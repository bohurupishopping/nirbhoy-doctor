import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../patient/domain/patient_models.dart';
import '../../patient/domain/clinical_models.dart';

final patientRepositoryProvider = Provider<PatientRepository>((ref) {
  return PatientRepository(Supabase.instance.client);
});

class PatientRepository {
  final SupabaseClient _supabase;

  PatientRepository(this._supabase);

  // 1. Search (Fuzzy)
  Future<List<Patient>> searchPatients(String clinicId, String query) async {
    try {
      final response = await _supabase.rpc(
        'search_patients_fuzzy',
        params: {'_clinic_id': clinicId, '_query': query},
      );
      return (response as List).map((e) => Patient.fromJson(e)).toList();
    } catch (e) {
      throw 'Search Error: $e';
    }
  }

  // 2. Get List (Paginated)
  Future<PatientListResult> getPatientsList({
    required String clinicId,
    int page = 1,
    int pageSize = 10,
    String search = '',
    String? gender,
  }) async {
    try {
      final response = await _supabase.rpc(
        'get_patients_v2',
        params: {
          '_clinic_id': clinicId,
          '_search': search,
          '_gender': gender,
          '_page': page,
          '_page_size': pageSize,
        },
      );

      final List<dynamic> data = response as List<dynamic>;
      if (data.isEmpty) return const PatientListResult();

      final total = data[0]['total_count'] as int? ?? 0;
      final patients = data.map((e) => Patient.fromJson(e)).toList();

      return PatientListResult(data: patients, total: total);
    } catch (e) {
      // If V2 doesn't exist, we might crash. assuming it exists based on staff.ts
      throw 'List Error: $e';
    }
  }

  // 3. Get Patient 360 History
  Future<PatientDetail?> getPatientHistory(String patientId) async {
    try {
      final response = await _supabase.rpc(
        'get_patient_admin_history',
        params: {'_patient_id': patientId},
      );

      // Response structure in schema: { profile: {}, appointments: [], documents: [] }
      if (response == null) return null;
      return PatientDetail.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      throw 'History Error: $e';
    }
  }

  // 4. Register Patient
  Future<String> registerPatient({
    required String clinicId,
    required String fullName,
    required String phone,
    required int age,
    required String gender,
    String? address,
    // Extended Address
    String? district,
    String? state,
    String? pincode,
    String? religion,
    Map<String, dynamic>? accessFlags,
  }) async {
    try {
      final response = await _supabase.rpc(
        'quick_register_patient',
        params: {
          '_clinic_id': clinicId,
          '_full_name': fullName,
          '_phone': phone,
          '_age': age,
          '_gender': gender,
          '_address_street': address,
          '_district': district,
          '_state': state,
          '_pincode': pincode,
          '_religion': religion,
          '_access_flags':
              accessFlags ?? {'critical': false, 'wheelchair': false},
        },
      );
      return response as String; // Returns patient_id
    } catch (e) {
      throw 'Registration Error: $e';
    }
  }

  // 5. Get Appointment Clinical Details
  Future<AppointmentClinicalDetails?> getAppointmentClinicalDetails(
    String appointmentId,
  ) async {
    try {
      final response = await _supabase.rpc(
        'get_appointment_clinical_details',
        params: {'_appointment_id': appointmentId},
      );
      if (response == null) return null;
      return AppointmentClinicalDetails.fromJson(
        response as Map<String, dynamic>,
      );
    } catch (e) {
      throw 'Clinical Details Error: $e';
    }
  }

  // 6. Get Invoice Print Data
  Future<InvoicePrintData?> getInvoicePrintData(String invoiceId) async {
    try {
      final response = await _supabase.rpc(
        'get_invoice_print_data',
        params: {'_invoice_id': invoiceId},
      );
      if (response == null) return null;
      // Handle both list and object response
      final data = (response is List && response.isNotEmpty)
          ? response[0]
          : response;
      return InvoicePrintData.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw 'Invoice Print Data Error: $e';
    }
  }

  // 7. Get Prescription Print Data
  Future<PrescriptionPrintData?> getPrescriptionPrintData(
    String appointmentId,
  ) async {
    try {
      final response = await _supabase.rpc(
        'get_prescription_print_data',
        params: {'_appointment_id': appointmentId},
      );
      if (response == null) return null;
      return PrescriptionPrintData.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      throw 'Prescription Print Data Error: $e';
    }
  }

  // 8. Update Patient Demographics
  Future<void> updatePatientDemographics({
    required String patientId,
    required String fullName,
    required String phone,
    required int age,
    required String gender,
    String? address,
    String? district,
    String? pincode,
    bool? isWheelchair,
    bool? isCritical,
  }) async {
    try {
      await _supabase.rpc(
        'update_patient_demographics',
        params: {
          '_patient_id': patientId,
          '_full_name': fullName,
          '_phone': phone,
          '_age': age,
          '_gender': gender,
          '_address': address,
          '_district': district,
          '_pincode': pincode,
          '_is_wheelchair': isWheelchair,
          '_is_critical': isCritical,
        },
      );
    } catch (e) {
      throw 'Update Error: $e';
    }
  }

  // 9. Get Appointment Timeline
  Future<List<TimelineEvent>> getAppointmentTimeline(
    String appointmentId,
  ) async {
    try {
      final response = await _supabase.rpc(
        'get_appointment_timeline',
        params: {'_appointment_id': appointmentId},
      );
      if (response == null) return [];
      return (response as List).map((e) => TimelineEvent.fromJson(e)).toList();
    } catch (e) {
      throw 'Timeline Error: $e';
    }
  }
}
