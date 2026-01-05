import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../consultation_controller.dart';

class ComplaintsTab extends ConsumerStatefulWidget {
  final String appointmentId;

  const ComplaintsTab({super.key, required this.appointmentId});

  @override
  ConsumerState<ComplaintsTab> createState() => _ComplaintsTabState();
}

class _ComplaintsTabState extends ConsumerState<ComplaintsTab> {
  final _symptomController = TextEditingController();

  @override
  void dispose() {
    _symptomController.dispose();
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

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Chief Complaint
          Text(
            'Chief Complaint',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: state.chiefComplaint,
            onChanged: (val) => controller.updateChiefComplaint(val),
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Describe main complaint...',
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

          // Symptoms
          Text(
            'Symptoms / Diagnosis',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _symptomController,
                  decoration: InputDecoration(
                    hintText: 'Add Symptom/Diagnosis...',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                  onFieldSubmitted: (val) {
                    if (val.trim().isNotEmpty) {
                      controller.addDiagnosis(val.trim());
                      _symptomController.clear();
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: () {
                  final val = _symptomController.text;
                  if (val.trim().isNotEmpty) {
                    controller.addDiagnosis(val.trim());
                    _symptomController.clear();
                  }
                },
                icon: const Icon(Icons.add),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: state.diagnosis
                .map(
                  (e) => Chip(
                    label: Text(e),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () => controller.removeDiagnosis(e),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(
                        color: Colors.grey.withValues(alpha: 0.2),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
