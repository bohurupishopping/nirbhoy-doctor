import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../patient/domain/clinical_models.dart';
import '../../patient/domain/patient_models.dart';
import '../domain/consultation_models.dart';

final consultationRepositoryProvider = Provider<ConsultationRepository>((ref) {
  return ConsultationRepository(Supabase.instance.client);
});

class ConsultationRepository {
  final SupabaseClient _supabase;

  ConsultationRepository(this._supabase);

  Future<ConsultationInitData> getConsultationInitData(
    String appointmentId,
  ) async {
    try {
      // 1. Get Appointment Details
      final apptResponse = await _supabase.rpc(
        'get_appointment_clinical_details',
        params: {'_appointment_id': appointmentId},
      );

      if (apptResponse == null) {
        throw 'Appointment Details not found';
      }
      final apptDetails = AppointmentClinicalDetails.fromJson(apptResponse);

      // 2. Get Patient 360 (using patient ID from appt)
      final patientResponse = await _supabase.rpc(
        'get_patient_admin_history',
        params: {'_patient_id': apptDetails.patient.id},
      );

      if (patientResponse == null) {
        throw 'Patient History not found';
      }
      final patient360 = PatientDetail.fromJson(patientResponse);

      return ConsultationInitData(
        appointmentDetails: apptDetails,
        patient360: patient360,
      );
    } catch (e) {
      throw 'Init Consultation Error: $e';
    }
  }

  Future<List<MedicineMaster>> searchMedicines(String query) async {
    try {
      final response = await _supabase.rpc(
        'search_medicines_vector',
        params: {'_query': query},
      );
      return (response as List).map((e) => MedicineMaster.fromJson(e)).toList();
    } catch (e) {
      // Fallback or empty if error? throw for now
      throw 'Search Medicine Error: $e';
    }
  }

  // TODO: Check schema for `submit_prescription_complete` signature
  // Assuming it takes a JSON payload.
  Future<void> submitPrescription({
    required String appointmentId,
    required Map<String, dynamic> payload,
  }) async {
    try {
      await _supabase.rpc(
        'submit_prescription_complete',
        params: {'_appointment_id': appointmentId, '_payload': payload},
      );
    } catch (e) {
      throw 'Submit Prescription Error: $e';
    }
  }
}
