// ignore_for_file: deprecated_member_use

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
          // --- Editor Section ---
          Text(
            'Patient Intake Editor',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A), // Slate 900
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Register daily vitals and observations',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF64748B), // Slate 500
            ),
          ),
          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFE2E8F0)), // Slate 200
            ),
            child: Column(
              children: [
                _buildField(
                  label: 'Blood Pressure',
                  placeholder: 'e.g. 120/80',
                  icon: Icons.favorite,
                  iconColor: Colors.red.shade500,
                  value: vitals['bp']?.toString(),
                  onChanged: (val) => controller.updateVital('bp', val),
                ),
                const SizedBox(height: 16),
                _buildField(
                  label: 'Temperature',
                  placeholder: 'e.g. 98.6°F',
                  icon: Icons.thermostat,
                  iconColor: Colors.orange.shade500,
                  value: vitals['temp']?.toString(),
                  onChanged: (val) => controller.updateVital('temp', val),
                ),
                const SizedBox(height: 16),
                _buildField(
                  label: 'Body Weight',
                  placeholder: 'e.g. 70 kg',
                  icon: Icons.monitor_weight,
                  iconColor: Theme.of(context).primaryColor,
                  value: vitals['weight']?.toString(),
                  onChanged: (val) => controller.updateVital('weight', val),
                ),
                const SizedBox(height: 16),
                _buildField(
                  label: 'Oxygen Saturation',
                  placeholder: 'e.g. 98%',
                  icon: Icons.air,
                  iconColor: Colors.green.shade500,
                  value: vitals['spo2']?.toString(),
                  onChanged: (val) => controller.updateVital('spo2', val),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // --- Preview Section ---
          _buildPreviewSection(context, vitals),
        ],
      ),
    );
  }

  Widget _buildField({
    required String label,
    required String placeholder,
    required IconData icon,
    required Color iconColor,
    required String? value,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: iconColor),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF334155), // Slate 700
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: value,
          onChanged: onChanged,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: const Color(0xFF0F172A), // Slate 900
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: GoogleFonts.inter(
              color: const Color(0xFF94A3B8), // Slate 400
            ),
            filled: true,
            fillColor: const Color(0xFFF8FAFC), // Slate 50
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide(
                color: const Color(0xFFE2E8F0), // Slate 200
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPreviewSection(
    BuildContext context,
    Map<String, dynamic> vitals,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xFFE2E8F0)), // Slate 200
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.05),
                  Colors.transparent,
                ],
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(32),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.2),
                        ),
                      ),
                      child: Icon(
                        Icons.monitor_heart_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Vitals Overview',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF0F172A), // Slate 900
                          ),
                        ),
                        Text(
                          'Clinical measurements',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF64748B), // Slate 500
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.history,
                        size: 14,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Live Capture',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Grid of Vitals
                Row(
                  children: [
                    Expanded(
                      child: _buildVitalCard(
                        label: 'BP',
                        value: vitals['bp'],
                        unit: 'mmHg',
                        icon: Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildVitalCard(
                        label: 'Temp',
                        value: vitals['temp'],
                        unit: '°F',
                        icon: Icons.thermostat,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildVitalCard(
                        label: 'Weight',
                        value: vitals['weight'],
                        unit: 'kg',
                        icon: Icons.monitor_weight,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildVitalCard(
                        label: 'SpO2',
                        value: vitals['spo2'],
                        unit: '%',
                        icon: Icons.air,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Quick Insight
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.blue.withOpacity(0.1)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.speed,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Baseline recorded',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                          Text(
                            'Ready for clinical assessment',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.withOpacity(0.7),
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

  Widget _buildVitalCard({
    required String label,
    required String? value,
    required String unit,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC), // Slate 50
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9)), // Slate 100
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: Text(
                  value ?? '--',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0F172A), // Slate 900
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF94A3B8), // Slate 400
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
