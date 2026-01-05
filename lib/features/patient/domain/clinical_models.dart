import 'package:freezed_annotation/freezed_annotation.dart';

part 'clinical_models.freezed.dart';
part 'clinical_models.g.dart';

@freezed
class AppointmentClinicalDetails with _$AppointmentClinicalDetails {
  const factory AppointmentClinicalDetails({
    required ClinicalPatientInfo patient,
    required ClinicalMeta meta,
    ClinicalConsultation? consultation,
    @Default([]) List<ClinicalMedicine> medicines,
    @Default([]) List<ClinicalLab> labs,
  }) = _AppointmentClinicalDetails;

  factory AppointmentClinicalDetails.fromJson(Map<String, dynamic> json) =>
      _$AppointmentClinicalDetailsFromJson(json);
}

@freezed
class ClinicalPatientInfo with _$ClinicalPatientInfo {
  const factory ClinicalPatientInfo({
    required String id,
    @JsonKey(name: 'full_name') required String fullName,
    int? age,
    String? gender,
    String? uhid,
    String? phone,
    Map<String, dynamic>? flags,
  }) = _ClinicalPatientInfo;

  factory ClinicalPatientInfo.fromJson(Map<String, dynamic> json) =>
      _$ClinicalPatientInfoFromJson(json);
}

@freezed
class ClinicalMeta with _$ClinicalMeta {
  const factory ClinicalMeta({
    @JsonKey(name: 'appointment_id') required String appointmentId,
    required String date,
    required String status,
    @JsonKey(name: 'doctor_name') String? doctorName,
    String? specialty,
    @JsonKey(name: 'token_number') int? tokenNumber,
    @JsonKey(name: 'invoice_id') String? invoiceId,
    @JsonKey(name: 'invoice_number') String? invoiceNumber,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'total_amount') num? totalAmount,
    @JsonKey(name: 'amount_paid') num? amountPaid,
    @JsonKey(name: 'balance_due') num? balanceDue,
  }) = _ClinicalMeta;

  factory ClinicalMeta.fromJson(Map<String, dynamic> json) =>
      _$ClinicalMetaFromJson(json);
}

@freezed
class ClinicalConsultation with _$ClinicalConsultation {
  const factory ClinicalConsultation({
    @JsonKey(name: 'consultation_id') required String consultationId,
    Map<String, dynamic>? vitals,
    @JsonKey(name: 'next_visit_date') String? nextVisitDate,
    @JsonKey(name: 'next_visit_text') String? nextVisitText,
    List<dynamic>? diagnosis,
  }) = _ClinicalConsultation;

  factory ClinicalConsultation.fromJson(Map<String, dynamic> json) =>
      _$ClinicalConsultationFromJson(json);
}

@freezed
class ClinicalMedicine with _$ClinicalMedicine {
  const factory ClinicalMedicine({
    required String name,
    String? type,
    String? frequency,
    String? duration,
    String? instruction,
  }) = _ClinicalMedicine;

  factory ClinicalMedicine.fromJson(Map<String, dynamic> json) =>
      _$ClinicalMedicineFromJson(json);
}

@freezed
class ClinicalLab with _$ClinicalLab {
  const factory ClinicalLab({
    required String test,
    String? instruction,
    required bool completed,
  }) = _ClinicalLab;

  factory ClinicalLab.fromJson(Map<String, dynamic> json) =>
      _$ClinicalLabFromJson(json);
}

// --- Invoice Print Models ---
@freezed
class InvoicePrintData with _$InvoicePrintData {
  const factory InvoicePrintData({
    required InvoiceMeta meta,
    required InvoiceClinic clinic,
    required InvoiceDoctor doctor,
    required InvoicePatient patient,
    required InvoiceAppointment appointment,
    required InvoiceFinancials financials,
  }) = _InvoicePrintData;

  factory InvoicePrintData.fromJson(Map<String, dynamic> json) =>
      _$InvoicePrintDataFromJson(json);
}

