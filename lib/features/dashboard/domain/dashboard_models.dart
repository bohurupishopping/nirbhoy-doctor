import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_models.freezed.dart';
part 'dashboard_models.g.dart';

@freezed
class DashboardStats with _$DashboardStats {
  const factory DashboardStats({
    @JsonKey(name: 'waiting_count') @Default(0) int waitingCount,
    @JsonKey(name: 'completed_today') @Default(0) int completedToday,
    @JsonKey(name: 'avg_consult_time_mins') @Default(0) num avgConsultTimeMins,
    @JsonKey(name: 'avg_wait_time_mins') @Default(0) num avgWaitTimeMins,
  }) = _DashboardStats;

  factory DashboardStats.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsFromJson(json);
}

@freezed
class QueueItem with _$QueueItem {
  const factory QueueItem({
    @JsonKey(name: 'appointment_id') required String appointmentId,
    @JsonKey(name: 'patient_name') required String patientName,
    @JsonKey(name: 'token_number') required int tokenNumber,
    @JsonKey(name: 'uhid') required String uhid,

    // New fields from get_doctor_active_queue
    @JsonKey(name: 'age') int? age,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'queue_status') String? queueStatus,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'amount_due') num? amountDue,
    @JsonKey(name: 'wait_time_mins') num? waitTimeMins,
    @JsonKey(name: 'checked_in_at') String? checkedInAt,
    @JsonKey(name: 'access_flags') Map<String, dynamic>? accessFlags,
  }) = _QueueItem;

  factory QueueItem.fromJson(Map<String, dynamic> json) =>
      _$QueueItemFromJson(json);
}

@freezed
class QueueData with _$QueueData {
  const factory QueueData({
    @Default([]) List<QueueItem> scheduled, // Might be empty now
    @Default([]) List<QueueItem> waiting,
    @Default([]) List<QueueItem> active, // called or in_consult
  }) = _QueueData;

  factory QueueData.fromJson(Map<String, dynamic> json) =>
      _$QueueDataFromJson(json);
}
