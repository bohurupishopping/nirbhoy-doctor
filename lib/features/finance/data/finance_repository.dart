import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/finance_models.dart';

final financeRepositoryProvider = Provider<FinanceRepository>((ref) {
  return FinanceRepository(Supabase.instance.client);
});

class FinanceRepository {
  final SupabaseClient _supabase;

  FinanceRepository(this._supabase);

  Future<FinanceResponse> getFinanceTransactions({
    required DateTime startDate,
    required DateTime endDate,
    String? statusFilter,
    String searchText = '',
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await _supabase.rpc(
        'get_finance_transactions',
        params: {
          '_start_date': startDate.toIso8601String().split('T')[0],
          '_end_date': endDate.toIso8601String().split('T')[0],
          '_status_filter': statusFilter == 'all' ? null : statusFilter,
          '_search_text': searchText,
          '_page': page,
          '_page_size': pageSize,
        },
      );

      if (response == null) {
        throw 'No data returned from finance RPC';
      }

      return FinanceResponse.fromJson(response as Map<String, dynamic>);
    } catch (e) {
      throw 'Finance Fetch Error: $e';
    }
  }
}
