import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../patient/domain/clinical_models.dart';
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
        initData: data,
        // Pre-fill fields if needed logic here (e.g. from draft)
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // --- Vitals ---
  void updateVital(String key, dynamic value) {
    if (value == null || (value is String && value.isEmpty)) {
      final newVitals = Map<String, dynamic>.from(state.vitals);
      newVitals.remove(key);
      state = state.copyWith(vitals: newVitals);
      return;
    }
    final newVitals = Map<String, dynamic>.from(state.vitals);
    newVitals[key] = value;
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
  void addMedicine(PrescriptionMedicine med) {
    // If med exists (by brand name?), update it? or allow duplicates?
    // Assuming unique brand name for simplicity or append.
    state = state.copyWith(medicines: [...state.medicines, med]);
  }

  void removeMedicine(int index) {
    if (index >= 0 && index < state.medicines.length) {
      final newMeds = List<PrescriptionMedicine>.from(state.medicines);
      newMeds.removeAt(index);
      state = state.copyWith(medicines: newMeds);
    }
  }

  void updateMedicine(int index, PrescriptionMedicine updatedMed) {
    if (index >= 0 && index < state.medicines.length) {
      final newMeds = List<PrescriptionMedicine>.from(state.medicines);
      newMeds[index] = updatedMed;
      state = state.copyWith(medicines: newMeds);
    }
  }

  // --- Labs ---
  void addLab(PrescriptionLab lab) {
    state = state.copyWith(labOrders: [...state.labOrders, lab]);
  }

  void removeLab(int index) {
    if (index >= 0 && index < state.labOrders.length) {
      final newLabs = List<PrescriptionLab>.from(state.labOrders);
      newLabs.removeAt(index);
      state = state.copyWith(labOrders: newLabs);
    }
  }

  // --- Advice ---
  void updateAdvice(String notes) {
    state = state.copyWith(adviceNotes: notes);
  }

  void updateNextVisit(String? dateIso) {
    state = state.copyWith(nextVisitDate: dateIso);
  }

  // --- Submit ---
  Future<bool> submit() async {
    state = state.copyWith(isSaving: true, error: null);
    try {
      final payload = {
        'vitals': state.vitals,
        'symptoms': state.symptoms, // List<String>
        'diagnosis': state.diagnosis, // List<String>
        'chief_complaint': state.chiefComplaint,
        'medicines': state.medicines.map((e) => e.toJson()).toList(),
        'lab_orders': state.labOrders.map((e) => e.toJson()).toList(),
        'advice': {
          'notes': state.adviceNotes,
          'next_visit_date': state.nextVisitDate,
        },
      };

      await _repo.submitPrescription(
        appointmentId: _appointmentId,
        payload: payload,
      );

      state = state.copyWith(isSaving: false);
      return true;
    } catch (e) {
      state = state.copyWith(isSaving: false, error: e.toString());
      return false;
    }
  }
}
