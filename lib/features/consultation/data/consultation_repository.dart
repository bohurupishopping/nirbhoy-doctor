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
}
