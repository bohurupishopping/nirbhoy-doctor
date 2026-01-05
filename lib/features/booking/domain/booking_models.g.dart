// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DoctorScheduleImpl _$$DoctorScheduleImplFromJson(Map<String, dynamic> json) =>
    _$DoctorScheduleImpl(
      day: (json['day'] as num).toInt(),
      start: json['start'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$$DoctorScheduleImplToJson(
  _$DoctorScheduleImpl instance,
) => <String, dynamic>{
  'day': instance.day,
  'start': instance.start,
  'end': instance.end,
};

_$DoctorImpl _$$DoctorImplFromJson(Map<String, dynamic> json) => _$DoctorImpl(
  id: json['doctor_id'] as String,
  fullName: json['full_name'] as String,
  specialty: json['specialty'] as String?,
  consultationFee: (json['consult_fee'] as num?)?.toDouble(),
  avgConsultTimeMin: (json['avg_consult_time_min'] as num?)?.toInt() ?? 15,
  isAvailable: json['is_available'] as bool? ?? true,
  schedule:
      (json['schedule'] as List<dynamic>?)
          ?.map((e) => DoctorSchedule.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$DoctorImplToJson(_$DoctorImpl instance) =>
    <String, dynamic>{
      'doctor_id': instance.id,
      'full_name': instance.fullName,
      'specialty': instance.specialty,
      'consult_fee': instance.consultationFee,
      'avg_consult_time_min': instance.avgConsultTimeMin,
      'is_available': instance.isAvailable,
      'schedule': instance.schedule,
    };

_$TimeSlotImpl _$$TimeSlotImplFromJson(Map<String, dynamic> json) =>
    _$TimeSlotImpl(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$$TimeSlotImplToJson(_$TimeSlotImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'isAvailable': instance.isAvailable,
    };

_$BookingResultImpl _$$BookingResultImplFromJson(Map<String, dynamic> json) =>
    _$BookingResultImpl(
      appointmentId: json['appointment_id'] as String,
      invoiceId: json['invoice_id'] as String,
      amountDue: (json['amount_due'] as num).toDouble(),
      appointmentNumber: json['appointment_number'] as String,
      invoiceNumber: json['invoice_number'] as String,
      doctorName: json['doctor_name'] as String,
    );

Map<String, dynamic> _$$BookingResultImplToJson(_$BookingResultImpl instance) =>
    <String, dynamic>{
      'appointment_id': instance.appointmentId,
      'invoice_id': instance.invoiceId,
      'amount_due': instance.amountDue,
      'appointment_number': instance.appointmentNumber,
      'invoice_number': instance.invoiceNumber,
      'doctor_name': instance.doctorName,
    };
