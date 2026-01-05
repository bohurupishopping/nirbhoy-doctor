// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import '../../patient/domain/patient_models.dart';
import 'patient_details_controller.dart';
import 'widgets/appointment_details_sheet.dart';
import 'widgets/invoice_print_view.dart';
import 'widgets/prescription_print_view.dart';
import 'widgets/registration_sheet.dart';
import '../../appointments/presentation/widgets/reschedule_dialog.dart';

class PatientDetailsPage extends ConsumerStatefulWidget {
  final String patientId;

  const PatientDetailsPage({super.key, required this.patientId});

  @override
  ConsumerState<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends ConsumerState<PatientDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncData = ref.watch(
      patientDetailsControllerProvider(widget.patientId),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF8),
      body: SafeArea(
        child: asyncData.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
          data: (detail) {
            if (detail == null) {
              return const Center(child: Text("Patient not found"));
            }
            final p = detail.profile;

            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  // 1. Clean Header Section (Custom)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              _HeaderActionButton(
                                icon: Icons.arrow_back_rounded,
                                onTap: () => Navigator.pop(context),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                'Patient 360',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          _HeaderActionButton(
                            icon: Icons.edit_rounded,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) =>
                                    RegistrationSheet(patient: p),
                              ).then((_) {
                                // Refresh data after returning from edit sheet
                                ref.invalidate(
                                  patientDetailsControllerProvider(
                                    widget.patientId,
                                  ),
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 2. Profile Section
                  SliverToBoxAdapter(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 24,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.05),
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                p.fullName[0].toUpperCase(),
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xFFFF8A65),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            p.fullName,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            p.uhid ?? 'NO UHID',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.indigo.withOpacity(0.8),
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Info Chips Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _SmallInfoBadge(label: '${p.age ?? "-"} YRS'),
                              const SizedBox(width: 8),
                              _SmallInfoBadge(
                                label: p.gender?.toUpperCase() ?? "GENDER?",
                              ),
                              const SizedBox(width: 8),
                              _SmallInfoBadge(
                                label: p.phone,
                                icon: Icons.phone_rounded,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 3. Capsule style Tab UI - Sticky Header
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _StickyTabBarDelegate(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        color: const Color(0xFFFFFCF8),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.03),
                            ),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            indicator: BoxDecoration(
                              color: Colors.black, // High contrast active
                              borderRadius: BorderRadius.circular(100),
                            ),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey[500],
                            labelStyle: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                            ),
                            unselectedLabelStyle: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                            dividerColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: const [
                              Tab(text: "Visits"),
                              Tab(text: "Files"),
                              Tab(text: "Vitals"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                controller: _tabController,
                children: [
                  _buildVisitsTab(detail.appointments, detail),
                  _buildDocumentsTab(detail.documents),
                  const Center(child: Text("Vital Trends coming soon")),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/patient/${widget.patientId}/booking');
        },
        backgroundColor: const Color(0xFFFF8A65),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        icon: const Icon(Icons.calendar_today_rounded, size: 18),
        label: Text(
          'New Booking',
          style: GoogleFonts.inter(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _buildVisitsTab(
    List<PatientHistoryItem> visits,
    PatientDetail detail,
  ) {
    if (visits.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history_rounded,
              size: 48,
              color: Colors.grey.withOpacity(0.1),
            ),
            const SizedBox(height: 16),
            Text(
              "No visit history",
              style: GoogleFonts.inter(
                color: Colors.grey[400],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      itemCount: visits.length,
      itemBuilder: (context, index) {
        final v = visits[index];
        final date = DateTime.tryParse(v.startTime) ?? DateTime.now();

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.black.withOpacity(0.04)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('MMM dd, yyyy').format(date),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                  _statusBadge(v.status),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                v.doctorName ?? 'Unknown Doctor',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              Text(
                v.specialty?.toUpperCase() ?? '',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(height: 1),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TOTAL BILL",
                        style: GoogleFonts.inter(
                          fontSize: 8,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey[400],
                        ),
                      ),
                      Text(
                        "₹${v.grandTotal ?? 0}",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  if ((v.balanceDue ?? 0) > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        "DUE: ₹${v.balanceDue}",
                        style: GoogleFonts.inter(
                          color: Colors.red,
                          fontWeight: FontWeight.w800,
                          fontSize: 11,
                        ),
                      ),
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10B981).withOpacity(0.05),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        "PAID",
                        style: GoogleFonts.inter(
                          color: const Color(0xFF10B981),
                          fontWeight: FontWeight.w800,
                          fontSize: 11,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _VisitActionBtn(
                      label: "Details",
                      icon: Icons.visibility_outlined,
                      onTap: () => AppointmentDetailsSheet.show(
                        context,
                        v.appointmentId,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _VisitActionBtn(
                    label: "Invoice",
                    icon: Icons.receipt_long_outlined,
                    onTap: () {
                      if (v.invoiceId != null) {
                        InvoicePrintView.show(context, v.invoiceId!);
                      }
                    },
                  ),
                  const SizedBox(width: 8),
                  const SizedBox(width: 8),
                  _VisitActionBtn(
                    label: "View Rx",
                    icon: Icons.description_outlined,
                    onTap: () =>
                        PrescriptionPrintView.show(context, v.appointmentId),
                  ),
                  const SizedBox(width: 8),
                  PopupMenuButton<String>(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.02),
                        ),
                      ),
                      child: const Icon(Icons.more_vert_rounded, size: 20),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                    onSelected: (value) async {
                      if (value == 'reschedule') {
                        await showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          useSafeArea: true,
                          backgroundColor: Colors.transparent,
                          builder: (_) => RescheduleSheet(
                            appointmentId: v.appointmentId,
                            patientName: detail.profile.fullName,
                            currentSlot: date,
                          ),
                        );
                        // Refresh details after potential reschedule
                        ref.invalidate(
                          patientDetailsControllerProvider(widget.patientId),
                        );
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'reschedule',
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit_calendar_rounded,
                              size: 18,
                              color: Colors.black87,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Reschedule',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDocumentsTab(List<PatientDocument> docs) {
    if (docs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.description_rounded,
              size: 48,
              color: Colors.grey.withOpacity(0.1),
            ),
            const SizedBox(height: 16),
            Text(
              "No files",
              style: GoogleFonts.inter(
                color: Colors.grey[400],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
      itemCount: docs.length,
      itemBuilder: (context, index) {
        final d = docs[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black.withOpacity(0.04)),
          ),
          child: ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.description_rounded,
                color: Colors.blue,
                size: 20,
              ),
            ),
            title: Text(
              d.fileName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            subtitle: Text(
              d.category,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            trailing: Icon(
              Icons.download_rounded,
              color: Colors.grey[300],
              size: 20,
            ),
          ),
        );
      },
    );
  }

  Widget _statusBadge(String status) {
    Color color = Colors.grey;
    if (status == 'completed') color = const Color(0xFF10B981);
    if (status == 'scheduled') color = Colors.indigo;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Text(
        status.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 8,
          color: color,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _SmallInfoBadge extends StatelessWidget {
  final String label;
  final IconData? icon;

  const _SmallInfoBadge({required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: Colors.grey[400]),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderActionButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black.withOpacity(0.05)),
        ),
        child: Center(child: Icon(icon, size: 22, color: Colors.black87)),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyTabBarDelegate({required this.child});

  @override
  double get minExtent => 64; // Height of the capsule tab container
  @override
  double get maxExtent => 64;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return false;
  }
}

class _VisitActionBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _VisitActionBtn({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black.withOpacity(0.02)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14, color: Colors.black87),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
