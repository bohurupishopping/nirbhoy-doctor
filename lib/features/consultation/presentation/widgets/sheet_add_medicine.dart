// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import '../../domain/consultation_models.dart';

class SheetAddMedicine extends StatefulWidget {
  final MedicineSearchResult? master;
  final ConsultationMedicine? editMedicine;
  final Function(ConsultationMedicine) onSave;

  const SheetAddMedicine({
    super.key,
    this.master,
    this.editMedicine,
    required this.onSave,
  }) : assert(
         master != null || editMedicine != null,
         'Either master or editMedicine must be provided',
       );

  @override
  State<SheetAddMedicine> createState() => _SheetAddMedicineState();
}

class _SheetAddMedicineState extends State<SheetAddMedicine> {
  late TextEditingController _freqController;
  late TextEditingController _durationController;
  late TextEditingController _instructionController;
  late TextEditingController _notesController;

  final List<String> _commonFrequencies = [
    '1-0-1',
    '1-0-0',
    '0-0-1',
    '1-1-1',
    'SOS',
  ];

  final List<String> _commonDurations = [
    '3 Days',
    '5 Days',
    '7 Days',
    '10 Days',
    '15 Days',
    '1 Month',
  ];

  final List<String> _commonInstructions = [
    'After Food',
    'Before Food',
    'With Food',
  ];

  @override
  void initState() {
    super.initState();
    final edit = widget.editMedicine;
    _freqController = TextEditingController(text: edit?.frequency ?? '1-0-1');
    _durationController = TextEditingController(
      text: edit?.duration ?? '5 Days',
    );
    _instructionController = TextEditingController(
      text: edit?.instruction ?? 'After Food',
    );
    _notesController = TextEditingController(
      text: edit?.specialInstructions ?? '',
    );
  }

  @override
  void dispose() {
    _freqController.dispose();
    _durationController.dispose();
    _instructionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submit() {
    ConsultationMedicine med;

    if (widget.editMedicine != null) {
      // Editing Mode
      med = widget.editMedicine!.copyWith(
        frequency: _freqController.text,
        duration: _durationController.text,
        instruction: _instructionController.text,
        specialInstructions: _notesController.text,
      );
    } else {
      // Adding Mode
      final master = widget.master!;
      med = ConsultationMedicine(
        tempId: const Uuid().v4(),
        masterId: master.id,
        name: master.brandName,
        composition: master.genericName,
        type: master.type,
        frequency: _freqController.text,
        duration: _durationController.text,
        instruction: _instructionController.text,
        specialInstructions: _notesController.text,
      );
    }

    widget.onSave(med);
    Navigator.pop(context);
  }

  void _setField(TextEditingController controller, String value) {
    setState(() {
      controller.text = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEditing = widget.editMedicine != null;

    // Determine display values
    final String brandName = isEditing
        ? widget.editMedicine!.name
        : widget.master!.brandName;

    final String? genericName = isEditing
        ? widget.editMedicine!.composition
        : widget.master!.genericName;

    final String? type = isEditing
        ? widget.editMedicine!.type
        : widget.master!.type;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Drag Handle
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12, bottom: 20),
              width: 48,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: theme.primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: theme.primaryColor.withOpacity(0.1),
                    ),
                  ),
                  child: Icon(
                    isEditing
                        ? Icons.edit_note_rounded
                        : Icons.medication_outlined,
                    color: theme.primaryColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brandName,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                      if (genericName != null)
                        Text(
                          genericName,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF64748B),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                if (type != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      type.toUpperCase(),
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),

          // Form Scrollable Area
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Frequency Section
                  _buildSectionLabel('Frequency'),
                  const SizedBox(height: 12),
                  _buildChipGroup(_commonFrequencies, _freqController),
                  const SizedBox(height: 12),
                  _buildTextField(
                    controller: _freqController,
                    hint: 'Custom frequency...',
                  ),

                  const SizedBox(height: 24),

                  // Duration Section
                  _buildSectionLabel('Duration'),
                  const SizedBox(height: 12),
                  _buildChipGroup(_commonDurations, _durationController),
                  const SizedBox(height: 12),
                  _buildTextField(
                    controller: _durationController,
                    hint: 'Custom duration...',
                  ),

                  const SizedBox(height: 24),

                  // Instruction Section
                  _buildSectionLabel('Instruction'),
                  const SizedBox(height: 12),
                  _buildChipGroup(_commonInstructions, _instructionController),
                  const SizedBox(height: 12),
                  _buildTextField(
                    controller: _instructionController,
                    hint: 'Add instructions...',
                    icon: Icons.notes_outlined,
                  ),

                  const SizedBox(height: 24),

                  // Notes Section
                  _buildSectionLabel('Special Notes (Optional)'),
                  const SizedBox(height: 12),
                  _buildTextField(
                    controller: _notesController,
                    hint: 'Any specific remarks...',
                    maxLines: 2,
                  ),

                  const SizedBox(height: 24),

                  // Add/Update Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: Text(
                        isEditing ? 'Update Medicine' : 'Add to Prescription',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Text(
      label.toUpperCase(),
      style: GoogleFonts.plusJakartaSans(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF94A3B8),
        letterSpacing: 1,
      ),
    );
  }

  Widget _buildChipGroup(
    List<String> options,
    TextEditingController controller,
  ) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        final isSelected = controller.text == option;
        return InkWell(
          onTap: () => _setField(controller, option),
          borderRadius: BorderRadius.circular(100),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : const Color(0xFFE2E8F0),
              ),
            ),
            child: Text(
              option,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : const Color(0xFF64748B),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    IconData? icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF0F172A),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(
          color: const Color(0xFF94A3B8),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        prefixIcon: icon != null
            ? Icon(icon, color: const Color(0xFF94A3B8), size: 20)
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
