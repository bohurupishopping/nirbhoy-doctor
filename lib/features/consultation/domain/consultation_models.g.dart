// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultationContextImpl _$$ConsultationContextImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultationContextImpl(
  patient: PersonBasicDetails.fromJson(json['patient'] as Map<String, dynamic>),
  consultationId: json['consultationId'] as String,
  safetyProfile: MedicalProfile.fromJson(
    json['medical_profile'] as Map<String, dynamic>,
  ),
  visitHistory:
      (json['visit_history'] as List<dynamic>?)
          ?.map((e) => VisitHistoryItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  documents:
      (json['documents'] as List<dynamic>?)
          ?.map((e) => PatientDocument.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  vitalsTrend:
      (json['vitals_trend'] as List<dynamic>?)
          ?.map((e) => VitalsTrendItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  aiSummary: json['ai_summary'] as String?,
);

Map<String, dynamic> _$$ConsultationContextImplToJson(
  _$ConsultationContextImpl instance,
) => <String, dynamic>{
  'patient': instance.patient,
  'consultationId': instance.consultationId,
  'medical_profile': instance.safetyProfile,
  'visit_history': instance.visitHistory,
  'documents': instance.documents,
  'vitals_trend': instance.vitalsTrend,
  'ai_summary': instance.aiSummary,
};

_$PersonBasicDetailsImpl _$$PersonBasicDetailsImplFromJson(
  Map<String, dynamic> json,
) => _$PersonBasicDetailsImpl(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? 'Unknown',
  age: (json['age'] as num?)?.toInt() ?? 0,
  gender: json['gender'] as String? ?? '',
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  isCritical: json['isCritical'] as bool? ?? false,
  isWheelchair: json['isWheelchair'] as bool? ?? false,
);

Map<String, dynamic> _$$PersonBasicDetailsImplToJson(
  _$PersonBasicDetailsImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'age': instance.age,
  'gender': instance.gender,
  'phone': instance.phone,
  'address': instance.address,
  'isCritical': instance.isCritical,
  'isWheelchair': instance.isWheelchair,
};

_$MedicalProfileImpl _$$MedicalProfileImplFromJson(Map<String, dynamic> json) =>
    _$MedicalProfileImpl(
      allergies:
          (json['allergies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      chronicConditions:
          (json['chronic_conditions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      familyHistory:
          (json['family_history'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      lifestyle: json['lifestyle_tags'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$MedicalProfileImplToJson(
  _$MedicalProfileImpl instance,
) => <String, dynamic>{
  'allergies': instance.allergies,
  'chronic_conditions': instance.chronicConditions,
  'family_history': instance.familyHistory,
  'lifestyle_tags': instance.lifestyle,
};

_$VisitHistoryItemImpl _$$VisitHistoryItemImplFromJson(
  Map<String, dynamic> json,
) => _$VisitHistoryItemImpl(
  id: json['appointment_id'] as String,
  date: DateTime.parse(json['visit_date'] as String),
  doctorName: json['doctor_name'] as String?,
  specialty: json['specialty'] as String?,
  diagnosis: json['diagnosis'] as List<dynamic>? ?? const [],
  vitals: json['vitals'] as Map<String, dynamic>?,
  prescriptions: json['prescriptions'] as List<dynamic>? ?? const [],
  labOrders: json['lab_orders'] as List<dynamic>? ?? const [],
  notes: json['notes'] as String?,
  advice: json['advice'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$VisitHistoryItemImplToJson(
  _$VisitHistoryItemImpl instance,
) => <String, dynamic>{
  'appointment_id': instance.id,
  'visit_date': instance.date.toIso8601String(),
  'doctor_name': instance.doctorName,
  'specialty': instance.specialty,
  'diagnosis': instance.diagnosis,
  'vitals': instance.vitals,
  'prescriptions': instance.prescriptions,
  'lab_orders': instance.labOrders,
  'notes': instance.notes,
  'advice': instance.advice,
};

_$PatientDocumentImpl _$$PatientDocumentImplFromJson(
  Map<String, dynamic> json,
) => _$PatientDocumentImpl(
  id: json['id'] as String? ?? '',
  fileName: json['name'] as String? ?? '',
  fileUrl: json['url'] as String? ?? '',
  category: json['category'] as String? ?? '',
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$$PatientDocumentImplToJson(
  _$PatientDocumentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.fileName,
  'url': instance.fileUrl,
  'category': instance.category,
  'date': instance.date?.toIso8601String(),
};

_$VitalsTrendItemImpl _$$VitalsTrendItemImplFromJson(
  Map<String, dynamic> json,
) => _$VitalsTrendItemImpl(
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  weight: json['weight'] as String?,
  temp: json['temp'] as String?,
  bp: json['bp'] as String?,
);

Map<String, dynamic> _$$VitalsTrendItemImplToJson(
  _$VitalsTrendItemImpl instance,
) => <String, dynamic>{
  'date': instance.date?.toIso8601String(),
  'weight': instance.weight,
  'temp': instance.temp,
  'bp': instance.bp,
};

_$MedicineSearchResultImpl _$$MedicineSearchResultImplFromJson(
  Map<String, dynamic> json,
) => _$MedicineSearchResultImpl(
  id: json['id'] as String,
  brandName: json['brand_name'] as String,
  genericName: json['generic_name'] as String?,
  strength: json['strength'] as String?,
  type: json['type'] as String?,
  manufacturer: json['manufacturer'] as String?,
  composition: json['composition'] as String?,
);

Map<String, dynamic> _$$MedicineSearchResultImplToJson(
  _$MedicineSearchResultImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'brand_name': instance.brandName,
  'generic_name': instance.genericName,
  'strength': instance.strength,
  'type': instance.type,
  'manufacturer': instance.manufacturer,
  'composition': instance.composition,
};

_$ConsultationMedicineImpl _$$ConsultationMedicineImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultationMedicineImpl(
  tempId: json['tempId'] as String,
  masterId: json['masterId'] as String,
  name: json['name'] as String,
  composition: json['composition'] as String?,
  type: json['type'] as String?,
  frequency: json['frequency'] as String?,
  duration: json['duration'] as String?,
  instruction: json['instruction'] as String?,
  specialInstructions: json['specialInstructions'] as String?,
);

Map<String, dynamic> _$$ConsultationMedicineImplToJson(
  _$ConsultationMedicineImpl instance,
) => <String, dynamic>{
  'tempId': instance.tempId,
  'masterId': instance.masterId,
  'name': instance.name,
  'composition': instance.composition,
  'type': instance.type,
  'frequency': instance.frequency,
  'duration': instance.duration,
  'instruction': instance.instruction,
  'specialInstructions': instance.specialInstructions,
};

_$ConsultationLabImpl _$$ConsultationLabImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultationLabImpl(
  testName: json['testName'] as String,
  instruction: json['instruction'] as String?,
);

Map<String, dynamic> _$$ConsultationLabImplToJson(
  _$ConsultationLabImpl instance,
) => <String, dynamic>{
  'testName': instance.testName,
  'instruction': instance.instruction,
};

_$ConsultationStateImpl _$$ConsultationStateImplFromJson(
  Map<String, dynamic> json,
) => _$ConsultationStateImpl(
  isLoading: json['isLoading'] as bool? ?? true,
  isSaving: json['isSaving'] as bool? ?? false,
  error: json['error'] as String?,
  context: json['context'] == null
      ? null
      : ConsultationContext.fromJson(json['context'] as Map<String, dynamic>),
  vitals:
      (json['vitals'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {'bp': '', 'temp': '', 'weight': '', 'spo2': ''},
  chiefComplaint: json['chiefComplaint'] as String? ?? '',
  symptoms:
      (json['symptoms'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  diagnosis:
      (json['diagnosis'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  medicines:
      (json['medicines'] as List<dynamic>?)
          ?.map((e) => ConsultationMedicine.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  labOrders:
      (json['labOrders'] as List<dynamic>?)
          ?.map((e) => ConsultationLab.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  nextVisitDate: json['nextVisitDate'] == null
      ? null
      : DateTime.parse(json['nextVisitDate'] as String),
  adviceNotes: json['adviceNotes'] as String? ?? '',
);

Map<String, dynamic> _$$ConsultationStateImplToJson(
  _$ConsultationStateImpl instance,
) => <String, dynamic>{
  'isLoading': instance.isLoading,
  'isSaving': instance.isSaving,
  'error': instance.error,
  'context': instance.context,
  'vitals': instance.vitals,
  'chiefComplaint': instance.chiefComplaint,
  'symptoms': instance.symptoms,
  'diagnosis': instance.diagnosis,
  'medicines': instance.medicines,
  'labOrders': instance.labOrders,
  'nextVisitDate': instance.nextVisitDate?.toIso8601String(),
  'adviceNotes': instance.adviceNotes,
};
