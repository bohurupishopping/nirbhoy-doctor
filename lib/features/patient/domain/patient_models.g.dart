// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientImpl _$$PatientImplFromJson(Map<String, dynamic> json) =>
    _$PatientImpl(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      uhid: json['uhid'] as String?,
      phone: json['phone'] as String,
      age: (json['age'] as num?)?.toInt(),
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      addressStreet: json['address_street'] as String?,
      district: json['district'] as String?,
      state: json['state'] as String?,
      pincode: json['pincode'] as String?,
      religion: json['religion'] as String?,
      flags: json['access_flags'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$PatientImplToJson(_$PatientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'uhid': instance.uhid,
      'phone': instance.phone,
      'age': instance.age,
      'gender': instance.gender,
      'address': instance.address,
      'address_street': instance.addressStreet,
      'district': instance.district,
      'state': instance.state,
      'pincode': instance.pincode,
      'religion': instance.religion,
      'access_flags': instance.flags,
    };

_$PatientHistoryItemImpl _$$PatientHistoryItemImplFromJson(
  Map<String, dynamic> json,
) => _$PatientHistoryItemImpl(
  appointmentId: json['appointment_id'] as String,
  startTime: json['start_time'] as String,
  doctorName: json['doctor_name'] as String?,
  specialty: json['specialty'] as String?,
  status: json['status'] as String,
  invoiceId: json['invoice_id'] as String?,
  grandTotal: json['amount'] as num?,
  balanceDue: json['balance_due'] as num?,
  paymentStatus: json['payment_status'] as String?,
  tokenNumber: (json['token_number'] as num?)?.toInt(),
);

Map<String, dynamic> _$$PatientHistoryItemImplToJson(
  _$PatientHistoryItemImpl instance,
) => <String, dynamic>{
  'appointment_id': instance.appointmentId,
  'start_time': instance.startTime,
  'doctor_name': instance.doctorName,
  'specialty': instance.specialty,
  'status': instance.status,
  'invoice_id': instance.invoiceId,
  'amount': instance.grandTotal,
  'balance_due': instance.balanceDue,
  'payment_status': instance.paymentStatus,
  'token_number': instance.tokenNumber,
};

_$PatientDocumentImpl _$$PatientDocumentImplFromJson(
  Map<String, dynamic> json,
) => _$PatientDocumentImpl(
  id: json['id'] as String,
  fileName: json['file_name'] as String,
  fileUrl: json['file_url'] as String,
  category: json['category'] as String,
  uploadedAt: json['uploaded_at'] as String,
);

Map<String, dynamic> _$$PatientDocumentImplToJson(
  _$PatientDocumentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'file_name': instance.fileName,
  'file_url': instance.fileUrl,
  'category': instance.category,
  'uploaded_at': instance.uploadedAt,
};

_$PatientDetailImpl _$$PatientDetailImplFromJson(Map<String, dynamic> json) =>
    _$PatientDetailImpl(
      profile: Patient.fromJson(json['profile'] as Map<String, dynamic>),
      appointments:
          (json['appointments'] as List<dynamic>?)
              ?.map(
                (e) => PatientHistoryItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      documents:
          (json['documents'] as List<dynamic>?)
              ?.map((e) => PatientDocument.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PatientDetailImplToJson(_$PatientDetailImpl instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'appointments': instance.appointments,
      'documents': instance.documents,
    };

_$PatientListResultImpl _$$PatientListResultImplFromJson(
  Map<String, dynamic> json,
) => _$PatientListResultImpl(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Patient.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: (json['total'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$PatientListResultImplToJson(
  _$PatientListResultImpl instance,
) => <String, dynamic>{'data': instance.data, 'total': instance.total};
