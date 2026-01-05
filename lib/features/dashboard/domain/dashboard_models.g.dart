// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardStatsImpl _$$DashboardStatsImplFromJson(Map<String, dynamic> json) =>
    _$DashboardStatsImpl(
      waitingCount: (json['waiting_count'] as num?)?.toInt() ?? 0,
      completedToday: (json['completed_today'] as num?)?.toInt() ?? 0,
      avgConsultTimeMins: json['avg_consult_time_mins'] as num? ?? 0,
      avgWaitTimeMins: json['avg_wait_time_mins'] as num? ?? 0,
    );

Map<String, dynamic> _$$DashboardStatsImplToJson(
  _$DashboardStatsImpl instance,
) => <String, dynamic>{
  'waiting_count': instance.waitingCount,
  'completed_today': instance.completedToday,
  'avg_consult_time_mins': instance.avgConsultTimeMins,
  'avg_wait_time_mins': instance.avgWaitTimeMins,
};

_$QueueItemImpl _$$QueueItemImplFromJson(Map<String, dynamic> json) =>
    _$QueueItemImpl(
      appointmentId: json['appointment_id'] as String,
      patientName: json['patient_name'] as String,
      tokenNumber: (json['token_number'] as num).toInt(),
      uhid: json['uhid'] as String,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      queueStatus: json['queue_status'] as String?,
      paymentStatus: json['payment_status'] as String?,
      amountDue: json['amount_due'] as num?,
      waitTimeMins: json['wait_time_mins'] as num?,
      checkedInAt: json['checked_in_at'] as String?,
      accessFlags: json['access_flags'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$QueueItemImplToJson(_$QueueItemImpl instance) =>
    <String, dynamic>{
      'appointment_id': instance.appointmentId,
      'patient_name': instance.patientName,
      'token_number': instance.tokenNumber,
      'uhid': instance.uhid,
      'age': instance.age,
      'gender': instance.gender,
      'queue_status': instance.queueStatus,
      'payment_status': instance.paymentStatus,
      'amount_due': instance.amountDue,
      'wait_time_mins': instance.waitTimeMins,
      'checked_in_at': instance.checkedInAt,
      'access_flags': instance.accessFlags,
    };

_$QueueDataImpl _$$QueueDataImplFromJson(Map<String, dynamic> json) =>
    _$QueueDataImpl(
      scheduled:
          (json['scheduled'] as List<dynamic>?)
              ?.map((e) => QueueItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      waiting:
          (json['waiting'] as List<dynamic>?)
              ?.map((e) => QueueItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      active:
          (json['active'] as List<dynamic>?)
              ?.map((e) => QueueItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$QueueDataImplToJson(_$QueueDataImpl instance) =>
    <String, dynamic>{
      'scheduled': instance.scheduled,
      'waiting': instance.waiting,
      'active': instance.active,
    };
