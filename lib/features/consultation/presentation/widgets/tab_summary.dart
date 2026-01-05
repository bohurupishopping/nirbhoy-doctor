// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../consultation_controller.dart';

class SummaryTab extends ConsumerWidget {
  final String appointmentId;

  const SummaryTab({super.key, required this.appointmentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the state
    final state = ref.watch(consultationControllerProvider(appointmentId));
    final controller = ref.read(
      consultationControllerProvider(appointmentId).notifier,
    );
    final summary = state.context?.aiSummary;
    final isGenerating = state
        .isLoading; // Assuming state.isLoading covers the generation process

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: const Color(0xFFE2E8F0)), // Slate 200
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            // --- Header Section ---
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFF5F3FF), // Violet 50
                    Colors.white,
                  ],
                ),
                border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0))),
              ),
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEDE9FE), // Violet 100
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFFDDD6FE),
                          ), // Violet 200
                        ),
                        child: const Icon(
                          FontAwesomeIcons.brain,
                          color: Color(0xFF7C3AED), // Violet 600
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Clinical Ai',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                          Text(
                            'Patient 360 Analysis',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Regenerate Button (Visible only if summary exists)
                  if (summary != null && summary.isNotEmpty)
                    OutlinedButton.icon(
                      onPressed: isGenerating
                          ? null
                          : () => controller.generateSummary(),
                      icon: isGenerating
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.refresh, size: 16),
                      label: const Text('Regenerate'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF6D28D9), // Violet 700
                        side: const BorderSide(color: Color(0xFFDDD6FE)),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        textStyle: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // --- Content Body ---
            Padding(
              padding: const EdgeInsets.all(32),
              child: _buildContent(context, controller, summary, isGenerating),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ConsultationController controller,
    String? summary,
    bool isGenerating,
  ) {
    // 1. Loading State
    if (isGenerating) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 40),
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F3FF),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8B5CF6)),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Analyzing clinical data points...',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF6D28D9),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Reviewing patient history, vitals, and trends.',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 40),
        ],
      );
    }

    // 2. Empty State (No Summary)
    if (summary == null || summary.isEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 40),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: const Color(0xFFF1F5F9)),
            ),
            child: const Center(
              child: Icon(
                FontAwesomeIcons.wandMagicSparkles,
                size: 32,
                color: Color(0xFFA78BFA),
              ), // Violet 400
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Ready to Analyze',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: 400,
            child: Text(
              'Our AI engine will review the patient\'s entire history, identifying critical alerts, medication patterns, and visit trends to generate a concise executive summary.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 15,
                height: 1.6,
                color: const Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => controller.generateSummary(),
            icon: const Icon(FontAwesomeIcons.robot, size: 18),
            label: const Text('Generate Clinical Summary'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7C3AED), // Violet 600
              foregroundColor: Colors.white,
              elevation: 4,
              shadowColor: const Color(0xFF7C3AED).withOpacity(0.4),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              shape: const StadiumBorder(),
              textStyle: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      );
    }

    // 3. Summary Content
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MarkdownBody(
          data: summary,
          styleSheet: MarkdownStyleSheet(
            h1: GoogleFonts.plusJakartaSans(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
              height: 1.5,
            ),
            h2: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E293B),
              height: 1.5,
            ),
            h3: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF334155),
              height: 1.5,
            ),
            p: GoogleFonts.inter(
              fontSize: 14,
              height: 1.6,
              color: const Color(0xFF334155),
              fontWeight: FontWeight.w500,
            ),
            strong: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
            listBullet: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF334155),
            ),
            blockSpacing: 12.0,
            h1Padding: const EdgeInsets.only(top: 16, bottom: 8),
            h2Padding: const EdgeInsets.only(top: 16, bottom: 8),
            listIndent: 24.0,
          ),
        ),
        const SizedBox(height: 40),
        const Divider(color: Color(0xFFE2E8F0)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  FontAwesomeIcons.robot,
                  size: 12,
                  color: Color(0xFF94A3B8),
                ),
                const SizedBox(width: 8),
                Text(
                  'Generated by Nirbhoy AI',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
            Text(
              DateTime.now().toString().substring(
                0,
                16,
              ), // Use a formatter if available
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFCBD5E1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
