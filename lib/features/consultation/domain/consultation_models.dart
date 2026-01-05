import 'package:freezed_annotation/freezed_annotation.dart';

// ignore: unused_import
import 'package:flutter/foundation.dart';

part 'consultation_models.freezed.dart';
part 'consultation_models.g.dart';

@freezed
class ConsultationContext with _$ConsultationContext {
  const factory ConsultationContext({
    required PersonBasicDetails patient,
    required String consultationId,
    @JsonKey(name: 'medical_profile') required MedicalProfile safetyProfile,
    @JsonKey(name: 'visit_history')
    @Default([])
    List<VisitHistoryItem> visitHistory,
    @Default([]) List<PatientDocument> documents,
    @JsonKey(name: 'vitals_trend')
    @Default([])
    List<VitalsTrendItem> vitalsTrend,
    @JsonKey(name: 'ai_summary') String? aiSummary,
  }) = _ConsultationContext;

  factory ConsultationContext.fromJson(Map<String, dynamic> json) =>
      _$ConsultationContextFromJson(json);
}

@freezed
class PersonBasicDetails with _$PersonBasicDetails {
  const factory PersonBasicDetails({
    @Default('') String id,
    @Default('Unknown') String name,
    @Default(0) int age,
    @Default('') String gender,
    String? phone,
    String? address,
    @Default(false) bool isCritical,
    @Default(false) bool isWheelchair,
  }) = _PersonBasicDetails;

  factory PersonBasicDetails.fromJson(Map<String, dynamic> json) =>
      _$PersonBasicDetailsFromJson(json);
}

@freezed
class MedicalProfile with _$MedicalProfile {
  const factory MedicalProfile({
    @Default([]) List<String> allergies,
    @JsonKey(name: 'chronic_conditions')
    @Default([])
    List<String> chronicConditions,
    @JsonKey(name: 'family_history') @Default([]) List<String> familyHistory,
    @JsonKey(name: 'lifestyle_tags')
    @Default({})
    Map<String, dynamic> lifestyle,
  }) = _MedicalProfile;

  factory MedicalProfile.fromJson(Map<String, dynamic> json) =>
      _$MedicalProfileFromJson(json);
}

@freezed
class VisitHistoryItem with _$VisitHistoryItem {
  const factory VisitHistoryItem({
    @JsonKey(name: 'appointment_id') required String id,
    @JsonKey(name: 'visit_date') required DateTime date,
    @JsonKey(name: 'doctor_name') String? doctorName,
    String? specialty,
    @Default([]) List<dynamic> diagnosis,
    Map<String, dynamic>? vitals,
    @Default([]) List<dynamic> prescriptions,
    @JsonKey(name: 'lab_orders') @Default([]) List<dynamic> labOrders,
    String? notes,
    Map<String, dynamic>? advice,
  }) = _VisitHistoryItem;

  factory VisitHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$VisitHistoryItemFromJson(json);
}

@freezed
class PatientDocument with _$PatientDocument {
  const factory PatientDocument({
    @Default('') String id,
    @JsonKey(name: 'name') @Default('') String fileName,
    @JsonKey(name: 'url') @Default('') String fileUrl,
    @Default('') String category,
    DateTime? date,
  }) = _PatientDocument;

  factory PatientDocument.fromJson(Map<String, dynamic> json) =>
      _$PatientDocumentFromJson(json);
}

@freezed
class VitalsTrendItem with _$VitalsTrendItem {
  const factory VitalsTrendItem({
    DateTime? date,
    String? weight,
    String? temp,
    String? bp,
  }) = _VitalsTrendItem;

  factory VitalsTrendItem.fromJson(Map<String, dynamic> json) =>
      _$VitalsTrendItemFromJson(json);
}

@freezed
class MedicineSearchResult with _$MedicineSearchResult {
  const factory MedicineSearchResult({
    required String id,
    @JsonKey(name: 'brand_name') required String brandName,
    @JsonKey(name: 'generic_name') String? genericName,
    String? strength,
    String? type,
    String? manufacturer,
    String? composition,
  }) = _MedicineSearchResult;

  factory MedicineSearchResult.fromJson(Map<String, dynamic> json) =>
      _$MedicineSearchResultFromJson(json);
}

// --- Specific Models for Input Flow (Richer than Print Models) ---

@freezed
class ConsultationMedicine with _$ConsultationMedicine {
  const factory ConsultationMedicine({
    // Store tempId for UI keys if needed, or rely on index
    required String tempId,
    required String masterId,
    required String name, // brand name
    String? composition,
    String? type,
    String? frequency,
    String? duration,
    String? instruction,
    String? specialInstructions,
  }) = _ConsultationMedicine;

  factory ConsultationMedicine.fromJson(Map<String, dynamic> json) =>
      _$ConsultationMedicineFromJson(json);
}

@freezed
class ConsultationLab with _$ConsultationLab {
  const factory ConsultationLab({
    required String testName,
    String? instruction,
  }) = _ConsultationLab;

  factory ConsultationLab.fromJson(Map<String, dynamic> json) =>
      _$ConsultationLabFromJson(json);
}

