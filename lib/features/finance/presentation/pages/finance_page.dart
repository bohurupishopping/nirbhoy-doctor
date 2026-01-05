// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/finance_controller.dart';

class FinancePage extends ConsumerStatefulWidget {
  const FinancePage({super.key});

  @override
  ConsumerState<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends ConsumerState<FinancePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  // Header toggle states
  bool _isSearchVisible = false;
  bool _isFilterVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(financeControllerProvider.notifier).next();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(financeControllerProvider);
    final controller = ref.read(financeControllerProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF8),
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // 1. Custom Header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _HeaderActionButton(
                            icon: Icons.arrow_back_rounded,
                            onTap: () => Navigator.pop(context),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            'Finance',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          _HeaderActionButton(
                            icon: Icons.search_rounded,
                            isSelected: _isSearchVisible,
                            onTap: () => setState(() {
                              _isSearchVisible = !_isSearchVisible;
                              if (_isSearchVisible) _isFilterVisible = false;
                            }),
                          ),
                          const SizedBox(width: 12),
                          _HeaderActionButton(
                            icon: Icons.calendar_month_rounded,
                            onTap: () async {
                              final picked = await showDateRangePicker(
                                context: context,
                                initialDateRange: DateTimeRange(
                                  start: state.startDate,
                                  end: state.endDate,
                                ),
                                firstDate: DateTime(2020),
                                lastDate: DateTime.now(),
                              );
                              if (picked != null) {
                                controller.updateFilters(
                                  startDate: picked.start,
                                  endDate: picked.end,
                                );
                              }
                            },
                          ),
                          const SizedBox(width: 12),
                          _HeaderActionButton(
                            icon: Icons.filter_list_rounded,
                            isSelected: _isFilterVisible,
                            onTap: () => setState(() {
                              _isFilterVisible = !_isFilterVisible;
                              if (_isFilterVisible) _isSearchVisible = false;
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),

              // 2. Collapsible Search / Filter Headers
              if (_isSearchVisible)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.05),
                        ),
                      ),
                      child: TextField(
                        controller: _searchController,
                        autofocus: true,
                        onSubmitted: (val) =>
                            controller.updateFilters(searchText: val),
                        decoration: InputDecoration(
                          hintText: 'Search invoice or patient...',
                          hintStyle: GoogleFonts.inter(
                            color: Colors.grey[400],
                            fontSize: 14,
                          ),
                          icon: const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),

              if (_isFilterVisible)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _StatusChip(
                            label: 'All Transactions',
                            isSelected: state.statusFilter == 'all',
                            onTap: () =>
                                controller.updateFilters(statusFilter: 'all'),
                          ),
                          _StatusChip(
                            label: 'Paid',
                            isSelected: state.statusFilter == 'paid',
                            onTap: () =>
                                controller.updateFilters(statusFilter: 'paid'),
                          ),
                          _StatusChip(
                            label: 'Pending',
                            isSelected: state.statusFilter == 'pending',
                            onTap: () => controller.updateFilters(
                              statusFilter: 'pending',
                            ),
                          ),
                          _StatusChip(
                            label: 'Partial',
                            isSelected: state.statusFilter == 'partial',
                            onTap: () => controller.updateFilters(
                              statusFilter: 'partial',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              // 3. Stats overview
              if (state.stats != null)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 75,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _CompactStatCard(
                          label: 'Gross Billed',
                          value:
                              '₹${NumberFormat('#,##,###').format(state.stats!.totalBilled)}',
                          color: const Color(0xFF10B981),
                        ),
                        _CompactStatCard(
                          label: 'Collected',
                          value:
                              '₹${NumberFormat('#,##,###').format(state.stats!.totalCollected)}',
                          color: Colors.indigo,
                        ),
                        _CompactStatCard(
                          label: 'Pending',
                          value:
                              '₹${NumberFormat('#,##,###').format(state.stats!.totalPending)}',
                          color: Colors.amber,
                        ),
                        _CompactStatCard(
                          label: 'Returns',
                          value: '₹${NumberFormat('#,##,###').format(0)}',
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),
            ];
          },
          body: Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.02),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              border: Border.all(color: Colors.black.withOpacity(0.02)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              child: state.isLoading && state.transactions.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : state.transactions.isEmpty
                  ? const _EmptyState()
                  : Builder(
                      builder: (context) {
                        return ListView.separated(
                          // Use the primary scroll controller provided by NestedScrollView
                          padding: const EdgeInsets.fromLTRB(16, 24, 16, 80),
                          itemCount:
                              state.transactions.length +
                              (state.transactions.length < state.totalRecords
                                  ? 1
                                  : 0),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            if (index == state.transactions.length) {
                              return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }

                            final txn = state.transactions[index];
                            return _TransactionLedgerItem(txn: txn);
                          },
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CompactStatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _CompactStatCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: color.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: color.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _StatusChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF8A65) : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFFF8A65)
                : Colors.black.withOpacity(0.05),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            color: isSelected ? Colors.white : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}

class _TransactionLedgerItem extends StatelessWidget {
  final dynamic txn;
  const _TransactionLedgerItem({required this.txn});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF8A65).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    (txn.patient['name'] ?? '?')[0].toUpperCase(),
                    style: GoogleFonts.plusJakartaSans(
                      color: const Color(0xFFFF8A65),
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      txn.patient['name'] ?? 'Unknown',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Dr. ${txn.doctorName ?? 'Staff'}',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '₹${NumberFormat('#,##,###').format(txn.amount)}',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  _SmallStatusBadge(status: txn.status ?? 'pending'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#${txn.invoiceNumber}'.toUpperCase(),
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[400],
                ),
              ),
              Text(
                DateFormat('MMM d, h:mm a').format(txn.createdAt),
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SmallStatusBadge extends StatelessWidget {
  final String status;
  const _SmallStatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status.toLowerCase()) {
      case 'paid':
        color = const Color(0xFF10B981);
        break;
      case 'pending':
        color = Colors.amber;
        break;
      case 'partial':
        color = Colors.indigo;
        break;
      case 'refunded':
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      margin: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        status.toUpperCase(),
        style: GoogleFonts.inter(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _HeaderActionButton({
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF8A65) : Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFFF8A65)
                : Colors.black.withOpacity(0.05),
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 20,
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.1,
            child: const Icon(Icons.receipt_long, size: 64, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Text(
            'No transactions available',
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
