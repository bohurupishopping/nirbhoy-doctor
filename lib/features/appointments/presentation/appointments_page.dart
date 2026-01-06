// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../auth/presentation/auth_controller.dart';
import 'appointments_controller.dart';
import 'widgets/appointment_card.dart';
import 'widgets/doctor_card.dart';

class AppointmentsPage extends ConsumerWidget {
  const AppointmentsPage({super.key});

  String _formatDoctorName(String name) {
    if (name.isEmpty) return name;
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length <= 2) return name;
    return '${parts[0]} ${parts[1]}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appointmentsControllerProvider);
    final controller = ref.read(appointmentsControllerProvider.notifier);
    final user = ref.watch(currentUserProvider);
    final isDoctorRestricted =
        user?.role == 'doctor' && state.selectedDoctor?.id == user?.id;

    return Scaffold(
      backgroundColor: const Color(0xfffafcff),
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // 1. Custom Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            _HeaderActionButton(
                              icon: Icons.arrow_back_rounded,
                              onTap: () {
                                if (isDoctorRestricted) {
                                  Navigator.pop(context);
                                } else if (state.selectedDoctor != null) {
                                  controller.selectDoctor(null);
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                            ),
                            const SizedBox(width: 16),
                            Flexible(
                              child: Text(
                                state.selectedDoctor != null
                                    ? 'Dr. ${_formatDoctorName(state.selectedDoctor!.fullName)}'
                                    : 'Appointments',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          _HeaderActionButton(
                            icon: Icons.calendar_month_rounded,
                            onTap: () async {
                              final picked = await showDatePicker(
                                context: context,
                                initialDate: state.selectedDate,
                                firstDate: DateTime(2023),
                                lastDate: DateTime(2030),
                              );
                              if (picked != null) {
                                controller.loadAppointments(date: picked);
                              }
                            },
                          ),
                          const SizedBox(width: 12),
                          _HeaderActionButton(
                            icon: Icons.refresh_rounded,
                            onTap: () => controller.loadAppointments(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),

              // 2. Date Selector Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black.withOpacity(0.05)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _DateNavButton(
                          icon: Icons.chevron_left_rounded,
                          onTap: () {
                            controller.loadAppointments(
                              date: state.selectedDate.subtract(
                                const Duration(days: 1),
                              ),
                            );
                          },
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.event_note_rounded,
                              size: 16,
                              color: Colors.indigo.withOpacity(0.5),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              DateFormat(
                                'EEEE, MMM d',
                              ).format(state.selectedDate),
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                        _DateNavButton(
                          icon: Icons.chevron_right_rounded,
                          onTap: () {
                            controller.loadAppointments(
                              date: state.selectedDate.add(
                                const Duration(days: 1),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              if (state.selectedDoctor == null &&
                  !state.isLoading &&
                  state.error == null)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(28, 12, 24, 8),
                    child: Text(
                      'SELECT SPECIALIST',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
            ];
          },
          body: Builder(
            builder: (context) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.error != null) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline_rounded,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error: ${state.error}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () => controller.loadAppointments(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF8A65),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          child: Text(
                            'Retry',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (state.selectedDoctor == null) {
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                  itemCount: state.doctors.length,
                  itemBuilder: (context, index) {
                    final dr = state.doctors[index];
                    return DoctorCard(
                      doctor: dr,
                      onTap: () => controller.selectDoctor(dr),
                    );
                  },
                );
              }

              final filteredAppts = state.appointments
                  .where((a) => a.doctorId == state.selectedDoctor!.id)
                  .toList();

              if (filteredAppts.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event_busy_rounded,
                        size: 64,
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No appointments for today',
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                itemCount: filteredAppts.length,
                itemBuilder: (context, index) {
                  final appt = filteredAppts[index];
                  return AppointmentCard(appointment: appt);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderActionButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black.withOpacity(0.05)),
        ),
        child: Center(child: Icon(icon, size: 22, color: Colors.black87)),
      ),
    );
  }
}

class _DateNavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _DateNavButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          shape: BoxShape.circle,
        ),
        child: Center(child: Icon(icon, size: 20, color: Colors.black54)),
      ),
    );
  }
}