@freezed
class ConsultationState with _$ConsultationState {
  const factory ConsultationState({
    // Status
    @Default(true) bool isLoading,
    @Default(false) bool isSaving,
    String? error,

    // Core Data
    ConsultationContext? context,

    // Form Fields
    @Default({'bp': '', 'temp': '', 'weight': '', 'spo2': ''})
    Map<String, String> vitals,
    @Default('') String chiefComplaint,
    @Default([]) List<String> symptoms,
    @Default([]) List<String> diagnosis,

    @Default([]) List<ConsultationMedicine> medicines,
    @Default([]) List<ConsultationLab> labOrders,

    @Default(null) DateTime? nextVisitDate,
    @Default('') String adviceNotes,
  }) = _ConsultationState;

  factory ConsultationState.fromJson(Map<String, dynamic> json) =>
      _$ConsultationStateFromJson(json);
}

// --- Prescription Print Models ---
@freezed
class PrescriptionPrintData with _$PrescriptionPrintData {
  const factory PrescriptionPrintData({
    required PrescriptionMeta meta,
    required PrescriptionClinic clinic,
    required PrescriptionDoctor doctor,
    required PrescriptionPatient patient,
    PrescriptionClinical? clinical,
    @JsonKey(name: 'rx_items') @Default([]) List<PrescriptionMedicine> rxItems,
    @JsonKey(name: 'lab_orders') @Default([]) List<PrescriptionLab> labOrders,
    required PrescriptionAdvice advice,
  }) = _PrescriptionPrintData;

  factory PrescriptionPrintData.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionPrintDataFromJson(json);
}

@freezed
class PrescriptionMeta with _$PrescriptionMeta {
  const factory PrescriptionMeta({
    @JsonKey(name: 'generated_at') required String generatedAt,
    @JsonKey(name: 'appointment_number') required String appointmentNumber,
    @JsonKey(name: 'visit_type') required String visitType,
    @JsonKey(name: 'visit_date') required String visitDate,
  }) = _PrescriptionMeta;

  factory PrescriptionMeta.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionMetaFromJson(json);
}

@freezed
class PrescriptionClinic with _$PrescriptionClinic {
  const factory PrescriptionClinic({
    required String name,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'header_image_url') String? headerImageUrl,
    String? phone,
    String? email,
    String? address,
    @JsonKey(name: 'footer_text') String? footerText,
  }) = _PrescriptionClinic;

  factory PrescriptionClinic.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionClinicFromJson(json);
}

@freezed
class PrescriptionDoctor with _$PrescriptionDoctor {
  const factory PrescriptionDoctor({
    required String name,
    String? specialty,
    String? qualifications,
    @JsonKey(name: 'reg_number') String? regNumber,
    @JsonKey(name: 'signature_url') String? signatureUrl,
  }) = _PrescriptionDoctor;

  factory PrescriptionDoctor.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionDoctorFromJson(json);
}

@freezed
class PrescriptionPatient with _$PrescriptionPatient {
  const factory PrescriptionPatient({
    required String name,
    required String uhid,
    @JsonKey(name: 'age_gender') required String ageGender,
    required String phone,
    required String address,
    @JsonKey(name: 'known_allergies') @Default([]) List<String> knownAllergies,
  }) = _PrescriptionPatient;

  factory PrescriptionPatient.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionPatientFromJson(json);
}

@freezed
class PrescriptionClinical with _$PrescriptionClinical {
  const factory PrescriptionClinical({
    Map<String, dynamic>? vitals,
    dynamic diagnosis, // Can be string or list json, use carefully
    dynamic symptoms,
    String? notes,
    @JsonKey(name: 'chief_complaint') String? chiefComplaint,
  }) = _PrescriptionClinical;

  factory PrescriptionClinical.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionClinicalFromJson(json);
}

@freezed
class PrescriptionMedicine with _$PrescriptionMedicine {
  const factory PrescriptionMedicine({
    @JsonKey(name: 'brand_name') required String brandName,
    @JsonKey(name: 'generic_name') String? genericName,
    String? type,
    String? dosage, // This maps to frequency in some views
    String? duration,
    String? instruction,
    String? note,
  }) = _PrescriptionMedicine;

  factory PrescriptionMedicine.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionMedicineFromJson(json);
}

@freezed
class PrescriptionLab with _$PrescriptionLab {
  const factory PrescriptionLab({
    @JsonKey(name: 'test_name') required String testName,
    String? instruction,
  }) = _PrescriptionLab;

  factory PrescriptionLab.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionLabFromJson(json);
}

@freezed
class PrescriptionAdvice with _$PrescriptionAdvice {
  const factory PrescriptionAdvice({
    @JsonKey(name: 'next_visit_date') String? nextVisitDate,
    @JsonKey(name: 'next_visit_text') String? nextVisitText,
  }) = _PrescriptionAdvice;

  factory PrescriptionAdvice.fromJson(Map<String, dynamic> json) =>
      _$PrescriptionAdviceFromJson(json);
}
