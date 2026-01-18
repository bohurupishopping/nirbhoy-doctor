import 'package:supabase_flutter/supabase_flutter.dart';
import '../../dashboard/domain/dashboard_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(Supabase.instance.client);
});

class DashboardRepository {
  final SupabaseClient _supabase;

  DashboardRepository(this._supabase);

  Future<DashboardStats> getDashboardStats(String doctorId) async {
    try {
      final response = await _supabase
          .rpc('get_doctor_dashboard_metrics', params: {'_doctor_id': doctorId})
          .timeout(const Duration(seconds: 10));

      // RPC returns a list of 1 object usually, or a single object if configured.
      // Based on schema: RETURNS TABLE(...) -> returns List<Map>
      final data = (response as List).first as Map<String, dynamic>;

      return DashboardStats.fromJson(data);
    } catch (e) {
      throw 'Stats Error: $e';
    }
  }

  Future<QueueData> getLiveQueue(String doctorId) async {
    try {
      final response = await _supabase
          .rpc('get_doctor_active_queue', params: {'_doctor_id': doctorId})
          .timeout(const Duration(seconds: 10));

      final List<dynamic> list = response as List<dynamic>;
      final items = list
          .map((e) => QueueItem.fromJson(e as Map<String, dynamic>))
          .toList();

      final waiting = items.where((i) => i.queueStatus == 'waiting').toList();
      final active = items
          .where((i) => ['called', 'in_consult'].contains(i.queueStatus))
          .toList();

      return QueueData(
        active: active,
        waiting: waiting,
        scheduled: [], // RPC doesn't return scheduled
      );
    } catch (e) {
      throw 'Queue Error: $e';
    }
  }

  Future<void> callPatient(String appointmentId, String doctorId) async {
    await _supabase.rpc(
      'doctor_call_patient',
      params: {'_appointment_id': appointmentId, '_doctor_id': doctorId},
    );
  }
}
