import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_models.freezed.dart';
part 'appointment_models.g.dart';

@freezed
class AppointmentGridItem with _$AppointmentGridItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AppointmentGridItem({
    required String id,
    required DateTime startTime,
    required DateTime endTime,
    required String status,
    required String type,
    required String patientName,
    required String uhid,
    required String doctorName,
    required String doctorId,
  }) = _AppointmentGridItem;

  factory AppointmentGridItem.fromJson(Map<String, dynamic> json) =>
      _$AppointmentGridItemFromJson(json);
}

@freezed
class RescheduleResult with _$RescheduleResult {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RescheduleResult({
    required bool success,
    required String message,
    @Default(false) bool financialWarning,
  }) = _RescheduleResult;

  factory RescheduleResult.fromJson(Map<String, dynamic> json) =>
      _$RescheduleResultFromJson(json);
}
