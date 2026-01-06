import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/appointment_repository.dart';
import '../domain/appointment_models.dart';

class HistoryState {
  final List<AppointmentHistoryItem> data;
  final bool isLoading;
  final String? error;
  final int page;
  final int pageSize;
  final int totalRecords;
  final DateTime? startDate;
  final DateTime? endDate;
  final String searchText;
  final String statusFilter;

  const HistoryState({
    this.data = const [],
    this.isLoading = false,
    this.error,
    this.page = 1,
    this.pageSize = 10,
    this.totalRecords = 0,
    this.startDate,
    this.endDate,
    this.searchText = '',
    this.statusFilter = 'all',
  });

  HistoryState copyWith({
    List<AppointmentHistoryItem>? data,
    bool? isLoading,
    String? error,
    int? page,
    int? pageSize,
    int? totalRecords,
    DateTime? startDate,
    DateTime? endDate,
    String? searchText,
    String? statusFilter,
  }) {
    return HistoryState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      totalRecords: totalRecords ?? this.totalRecords,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      searchText: searchText ?? this.searchText,
      statusFilter: statusFilter ?? this.statusFilter,
    );
  }
}

final historyControllerProvider =
    StateNotifierProvider.autoDispose<HistoryController, HistoryState>((ref) {
      final repo = ref.watch(appointmentRepositoryProvider);
      return HistoryController(repo);
    });

class HistoryController extends StateNotifier<HistoryState> {
  final AppointmentRepository _repo;

  HistoryController(this._repo) : super(const HistoryState()) {
    loadHistory();
  }

  Future<void> loadHistory() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _repo.getAppointmentHistory(
        page: state.page,
        pageSize: state.pageSize,
        startDate: state.startDate,
        endDate: state.endDate,
        searchText: state.searchText,
        statusFilter: state.statusFilter,
      );

      state = state.copyWith(
        isLoading: false,
        data: response.data,
        totalRecords: (response.meta['total_records'] as num?)?.toInt() ?? 0,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void setPage(int page) {
    if (page < 1) return;
    state = state.copyWith(page: page);
    loadHistory();
  }

  void setFilters({
    String? searchText,
    String? statusFilter,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    state = state.copyWith(
      searchText: searchText,
      statusFilter: statusFilter,
      startDate: startDate,
      endDate: endDate,
      page: 1, // Reset to first page
    );
    loadHistory();
  }
}
