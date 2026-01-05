import 'package:freezed_annotation/freezed_annotation.dart';
import '../../patient/domain/clinical_models.dart';
import '../../patient/domain/patient_models.dart';

part 'consultation_models.freezed.dart';
part 'consultation_models.g.dart';

@freezed
class ConsultationInitData with _$ConsultationInitData {
  const factory ConsultationInitData({
    required AppointmentClinicalDetails appointmentDetails,
    required PatientDetail patient360,
  }) = _ConsultationInitData;

  factory ConsultationInitData.fromJson(Map<String, dynamic> json) =>
      _$ConsultationInitDataFromJson(json);
}

@freezed
class ConsultationState with _$ConsultationState {
  const factory ConsultationState({
    // Status
    @Default(true) bool isLoading,
    @Default(false) bool isSaving,
    String? error,

    // Core Data
    ConsultationInitData? initData,

    // Form Fields
    @Default({}) Map<String, dynamic> vitals, // {bp_sys: 120, temp: 98.6 ...}
    @Default('') String chiefComplaint,
    @Default([]) List<String> symptoms,
    @Default([]) List<String> diagnosis,
    @Default([]) List<PrescriptionMedicine> medicines,
    @Default([]) List<PrescriptionLab> labOrders,
    String? nextVisitDate, // ISO Date String
    String? adviceNotes,
  }) = _ConsultationState;

  factory ConsultationState.fromJson(Map<String, dynamic> json) =>
      _$ConsultationStateFromJson(json);
}

@freezed
class MedicineMaster with _$MedicineMaster {
  const factory MedicineMaster({
    required String id,
    required String name,
    @JsonKey(name: 'brand_name') String? brandName,
    @JsonKey(name: 'generic_name') String? genericName,
    String? type,
    String? strength,
    @JsonKey(name: 'dosage_form') String? dosageForm,
  }) = _MedicineMaster;

  factory MedicineMaster.fromJson(Map<String, dynamic> json) =>
      _$MedicineMasterFromJson(json);
}
