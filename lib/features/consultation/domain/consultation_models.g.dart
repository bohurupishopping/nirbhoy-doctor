// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultationInitDataImpl _$$ConsultationInitDataImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultationInitDataImpl(
  appointmentDetails: AppointmentClinicalDetails.fromJson(
    json['appointmentDetails'] as Map<String, dynamic>,
  ),
  patient360: PatientDetail.fromJson(
    json['patient360'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$ConsultationInitDataImplToJson(
  _$ConsultationInitDataImpl instance,
) => <String, dynamic>{
  'appointmentDetails': instance.appointmentDetails,
  'patient360': instance.patient360,
};

_$ConsultationStateImpl _$$ConsultationStateImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultationStateImpl(
  isLoading: json['isLoading'] as bool? ?? true,
  isSaving: json['isSaving'] as bool? ?? false,
  error: json['error'] as String?,
  initData: json['initData'] == null
      ? null
      : ConsultationInitData.fromJson(json['initData'] as Map<String, dynamic>),
  vitals: json['vitals'] as Map<String, dynamic>? ?? const {},
  chiefComplaint: json['chiefComplaint'] as String? ?? '',
  symptoms:
      (json['symptoms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  diagnosis:
      (json['diagnosis'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  medicines:
      (json['medicines'] as List<dynamic>?)
          ?.map((e) => PrescriptionMedicine.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  labOrders:
      (json['labOrders'] as List<dynamic>?)
          ?.map((e) => PrescriptionLab.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  nextVisitDate: json['nextVisitDate'] as String?,
  adviceNotes: json['adviceNotes'] as String?,
);

Map<String, dynamic> _$$ConsultationStateImplToJson(
  _$ConsultationStateImpl instance,
) => <String, dynamic>{
  'isLoading': instance.isLoading,
  'isSaving': instance.isSaving,
  'error': instance.error,
  'initData': instance.initData,
  'vitals': instance.vitals,
  'chiefComplaint': instance.chiefComplaint,
  'symptoms': instance.symptoms,
  'diagnosis': instance.diagnosis,
  'medicines': instance.medicines,
  'labOrders': instance.labOrders,
  'nextVisitDate': instance.nextVisitDate,
  'adviceNotes': instance.adviceNotes,
};

_$MedicineMasterImpl _$$MedicineMasterImplFromJson(Map<String, dynamic> json) =>
    _$MedicineMasterImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      brandName: json['brand_name'] as String?,
      genericName: json['generic_name'] as String?,
      type: json['type'] as String?,
      strength: json['strength'] as String?,
      dosageForm: json['dosage_form'] as String?,
    );

Map<String, dynamic> _$$MedicineMasterImplToJson(
  _$MedicineMasterImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'brand_name': instance.brandName,
  'generic_name': instance.genericName,
  'type': instance.type,
  'strength': instance.strength,
  'dosage_form': instance.dosageForm,
};
