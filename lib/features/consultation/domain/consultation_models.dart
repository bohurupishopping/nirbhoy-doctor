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
    required String id,
    required String name,
    required int age,
    required String gender,
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
    required String id,
    @JsonKey(name: 'file_name') required String fileName,
    @JsonKey(name: 'file_url') required String fileUrl,
    required String category,
    DateTime? date,
  }) = _PatientDocument;

  factory PatientDocument.fromJson(Map<String, dynamic> json) =>
      _$PatientDocumentFromJson(json);
}

@freezed
class VitalsTrendItem with _$VitalsTrendItem {
  const factory VitalsTrendItem({
    required DateTime date,
    double? weight,
    double? temp,
    @JsonKey(name: 'bp_sys') int? bpSys,
    @JsonKey(name: 'bp_dia') int? bpDia,
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
