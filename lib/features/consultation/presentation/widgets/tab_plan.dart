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

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Advice
          Text(
            'Clinical Advice / Instructions',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: state.adviceNotes,
            onChanged: (val) => controller.updateAdvice(val),
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Enter diet, precautions, or general instructions...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.grey.withValues(alpha: 0.2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Follow Up
          Text(
            'Follow Up',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now().add(const Duration(days: 7)),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (date != null) {
                controller.updateNextVisit(date.toIso8601String());
              }
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today_rounded, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    state.nextVisitDate != null
                        ? DateFormat(
                            'MMM dd, yyyy',
                          ).format(DateTime.parse(state.nextVisitDate!))
                        : 'Select Follow-up Date (Optional)',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: state.nextVisitDate != null
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
