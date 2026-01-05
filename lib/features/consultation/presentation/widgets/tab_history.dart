// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../consultation_controller.dart';
import '../../domain/consultation_models.dart';

class HistoryTab extends ConsumerWidget {
  final String appointmentId;
  const HistoryTab({super.key, required this.appointmentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(consultationControllerProvider(appointmentId));
    final contextData = state.context;

    if (contextData == null) return const SizedBox.shrink();

    final totalVisits = contextData.visitHistory.length;
    final totalDocs = contextData.documents.length;
    final lastVisit = contextData.visitHistory.isNotEmpty
        ? contextData.visitHistory.first
        : null;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- Overview Section ---
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
                          Icons.history_edu,
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
                              'History Archive',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF0F172A), // Slate 900
                              ),
                            ),
                            Text(
                              'Historical records lookup',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF64748B), // Slate 500
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
                              Icons.verified_user_outlined,
                              size: 14,
                              color: Color(0xFF059669), // Emerald 600
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Encrypted',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF065F46), // Emerald 800
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Stats Grid
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        icon: Icons.access_time_filled,
                        label: 'Visits',
                        value: totalVisits.toString(),
                        color: Theme.of(context).primaryColor,
                        bgColor: const Color(0xFFF8FAFC), // Slate 50
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildStatCard(
                        icon: Icons.description,
                        label: 'Files',
                        value: totalDocs.toString(),
                        color: const Color(0xFF4F46E5), // Indigo 600
                        bgColor: const Color(0xFFF8FAFC), // Slate 50
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Latest Record
                if (lastVisit != null)
                  Container(
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
                            const Icon(
                              Icons.calendar_month,
                              size: 16,
                              color: Colors.orange,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'LATEST RECORD',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF64748B),
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          DateFormat(
                            'MMMM d, yyyy',
                          ).format(lastVisit.date).toUpperCase(),
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                        Text(
                          'Last Consultation',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // --- Lists Section ---
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              children: [
                _buildAccordionItem(
                  context,
                  title: '1. Medical Visit Timeline',
                  subtitle: '$totalVisits previous interactions',
                  icon: Icons.history,
                  iconColor: Theme.of(context).primaryColor,
                  iconBg: Theme.of(context).primaryColor.withOpacity(0.05),
                  initiallyExpanded: true,
                  child: totalVisits == 0
                      ? _buildEmptyState(
                          'Fresh Medical Record - No Previous Visits',
                          Icons.history,
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: contextData.visitHistory.length,
                          separatorBuilder: (c, i) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return _buildVisitItem(
                              context,
                              contextData.visitHistory[index],
                            );
                          },
                        ),
                ),
                const Divider(height: 1, indent: 20, endIndent: 20),
                _buildAccordionItem(
                  context,
                  title: '2. Archived Medical Documents',
                  subtitle: '$totalDocs files discovered',
                  icon: Icons.description_outlined,
                  iconColor: const Color(0xFF4F46E5), // Indigo 600
                  iconBg: const Color(0xFFEEF2FF), // Indigo 50
                  child: totalDocs == 0
                      ? _buildEmptyState(
                          'No medical documents on file',
                          Icons.folder_open,
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 1.0,
                              ),
                          itemCount: contextData.documents.length,
                          itemBuilder: (context, index) {
                            return _DocumentCard(
                              doc: contextData.documents[index],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
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
                label.toUpperCase(),
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: color,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String msg, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(40),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        // borderType: BorderType.dash (simplified)
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: const Color(0xFFCBD5E1)),
          const SizedBox(height: 12),
          Text(
            msg,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF94A3B8),
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
    required Color iconColor,
    required Color iconBg,
    required Widget child,
    bool initiallyExpanded = false,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        initiallyExpanded: initiallyExpanded,
        tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: iconBg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        title: Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF64748B),
          ),
        ),
        childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        children: [child],
      ),
    );
  }

  Widget _buildVisitItem(BuildContext context, VisitHistoryItem visit) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('MMM').format(visit.date).toUpperCase(),
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  DateFormat('d').format(visit.date),
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                Text(
                  DateFormat('yyyy').format(visit.date),
                  style: GoogleFonts.inter(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OPD Consultation',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                        if (visit.doctorName != null)
                          Text(
                            'Dr. ${visit.doctorName}',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF64748B),
                            ),
                          ),
                      ],
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _showVisitDetails(context, visit),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 0,
                        ),
                        visualDensity: VisualDensity.compact,
                        side: BorderSide(
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.2),
                        ),
                      ),
                      icon: Icon(
                        Icons.visibility_outlined,
                        size: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                      label: Text(
                        'View Record',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (visit.diagnosis.isNotEmpty)
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: visit.diagnosis.take(4).map((d) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Text(
                          d.toString(),
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF475569),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (visit.prescriptions.isNotEmpty)
                      _buildMiniTag(
                        Icons.medication_outlined,
                        '${visit.prescriptions.length} Meds',
                      ),
                    if (visit.labOrders.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: _buildMiniTag(
                          Icons.description_outlined,
                          '${visit.labOrders.length} Labs',
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniTag(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 12, color: const Color(0xFF94A3B8)),
        const SizedBox(width: 4),
        Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }

  void _showVisitDetails(BuildContext context, VisitHistoryItem visit) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFFFAFAFA),
        insetPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 800),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9))),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              DateFormat('d').format(visit.date),
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Consultation Record',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF0F172A),
                              ),
                            ),
                            Text(
                              'Dr. ${visit.doctorName ?? "Unknown"}',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_rounded),
                      color: const Color(0xFF64748B),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Diagnosis
                      _buildDetailSectionHeader(
                        'Clinical Context',
                        Icons.monitor_heart_outlined,
                        Theme.of(context).primaryColor,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFF1F5F9)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DIAGNOSIS',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF94A3B8),
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 8),
                            if (visit.diagnosis.isEmpty)
                              Text(
                                'No diagnosis recorded',
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                  color: const Color(0xFF94A3B8),
                                ),
                              )
                            else
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: visit.diagnosis.map((d) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF8FAFC),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: const Color(0xFFE2E8F0),
                                      ),
                                    ),
                                    child: Text(
                                      d.toString(),
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF334155),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // 2. Vitals
                      if (visit.vitals != null &&
                          visit.vitals is Map &&
                          (visit.vitals as Map).isNotEmpty) ...[
                        _buildDetailSectionHeader(
                          'Vitals Snapshot',
                          Icons.favorite_outline,
                          Colors.pink,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 2.5,
                              ),
                          itemCount: (visit.vitals as Map).length,
                          itemBuilder: (context, index) {
                            final key = (visit.vitals as Map).keys.elementAt(
                              index,
                            );
                            final val = (visit.vitals as Map).values.elementAt(
                              index,
                            );
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFF1F5F9),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    key.toString().toUpperCase(),
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF94A3B8),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    val.toString(),
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF0F172A),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                      ],

                      // 3. Prescriptions
                      if (visit.prescriptions.isNotEmpty) ...[
                        _buildDetailSectionHeader(
                          'Prescriptions (${visit.prescriptions.length})',
                          Icons.medication_outlined,
                          const Color(0xFF4F46E5),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: visit.prescriptions.length,
                            separatorBuilder: (c, i) => const Divider(
                              height: 1,
                              color: Color(0xFFF1F5F9),
                            ),
                            itemBuilder: (context, index) {
                              final med = visit.prescriptions[index];
                              // med is dynamic usually, adjust if model strong
                              return Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          med['brand_name'] ??
                                              med['name'] ??
                                              'Unknown Med',
                                          style: GoogleFonts.plusJakartaSans(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF0F172A),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF1F5F9),
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: Text(
                                            med['dosage'] ?? 'N/A',
                                            style: GoogleFonts.inter(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: const Color(0xFF64748B),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      med['instruction'] ?? 'No instructions',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: const Color(0xFF64748B),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSectionHeader(String title, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Text(
            title.toUpperCase(),
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: color,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _DocumentCard extends StatelessWidget {
  final PatientDocument doc;
  const _DocumentCard({required this.doc});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(
                  Icons.description_outlined,
                  color: Color(0xFF4F46E5),
                  size: 24,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              doc.fileName,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              doc.category.toUpperCase().replaceAll('_', ' '),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF94A3B8),
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
