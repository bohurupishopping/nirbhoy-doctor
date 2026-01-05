import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/clinical_models.dart';
import '../patient_details_controller.dart';

class PrescriptionPrintView extends ConsumerWidget {
  final String appointmentId;

  const PrescriptionPrintView({super.key, required this.appointmentId});

  static void show(BuildContext context, String appointmentId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PrescriptionPrintView(appointmentId: appointmentId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(prescriptionPrintDataProvider(appointmentId));

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          // Drag Handle
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header with Close Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "PRESCRIPTION PREVIEW",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 20),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Scrollable Content
          Expanded(
            child: asyncData.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text("Error: $err")),
              data: (data) {
                if (data == null) {
                  return const Center(child: Text("Prescription not found"));
                }
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: _buildA4Prescription(context, data),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildA4Prescription(
    BuildContext context,
    PrescriptionPrintData data,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 1. Header (Logo or Text)
        if (data.clinic.headerImageUrl != null)
          Image.network(
            data.clinic.headerImageUrl!,
            height: 100,
            fit: BoxFit.contain,
            errorBuilder: (_, _, _) => const SizedBox(),
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.clinic.name,
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.clinic.address ?? '',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (data.clinic.phone != null || data.clinic.email != null)
                      Text(
                        "${data.clinic.phone != null ? 'Ph: ${data.clinic.phone}  ' : ''}${data.clinic.email != null ? 'Email: ${data.clinic.email}' : ''}",
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                  ],
                ),
              ),
              if (data.clinic.logoUrl != null)
                Image.network(
                  data.clinic.logoUrl!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => const SizedBox(),
                ),
            ],
          ),

        const SizedBox(height: 24),

        // 2. Doctor & Patient Info (Grid 2 cols)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Box
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50.withValues(alpha: 0.5),
                  border: Border.all(color: Colors.green.shade100),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DOCTOR",
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: Colors.green.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.doctor.name,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      data.doctor.specialty ?? 'General Physician',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Text(
                      data.doctor.qualifications ?? '',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Patient Box
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50.withValues(alpha: 0.5),
                  border: Border.all(color: Colors.red.shade100),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PATIENT",
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: Colors.red.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.patient.name,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "${data.patient.ageGender} • ID: ${data.patient.uhid}",
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Text(
                      data.patient.phone,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // 3. Meta & Vitals Bar
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey.shade200),
            ),
          ),
          child: Wrap(
            spacing: 16,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _MetaItem("Date", data.meta.visitDate),
              _MetaItem("Appt #", data.meta.appointmentNumber),
              _MetaItem("Type", data.meta.visitType.toUpperCase()),
              if (data.clinical?.vitals != null) ...[
                Container(width: 1, height: 12, color: Colors.grey.shade300),
                ...data.clinical!.vitals!.entries.map(
                  (e) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${e.key}: ",
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        "${e.value}",
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),

        // 4. Clinical Snapshot
        if (data.clinical != null) ...[
          const SizedBox(height: 16),
          if (data.clinical!.chiefComplaint != null)
            _ClinicalSection(
              title: "Chief Complaint",
              content: data.clinical!.chiefComplaint!,
            ),
          if (data.clinical!.diagnosis != null)
            _ClinicalSection(
              title: "Diagnosis",
              content: data.clinical!.diagnosis is List
                  ? (data.clinical!.diagnosis as List).join(', ')
                  : data.clinical!.diagnosis.toString(),
            ),
          if (data.clinical!.notes != null)
            _ClinicalSection(title: "Notes", content: data.clinical!.notes!),
        ],

        const SizedBox(height: 24),

        // 5. Rx Header
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                "Rx",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Serif',
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "PRESCRIBED MEDICINES",
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                color: Colors.grey.shade400,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // 6. Rx Table
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Table Header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text("MEDICINE", style: _tableHeaderStyle),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text("DOSAGE", style: _tableHeaderStyle),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text("DURATION", style: _tableHeaderStyle),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "INSTRUCTION",
                        style: _tableHeaderStyle,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              // Table Body
              if (data.rxItems.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      "No medicines prescribed",
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                )
              else
                ...data.rxItems.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final med = entry.value;
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey.shade100),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${idx + 1}. ${med.brandName}",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                ),
                              ),
                              if (med.genericName != null)
                                Text(
                                  med.genericName!,
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              if (med.note != null)
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.yellow.shade50,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Colors.yellow.shade100,
                                    ),
                                  ),
                                  child: Text(
                                    "Note: ${med.note}",
                                    style: GoogleFonts.inter(
                                      fontSize: 9,
                                      color: Colors.orange.shade800,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            med.dosage ?? '-',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            med.duration ?? '-',
                            style: GoogleFonts.inter(
                              color: Colors.grey.shade700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            med.instruction ?? '-',
                            textAlign: TextAlign.right,
                            style: GoogleFonts.inter(
                              color: Colors.grey.shade700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            ],
          ),
        ),

        // 7. Lab & Advice
        if (data.labOrders.isNotEmpty) ...[
          const SizedBox(height: 20),
          Text(
            "INVESTIGATIONS",
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: data.labOrders
                .map(
                  (l) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      "• ${l.testName} ${l.instruction != null ? '(${l.instruction})' : ''}",
                      style: GoogleFonts.inter(fontSize: 12),
                    ),
                  ),
                )
                .toList(),
          ),
        ],

        const SizedBox(
          height: 32,
        ), // Push footer down with fixed space instead of Spacer()
        const SizedBox(height: 32),
        const Divider(),

        // 8. Footer Advice & Sig
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (data.advice.nextVisitText != null) ...[
                    Text(
                      "ADVICE",
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.advice.nextVisitText!,
                      style: GoogleFonts.inter(fontSize: 12, height: 1.4),
                    ),
                  ],
                  if (data.advice.nextVisitDate != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Next Visit: ${data.advice.nextVisitDate}",
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (data.doctor.signatureUrl != null)
                  Image.network(
                    data.doctor.signatureUrl!,
                    height: 40,
                    errorBuilder: (_, _, _) => const SizedBox(),
                  ),
                Text(
                  data.doctor.name,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Authorized Signatory",
                  style: GoogleFonts.inter(
                    fontSize: 9,
                    color: Colors.grey,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),

        // 9. Footer Text
        if (data.clinic.footerText != null) ...[
          const SizedBox(height: 16),
          Text(
            data.clinic.footerText!,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 10, color: Colors.grey),
          ),
        ],
      ],
    );
  }

  TextStyle get _tableHeaderStyle => GoogleFonts.inter(
    fontSize: 9,
    fontWeight: FontWeight.bold,
    color: Colors.grey.shade600,
    letterSpacing: 0.5,
  );
}

class _MetaItem extends StatelessWidget {
  final String label;
  final String value;
  const _MetaItem(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: GoogleFonts.inter(fontSize: 9, color: Colors.grey)),
        Text(
          value,
          style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _ClinicalSection extends StatelessWidget {
  final String title;
  final String content;
  const _ClinicalSection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            content,
            style: GoogleFonts.inter(
              fontSize: 12,
              height: 1.4,
              color: Colors.grey.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
