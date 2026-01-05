import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/presentation/auth_controller.dart';
import '../../dashboard/data/dashboard_repository.dart';
import '../../dashboard/domain/dashboard_models.dart';

// State class to hold both stats and queue data
class DashboardState {
  final DashboardStats stats;
  final QueueData queue;
  final bool isLoading;
  final String? error;

  const DashboardState({
    this.stats = const DashboardStats(),
    this.queue = const QueueData(),
    this.isLoading = false,
    this.error,
  });

  DashboardState copyWith({
    DashboardStats? stats,
    QueueData? queue,
    bool? isLoading,
    String? error,
  }) {
    return DashboardState(
      stats: stats ?? this.stats,
      queue: queue ?? this.queue,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

final dashboardControllerProvider =
    StateNotifierProvider<DashboardController, DashboardState>((ref) {
      final repo = ref.watch(dashboardRepositoryProvider);
      // Get doctorId from Auth Controller's current user
      final user = ref.watch(currentUserProvider);
      return DashboardController(repo, user?.id);
    });

class DashboardController extends StateNotifier<DashboardState> {
  final DashboardRepository _repo;
  final String? _doctorId;
  Timer? _timer;

  DashboardController(this._repo, this._doctorId)
    : super(const DashboardState()) {
    if (_doctorId != null) {
      loadData();
      startAutoRefresh();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startAutoRefresh() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      loadData(isRefresh: true);
    });
  }

  Future<void> loadData({bool isRefresh = false}) async {
    if (_doctorId == null) {
      state = state.copyWith(
        error: 'Configuration Error: Doctor ID missing. Re-login required.',
        isLoading: false,
      );
      return;
    }

    if (!isRefresh) {
      state = state.copyWith(isLoading: true, error: null);
    }

    try {
      // Parallel fetch for speed
      final results = await Future.wait([
        _repo.getDashboardStats(_doctorId),
        _repo.getLiveQueue(_doctorId),
      ]);

      state = state.copyWith(
        stats: results[0] as DashboardStats,
        queue: results[1] as QueueData,
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: isRefresh
            ? null
            : e.toString(), // Don't show error on background refresh
      );
    }
  }

  Future<void> callPatient(String appointmentId) async {
    if (_doctorId == null) return;
    try {
      await _repo.callPatient(appointmentId, _doctorId);
      await loadData(isRefresh: true);
    } catch (e) {
      // Handle error accordingly
      rethrow;
    }
  }
}
