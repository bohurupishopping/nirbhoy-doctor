import 'package:freezed_annotation/freezed_annotation.dart';

part 'finance_models.freezed.dart';
part 'finance_models.g.dart';

@freezed
class FinanceStats with _$FinanceStats {
  const factory FinanceStats({
    @JsonKey(name: 'total_billed') required num totalBilled,
    @JsonKey(name: 'total_collected') required num totalCollected,
    @JsonKey(name: 'total_pending') required num totalPending,
    @JsonKey(name: 'txn_count') required int txnCount,
  }) = _FinanceStats;

  factory FinanceStats.fromJson(Map<String, dynamic> json) =>
      _$FinanceStatsFromJson(json);
}

@freezed
class FinanceTransaction with _$FinanceTransaction {
  const factory FinanceTransaction({
    @JsonKey(name: 'invoice_id') required String invoiceId,
    @JsonKey(name: 'invoice_number') required String invoiceNumber,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required num amount,
    required num paid,
    required num balance,
    String? status,
    String? mode,
    required Map<String, dynamic> patient,
    @JsonKey(name: 'doctor_name') String? doctorName,
  }) = _FinanceTransaction;

  factory FinanceTransaction.fromJson(Map<String, dynamic> json) =>
      _$FinanceTransactionFromJson(json);
}

@freezed
class FinanceMeta with _$FinanceMeta {
  const factory FinanceMeta({
    @JsonKey(name: 'total_records') required int totalRecords,
    @JsonKey(name: 'current_page') required int currentPage,
  }) = _FinanceMeta;

  factory FinanceMeta.fromJson(Map<String, dynamic> json) =>
      _$FinanceMetaFromJson(json);
}

@freezed
class FinanceResponse with _$FinanceResponse {
  const factory FinanceResponse({
    required FinanceStats stats,
    required List<FinanceTransaction> transactions,
    required FinanceMeta meta,
  }) = _FinanceResponse;

  factory FinanceResponse.fromJson(Map<String, dynamic> json) =>
      _$FinanceResponseFromJson(json);
}
