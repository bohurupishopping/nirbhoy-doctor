// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinanceStatsImpl _$$FinanceStatsImplFromJson(Map<String, dynamic> json) =>
    _$FinanceStatsImpl(
      totalBilled: json['total_billed'] as num,
      totalCollected: json['total_collected'] as num,
      totalPending: json['total_pending'] as num,
      txnCount: (json['txn_count'] as num).toInt(),
    );

Map<String, dynamic> _$$FinanceStatsImplToJson(_$FinanceStatsImpl instance) =>
    <String, dynamic>{
      'total_billed': instance.totalBilled,
      'total_collected': instance.totalCollected,
      'total_pending': instance.totalPending,
      'txn_count': instance.txnCount,
    };

_$FinanceTransactionImpl _$$FinanceTransactionImplFromJson(
  Map<String, dynamic> json,
) => _$FinanceTransactionImpl(
  invoiceId: json['invoice_id'] as String,
  invoiceNumber: json['invoice_number'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  amount: json['amount'] as num,
  paid: json['paid'] as num,
  balance: json['balance'] as num,
  status: json['status'] as String?,
  mode: json['mode'] as String?,
  patient: json['patient'] as Map<String, dynamic>,
  doctorName: json['doctor_name'] as String?,
);

Map<String, dynamic> _$$FinanceTransactionImplToJson(
  _$FinanceTransactionImpl instance,
) => <String, dynamic>{
  'invoice_id': instance.invoiceId,
  'invoice_number': instance.invoiceNumber,
  'created_at': instance.createdAt.toIso8601String(),
  'amount': instance.amount,
  'paid': instance.paid,
  'balance': instance.balance,
  'status': instance.status,
  'mode': instance.mode,
  'patient': instance.patient,
  'doctor_name': instance.doctorName,
};

_$FinanceMetaImpl _$$FinanceMetaImplFromJson(Map<String, dynamic> json) =>
    _$FinanceMetaImpl(
      totalRecords: (json['total_records'] as num).toInt(),
      currentPage: (json['current_page'] as num).toInt(),
    );

Map<String, dynamic> _$$FinanceMetaImplToJson(_$FinanceMetaImpl instance) =>
    <String, dynamic>{
      'total_records': instance.totalRecords,
      'current_page': instance.currentPage,
    };

_$FinanceResponseImpl _$$FinanceResponseImplFromJson(
  Map<String, dynamic> json,
) => _$FinanceResponseImpl(
  stats: FinanceStats.fromJson(json['stats'] as Map<String, dynamic>),
  transactions: (json['transactions'] as List<dynamic>)
      .map((e) => FinanceTransaction.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: FinanceMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$FinanceResponseImplToJson(
  _$FinanceResponseImpl instance,
) => <String, dynamic>{
  'stats': instance.stats,
  'transactions': instance.transactions,
  'meta': instance.meta,
};
