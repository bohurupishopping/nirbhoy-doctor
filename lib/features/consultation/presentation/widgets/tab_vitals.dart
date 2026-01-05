import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../consultation_controller.dart';

class VitalsTab extends ConsumerWidget {
  final String appointmentId;

  const VitalsTab({super.key, required this.appointmentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(consultationControllerProvider(appointmentId));
    final controller = ref.read(
      consultationControllerProvider(appointmentId).notifier,
    );
    final vitals = state.vitals;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vitals Signs',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          _buildField(
            label: 'Temperature (°F)',
            value: vitals['temp']?.toString(),
            onChanged: (val) => controller.updateVital('temp', val),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildField(
                  label: 'BP Systolic (mmHg)',
                  value: vitals['bp_sys']?.toString(),
                  onChanged: (val) => controller.updateVital('bp_sys', val),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildField(
                  label: 'BP Diastolic (mmHg)',
                  value: vitals['bp_dia']?.toString(),
                  onChanged: (val) => controller.updateVital('bp_dia', val),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildField(
                  label: 'Pulse (bpm)',
                  value: vitals['pulse']?.toString(),
                  onChanged: (val) => controller.updateVital('pulse', val),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildField(
                  label: 'Respiration (rpm)',
                  value: vitals['resp']?.toString(),
                  onChanged: (val) => controller.updateVital('resp', val),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildField(
                  label: 'Height (cm)',
                  value: vitals['height']?.toString(),
                  onChanged: (val) => controller.updateVital('height', val),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildField(
                  label: 'Weight (kg)',
                  value: vitals['weight']?.toString(),
                  onChanged: (val) => controller.updateVital('weight', val),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildField(
            label: 'SPO2 (%)',
            value: vitals['spo2']?.toString(),
            onChanged: (val) => controller.updateVital('spo2', val),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  Widget _buildField({
    required String label,
    required String? value,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: value,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.05)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.05)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
            ),
          ),
        ),
      ],
    );
  }
}
