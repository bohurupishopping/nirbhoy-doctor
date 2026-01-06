// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'dashboard_controller.dart';
import '../../auth/presentation/auth_controller.dart';
import 'widgets/stat_card.dart';
import 'widgets/queue_tile.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    final state = ref.watch(dashboardControllerProvider);

    if (state.isLoading &&
        state.queue.active.isEmpty &&
        state.stats.waitingCount == 0) {
      return const Scaffold(
        backgroundColor: Color(0xfffafcff),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.error != null && !state.isLoading && state.queue.active.isEmpty) {
      return Scaffold(
        backgroundColor: const Color(0xfffafcff),
        body: Center(
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
                  state.error!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(dashboardControllerProvider.notifier)
                        .loadData(isRefresh: true);
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xfffafcff),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await ref
                .read(dashboardControllerProvider.notifier)
                .loadData(isRefresh: true);
          },
          child: CustomScrollView(
            slivers: [
              // 1. App Bar / Header
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  user?.avatarUrl ??
                                      'https://cdn.nirbhoy.de/avatars/247b6bbf-021e-43ec-8c8c-151218a6b9b3/035da0e7-4158-4ca9-881a-7fab018343bb-gemini-fused-image-1__14_.webp',
                                ), // Placeholder Avatar
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Doctor',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Text(
                                user?.fullName ?? 'Hello Doctor',
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _HeaderActionButton(
                            icon: Icons.notifications_none_rounded,
                            onTap: () {},
                          ),
                          const SizedBox(width: 12),
                          _HeaderActionButton(
                            icon: Icons.logout_rounded,
                            onTap: () {
                              ref
                                  .read(authControllerProvider.notifier)
                                  .signOut(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              // 2.5 Navigation Buttons
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                        child: _NavMenuCard(
                          label: 'Patients',
                          icon: Icons.people_rounded,
                          color: Colors.blue,
                          onTap: () => context.push('/patient'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _NavMenuCard(
                          label: 'Schedule',
                          icon: Icons.calendar_month_rounded,
                          color: Colors.indigo,
                          onTap: () => context.push('/appointments'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _NavMenuCard(
                          label: 'History',
                          icon: Icons.history_rounded,
                          color: Colors.teal,
                          onTap: () => context.push('/history'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),

              // 3. Stats Carousel
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 150, // Height for the new taller cards
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      StatCard(
                        label: 'Waiting',
                        value: '${state.stats.waitingCount}',
                        icon: Icons.hourglass_empty_rounded,
                        color: Colors.orange,
                      ),
                      StatCard(
                        label: 'Completed',
                        value: '${state.stats.completedToday}',
                        icon: Icons.check_circle_outline_rounded,
                        color: Colors.green,
                      ),
                      StatCard(
                        label: 'Avg Consult',
                        value: '${state.stats.avgConsultTimeMins}m',
                        icon: Icons.timer_rounded,
                        color: Colors.blue,
                      ),
                      StatCard(
                        label: 'Avg Wait',
                        value: '${state.stats.avgWaitTimeMins}m',
                        icon: Icons.access_time_rounded,
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              // 5. Queue List
              // 5. Active Patients
              if (state.queue.active.isNotEmpty) ...[
                _SectionTitle(title: 'Current Session', badge: 'Active'),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = state.queue.active[index];
                      return QueueTile(
                        item: item,
                        isActive: true,
                        onTap: () {
                          context.push('/consultation/${item.appointmentId}');
                        },
                      );
                    }, childCount: state.queue.active.length),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],

              // 6. Waiting Room
              if (state.queue.waiting.isNotEmpty) ...[
                _SectionTitle(title: 'Waiting Room', badge: 'Lobby'),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = state.queue.waiting[index];
                      return QueueTile(
                        item: item,
                        actionLabel: 'Call',
                        onAction: () {
                          ref
                              .read(dashboardControllerProvider.notifier)
                              .callPatient(item.appointmentId);
                        },
                        onTap: () {
                          // View patient details if needed
                        },
                      );
                    }, childCount: state.queue.waiting.length),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],

              if (state.queue.active.isEmpty && state.queue.waiting.isEmpty)
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        "No patients in queue",
                        style: GoogleFonts.plusJakartaSans(color: Colors.grey),
                      ),
                    ),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: 48)),
            ],
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
        height: 48, // Larger target
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

class _NavMenuCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _NavMenuCard({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String badge;

  const _SectionTitle({required this.title, required this.badge});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                badge,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
