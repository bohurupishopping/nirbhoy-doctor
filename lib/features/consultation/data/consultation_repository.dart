import 'dart:convert';
import 'package:dart_openai/dart_openai.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/consultation_models.dart';

final consultationRepositoryProvider = Provider<ConsultationRepository>((ref) {
  return ConsultationRepository(Supabase.instance.client);
});

class ConsultationRepository {
  final SupabaseClient _supabase;

  ConsultationRepository(this._supabase);

  Future<ConsultationContext> getConsultationInitData(
    String appointmentId,
  ) async {
    try {
      // 1. Get Appointment Details
      // 1. Get Appointment Details
      final dynamic apptRaw = await _supabase.rpc(
        'get_appointment_details_by_id',
        params: {'_appointment_id': appointmentId},
      );

      if (apptRaw == null) {
        throw 'Appointment Details not found (null response)';
      }

      Map<String, dynamic> apptResponse;
      if (apptRaw is List) {
        if (apptRaw.isEmpty) throw 'Appointment Details empty list';
        apptResponse = Map<String, dynamic>.from(apptRaw.first);
      } else {
        apptResponse = Map<String, dynamic>.from(apptRaw);
      }

      // Extract patient basic info from appointment details - FIXED PATH
      final appointmentObj = apptResponse['appointment'];
      if (appointmentObj == null) throw 'Appointment object missing';

      final String patientId = appointmentObj['patient_id'];

      // We also need doctor_id for the 360 summary (to calculate is_my_visit)
      final String doctorId = appointmentObj['doctor_id'];

      // 2. Get Patient 360 Summary
      final dynamic summaryRaw = await _supabase.rpc(
        'get_patient_360_summary',
        params: {'_patient_id': patientId, '_doctor_id': doctorId},
      );

      if (summaryRaw == null) {
        throw 'Patient 360 Summary not found';
      }

      Map<String, dynamic> summaryResponse;
      if (summaryRaw is List) {
        if (summaryRaw.isEmpty) throw 'Summary empty list';
        summaryResponse = Map<String, dynamic>.from(summaryRaw.first);
      } else {
        summaryResponse = Map<String, dynamic>.from(summaryRaw);
      }

      // Map details from Summary which is richer
      final patientData = Map<String, dynamic>.from(
        summaryResponse['patient'] ?? {},
      );
      // Remap keys to match PersonBasicDetails
      patientData['name'] =
          patientData['full_name'] ??
          appointmentObj['patient_name'] ??
          'Unknown';
      // Handle flags if present (assuming List or null)
      final flags = patientData['flags'];
      if (flags is List) {
        patientData['isCritical'] = flags.contains('critical');
        patientData['isWheelchair'] = flags.contains('wheelchair');
      }

      final patient = PersonBasicDetails.fromJson(patientData);
      final safetyProfile = MedicalProfile.fromJson(
        Map<String, dynamic>.from(summaryResponse['medical_profile'] ?? {}),
      );

      // 3. Check if consultation exists, if not create one (same as Next.js pattern)
      String consultationId;
      final existingConsult = await _supabase
          .from('consultations')
          .select('id')
          .eq('appointment_id', appointmentId)
          .maybeSingle();

      if (existingConsult != null) {
        consultationId = existingConsult['id'];
      } else {
        // Create new consultation record
        final newConsult = await _supabase
            .from('consultations')
            .insert({'appointment_id': appointmentId, 'doctor_id': doctorId})
            .select('id')
            .single();
        consultationId = newConsult['id'];
      }

      // Map to ConsultationContext
      return ConsultationContext(
        consultationId: consultationId,
        patient: patient,

        safetyProfile: safetyProfile,
        visitHistory: (summaryResponse['visit_history'] as List? ?? []).map((
          e,
        ) {
          final map = Map<String, dynamic>.from(e);
          // Manual mapping to ensure safety even if build_runner is stale
          if (map['id'] == null && map['appointment_id'] != null) {
            map['id'] = map['appointment_id'];
          }
          if (map['date'] == null && map['visit_date'] != null) {
            map['date'] = map['visit_date'];
          }
          // Handle explicit nulls for lists which might crash fromJson
          if (map['diagnosis'] == null) map['diagnosis'] = [];
          if (map['prescriptions'] == null) map['prescriptions'] = [];
          if (map['lab_orders'] == null) map['lab_orders'] = [];
          return VisitHistoryItem.fromJson(map);
        }).toList(),
        documents: (summaryResponse['documents'] as List? ?? [])
            .map((e) => PatientDocument.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        vitalsTrend: (summaryResponse['vitals_trend'] as List? ?? [])
            .map((e) => VitalsTrendItem.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
        aiSummary: summaryResponse['ai_summary'],
      );
    } catch (e) {
      throw 'Init Consultation Error: $e';
    }
  }

  Future<void> updateMedicalProfile(
    String patientId,
    MedicalProfile profile,
  ) async {
    try {
      await _supabase.rpc(
        'upsert_patient_medical_profile',
        params: {
          '_patient_id': patientId,
          '_allergies': profile.allergies,
          '_chronic_conditions': profile.chronicConditions,
          '_family_history': profile.familyHistory,
          '_lifestyle_tags': profile.lifestyle,
        },
      );
    } catch (e) {
      throw 'Update Profile Error: $e';
    }
  }

  Future<List<MedicineSearchResult>> searchMedicines(String query) async {
    try {
      final response = await _supabase.rpc(
        'search_medicines_vector',
        params: {'_query': query},
      );
      return (response as List)
          .map(
            (e) => MedicineSearchResult.fromJson(Map<String, dynamic>.from(e)),
          )
          .toList();
    } catch (e) {
      throw 'Search Medicine Error: $e';
    }
  }

  Future<String> createCustomMedicine({
    required String name,
    String? manufacturer,
    String? saltComposition,
    String? type,
    String? packSize,
    double? price,
  }) async {
    try {
      final newId = await _supabase.rpc(
        'create_new_medicine',
        params: {
          '_name': name,
          '_manufacturer_name': manufacturer,
          '_salt_composition': saltComposition,
          '_type': type,
          '_pack_size_label': packSize,
          '_price': price,
          // Optional fields left null for now as per minimal UI requirements
          '_short_composition1': null,
          '_short_composition2': null,
          '_medicine_desc': null,
          '_side_effects': null,
        },
      );
      return newId;
    } catch (e) {
      throw 'Create Custom Medicine Error: $e';
    }
  }

  Future<void> submitPrescription({
    required String consultId,
    required ConsultationState state,
  }) async {
    try {
      // Prepare payloads
      final diagnosisJson = state.diagnosis
          .map((d) => {'code': d, 'label': d})
          .toList(); // Simple string to object map

      final vitalsJson = state.vitals;

      final medsJson = state.medicines
          .map(
            (m) => {
              'master_id': m.masterId,
              'name': m.name,
              'composition': m.composition,
              'frequency': m.frequency,
              'duration': m.duration,
              'instruction': m.instruction,
              'special_instructions': m.specialInstructions,
              'type': m.type,
            },
          )
          .toList();

      final labsJson = state.labOrders
          .map((l) => {'test_name': l.testName, 'instruction': l.instruction})
          .toList();

      await _supabase.rpc(
        'submit_prescription_complete',
        params: {
          '_consult_id': consultId,
          '_diagnosis': diagnosisJson,
          '_chief_complaint':
              state.chiefComplaint, // Using chiefComplaint as primary complaint
          '_notes': state.adviceNotes,
          '_vitals': vitalsJson,
          '_meds': medsJson,
          '_labs': labsJson,
          '_next_visit_date': state.nextVisitDate?.toIso8601String().split(
            'T',
          )[0], // YYYY-MM-DD
          '_next_visit_text':
              null, // Optional text logic can be added if UI supports it
        },
      );
    } catch (e) {
      throw 'Submit Prescription Error: $e';
    }
  }

  Future<String> generateSummary({required String appointmentId}) async {
    ConsultationContext? context;
    try {
      // 1. Get Context (needed for fallback and patient IDs)
      context = await getConsultationInitData(appointmentId);

      // 2. Fetch Secure API Key
      final String? apiKey = await _supabase.rpc(
        'get_active_api_key',
        params: {'_provider': 'openai'},
      );

      if (apiKey == null || apiKey.isEmpty) {
        // print('OpenAI Key not found, using local fallback.');
        return _generateLocalSummary(context);
      }

      // 3. Configure OpenAI
      OpenAI.apiKey = apiKey;

      // 4. Fetch Raw 360 Data for AI Context (as per ai.ts pattern)
      final raw360Data = await _supabase.rpc(
        'get_patient_360_summary',
        params: {
          '_patient_id': context.patient.id, // Assuming context has valid ID
          '_doctor_id': _supabase.auth.currentUser?.id ?? '',
        },
      );

      // System Prompt (from ai.ts)
      const systemPrompt = '''
You are an expert Clinical AI Medical Assistant aimed at senior doctors.
Your task is to analyze the provided Patient 360 JSON data and generate a "Clinical Snapshot & Executive Summary" in Markdown format.

**Goal:** Provide a high-level, actionable summary. Highlight critical alerts, recent patterns, and safety issues first.

**Output Structure & Style Guidelines (Strictly Follow This Format):**

1.  **Clinical Snapshot & Executive Summary**
    *   **Patient:** Name (Age/Gender) | UHID: ...[last 4 digits]
    *   **Status:** [CRITICAL / STABLE / WHEELCHAIR] (Derived from access_flags or recent vitals)
    *   **Summary:** Write a single, high-density paragraph (approx 3-4 sentences) that synthesizes the patient's profile, main presenting complaints, active diagnoses, and recent visit context. Focus on the "why now" - why is the patient here today?

2.  **🔍 Detailed Clinical Analysis**
    *   **⚠️ Safety & Alerts:** Bullet points for Allergies and Critical Flags. "None" if clean.
    *   **💊 Active Meds & Regimen:** concise review of current drugs. Group by condition. Flag any unusual durations or interactions.
    *   **📉 Vitals & History:** Most recent vitals with date. Mention key chronic conditions.
    *   **🗓️ Visit Pattern:** Briefly mention visit frequency (e.g., "3rd visit in 2 weeks") and last 2-3 visits with 1-line context.

**Tone:** Professional, precise, physician-to-physician. Use icons (🚨, ⚠️, 💊, 📉, 🗓️) to make scanning easy.
**Constraint:** Keep it "semi-detailed" - enough for clinical decision making, but short enough to read in 30 seconds. Avoid fluff.
''';

      final userPrompt =
          '''
Here is the Patient 360 Data JSON:
```json
${jsonEncode(raw360Data)}
```

Generate the Clinical Snapshot now.
''';

      // 5. Call OpenAI
      // Note: OpenAI.instance.chat.create returns a Future<OpenAIChatCompletionModel>
      final completion = await OpenAI.instance.chat.create(
        model: "gpt-4o",
        messages: [
          OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.system,
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(
                systemPrompt,
              ),
            ],
          ),
          OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.user,
            content: [
              OpenAIChatCompletionChoiceMessageContentItemModel.text(
                userPrompt,
              ),
            ],
          ),
        ],
      );

      final content = completion.choices.first.message.content;
      if (content == null || content.isEmpty) throw 'Empty AI response';

      String rawContent = content
          .map((e) => e.text ?? '')
          .join(); // Simplified content extraction

      // Clean up potential markdown code blocks
      rawContent = rawContent
          .replaceAll(RegExp(r'^```markdown\s*'), '')
          .replaceAll(RegExp(r'^```\s*'), '')
          .replaceAll(RegExp(r'```\s*$'), '');

      return rawContent.trim();
    } catch (e) {
      // print('AI Generation Failed: $e');
      if (context != null) {
        return _generateLocalSummary(context);
      }
      rethrow;
    }
  }

  // --- Prescription Preview Helpers ---
  Future<Map<String, dynamic>> getPrescriptionHeaderData(
    String appointmentId,
  ) async {
    final dynamic apptRaw = await _supabase.rpc(
      'get_appointment_details_by_id',
      params: {'_appointment_id': appointmentId},
    );

    if (apptRaw == null) {
      throw 'Appointment Details not found';
    }

    Map<String, dynamic> apptResponse;
    if (apptRaw is List) {
      if (apptRaw.isEmpty) throw 'Appointment Details empty list';
      apptResponse = Map<String, dynamic>.from(apptRaw.first);
    } else {
      apptResponse = Map<String, dynamic>.from(apptRaw);
    }

    final appointment = apptResponse['appointment'] ?? {};
    final clinic = apptResponse['clinic'] ?? {};
    final doctor = apptResponse['doctor'] ?? {};
    final patient = apptResponse['patient'] ?? {}; // Use for basic fallback

    return {
      'meta': {
        'generated_at': DateTime.now().toIso8601String(),
        'appointment_number': appointment['appointment_number'] ?? '',
        'visit_type': appointment['type'] ?? 'Consultation',
        'visit_date': appointment['date'] ?? '',
      },
      'clinic': {
        'name': clinic['name'] ?? '',
        'logo_url': clinic['logo_url'],
        'header_image_url':
            clinic['header_image_url'], // Ensure this field exists in RPC
        'phone':
            clinic['phone_number'] ??
            clinic['phone'] ??
            '', // Handle variations
        'email': clinic['email'] ?? '',
        'address': clinic['address'] ?? '',
        // 'footer_text': clinic['footer_text'], // If available
      },
      'doctor': {
        'name': doctor['name'] ?? '',
        'specialty': doctor['specialty'] ?? '',
        'qualifications': doctor['qualifications'] ?? '',
        'reg_number': doctor['registration_number'] ?? '',
        'signature_url': doctor['signature_url'],
      },
      // Include patient basics here just in case they differ slightly or we need extra fields
      'patient_basics': {
        'name': patient['full_name'] ?? appointment['patient_name'] ?? '',
        'uhid': patient['uhid'] ?? '',
        'age_gender': '${patient['age'] ?? '?'}/${patient['gender'] ?? '?'}',
        'phone': patient['phone'] ?? '',
        'address': patient['address'] ?? '',
        'known_allergies': [], // Will be filled from state
      },
    };
  }

  String _generateLocalSummary(ConsultationContext context) {
    final patient = context.patient;
    final history = context.visitHistory;

    final sb = StringBuffer();

    sb.writeln('### Clinical Snapshot & Executive Summary');
    sb.writeln(
      '**Patient:** ${patient.name} (${patient.age}/${patient.gender})',
    );
    if (patient.isCritical == true) {
      sb.writeln('**Status:** 🚨 CRITICAL');
    }
    if (patient.isWheelchair == true) {
      sb.writeln('**Status:** ♿ Wheelchair User');
    }
    sb.writeln('');
    sb.writeln('**Summary:**');
    sb.writeln(
      'Patient presenting for consultation. History indicates ${history.length} previous visits.',
    );
    if (context.safetyProfile.chronicConditions.isNotEmpty) {
      sb.writeln(
        'Known conditions: ${context.safetyProfile.chronicConditions.join(", ")}.',
      );
    }
    sb.writeln('');

    sb.writeln('### 🔍 Detailed Clinical Analysis');
    sb.writeln('* **⚠️ Safety & Alerts:**');
    if (context.safetyProfile.allergies.isNotEmpty) {
      sb.writeln(
        '  * Allergies: ${context.safetyProfile.allergies.join(", ")}',
      );
    } else {
      sb.writeln('  * No known allergies recorded.');
    }

    sb.writeln('* **📉 Vitals & Trends:**');
    if (context.vitalsTrend.isNotEmpty) {
      final latest = context.vitalsTrend.first;
      final bp = latest.bp ?? '--';
      final temp = latest.temp ?? '--';
      final weight = latest.weight ?? '--';
      sb.writeln('  * Latest: BP $bp, Temp $temp°F, Weight ${weight}kg');
    } else {
      sb.writeln('  * No recent vitals data.');
    }

    sb.writeln('* **🗓️ Visit Pattern:**');
    if (history.isNotEmpty) {
      sb.writeln('  * Last visit: ${history.first.date}');
      sb.writeln('  * Total recorded visits: ${history.length}');
    } else {
      sb.writeln('  * This appears to be the first recorded visit.');
    }

    sb.writeln('');
    sb.writeln(
      '> *Note: This summary is generated based on available records.*',
    );

    return sb.toString();
  }
}
