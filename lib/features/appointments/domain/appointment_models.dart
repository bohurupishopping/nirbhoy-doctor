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

@freezed
class HistoryPatient with _$HistoryPatient {
  const factory HistoryPatient({
    required String name,
    required String uhid,
    required String details,
    required String phone,
  }) = _HistoryPatient;

  factory HistoryPatient.fromJson(Map<String, dynamic> json) =>
      _$HistoryPatientFromJson(json);
}

@freezed
class AppointmentHistoryItem with _$AppointmentHistoryItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AppointmentHistoryItem({
    required String appointmentId,
    required String appointmentNumber,
    required DateTime date,
    required String status,
    required String type,
    required HistoryPatient patient,
    @JsonKey(fromJson: _parseDiagnosis) String? diagnosis,
    @Default(false) bool canPrint,
  }) = _AppointmentHistoryItem;

  factory AppointmentHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$AppointmentHistoryItemFromJson(json);
}

String? _parseDiagnosis(dynamic value) {
  if (value == null) return null;
  if (value is String) return value;
  if (value is List) {
    if (value.isEmpty) return null;
    return value.join(', ');
  }
  return value.toString();
}

@freezed
class HistoryResponse with _$HistoryResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory HistoryResponse({
    @Default([]) List<AppointmentHistoryItem> data,
    required Map<String, dynamic> meta,
  }) = _HistoryResponse;

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseFromJson(json);
}
