// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AiProcessingIndicator extends StatefulWidget {
  final String message;
  const AiProcessingIndicator({
    super.key,
    this.message = 'Analyzing clinical data...',
  });

  @override
  State<AiProcessingIndicator> createState() => _AiProcessingIndicatorState();
}

class _AiProcessingIndicatorState extends State<AiProcessingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final List<String> _loadingMessages = [
    "Reading patient history...",
    "Analyzing vital trends...",
    "Checking medication interactions...",
    "Summarizing clinical notes...",
    "Formulating insights...",
  ];

  int _currentMessageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _startMessageCycle();
  }

  void _startMessageCycle() async {
    while (mounted) {
      await Future.delayed(const Duration(milliseconds: 1500));
      if (mounted) {
        setState(() {
          _currentMessageIndex =
              (_currentMessageIndex + 1) % _loadingMessages.length;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Animated Pulse Icon
          SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer Pulse
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Container(
                      width: 60 + (_controller.value * 40),
                      height: 60 + (_controller.value * 40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(
                          0xFF7C3AED,
                        ).withOpacity((1 - _controller.value) * 0.2),
                      ),
                    );
                  },
                ),
                // Inner Pulse
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Container(
                      width: 60 + (_controller.value * 20),
                      height: 60 + (_controller.value * 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(
                          0xFF8B5CF6,
                        ).withOpacity((1 - _controller.value) * 0.3),
                      ),
                    );
                  },
                ),
                // Icon Container
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF7C3AED).withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFF7C3AED), Color(0xFFC026D3)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: const Icon(
                        FontAwesomeIcons.brain,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Gradient Text
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF7C3AED), Color(0xFFC026D3)],
            ).createShader(bounds),
            child: Text(
              "AI Assistant Working",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white, // Required for ShaderMask
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Cycling Message with fade transition could be nicer, but text swap is fine for now
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              _loadingMessages[_currentMessageIndex],
              key: ValueKey<int>(_currentMessageIndex),
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
