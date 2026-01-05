// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../consultation_controller.dart';

class PlanTab extends ConsumerWidget {
  final String appointmentId;

  const PlanTab({super.key, required this.appointmentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(consultationControllerProvider(appointmentId));
    final controller = ref.read(
      consultationControllerProvider(appointmentId).notifier,
    );

    final followupChips = [
      {'label': '3 Days', 'days': 3},
      {'label': '5 Days', 'days': 5},
      {'label': '1 Week', 'days': 7},
      {'label': '2 Weeks', 'days': 14},
      {'label': '1 Month', 'days': 30},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- Master Plan Overview ---
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: const Color(0xFFE2E8F0)), // Slate 200
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.2),
                          ),
                        ),
                        child: Icon(
                          Icons.assignment_turned_in_outlined,
                          color: Theme.of(context).primaryColor,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Master Plan',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF0F172A),
                              ),
                            ),
                            Text(
                              'Preview of final result',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFECFDF5), // Emerald 50
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: const Color(0xFFD1FAE5),
                          ), // Emerald 100
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.description_outlined,
                              size: 14,
                              color: Color(0xFF059669), // Emerald 600
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Ready to Generate',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF064E3B), // Emerald 900
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // 1. Final Diagnosis Block
                _buildOverviewBlock(
                  context,
                  title: 'Final Diagnosis',
                  icon: Icons.medical_services_outlined,
                  content: state.diagnosis.isNotEmpty
                      ? Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: state.diagnosis
                              .map(
                                (d) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: const Color(0xFFF1F5F9),
                                    ),
                                  ),
                                  child: Text(
                                    d,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF334155),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      : Text(
                          'No diagnosis entered',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            color: const Color(0xFF94A3B8),
                          ),
                        ),
                ),
                const SizedBox(height: 12),

                // 2. Summary Stats Grid
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        context,
                        title: 'Medicines',
                        count: state.medicines.length.toString(),
                        icon: Icons.medication_outlined,
                        color: const Color(0xFF4F46E5), // Indigo
                        bgColor: const Color(0xFFEEF2FF), // Indigo 50
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        context,
                        title: 'Investigations',
                        count: state.labOrders.length.toString(),
                        icon: Icons.science_outlined,
                        color: const Color(0xFF059669), // Emerald
                        bgColor: const Color(0xFFECFDF5), // Emerald 50
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // 3. Scheduled Visit Block
                _buildOverviewBlock(
                  context,
                  title: 'Scheduled Visit',
                  icon: Icons.calendar_today_outlined,
                  iconColor: const Color(0xFFF97316), // Orange
                  content: state.nextVisitDate != null
                      ? Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.calendar_today_outlined,
                                color: Color(0xFFEA580C),
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat(
                                    'MMM dd, yyyy',
                                  ).format(state.nextVisitDate!),
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF0F172A),
                                  ),
                                ),
                                Text(
                                  'Return Appointment',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(
                                      0xFFEA580C,
                                    ).withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Text(
                          'No follow-up date set',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            color: const Color(0xFF94A3B8),
                          ),
                        ),
                  bgColor: const Color(
                    0xFFFFF7ED,
                  ).withOpacity(0.5), // Orange 50ish
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // --- Finalize Treatment Plan Section (Accordion) ---
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF8FAFC), // Slate 50
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFF1F5F9)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: const Icon(
                          Icons.edit_outlined,
                          size: 20,
                          color: Color(0xFF475569),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Finalize Treatment Plan',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                          Text(
                            'Adjust follow-up and clinical advice',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Accordion
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // 1. Next Appointment
                      _buildAccordionItem(
                        context,
                        title: '1. Next Appointment',
                        subtitle: state.nextVisitDate != null
                            ? DateFormat(
                                'MMM dd, yyyy',
                              ).format(state.nextVisitDate!)
                            : 'Select return date',
                        icon: Icons.calendar_today_outlined,
                        iconBg: const Color(0xFFFFF7ED), // Orange 50
                        iconColor: const Color(0xFFEA580C), // Orange 600
                        initiallyExpanded: true,
                        children: [
                          // Quick Select
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 4,
                                  bottom: 8,
                                ),
                                child: Text(
                                  'QUICK SELECT',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF94A3B8),
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: followupChips.map((chip) {
                                  final chipDate = DateTime.now().add(
                                    Duration(days: chip['days'] as int),
                                  );
                                  // Simple check: same day/month/year
                                  final isSelected =
                                      state.nextVisitDate != null &&
                                      state.nextVisitDate!.year ==
                                          chipDate.year &&
                                      state.nextVisitDate!.month ==
                                          chipDate.month &&
                                      state.nextVisitDate!.day == chipDate.day;

                                  return InkWell(
                                    onTap: () =>
                                        controller.updateNextVisit(chipDate),
                                    borderRadius: BorderRadius.circular(100),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Theme.of(context).primaryColor
                                            : const Color(0xFFF8FAFC),
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                        border: Border.all(
                                          color: isSelected
                                              ? Theme.of(context).primaryColor
                                              : const Color(0xFFE2E8F0),
                                        ),
                                      ),
                                      child: Text(
                                        chip['label'] as String,
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: isSelected
                                              ? Colors.white
                                              : const Color(0xFF475569),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Custom Date
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 4,
                                  bottom: 8,
                                ),
                                child: Text(
                                  'CUSTOM DATE',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xFF94A3B8),
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        final date = await showDatePicker(
                                          context: context,
                                          initialDate:
                                              state.nextVisitDate ??
                                              DateTime.now().add(
                                                const Duration(days: 7),
                                              ),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now().add(
                                            const Duration(days: 365),
                                          ),
                                        );
                                        if (date != null) {
                                          controller.updateNextVisit(date);
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 14,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(
                                            0xFFF1F5F9,
                                          ).withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                          border: Border.all(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.calendar_today_outlined,
                                              size: 18,
                                              color: Theme.of(
                                                context,
                                              ).primaryColor,
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              state.nextVisitDate != null
                                                  ? DateFormat(
                                                      'MMM dd, yyyy',
                                                    ).format(
                                                      state.nextVisitDate!,
                                                    )
                                                  : 'Pick a date',
                                              style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xFF0F172A),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (state.nextVisitDate != null) ...[
                                    const SizedBox(width: 8),
                                    IconButton.filled(
                                      onPressed: () =>
                                          controller.updateNextVisit(null),
                                      icon: const Icon(Icons.close, size: 20),
                                      style: IconButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFFFEF2F2,
                                        ),
                                        foregroundColor: const Color(
                                          0xFFDC2626,
                                        ),
                                        fixedSize: const Size(48, 48),
                                        shape: const CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // 2. Advice & Instructions
                      _buildAccordionItem(
                        context,
                        title: '2. Advice & Instructions',
                        subtitle: 'General notes for patient',
                        icon: Icons.description_outlined,
                        iconBg: Theme.of(
                          context,
                        ).primaryColor.withOpacity(0.05),
                        iconColor: Theme.of(context).primaryColor,
                        children: [
                          Stack(
                            children: [
                              TextFormField(
                                initialValue: state.adviceNotes,
                                onChanged: (val) =>
                                    controller.updateAdvice(val),
                                maxLines: 6,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF334155),
                                  height: 1.5,
                                ),
                                decoration: InputDecoration(
                                  hintText:
                                      'Write clinical advice here (e.g., Avoid fatty food, take complete bed rest)...',
                                  hintStyle: GoogleFonts.inter(
                                    color: const Color(0xFF94A3B8),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  filled: true,
                                  fillColor: const Color(
                                    0xFFF1F5F9,
                                  ).withOpacity(0.5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    borderSide: BorderSide(
                                      color: Theme.of(
                                        context,
                                      ).primaryColor.withOpacity(0.2),
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.all(24),
                                ),
                              ),
                              const Positioned(
                                right: 20,
                                bottom: 20,
                                child: Icon(
                                  Icons.info_outline,
                                  color: Color(0xFFCBD5E1),
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              '* This advice will be printed prominently on the final prescription.',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                color: const Color(0xFF94A3B8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewBlock(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget content,
    Color? iconColor,
    Color? bgColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: iconColor ?? Theme.of(context).primaryColor,
            ),
            const SizedBox(width: 8),
            Text(
              title.toUpperCase(),
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF94A3B8),
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: bgColor ?? const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFF1F5F9)),
          ),
          child: content,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String count,
    required IconData icon,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 8),
              Text(
                title.toUpperCase(),
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: color,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            count,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccordionItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required List<Widget> children,
    bool initiallyExpanded = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          title: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ],
          ),
          children: children,
        ),
      ),
    );
  }
}
