import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/finance_repository.dart';
import '../../domain/finance_models.dart';

class FinanceState {
  final List<FinanceTransaction> transactions;
  final FinanceStats? stats;
  final bool isLoading;
  final String? error;
  final DateTime startDate;
  final DateTime endDate;
  final String? statusFilter;
  final String searchText;
  final int currentPage;
  final int totalRecords;

  const FinanceState({
    this.transactions = const [],
    this.stats,
    this.isLoading = false,
    this.error,
    required this.startDate,
    required this.endDate,
    this.statusFilter = 'all',
    this.searchText = '',
    this.currentPage = 1,
    this.totalRecords = 0,
  });

  FinanceState copyWith({
    List<FinanceTransaction>? transactions,
    FinanceStats? stats,
    bool? isLoading,
    String? error,
    DateTime? startDate,
    DateTime? endDate,
    String? statusFilter,
    String? searchText,
    int? currentPage,
    int? totalRecords,
  }) {
    return FinanceState(
      transactions: transactions ?? this.transactions,
      stats: stats ?? this.stats,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      statusFilter: statusFilter ?? this.statusFilter,
      searchText: searchText ?? this.searchText,
      currentPage: currentPage ?? this.currentPage,
      totalRecords: totalRecords ?? this.totalRecords,
    );
  }
}

final financeControllerProvider =
    StateNotifierProvider.autoDispose<FinanceController, FinanceState>((ref) {
      final repo = ref.watch(financeRepositoryProvider);
      return FinanceController(repo);
    });

class FinanceController extends StateNotifier<FinanceState> {
  final FinanceRepository _repo;

  FinanceController(this._repo)
    : super(
        FinanceState(
          startDate: DateTime.now().subtract(const Duration(days: 30)),
          endDate: DateTime.now(),
        ),
      ) {
    loadFinanceData();
  }

  Future<void> loadFinanceData({int page = 1, bool isRefresh = true}) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _repo.getFinanceTransactions(
        startDate: state.startDate,
        endDate: state.endDate,
        statusFilter: state.statusFilter,
        searchText: state.searchText,
        page: page,
      );

      if (isRefresh) {
        state = state.copyWith(
          transactions: response.transactions,
          stats: response.stats,
          totalRecords: response.meta.totalRecords,
          currentPage: page,
          isLoading: false,
        );
      } else {
        state = state.copyWith(
          transactions: [...state.transactions, ...response.transactions],
          stats: response.stats,
          totalRecords: response.meta.totalRecords,
          currentPage: page,
          isLoading: false,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void updateFilters({
    DateTime? startDate,
    DateTime? endDate,
    String? statusFilter,
    String? searchText,
  }) {
    state = state.copyWith(
      startDate: startDate ?? state.startDate,
      endDate: endDate ?? state.endDate,
      statusFilter: statusFilter ?? state.statusFilter,
      searchText: searchText ?? state.searchText,
      currentPage: 1, // Reset page on filter change
    );
    loadFinanceData();
  }

  void next() {
    if (state.transactions.length < state.totalRecords) {
      loadFinanceData(page: state.currentPage + 1, isRefresh: false);
    }
  }
}
