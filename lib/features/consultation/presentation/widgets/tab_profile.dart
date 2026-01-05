import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../consultation_controller.dart';
import '../../domain/consultation_models.dart';

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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildInfoCard(),
          const SizedBox(height: 24),

          _buildSection(
            title: "ALLERGIES",
            icon: FontAwesomeIcons.triangleExclamation,
            color: Colors.red,
            items: allergies,
            controller: allergyCtrl,
            onAdd: (val) => setState(() => allergies.add(val)),
            onRemove: (val) => setState(() => allergies.remove(val)),
            placeholder: "Add allergy (e.g. Penicillin)",
          ),

          _buildSection(
            title: "CHRONIC CONDITIONS",
            icon: FontAwesomeIcons.heartPulse,
            color: Colors.orange,
            items: chronicConditions,
            controller: conditionCtrl,
            onAdd: (val) => setState(() => chronicConditions.add(val)),
            onRemove: (val) => setState(() => chronicConditions.remove(val)),
            placeholder: "Add condition (e.g. Hypertension)",
          ),

          _buildSection(
            title: "FAMILY HISTORY",
            icon: FontAwesomeIcons.users,
            color: Colors.blue,
            items: familyHistory,
            controller: familyCtrl,
            onAdd: (val) => setState(() => familyHistory.add(val)),
            onRemove: (val) => setState(() => familyHistory.remove(val)),
            placeholder: "Add family history",
          ),

          _buildSection(
            title: "LIFESTYLE",
            icon: FontAwesomeIcons.personWalking,
            color: Colors.green,
            items: lifestyle,
            controller: lifestyleCtrl,
            onAdd: (val) => setState(() => lifestyle.add(val)),
            onRemove: (val) => setState(() => lifestyle.remove(val)),
            placeholder: "Add lifestyle tag (e.g. Smoker)",
          ),

          const SizedBox(height: 32),

          ElevatedButton.icon(
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
            icon: state.isSaving
                ? Container(
                    width: 20,
                    height: 20,
                    padding: const EdgeInsets.all(2),
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.save),
            label: const Text("Update Medical Profile"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          if (state.error != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                state.error!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.amber.shade200),
      ),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.shieldHalved,
            color: Colors.amber.shade800,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Safety Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Updates here will efficiently reflect across the patient's record.",
                  style: TextStyle(fontSize: 12, color: Colors.amber.shade800),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required MaterialColor color,
    required List<String> items,
    required TextEditingController controller,
    required Function(String) onAdd,
    required Function(String) onRemove,
    required String placeholder,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...items.map(
                (item) => Chip(
                  label: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  deleteIcon: const Icon(Icons.close, size: 14),
                  onDeleted: () => onRemove(item),
                ),
              ),
              // Simple Add Field
              SizedBox(
                width: 150,
                height: 32,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "+ Add",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade400,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(fontSize: 12),
                  onSubmitted: (val) {
                    if (val.isNotEmpty) {
                      onAdd(val);
                      controller.clear();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
