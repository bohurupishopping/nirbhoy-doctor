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
class DoctorSchedule with _$DoctorSchedule {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DoctorSchedule({
    required int day,
    required String start,
    required String end,
  }) = _DoctorSchedule;

  factory DoctorSchedule.fromJson(Map<String, dynamic> json) =>
      _$DoctorScheduleFromJson(json);
}

@freezed
class Doctor with _$Doctor {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Doctor({
    @JsonKey(name: 'doctor_id') required String id,
    required String fullName,
    String? specialty,
    @JsonKey(name: 'consult_fee') double? consultationFee,
    @Default(15) int avgConsultTimeMin,
    @Default(true) bool isAvailable,
    @Default([]) List<DoctorSchedule> schedule,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}

@freezed
class TimeSlot with _$TimeSlot {
  const factory TimeSlot({
    required DateTime startTime,
    required DateTime endTime,
    required bool isAvailable,
  }) = _TimeSlot;

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
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
