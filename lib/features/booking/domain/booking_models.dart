import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_models.freezed.dart';
part 'booking_models.g.dart';

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
class BookingResult with _$BookingResult {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory BookingResult({
    required String appointmentId,
    required String invoiceId,
    required double amountDue,
    required String appointmentNumber,
    required String invoiceNumber,
    required String doctorName,
  }) = _BookingResult;

  factory BookingResult.fromJson(Map<String, dynamic> json) =>
      _$BookingResultFromJson(json);
}
