// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../consultation_controller.dart';
import '../../domain/consultation_models.dart';

const List<String> kAllergySuggestions = [
  "Sulfa",
  "Penicillin",
  "Dust/Pollens",
  "Aspirin",
  "NSAIDs",
  "Lactose",
  "Seafood",
  "Peanuts",
  "Eggs",
  "Latex",
  "Dye/Contrast",
  "Milk",
  "Soy",
  "Wheat",
];
const List<String> kConditionSuggestions = [
  "Diabetes Type 2",
  "Hypertension",
  "Hypothyroid",
  "Asthma",
  "CKD",
  "PCOS",
  "Gastritis",
  "Hyperlipidemia",
  "Migraine",
  "OA Knee",
  "IHD",
  "COPD",
  "Hyperuricemia",
  "Anemia",
];
const List<String> kFamilySuggestions = [
  "F: Diabetes",
  "M: Diabetes",
  "F: Hypertension",
  "M: BP",
  "Sibling: Asthma",
  "Parents: CAD",
  "F: Stroke",
  "M: Cancer",
  "F: CKD",
  "Sibling: Diabetes",
  "M: Thyroid",
  "Paternal: Heart",
  "Maternal: BP",
  "M: OA",
];
const List<String> kLifestyleSuggestions = [
  "Smoker",
  "Alcohol",
  "Vegetarian",
  "Vegan",
  "Sedentary",
  "Active",
  "High Stress",
];

class ProfileTab extends ConsumerStatefulWidget {
  final String appointmentId;
  const ProfileTab({super.key, required this.appointmentId});

  @override
  ConsumerState<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends ConsumerState<ProfileTab> {
  // Local state for editing form
  late List<String> allergies;
  late List<String> chronicConditions;
  late List<String> familyHistory;
  late List<String> lifestyle;

  final TextEditingController allergyCtrl = TextEditingController();
  final TextEditingController conditionCtrl = TextEditingController();
  final TextEditingController familyCtrl = TextEditingController();
  final TextEditingController lifestyleCtrl = TextEditingController();

  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      consultationControllerProvider(widget.appointmentId),
    );
    final controller = ref.read(
      consultationControllerProvider(widget.appointmentId).notifier,
    );

    if (state.context == null) return const SizedBox.shrink();

