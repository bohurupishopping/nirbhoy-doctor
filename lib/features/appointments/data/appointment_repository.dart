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

  Future<List<Doctor>> getDoctors({String? clinicId, String? search}) async {
    try {
      final response = await _supabase.rpc(
        'get_booking_init_data',
        params: {'_clinic_id': clinicId},
      );

      List<dynamic> data;
      if (response is Map && response.containsKey('doctors')) {
        data = response['doctors'] as List<dynamic>;
      } else if (response is List) {
        data = response;
      } else {
        data = [];
      }

      if (search != null && search.isNotEmpty) {
        data = data
            .where(
              (d) => d['full_name'].toString().toLowerCase().contains(
                search.toLowerCase(),
              ),
            )
            .toList();
      }

      return data.map((e) => Doctor.fromJson(e)).toList();
    } catch (e) {
      throw 'Fetch Doctors Error: $e';
    }
  }

  Future<List<TimeSlot>> getAvailableSlots({
    required String doctorId,
    required DateTime date,
  }) async {
    try {
      final dateStr = date.toIso8601String().split('T')[0];

      final response = await _supabase.rpc(
        'get_available_slots',
        params: {'_doctor_id': doctorId, '_date': dateStr},
      );

      final List<dynamic> data = response as List<dynamic>;

      return data.map((json) {
        final timeStr = json['slot_time'] as String;
        final isAvailable = json['is_available'] as bool;
        final parts = timeStr.split(':');
        final startTime = DateTime(
          date.year,
          date.month,
          date.day,
          int.parse(parts[0]),
          int.parse(parts[1]),
        );
        return TimeSlot(
          startTime: startTime,
          endTime: startTime.add(const Duration(minutes: 15)),
          isAvailable: isAvailable,
        );
      }).toList();
    } catch (e) {
      throw 'Get Slots Error: $e';
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
