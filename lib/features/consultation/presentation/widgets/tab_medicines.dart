import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../patient/domain/clinical_models.dart';
import '../consultation_controller.dart';
import '../../data/consultation_repository.dart';
import '../../domain/consultation_models.dart';

class MedicinesTab extends ConsumerStatefulWidget {
  final String appointmentId;

  const MedicinesTab({super.key, required this.appointmentId});

  @override
  ConsumerState<MedicinesTab> createState() => _MedicinesTabState();
}

class _MedicinesTabState extends ConsumerState<MedicinesTab> {
  final _searchController = TextEditingController();
  List<MedicineMaster> _searchResults = [];
  bool _isSearching = false;

  void _onSearch(String query) async {
    if (query.length < 2) {
      setState(() => _searchResults = []);
      return;
    }

    setState(() => _isSearching = true);
    try {
      final results = await ref
          .read(consultationRepositoryProvider)
          .searchMedicines(query);
      if (mounted) {
        setState(() {
          _searchResults = results;
          _isSearching = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isSearching = false);
    }
  }

  void _addMedicine(MedicineMaster master) {
    // Show dialog to enter details? Or add directly with defaults?
    // For now, add directly and allow edit inline or via bottom sheet.
    // Making it simple: add then edit.
    final med = PrescriptionMedicine(
      brandName: master.name,
      genericName: master.genericName,
      type: master.type,
      dosage: '1-0-1', // Default
      duration: '5 Days',
      instruction: 'After Food',
    );

    ref
        .read(consultationControllerProvider(widget.appointmentId).notifier)
        .addMedicine(med);
    _searchController.clear();
    setState(() => _searchResults = []);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      consultationControllerProvider(widget.appointmentId),
    );
    final controller = ref.read(
      consultationControllerProvider(widget.appointmentId).notifier,
    );
    final meds = state.medicines;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Text(
            'Add Medicines',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              TextFormField(
                controller: _searchController,
                onChanged: _onSearch,
                decoration: InputDecoration(
                  hintText: 'Search brand or generic name...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.withValues(alpha: 0.2),
                    ),
                  ),
                  suffixIcon: _isSearching
                      ? const Padding(
                          padding: EdgeInsets.all(12),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : null,
                ),
              ),
              if (_searchResults.isNotEmpty)
                Container(
                  constraints: const BoxConstraints(maxHeight: 200),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final item = _searchResults[index];
                      return ListTile(
                        title: Text(
                          item.name,
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          '${item.genericName ?? ""} • ${item.type ?? ""}',
                          style: GoogleFonts.inter(fontSize: 12),
                        ),
                        onTap: () => _addMedicine(item),
                      );
                    },
                  ),
                ),
            ],
          ),

          const SizedBox(height: 24),

          // List
          Text(
            'Prescribed Medicines (${meds.length})',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),

          if (meds.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'No medicines added',
                  style: GoogleFonts.inter(color: Colors.grey),
                ),
              ),
            ),

          ...meds.asMap().entries.map((entry) {
            final index = entry.key;
            final med = entry.value;
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black.withValues(alpha: 0.04)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              med.brandName,
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            if (med.genericName != null)
                              Text(
                                med.genericName!,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        onPressed: () => controller.removeMedicine(index),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _InlineInput(
                          label: 'Dosage',
                          value: med.dosage ?? '',
                          onChanged: (val) {
                            controller.updateMedicine(
                              index,
                              med.copyWith(dosage: val),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _InlineInput(
                          label: 'Duration',
                          value: med.duration ?? '',
                          onChanged: (val) {
                            controller.updateMedicine(
                              index,
                              med.copyWith(duration: val),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _InlineInput(
                    label: 'Instruction',
                    value: med.instruction ?? '',
                    onChanged: (val) {
                      controller.updateMedicine(
                        index,
                        med.copyWith(instruction: val),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _InlineInput extends StatelessWidget {
  final String label;
  final String value;
  final Function(String) onChanged;

  const _InlineInput({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.inter(fontSize: 10, color: Colors.grey)),
        const SizedBox(height: 4),
        TextFormField(
          initialValue: value,
          onChanged: onChanged,
          style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 13),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 8,
            ),
            border: const UnderlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
