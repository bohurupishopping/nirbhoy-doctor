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
