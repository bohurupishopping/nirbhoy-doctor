import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../domain/clinical_models.dart';
import '../patient_details_controller.dart';

class AppointmentDetailsSheet extends ConsumerWidget {
  final String appointmentId;

  const AppointmentDetailsSheet({super.key, required this.appointmentId});

  static void show(BuildContext context, String appointmentId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          AppointmentDetailsSheet(appointmentId: appointmentId),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDetails = ref.watch(appointmentDetailsProvider(appointmentId));
    final asyncTimeline = ref.watch(appointmentTimelineProvider(appointmentId));

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFCF8),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Expanded(
            child: asyncDetails.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, st) => Center(child: Text('Error: $err')),
              data: (details) {
                if (details == null) {
                  return const Center(child: Text("Details not found"));
                }
                return asyncTimeline.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, st) =>
                      Center(child: Text('Timeline Error: $err')),
                  data: (timeline) => _buildContent(context, details, timeline),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    AppointmentClinicalDetails d,
    List<TimelineEvent> timeline,
  ) {
    final meta = d.meta;
    final date = DateTime.tryParse(meta.date) ?? DateTime.now();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Visit Details",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  DateFormat('MMMM dd, yyyy • hh:mm a').format(date),
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            _StatusBadge(status: meta.status),
          ],
        ),
        const SizedBox(height: 24),

        // Doctor Info
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.black.withValues(alpha: 0.04)),
          ),
          child: Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF8A65),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person_rounded, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meta.doctorName ?? 'Unknown Doctor',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        // Timeline Section
        _SectionHeader(title: "JOURNEY TIMELINE", icon: Icons.timeline_rounded),
        const SizedBox(height: 16),

        if (timeline.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                "No timeline events found",
                style: GoogleFonts.inter(color: Colors.grey),
              ),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: timeline.length,
            itemBuilder: (context, index) {
              return _TimelineItem(
                event: timeline[index],
                isLast: index == timeline.length - 1,
              );
            },
          ),

        const SizedBox(height: 40),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final TimelineEvent event;
  final bool isLast;

  const _TimelineItem({required this.event, required this.isLast});

  @override
  Widget build(BuildContext context) {
    Color color;
    IconData icon;

    switch (event.color) {
      case 'success':
        color = Colors.green;
        icon = Icons.check_circle_rounded;
        break;
      case 'warning':
      case 'orange':
        color = Colors.orange;
        icon = Icons.warning_rounded;
        break;
      case 'destructive':
        color = Colors.red;
        icon = Icons.cancel_rounded;
        break;
      case 'info':
      case 'primary':
        color = Colors.blue;
        icon = Icons.info_rounded;
        break;
      default:
        color = Colors.grey;
        icon = Icons.circle;
    }

    // specific icons based on type for better UI
    if (event.eventType == 'payment') icon = Icons.payments_rounded;
    if (event.eventType == 'booking_created') {
      icon = Icons.calendar_month_rounded;
    }
    if (event.eventType == 'clinical_event') {
      icon = Icons.medical_services_rounded;
      if (event.title.contains('Completed')) {
        icon = Icons.receipt_long_rounded;
      }
    }
    if (event.eventType == 'reschedule') icon = Icons.edit_calendar_rounded;
    if (event.eventType == 'cancellation') icon = Icons.block_flipped;

    final dt = DateTime.tryParse(event.eventTime);
    final timeStr = dt != null ? DateFormat('hh:mm a').format(dt) : '';
    final dateStr = dt != null ? DateFormat('MMM dd').format(dt) : '';

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Time Column
          SizedBox(
            width: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  timeStr,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  dateStr,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // Line & Dot
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: color.withValues(alpha: 0.2),
                    width: 1.5,
                  ),
                ),
                child: Icon(icon, size: 14, color: color),
              ),
              if (!isLast)
                Expanded(child: Container(width: 2, color: Colors.grey[200])),
            ],
          ),
          const SizedBox(width: 16),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0, top: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (event.description != null)
                    Text(
                      event.eventType == 'payment'
                          ? event.description!
                                .replaceAll(RegExp(r'Amount: [^|]+'), '')
                                .replaceAll(RegExp(r'^\s*\|\s*'), '')
                                .trim()
                          : event.description!,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                    ),
                  if (event.actorName != null) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline_rounded,
                          size: 12,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          event.actorName!,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[400]),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: Colors.grey[400],
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color = Colors.grey;
    if (status == 'completed') color = Colors.green;
    if (status == 'scheduled') color = Colors.blue;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        status.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: color,
        ),
      ),
    );
  }
}
