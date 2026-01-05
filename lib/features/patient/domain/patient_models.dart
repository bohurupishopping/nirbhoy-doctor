import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_models.freezed.dart';
part 'patient_models.g.dart';

@freezed
class Patient with _$Patient {
  const factory Patient({
    required String id,
    @JsonKey(name: 'full_name') required String fullName,
    String? uhid,
    required String phone,
    int? age,
    String? gender,
    String? address, // mapped from address or composite
    @JsonKey(name: 'address_street') String? addressStreet,
    String? district,
    String? state,
    String? pincode,
    String? religion,
    @JsonKey(name: 'access_flags') Map<String, dynamic>? flags,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}

@freezed
class PatientHistoryItem with _$PatientHistoryItem {
  const factory PatientHistoryItem({
    @JsonKey(name: 'appointment_id') required String appointmentId,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'doctor_name') String? doctorName,
    String? specialty,
    required String status,
    @JsonKey(name: 'invoice_id') String? invoiceId,
    @JsonKey(name: 'amount') num? grandTotal,
    @JsonKey(name: 'balance_due') num? balanceDue,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'token_number') int? tokenNumber,
  }) = _PatientHistoryItem;

  factory PatientHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$PatientHistoryItemFromJson(json);
}

@freezed
class PatientDocument with _$PatientDocument {
  const factory PatientDocument({
    required String id,
    @JsonKey(name: 'file_name') required String fileName,
    @JsonKey(name: 'file_url') required String fileUrl,
    required String category,
    @JsonKey(name: 'uploaded_at') required String uploadedAt,
  }) = _PatientDocument;

  factory PatientDocument.fromJson(Map<String, dynamic> json) =>
      _$PatientDocumentFromJson(json);
}

@freezed
class PatientDetail with _$PatientDetail {
  const factory PatientDetail({
    required Patient profile,
    @Default([]) List<PatientHistoryItem> appointments,
    @Default([]) List<PatientDocument> documents,
  }) = _PatientDetail;

  factory PatientDetail.fromJson(Map<String, dynamic> json) =>
      _$PatientDetailFromJson(json);
}

// For List View Pagination
@freezed
class PatientListResult with _$PatientListResult {
  const factory PatientListResult({
    @Default([]) List<Patient> data,
    @Default(0) int total,
  }) = _PatientListResult;

  factory PatientListResult.fromJson(Map<String, dynamic> json) =>
      _$PatientListResultFromJson(json);
}
