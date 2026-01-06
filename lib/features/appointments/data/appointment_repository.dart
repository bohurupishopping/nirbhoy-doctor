import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/appointment_models.dart';

final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  return AppointmentRepository(Supabase.instance.client);
});

class AppointmentRepository {
  final SupabaseClient _supabase;

  AppointmentRepository(this._supabase);

  Future<List<AppointmentGridItem>> getAppointments(DateTime date) async {
    try {
      final dateStr = date.toIso8601String().split('T')[0];
      final response = await _supabase.rpc(
        'get_my_appointments_grid',
        params: {'_date': dateStr},
      );

      return (response as List)
          .map((e) => AppointmentGridItem.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw 'Error fetching appointments: $e';
    }
  }

  Future<String?> getAppointmentDoctorId(String appointmentId) async {
    try {
      final response = await _supabase
          .from('appointments')
          .select('doctor_id')
          .eq('id', appointmentId)
          .single();
      return response['doctor_id'] as String?;
    } catch (e) {
      return null;
    }
  }

  Future<RescheduleResult> rescheduleAppointment({
    required String appointmentId,
    required DateTime newStartTime,
    String? newDoctorId,
  }) async {
    try {
      final response = await _supabase.rpc(
        'reschedule_appointment',
        params: {
          '_appointment_id': appointmentId,
          '_new_start_time': newStartTime.toIso8601String(),
          '_new_doctor_id': newDoctorId,
        },
      );

      return RescheduleResult.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      if (e is PostgrestException) {
        return RescheduleResult(
          success: false,
          message: e.message,
          financialWarning: false,
        );
      }
      return RescheduleResult(
        success: false,
        message: e.toString(),
        financialWarning: false,
      );
    }
  }
}
