// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinical_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppointmentClinicalDetailsImpl _$$AppointmentClinicalDetailsImplFromJson(
  Map<String, dynamic> json,
) => _$AppointmentClinicalDetailsImpl(
  patient: ClinicalPatientInfo.fromJson(
    json['patient'] as Map<String, dynamic>,
  ),
  meta: ClinicalMeta.fromJson(json['meta'] as Map<String, dynamic>),
  consultation: json['consultation'] == null
      ? null
      : ClinicalConsultation.fromJson(
          json['consultation'] as Map<String, dynamic>,
        ),
  medicines:
      (json['medicines'] as List<dynamic>?)
          ?.map((e) => ClinicalMedicine.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  labs:
      (json['labs'] as List<dynamic>?)
          ?.map((e) => ClinicalLab.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$AppointmentClinicalDetailsImplToJson(
  _$AppointmentClinicalDetailsImpl instance,
) => <String, dynamic>{
  'patient': instance.patient,
  'meta': instance.meta,
  'consultation': instance.consultation,
  'medicines': instance.medicines,
  'labs': instance.labs,
};

_$ClinicalPatientInfoImpl _$$ClinicalPatientInfoImplFromJson(
  Map<String, dynamic> json,
) => _$ClinicalPatientInfoImpl(
  id: json['id'] as String,
  fullName: json['full_name'] as String,
  age: (json['age'] as num?)?.toInt(),
  gender: json['gender'] as String?,
  uhid: json['uhid'] as String?,
  phone: json['phone'] as String?,
  flags: json['flags'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$ClinicalPatientInfoImplToJson(
  _$ClinicalPatientInfoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'age': instance.age,
  'gender': instance.gender,
  'uhid': instance.uhid,
  'phone': instance.phone,
  'flags': instance.flags,
};

_$ClinicalMetaImpl _$$ClinicalMetaImplFromJson(Map<String, dynamic> json) =>
    _$ClinicalMetaImpl(
      appointmentId: json['appointment_id'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
      doctorName: json['doctor_name'] as String?,
      specialty: json['specialty'] as String?,
      tokenNumber: (json['token_number'] as num?)?.toInt(),
      invoiceId: json['invoice_id'] as String?,
      invoiceNumber: json['invoice_number'] as String?,
      paymentStatus: json['payment_status'] as String?,
      totalAmount: json['total_amount'] as num?,
      amountPaid: json['amount_paid'] as num?,
      balanceDue: json['balance_due'] as num?,
    );

Map<String, dynamic> _$$ClinicalMetaImplToJson(_$ClinicalMetaImpl instance) =>
    <String, dynamic>{
      'appointment_id': instance.appointmentId,
      'date': instance.date,
      'status': instance.status,
      'doctor_name': instance.doctorName,
      'specialty': instance.specialty,
      'token_number': instance.tokenNumber,
      'invoice_id': instance.invoiceId,
      'invoice_number': instance.invoiceNumber,
      'payment_status': instance.paymentStatus,
      'total_amount': instance.totalAmount,
      'amount_paid': instance.amountPaid,
      'balance_due': instance.balanceDue,
    };

_$ClinicalConsultationImpl _$$ClinicalConsultationImplFromJson(
  Map<String, dynamic> json,
) => _$ClinicalConsultationImpl(
  consultationId: json['consultation_id'] as String,
  vitals: json['vitals'] as Map<String, dynamic>?,
  nextVisitDate: json['next_visit_date'] as String?,
  nextVisitText: json['next_visit_text'] as String?,
  diagnosis: json['diagnosis'] as List<dynamic>?,
);

Map<String, dynamic> _$$ClinicalConsultationImplToJson(
  _$ClinicalConsultationImpl instance,
) => <String, dynamic>{
  'consultation_id': instance.consultationId,
  'vitals': instance.vitals,
  'next_visit_date': instance.nextVisitDate,
  'next_visit_text': instance.nextVisitText,
  'diagnosis': instance.diagnosis,
};

_$ClinicalMedicineImpl _$$ClinicalMedicineImplFromJson(
  Map<String, dynamic> json,
) => _$ClinicalMedicineImpl(
  name: json['name'] as String,
  type: json['type'] as String?,
  frequency: json['frequency'] as String?,
  duration: json['duration'] as String?,
  instruction: json['instruction'] as String?,
);

Map<String, dynamic> _$$ClinicalMedicineImplToJson(
  _$ClinicalMedicineImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'type': instance.type,
  'frequency': instance.frequency,
  'duration': instance.duration,
  'instruction': instance.instruction,
};

_$ClinicalLabImpl _$$ClinicalLabImplFromJson(Map<String, dynamic> json) =>
    _$ClinicalLabImpl(
      test: json['test'] as String,
      instruction: json['instruction'] as String?,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$ClinicalLabImplToJson(_$ClinicalLabImpl instance) =>
    <String, dynamic>{
      'test': instance.test,
      'instruction': instance.instruction,
      'completed': instance.completed,
    };

_$InvoicePrintDataImpl _$$InvoicePrintDataImplFromJson(
  Map<String, dynamic> json,
) => _$InvoicePrintDataImpl(
  meta: InvoiceMeta.fromJson(json['meta'] as Map<String, dynamic>),
  clinic: InvoiceClinic.fromJson(json['clinic'] as Map<String, dynamic>),
  doctor: InvoiceDoctor.fromJson(json['doctor'] as Map<String, dynamic>),
  patient: InvoicePatient.fromJson(json['patient'] as Map<String, dynamic>),
  appointment: InvoiceAppointment.fromJson(
    json['appointment'] as Map<String, dynamic>,
  ),
  financials: InvoiceFinancials.fromJson(
    json['financials'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$InvoicePrintDataImplToJson(
  _$InvoicePrintDataImpl instance,
) => <String, dynamic>{
  'meta': instance.meta,
  'clinic': instance.clinic,
  'doctor': instance.doctor,
  'patient': instance.patient,
  'appointment': instance.appointment,
  'financials': instance.financials,
};

_$InvoiceMetaImpl _$$InvoiceMetaImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceMetaImpl(
      generatedAt: json['generated_at'] as String,
      invoiceNo: json['invoice_no'] as String,
      fullInvoiceId: json['full_invoice_id'] as String,
    );

Map<String, dynamic> _$$InvoiceMetaImplToJson(_$InvoiceMetaImpl instance) =>
    <String, dynamic>{
      'generated_at': instance.generatedAt,
      'invoice_no': instance.invoiceNo,
      'full_invoice_id': instance.fullInvoiceId,
    };

_$InvoiceClinicImpl _$$InvoiceClinicImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceClinicImpl(
      name: json['name'] as String,
      addressFull: json['address_full'] as String,
      contacts: json['contacts'] as Map<String, dynamic>?,
      branding: json['branding'] as Map<String, dynamic>?,
      taxInfo: json['tax_info'] as String?,
    );

Map<String, dynamic> _$$InvoiceClinicImplToJson(_$InvoiceClinicImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address_full': instance.addressFull,
      'contacts': instance.contacts,
      'branding': instance.branding,
      'tax_info': instance.taxInfo,
    };

_$InvoiceDoctorImpl _$$InvoiceDoctorImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceDoctorImpl(
      name: json['name'] as String,
      regNo: json['reg_no'] as String?,
      specialty: json['specialty'] as String?,
      qualifications: json['qualifications'] as String?,
      signature: json['signature'] as String?,
    );

Map<String, dynamic> _$$InvoiceDoctorImplToJson(_$InvoiceDoctorImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'reg_no': instance.regNo,
      'specialty': instance.specialty,
      'qualifications': instance.qualifications,
      'signature': instance.signature,
    };

_$InvoicePatientImpl _$$InvoicePatientImplFromJson(Map<String, dynamic> json) =>
    _$InvoicePatientImpl(
      name: json['name'] as String,
      uhid: json['uhid'] as String,
      phone: json['phone'] as String?,
      ageGender: json['age_gender'] as String?,
      addressFull: json['address_full'] as String?,
    );

Map<String, dynamic> _$$InvoicePatientImplToJson(
  _$InvoicePatientImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'uhid': instance.uhid,
  'phone': instance.phone,
  'age_gender': instance.ageGender,
  'address_full': instance.addressFull,
};

_$InvoiceAppointmentImpl _$$InvoiceAppointmentImplFromJson(
  Map<String, dynamic> json,
) => _$InvoiceAppointmentImpl(
  date: json['date'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  type: json['type'] as String,
  apptNumber: json['appt_number'] as String?,
  tokenNumber: (json['token_number'] as num).toInt(),
  room: json['room'] as String?,
  createdByName: json['created_by_name'] as String?,
);

Map<String, dynamic> _$$InvoiceAppointmentImplToJson(
  _$InvoiceAppointmentImpl instance,
) => <String, dynamic>{
  'date': instance.date,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'type': instance.type,
  'appt_number': instance.apptNumber,
  'token_number': instance.tokenNumber,
  'room': instance.room,
  'created_by_name': instance.createdByName,
};

_$InvoiceFinancialsImpl _$$InvoiceFinancialsImplFromJson(
  Map<String, dynamic> json,
) => _$InvoiceFinancialsImpl(
  status: json['status'] as String?,
  subTotal: json['sub_total'] as num,
  taxTotal: json['tax_total'] as num,
  grandTotal: json['grand_total'] as num,
  amountPaid: json['amount_paid'] as num,
  balanceDue: json['balance_due'] as num,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => InvoiceItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$InvoiceFinancialsImplToJson(
  _$InvoiceFinancialsImpl instance,
) => <String, dynamic>{
  'status': instance.status,
  'sub_total': instance.subTotal,
  'tax_total': instance.taxTotal,
  'grand_total': instance.grandTotal,
  'amount_paid': instance.amountPaid,
  'balance_due': instance.balanceDue,
  'items': instance.items,
};

_$InvoiceItemImpl _$$InvoiceItemImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceItemImpl(
      desc: json['desc'] as String,
      qty: json['qty'] as num,
      unitPrice: json['unit_price'] as num,
      total: json['total'] as num,
    );

Map<String, dynamic> _$$InvoiceItemImplToJson(_$InvoiceItemImpl instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'qty': instance.qty,
      'unit_price': instance.unitPrice,
      'total': instance.total,
    };

_$PrescriptionPrintDataImpl _$$PrescriptionPrintDataImplFromJson(
  Map<String, dynamic> json,
) => _$PrescriptionPrintDataImpl(
  meta: PrescriptionMeta.fromJson(json['meta'] as Map<String, dynamic>),
  clinic: PrescriptionClinic.fromJson(json['clinic'] as Map<String, dynamic>),
  doctor: PrescriptionDoctor.fromJson(json['doctor'] as Map<String, dynamic>),
  patient: PrescriptionPatient.fromJson(
    json['patient'] as Map<String, dynamic>,
  ),
  clinical: json['clinical'] == null
      ? null
      : PrescriptionClinical.fromJson(json['clinical'] as Map<String, dynamic>),
  rxItems:
      (json['rx_items'] as List<dynamic>?)
          ?.map((e) => PrescriptionMedicine.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  labOrders:
      (json['lab_orders'] as List<dynamic>?)
          ?.map((e) => PrescriptionLab.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  advice: PrescriptionAdvice.fromJson(json['advice'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$PrescriptionPrintDataImplToJson(
  _$PrescriptionPrintDataImpl instance,
) => <String, dynamic>{
  'meta': instance.meta,
  'clinic': instance.clinic,
  'doctor': instance.doctor,
  'patient': instance.patient,
  'clinical': instance.clinical,
  'rx_items': instance.rxItems,
  'lab_orders': instance.labOrders,
  'advice': instance.advice,
};

_$PrescriptionMetaImpl _$$PrescriptionMetaImplFromJson(
  Map<String, dynamic> json,
) => _$PrescriptionMetaImpl(
  generatedAt: json['generated_at'] as String,
  appointmentNumber: json['appointment_number'] as String,
  visitType: json['visit_type'] as String,
  visitDate: json['visit_date'] as String,
);

Map<String, dynamic> _$$PrescriptionMetaImplToJson(
  _$PrescriptionMetaImpl instance,
) => <String, dynamic>{
  'generated_at': instance.generatedAt,
  'appointment_number': instance.appointmentNumber,
  'visit_type': instance.visitType,
  'visit_date': instance.visitDate,
};

_$PrescriptionClinicImpl _$$PrescriptionClinicImplFromJson(
  Map<String, dynamic> json,
) => _$PrescriptionClinicImpl(
  name: json['name'] as String,
  logoUrl: json['logo_url'] as String?,
  headerImageUrl: json['header_image_url'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  address: json['address'] as String?,
  footerText: json['footer_text'] as String?,
);

Map<String, dynamic> _$$PrescriptionClinicImplToJson(
  _$PrescriptionClinicImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'logo_url': instance.logoUrl,
  'header_image_url': instance.headerImageUrl,
  'phone': instance.phone,
  'email': instance.email,
  'address': instance.address,
  'footer_text': instance.footerText,
};

_$PrescriptionDoctorImpl _$$PrescriptionDoctorImplFromJson(
  Map<String, dynamic> json,
) => _$PrescriptionDoctorImpl(
  name: json['name'] as String,
  specialty: json['specialty'] as String?,
  qualifications: json['qualifications'] as String?,
  regNumber: json['reg_number'] as String?,
  signatureUrl: json['signature_url'] as String?,
);

Map<String, dynamic> _$$PrescriptionDoctorImplToJson(
  _$PrescriptionDoctorImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'specialty': instance.specialty,
  'qualifications': instance.qualifications,
  'reg_number': instance.regNumber,
  'signature_url': instance.signatureUrl,
};

_$PrescriptionPatientImpl _$$PrescriptionPatientImplFromJson(
  Map<String, dynamic> json,
) => _$PrescriptionPatientImpl(
  name: json['name'] as String,
  uhid: json['uhid'] as String,
  ageGender: json['age_gender'] as String,
  phone: json['phone'] as String,
  address: json['address'] as String,
  knownAllergies:
      (json['known_allergies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$PrescriptionPatientImplToJson(
  _$PrescriptionPatientImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'uhid': instance.uhid,
  'age_gender': instance.ageGender,
  'phone': instance.phone,
  'address': instance.address,
  'known_allergies': instance.knownAllergies,
};

_$PrescriptionClinicalImpl _$$PrescriptionClinicalImplFromJson(
  Map<String, dynamic> json,
) => _$PrescriptionClinicalImpl(
  vitals: json['vitals'] as Map<String, dynamic>?,
  diagnosis: json['diagnosis'],
  symptoms: json['symptoms'],
  notes: json['notes'] as String?,
  chiefComplaint: json['chief_complaint'] as String?,
);

Map<String, dynamic> _$$PrescriptionClinicalImplToJson(
  _$PrescriptionClinicalImpl instance,
) => <String, dynamic>{
  'vitals': instance.vitals,
  'diagnosis': instance.diagnosis,
  'symptoms': instance.symptoms,
  'notes': instance.notes,
  'chief_complaint': instance.chiefComplaint,
};

_$PrescriptionMedicineImpl _$$PrescriptionMedicineImplFromJson(
  Map<String, dynamic> json,
) => _$PrescriptionMedicineImpl(
  brandName: json['brand_name'] as String,
  genericName: json['generic_name'] as String?,
  type: json['type'] as String?,
  dosage: json['dosage'] as String?,
  duration: json['duration'] as String?,
  instruction: json['instruction'] as String?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$$PrescriptionMedicineImplToJson(
  _$PrescriptionMedicineImpl instance,
) => <String, dynamic>{
  'brand_name': instance.brandName,
  'generic_name': instance.genericName,
  'type': instance.type,
  'dosage': instance.dosage,
  'duration': instance.duration,
  'instruction': instance.instruction,
  'note': instance.note,
};

_$PrescriptionLabImpl _$$PrescriptionLabImplFromJson(
  Map<String, dynamic> json,
) => _$PrescriptionLabImpl(
  testName: json['test_name'] as String,
  instruction: json['instruction'] as String?,
);

Map<String, dynamic> _$$PrescriptionLabImplToJson(
  _$PrescriptionLabImpl instance,
) => <String, dynamic>{
  'test_name': instance.testName,
  'instruction': instance.instruction,
};

_$PrescriptionAdviceImpl _$$PrescriptionAdviceImplFromJson(
  Map<String, dynamic> json,
) => _$PrescriptionAdviceImpl(
  nextVisitDate: json['next_visit_date'] as String?,
  nextVisitText: json['next_visit_text'] as String?,
);

Map<String, dynamic> _$$PrescriptionAdviceImplToJson(
  _$PrescriptionAdviceImpl instance,
) => <String, dynamic>{
  'next_visit_date': instance.nextVisitDate,
  'next_visit_text': instance.nextVisitText,
};

_$TimelineEventImpl _$$TimelineEventImplFromJson(Map<String, dynamic> json) =>
    _$TimelineEventImpl(
      eventTime: json['event_time'] as String,
      eventType: json['event_type'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      actorName: json['actor_name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$$TimelineEventImplToJson(_$TimelineEventImpl instance) =>
    <String, dynamic>{
      'event_time': instance.eventTime,
      'event_type': instance.eventType,
      'title': instance.title,
      'description': instance.description,
      'actor_name': instance.actorName,
      'color': instance.color,
    };
