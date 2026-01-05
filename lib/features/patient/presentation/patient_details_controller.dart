import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../patient/data/patient_repository.dart';
import '../../patient/domain/patient_models.dart';
import '../../patient/domain/clinical_models.dart';

final patientDetailsControllerProvider = StateNotifierProvider.autoDispose
    .family<PatientDetailsController, AsyncValue<PatientDetail?>, String>((
      ref,
      patientId,
    ) {
      final repo = ref.watch(patientRepositoryProvider);
      return PatientDetailsController(repo, patientId);
    });

class PatientDetailsController
    extends StateNotifier<AsyncValue<PatientDetail?>> {
  final PatientRepository _repo;
  final String _patientId;

  PatientDetailsController(this._repo, this._patientId)
    : super(const AsyncValue.loading()) {
    loadDetails();
  }

  Future<void> loadDetails() async {
    try {
      final data = await _repo.getPatientHistory(_patientId);
      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final appointmentDetailsProvider = FutureProvider.autoDispose
    .family<AppointmentClinicalDetails?, String>((ref, appointmentId) async {
      final repo = ref.watch(patientRepositoryProvider);
      return repo.getAppointmentClinicalDetails(appointmentId);
    });

final invoicePrintDataProvider = FutureProvider.autoDispose
    .family<InvoicePrintData?, String>((ref, invoiceId) async {
      final repo = ref.watch(patientRepositoryProvider);
      return repo.getInvoicePrintData(invoiceId);
    });

final prescriptionPrintDataProvider = FutureProvider.autoDispose
    .family<PrescriptionPrintData?, String>((ref, appointmentId) async {
      final repo = ref.watch(patientRepositoryProvider);
      return repo.getPrescriptionPrintData(appointmentId);
    });

final appointmentTimelineProvider = FutureProvider.autoDispose
    .family<List<TimelineEvent>, String>((ref, appointmentId) async {
      final repo = ref.watch(patientRepositoryProvider);
      return repo.getAppointmentTimeline(appointmentId);
    });
