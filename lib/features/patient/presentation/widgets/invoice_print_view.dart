import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../domain/clinical_models.dart';
import '../patient_details_controller.dart';

class InvoicePrintView extends ConsumerWidget {
  final String invoiceId;

  const InvoicePrintView({super.key, required this.invoiceId});

  static void show(BuildContext context, String invoiceId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => InvoicePrintView(invoiceId: invoiceId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(invoicePrintDataProvider(invoiceId));

    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
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
                  "INVOICE DETAILS",
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
                  return const Center(child: Text("Invoice not found"));
                }
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: _buildThermalInvoice(context, data),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThermalInvoice(BuildContext context, InvoicePrintData data) {
    final fmtCurrency = NumberFormat.currency(symbol: '₹', decimalDigits: 2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Clinic Header
        if (data.clinic.branding?['logo'] != null)
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Image.network(
                data.clinic.branding!['logo'],
                height: 60,
                errorBuilder: (_, _, _) => const SizedBox(),
              ),
            ),
          ),
        Text(
          data.clinic.name,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontWeight: FontWeight.w900, fontSize: 18),
        ),
        const SizedBox(height: 4),
        Text(
          data.clinic.addressFull,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontSize: 10, color: Colors.grey[600]),
        ),
        if (data.clinic.contacts != null)
          Text(
            "Ph: ${data.clinic.contacts!['primary']} | ${data.clinic.contacts!['email'] ?? ''}",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 10, color: Colors.grey[600]),
          ),

        const SizedBox(height: 16),
        const Divider(color: Colors.black),
        const SizedBox(height: 8),

        // Meta Info
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "INV: ${data.meta.invoiceNo}",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
                Text(
                  data.appointment.date,
                  style: GoogleFonts.inter(fontSize: 10),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Token: ${data.appointment.tokenNumber}",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
                Text(
                  data.appointment.startTime,
                  style: GoogleFonts.inter(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Patient & Doctor
        _InfoRow("Patient", data.patient.name),
        _InfoRow("UHID", data.patient.uhid),
        if (data.patient.phone != null) _InfoRow("Phone", data.patient.phone!),
        const SizedBox(height: 8),
        _InfoRow("Doctor", data.doctor.name),
        if (data.doctor.specialty != null)
          _InfoRow("Specialty", data.doctor.specialty!),

        const SizedBox(height: 16),
        const Divider(color: Colors.grey),

        // Items Table
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1.5),
            },
            children: [
              TableRow(
                children: [
                  Text("Desc", style: _headerStyle),
                  Text("Qty", style: _headerStyle, textAlign: TextAlign.center),
                  Text("Amt", style: _headerStyle, textAlign: TextAlign.right),
                ],
              ),
              const TableRow(
                children: [
                  SizedBox(height: 8),
                  SizedBox(height: 8),
                  SizedBox(height: 8),
                ],
              ),
              ...data.financials.items.map(
                (item) => TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(item.desc, style: _commonStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        "${item.qty}",
                        style: _commonStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        fmtCurrency.format(item.total),
                        style: _commonStyle,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const Divider(color: Colors.grey),
        const SizedBox(height: 8),

        // Totals
        _TotalRow("Sub Total", fmtCurrency.format(data.financials.subTotal)),
        if (data.financials.taxTotal > 0)
          _TotalRow("Tax", fmtCurrency.format(data.financials.taxTotal)),
        const SizedBox(height: 4),
        _TotalRow(
          "Grand Total",
          fmtCurrency.format(data.financials.grandTotal),
          isBold: true,
          scale: 1.2,
        ),
        const SizedBox(height: 4),
        _TotalRow("Paid", fmtCurrency.format(data.financials.amountPaid)),
        if (data.financials.balanceDue > 0)
          _TotalRow(
            "Balance Due",
            fmtCurrency.format(data.financials.balanceDue),
            color: Colors.red,
            isBold: true,
          ),

        const SizedBox(height: 20),

        // Footer Msg
        if (data.clinic.branding?['footer_msg'] != null)
          Text(
            data.clinic.branding!['footer_msg'],
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 10,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
      ],
    );
  }

  TextStyle get _headerStyle => GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    textBaseline: TextBaseline.alphabetic,
  );

  TextStyle get _commonStyle =>
      GoogleFonts.inter(fontSize: 11, color: Colors.black87);
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              "$label:",
              style: GoogleFonts.inter(fontSize: 11, color: Colors.grey[600]),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final Color? color;
  final double scale;

  const _TotalRow(
    this.label,
    this.value, {
    this.isBold = false,
    this.color,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11 * scale,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
              color: color ?? Colors.black,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 11 * scale,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
              color: color ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
