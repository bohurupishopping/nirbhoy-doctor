// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/dashboard_models.dart';

class QueueTile extends StatelessWidget {
  final QueueItem item;
  final VoidCallback? onTap;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool isScheduled; // Helper to distinguish expected arrivals
  final bool isActive; // Helper to distinguish active consultations

  const QueueTile({
    super.key,
    required this.item,
    this.onTap,
    this.actionLabel,
    this.onAction,
    this.isScheduled = false,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final isCritical = item.accessFlags?['critical'] == true;
    final isWheelchair = item.accessFlags?['wheelchair'] == true;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // Token Avatar
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: _getAvatarColor().withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: isScheduled
                      ? Icon(
                          Icons.person_outline_rounded,
                          color: Colors.blue[600],
                          size: 28,
                        )
                      : Text(
                          '${item.tokenNumber}',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: isActive
                                ? const Color(0xFF10B981)
                                : const Color(0xFFFF8A65),
                          ),
                        ),
                ),

                const SizedBox(width: 12),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.patientName,
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (isCritical) ...[
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.red,
                              size: 18,
                            ),
                          ],
                          if (isWheelchair) ...[
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.accessible,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Icons.schedule_rounded,
                            size: 14,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _getTimeText(item),
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (item.gender != null) ...[
                            const SizedBox(width: 12),
                            Icon(
                              Icons.person,
                              size: 14,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${item.gender}, ${item.age}y',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),

                // Action Button or Arrow
                if (actionLabel != null && onAction != null)
                  ElevatedButton(
                    onPressed: onAction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      actionLabel!,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.grey[300],
                      size: 18,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getAvatarColor() {
    if (isScheduled) return Colors.blue;
    if (isActive) return const Color(0xFF10B981);
    return const Color(0xFFFF8A65);
  }

  String _getTimeText(QueueItem item) {
    if (item.waitTimeMins != null) {
      if (isActive) return 'In Room'; // Simplified for active
      return 'Wait: ${item.waitTimeMins!.toInt()} min';
    }
    return 'Walk-in';
  }
}
