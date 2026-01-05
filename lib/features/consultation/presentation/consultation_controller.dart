import 'package:flutter_riverpod/flutter_riverpod.dart'; // Using standard toast or fluttertoast? User prefers Sonner in web, maybe toastification here.
// Actually I'll use a simple snackbar mechanism or just expose error/warning state?
// The plan said "Show toast warning". I'll use a listener in UI or simple state getter.
// For now, I'll just expose the check method and let UI handle toast.

import '../data/consultation_repository.dart';
import '../domain/consultation_models.dart';

final consultationControllerProvider =
    StateNotifierProvider.family<
      ConsultationController,
      ConsultationState,
      String
    >((ref, appointmentId) {
      final repo = ref.watch(consultationRepositoryProvider);
      return ConsultationController(repo, appointmentId);
    });

class ConsultationController extends StateNotifier<ConsultationState> {
  final ConsultationRepository _repo;
  final String _appointmentId;

  ConsultationController(this._repo, this._appointmentId)
    : super(const ConsultationState()) {
    _init();
  }

  Future<void> _init() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final data = await _repo.getConsultationInitData(_appointmentId);
      state = state.copyWith(
        isLoading: false,
        context: data,
        // Pre-fill logic can go here if restoring from draft
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // --- Profile ---
  Future<void> saveMedicalProfile(MedicalProfile profile) async {
    if (state.context == null) return;

    // Optimistic update of context
    final oldContext = state.context!;
    state = state.copyWith(
      context: oldContext.copyWith(safetyProfile: profile),
      isSaving:
          true, // Reusing isSaving to show spinner, or could use separate flag
    );

    try {
      await _repo.updateMedicalProfile(oldContext.patient.id, profile);
      state = state.copyWith(isSaving: false);
    } catch (e) {
      // Revert
      state = state.copyWith(
        context: oldContext,
        isSaving: false,
        error: "Failed to update profile: $e",
      );
    }
    // Note: UI should listen to state.error or just `await` this future if exposed
  }

  // --- Vitals ---
  void updateVital(String key, String value) {
    if (value.isEmpty) {
      final newVitals = Map<String, String>.from(state.vitals);
      newVitals.remove(key);
      state = state.copyWith(vitals: newVitals);
      return;
    }
    final newVitals = Map<String, String>.from(state.vitals);
    newVitals[key] = value;
    state = state.copyWith(vitals: newVitals);
  }

  void updateAllVitals(Map<String, String> newVitals) {
    state = state.copyWith(vitals: newVitals);
  }

  // --- Complaints ---
  void updateChiefComplaint(String val) {
    state = state.copyWith(chiefComplaint: val);
  }

  void addSymptom(String symptom) {
    if (!state.symptoms.contains(symptom)) {
      state = state.copyWith(symptoms: [...state.symptoms, symptom]);
    }
  }

  void removeSymptom(String symptom) {
    state = state.copyWith(
      symptoms: state.symptoms.where((e) => e != symptom).toList(),
    );
  }

  // --- Diagnosis ---
  void addDiagnosis(String diagnosis) {
    if (!state.diagnosis.contains(diagnosis)) {
      state = state.copyWith(diagnosis: [...state.diagnosis, diagnosis]);
    }
  }

  void removeDiagnosis(String diagnosis) {
    state = state.copyWith(
      diagnosis: state.diagnosis.where((e) => e != diagnosis).toList(),
    );
  }

  // --- Medicines ---

  // Helper to check allergy
  String? checkAllergyWarning(String medName) {
    final allergies = state.context?.safetyProfile.allergies ?? [];
    if (allergies.isEmpty) return null;

    final lowerName = medName.toLowerCase();
    for (final allergy in allergies) {
      if (lowerName.contains(allergy.toLowerCase())) {
        return "Warning: Patient has allergy to $allergy";
      }
    }
    return null;
  }

  void addMedicine(ConsultationMedicine med) {
    state = state.copyWith(medicines: [...state.medicines, med]);
  }

  void removeMedicine(String tempId) {
    state = state.copyWith(
      medicines: state.medicines.where((m) => m.tempId != tempId).toList(),
    );
  }

  void updateMedicine(ConsultationMedicine med) {
    final index = state.medicines.indexWhere((m) => m.tempId == med.tempId);
    if (index != -1) {
      final newMeds = List<ConsultationMedicine>.from(state.medicines);
      newMeds[index] = med;
      state = state.copyWith(medicines: newMeds);
    }
  }

  // --- Labs ---
  void addLab(ConsultationLab lab) {
    // Avoid dups by testName if needed, or allow
    state = state.copyWith(labOrders: [...state.labOrders, lab]);
  }

  void removeLab(int index) {
    if (index >= 0 && index < state.labOrders.length) {
      final newLabs = List<ConsultationLab>.from(state.labOrders);
      newLabs.removeAt(index);
      state = state.copyWith(labOrders: newLabs);
    }
  }

  // --- Advice ---
  void updateAdvice(String notes) {
    state = state.copyWith(adviceNotes: notes);
  }

  void updateNextVisit(DateTime? date) {
    state = state.copyWith(nextVisitDate: date);
  }

  // --- Submit ---
  Future<bool> submit() async {
    if (state.context == null) {
      state = state.copyWith(error: 'Consultation context not loaded');
      return false;
    }

    state = state.copyWith(isSaving: true, error: null);
    try {
      await _repo.submitPrescription(
        consultId: state.context!.consultationId,
        state: state,
      );

      state = state.copyWith(isSaving: false);
      return true;
    } catch (e) {
      state = state.copyWith(isSaving: false, error: e.toString());
      return false;
    }
  }

  // --- AI Summary ---
  Future<void> generateSummary() async {
    if (state.context == null) return;

    state = state.copyWith(isLoading: true);
    try {
      final summary = await _repo.generateSummary(
        appointmentId: _appointmentId,
      );

      // Update the context with new summary
      final newContext = state.context!.copyWith(aiSummary: summary);
      state = state.copyWith(isLoading: false, context: newContext);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
