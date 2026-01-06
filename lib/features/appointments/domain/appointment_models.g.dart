// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentGridItemImpl _$$AppointmentGridItemImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentGridItemImpl(
  id: json['id'] as String,
  startTime: DateTime.parse(json['start_time'] as String),
  endTime: DateTime.parse(json['end_time'] as String),
  status: json['status'] as String,
  type: json['type'] as String,
  patientName: json['patient_name'] as String,
  uhid: json['uhid'] as String,
  doctorName: json['doctor_name'] as String,
  doctorId: json['doctor_id'] as String,
);

Map<String, dynamic> _$$AppointmentGridItemImplToJson(
  _$AppointmentGridItemImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'start_time': instance.startTime.toIso8601String(),
  'end_time': instance.endTime.toIso8601String(),
  'status': instance.status,
  'type': instance.type,
  'patient_name': instance.patientName,
  'uhid': instance.uhid,
  'doctor_name': instance.doctorName,
  'doctor_id': instance.doctorId,
};

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

_$RescheduleResultImpl _$$RescheduleResultImplFromJson(
  Map<String, dynamic> json,
) => _$RescheduleResultImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  financialWarning: json['financial_warning'] as bool? ?? false,
);

Map<String, dynamic> _$$RescheduleResultImplToJson(
  _$RescheduleResultImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'financial_warning': instance.financialWarning,
};