@freezed
class InvoiceMeta with _$InvoiceMeta {
  const factory InvoiceMeta({
    @JsonKey(name: 'generated_at') required String generatedAt,
    @JsonKey(name: 'invoice_no') required String invoiceNo,
    @JsonKey(name: 'full_invoice_id') required String fullInvoiceId,
  }) = _InvoiceMeta;

  factory InvoiceMeta.fromJson(Map<String, dynamic> json) =>
      _$InvoiceMetaFromJson(json);
}

@freezed
class InvoiceClinic with _$InvoiceClinic {
  const factory InvoiceClinic({
    required String name,
    @JsonKey(name: 'address_full') required String addressFull,
    Map<String, dynamic>? contacts, // primary, email etc
    Map<String, dynamic>? branding, // logo, footer_msg
    @JsonKey(name: 'tax_info') String? taxInfo,
  }) = _InvoiceClinic;

  factory InvoiceClinic.fromJson(Map<String, dynamic> json) =>
      _$InvoiceClinicFromJson(json);
}

@freezed
class InvoiceDoctor with _$InvoiceDoctor {
  const factory InvoiceDoctor({
    required String name,
    @JsonKey(name: 'reg_no') String? regNo,
    String? specialty,
    String? qualifications,
    String? signature,
  }) = _InvoiceDoctor;

  factory InvoiceDoctor.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDoctorFromJson(json);
}

@freezed
class InvoicePatient with _$InvoicePatient {
  const factory InvoicePatient({
    required String name,
    required String uhid,
    String? phone,
    @JsonKey(name: 'age_gender') String? ageGender,
    @JsonKey(name: 'address_full') String? addressFull,
  }) = _InvoicePatient;

  factory InvoicePatient.fromJson(Map<String, dynamic> json) =>
      _$InvoicePatientFromJson(json);
}

@freezed
class InvoiceAppointment with _$InvoiceAppointment {
  const factory InvoiceAppointment({
    required String date,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    required String type,
    @JsonKey(name: 'appt_number') String? apptNumber,
    @JsonKey(name: 'token_number') required int tokenNumber,
    String? room,
    @JsonKey(name: 'created_by_name') String? createdByName,
  }) = _InvoiceAppointment;

  factory InvoiceAppointment.fromJson(Map<String, dynamic> json) =>
      _$InvoiceAppointmentFromJson(json);
}

@freezed
class InvoiceFinancials with _$InvoiceFinancials {
  const factory InvoiceFinancials({
    String? status,
    @JsonKey(name: 'sub_total') required num subTotal,
    @JsonKey(name: 'tax_total') required num taxTotal,
    @JsonKey(name: 'grand_total') required num grandTotal,
    @JsonKey(name: 'amount_paid') required num amountPaid,
    @JsonKey(name: 'balance_due') required num balanceDue,
    @Default([]) List<InvoiceItem> items,
    // payment_history skipped for now as UI doesn't explicitly use it yet
  }) = _InvoiceFinancials;

  factory InvoiceFinancials.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFinancialsFromJson(json);
}

@freezed
class InvoiceItem with _$InvoiceItem {
  const factory InvoiceItem({
    required String desc,
    required num qty,
    @JsonKey(name: 'unit_price') required num unitPrice,
    required num total,
  }) = _InvoiceItem;

  factory InvoiceItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemFromJson(json);
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

// --- Timeline Models ---
@freezed
class TimelineEvent with _$TimelineEvent {
  const factory TimelineEvent({
    @JsonKey(name: 'event_time') required String eventTime,
    @JsonKey(name: 'event_type') required String eventType,
    required String title,
    String? description,
    @JsonKey(name: 'actor_name') String? actorName,
    String? color,
  }) = _TimelineEvent;

  factory TimelineEvent.fromJson(Map<String, dynamic> json) =>
      _$TimelineEventFromJson(json);
}
