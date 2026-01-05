import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../consultation_controller.dart';
import '../widgets/tab_vitals.dart';
import '../widgets/tab_complaints.dart';
import '../widgets/tab_medicines.dart';
import '../widgets/tab_diagnostics.dart';
import '../widgets/tab_plan.dart';
import '../widgets/tab_summary.dart';
import '../widgets/tab_history.dart';
import '../widgets/tab_profile.dart';

class ConsultationPage extends ConsumerStatefulWidget {
  final String appointmentId;

  const ConsultationPage({super.key, required this.appointmentId});

  @override
  ConsumerState<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends ConsumerState<ConsultationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      consultationControllerProvider(widget.appointmentId),
    );
    final controller = ref.read(
      consultationControllerProvider(widget.appointmentId).notifier,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF8),
      body: SafeArea(
        child: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.context == null
            ? Center(child: Text("Error loading data: ${state.error}"))
            : NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  // prefer context if available
                  final patient = state.context!.patient;

                  return [
                    // Header
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => context.pop(),
                              icon: const Icon(Icons.arrow_back_rounded),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                  color: Colors.black.withValues(alpha: 0.05),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      patient.name,
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    if (patient.isCritical)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red.shade100,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Text(
                                          "CRITICAL",
                                          style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red.shade800,
                                          ),
                                        ),
                                      ),
                                    if (patient.isWheelchair)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Icon(
                                          FontAwesomeIcons.wheelchair,
                                          size: 14,
                                          color: Colors.blue.shade700,
                                        ),
                                      ),
                                  ],
                                ),
                                Text(
                                  '${patient.age} Y / ${patient.gender} • ${patient.phone ?? "No Phone"}',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            if (state.isSaving)
                              const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            else
                              ElevatedButton(
                                onPressed: () async {
                                  final messenger = ScaffoldMessenger.of(
                                    context,
                                  );
                                  final router = GoRouter.of(context);

                                  final success = await controller.submit();

                                  if (success) {
                                    messenger.showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Consultation Completed!',
                                        ),
                                      ),
                                    );
                                    if (router.canPop()) router.pop();
                                  } else if (state.error != null) {
                                    messenger.showSnackBar(
                                      SnackBar(
                                        content: Text('Error: ${state.error}'),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                ),
                                child: Text(
                                  'Sign & Complete',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    // Tabs
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _StickyTabBarDelegate(
                        child: Container(
                          color: const Color(0xFFFFFCF8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colors.black.withValues(alpha: 0.05),
                              ),
                            ),
                            child: TabBar(
                              controller: _tabController,
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              indicator: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey[600],
                              dividerColor: Colors.transparent,
                              labelStyle: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                              unselectedLabelStyle: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                              tabs: const [
                                Tab(text: "Summary"),
                                Tab(text: "History"),
                                Tab(text: "Profile"),
                                Tab(text: "Vitals"),
                                Tab(text: "Complaints"),
                                Tab(text: "Medicines"),
                                Tab(text: "Diagnostics"),
                                Tab(text: "Advice & Plan"),
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
                    SummaryTab(appointmentId: widget.appointmentId),
                    HistoryTab(appointmentId: widget.appointmentId),
                    ProfileTab(appointmentId: widget.appointmentId),
                    VitalsTab(appointmentId: widget.appointmentId),
                    ComplaintsTab(appointmentId: widget.appointmentId),
                    MedicinesTab(appointmentId: widget.appointmentId),
                    DiagnosticsTab(appointmentId: widget.appointmentId),
                    PlanTab(appointmentId: widget.appointmentId),
                  ],
                ),
              ),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyTabBarDelegate({required this.child});

  @override
  double get minExtent => 64;
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
