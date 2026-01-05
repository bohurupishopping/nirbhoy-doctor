import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../consultation_controller.dart';
import '../../../patient/domain/clinical_models.dart';

class DiagnosticsTab extends ConsumerStatefulWidget {
  final String appointmentId;

  const DiagnosticsTab({super.key, required this.appointmentId});

  @override
  ConsumerState<DiagnosticsTab> createState() => _DiagnosticsTabState();
}

class _DiagnosticsTabState extends ConsumerState<DiagnosticsTab> {
  final _testController = TextEditingController();

  @override
  void dispose() {
    _testController.dispose();
    super.dispose();
  }

  void _addTest() {
    final val = _testController.text;
    if (val.trim().isNotEmpty) {
      final lab = PrescriptionLab(testName: val.trim());
      ref
          .read(consultationControllerProvider(widget.appointmentId).notifier)
          .addLab(lab);
      _testController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      consultationControllerProvider(widget.appointmentId),
    );
    final controller = ref.read(
      consultationControllerProvider(widget.appointmentId).notifier,
    );
    final labs = state.labOrders;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order Lab Tests / Diagnostics',
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
                  controller: _testController,
                  decoration: InputDecoration(
                    hintText: 'Enter test name (e.g. CBC, Lipid Profile)...',
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
                  onFieldSubmitted: (_) => _addTest(),
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: _addTest,
                icon: const Icon(Icons.add),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          if (labs.isNotEmpty)
            Text(
              'Ordered Tests',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.grey[600],
              ),
            ),
          const SizedBox(height: 8),

          ...labs.asMap().entries.map((entry) {
            final index = entry.key;
            final lab = entry.value;
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.black.withValues(alpha: 0.04)),
                ),
                title: Text(
                  lab.testName,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.close, size: 18, color: Colors.grey),
                  onPressed: () => controller.removeLab(index),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