    // Init local state from provider once
    if (!_initialized) {
      final profile = state.context!.safetyProfile;
      allergies = List.from(profile.allergies);
      chronicConditions = List.from(profile.chronicConditions);
      familyHistory = List.from(profile.familyHistory);
      lifestyle = profile.lifestyle.keys.toList(); // Using keys as tags
      _initialized = true;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // --- Editor Section ---
          Text(
            'Patient Record Editor',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Modify medical history and alerts',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.black.withOpacity(0.05)),
            ),
            child: Column(
              children: [
                _buildEditor(
                  title: '1. Update Drug & Food Allergies',
                  count: allergies.length,
                  icon: Icons.warning_amber_rounded,
                  color: Colors.red,
                  items: allergies,
                  controller: allergyCtrl,
                  suggestions: kAllergySuggestions,
                  onAdd: (val) => setState(() => allergies.add(val)),
                  onRemove: (val) => setState(() => allergies.remove(val)),
                  placeholder: 'Add new allergy...',
                ),
                Divider(
                  height: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black.withOpacity(0.05),
                ),
                _buildEditor(
                  title: '2. Update Chronic Conditions',
                  count: chronicConditions.length,
                  icon: Icons.monitor_heart_outlined,
                  color: Colors.orange,
                  items: chronicConditions,
                  controller: conditionCtrl,
                  suggestions: kConditionSuggestions,
                  onAdd: (val) => setState(() => chronicConditions.add(val)),
                  onRemove: (val) =>
                      setState(() => chronicConditions.remove(val)),
                  placeholder: 'Add condition...',
                ),
                Divider(
                  height: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black.withOpacity(0.05),
                ),
                _buildEditor(
                  title: '3. Update Family History',
                  count: familyHistory.length,
                  icon: Icons.people_outline,
                  color: Theme.of(context).primaryColor,
                  items: familyHistory,
                  controller: familyCtrl,
                  suggestions: kFamilySuggestions,
                  onAdd: (val) => setState(() => familyHistory.add(val)),
                  onRemove: (val) => setState(() => familyHistory.remove(val)),
                  placeholder: 'Add family history...',
                ),
                Divider(
                  height: 1,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.black.withOpacity(0.05),
                ),
                _buildEditor(
                  title: '4. Update Lifestyle Factors',
                  count: lifestyle.length,
                  icon: Icons.favorite_outline,
                  color: const Color(0xFFE11D48), // Rose 600
                  items: lifestyle,
                  controller: lifestyleCtrl,
                  suggestions: kLifestyleSuggestions,
                  onAdd: (val) => setState(() => lifestyle.add(val)),
                  onRemove: (val) => setState(() => lifestyle.remove(val)),
                  placeholder: 'Add lifestyle tag...',
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // --- Overview Section (Safety Profile) ---
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.black.withOpacity(0.05)),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.05),
                        ),
                      ),
                      child: Icon(
                        Icons.shield_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Safety Profile',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                        Text(
                          'Current medical summary and alerts',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildOverviewItem(
                  title: 'Known Allergies',
                  items: allergies,
                  icon: Icons.warning_amber_rounded,
                  color: Colors.red,
                  emptyText: 'No allergies recorded',
                ),
                const SizedBox(height: 16),
                _buildOverviewItem(
                  title: 'Chronic Conditions',
                  items: chronicConditions,
                  icon: Icons.monitor_heart_outlined,
                  color: Colors.orange,
                  emptyText: 'No conditions recorded',
                ),
                const SizedBox(height: 16),
                _buildOverviewItem(
                  title: 'Family Health History',
                  items: familyHistory,
                  icon: Icons.people_outline,
                  color: Theme.of(context).primaryColor,
                  emptyText: 'No family history recorded',
                ),
                const SizedBox(height: 16),
                _buildOverviewItem(
                  title: 'Lifestyle & Habits',
                  items: lifestyle,
                  icon: Icons.favorite_outline,
                  color: const Color(0xFFE11D48), // Rose 600
                  emptyText: 'No lifestyle factors recorded',
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Save Button
          SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: state.isSaving
                  ? null
                  : () {
                      final newProfile = MedicalProfile(
                        allergies: allergies,
                        chronicConditions: chronicConditions,
                        familyHistory: familyHistory,
                        lifestyle: {for (var e in lifestyle) e: true},
                      );
                      controller.saveMedicalProfile(newProfile);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                elevation: 0,
              ),
              child: state.isSaving
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.save_outlined),
                        const SizedBox(width: 8),
                        Text(
                          'Update Patient Profile',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          if (state.error != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  state.error!,
                  style: GoogleFonts.inter(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildOverviewItem({
    required String title,
    required List<String> items,
    required IconData icon,
    required Color color,
    required String emptyText,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC), // Slate 50
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 8),
              Text(
                title.toUpperCase(),
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF64748B), // Slate 500
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          if (items.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: items
                  .map(
                    (item) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: color.withOpacity(0.2)),
                      ),
                      child: Text(
                        item,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: color,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ] else ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCBD5E1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  emptyText,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF94A3B8), // Slate 400
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEditor({
    required String title,
    required int count,
    required IconData icon,
    required Color color,
    required List<String> items,
    required TextEditingController controller,
    required List<String> suggestions,
    required Function(String) onAdd,
    required Function(String) onRemove,
    required String placeholder,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        subtitle: Text(
          '$count items active',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF64748B),
          ),
        ),
        childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onSubmitted: (val) {
                    if (val.trim().isNotEmpty && !items.contains(val.trim())) {
                      onAdd(val.trim());
                      controller.clear();
                    }
                  },
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F172A),
                  ),
                  decoration: InputDecoration(
                    hintText: placeholder,
                    hintStyle: GoogleFonts.inter(
                      color: const Color(0xFF94A3B8),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF8FAFC),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: 48,
                width: 48,
                child: FilledButton(
                  onPressed: () {
                    final val = controller.text.trim();
                    if (val.isNotEmpty && !items.contains(val)) {
                      onAdd(val);
                      controller.clear();
                    }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFF1F5F9), // Slate 100
                    foregroundColor: const Color(0xFF0F172A), // Slate 900
                    padding: EdgeInsets.zero,
                  ),
                  child: const Icon(Icons.add_rounded),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: suggestions.map((s) {
                return InkWell(
                  onTap: () {
                    if (!items.contains(s)) onAdd(s);
                  },
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black.withOpacity(0.05)),
                    ),
                    child: Text(
                      '+ $s',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          if (items.isNotEmpty) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: items.map((item) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(12, 6, 6, 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: color.withOpacity(0.2)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () => onRemove(item),
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Icon(
                              Icons.close_rounded,
                              size: 14,
                              color: color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
