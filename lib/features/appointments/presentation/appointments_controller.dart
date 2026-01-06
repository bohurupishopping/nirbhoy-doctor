import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/domain/user_model.dart';
import '../../auth/presentation/auth_controller.dart';
import '../data/appointment_repository.dart';
import '../domain/appointment_models.dart';

class AppointmentsState {
  final List<AppointmentGridItem> appointments;
  final List<Doctor> doctors;
  final Doctor? selectedDoctor;
  final bool isLoading;
  final String? error;
  final DateTime selectedDate;

  const AppointmentsState({
    this.appointments = const [],
    this.doctors = const [],
    this.selectedDoctor,
    this.isLoading = false,
    this.error,
    required this.selectedDate,
  });

  AppointmentsState copyWith({
    List<AppointmentGridItem>? appointments,
    List<Doctor>? doctors,
    Doctor? Function()? selectedDoctor,
    bool? isLoading,
    String? error,
    DateTime? selectedDate,
  }) {
    return AppointmentsState(
      appointments: appointments ?? this.appointments,
      doctors: doctors ?? this.doctors,
      selectedDoctor: selectedDoctor != null
          ? selectedDoctor()
          : this.selectedDoctor,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }
}

final appointmentsControllerProvider =
    StateNotifierProvider.autoDispose<
      AppointmentsController,
      AppointmentsState
    >((ref) {
      final repo = ref.watch(appointmentRepositoryProvider);
      final user = ref.watch(currentUserProvider);
      return AppointmentsController(repo, user?.clinicId, user);
    });

class AppointmentsController extends StateNotifier<AppointmentsState> {
  final AppointmentRepository _repo;
  final String? _clinicId;
  final UserModel? _currentUser;

  AppointmentsController(this._repo, this._clinicId, this._currentUser)
    : super(AppointmentsState(selectedDate: DateTime.now())) {
    if (_clinicId != null) {
      loadAppointments();
    }
  }

  Future<void> loadAppointments({DateTime? date}) async {
    if (_clinicId == null) return;

    final targetDate = date ?? state.selectedDate;

    state = state.copyWith(
      isLoading: true,
      error: null,
      selectedDate: targetDate,
    );

    try {
      final doctors = await _repo.getDoctors(clinicId: _clinicId);
      final appointments = await _repo.getAppointments(targetDate);

      // Auto-select doctor if current user is a doctor
      Doctor? preselectedDoctor;
      if (_currentUser != null) {
        try {
          // Find matching doctor
          preselectedDoctor = doctors.firstWhere(
            (d) => d.id == _currentUser.id,
          );
        } catch (_) {
          // No match found
        }
      }

      state = state.copyWith(
        appointments: appointments,
        doctors: doctors,
        selectedDoctor: preselectedDoctor != null
            ? () => preselectedDoctor
            : null,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void selectDoctor(Doctor? doctor) {
    state = state.copyWith(selectedDoctor: () => doctor);
  }

  // Need a way to explicitly set null for selectedDoctor in copyWith

  Future<List<Doctor>> getDoctorsList() async {
    if (_clinicId == null) return [];
    return await _repo.getDoctors(clinicId: _clinicId);
  }

  Future<RescheduleResult?> rescheduleAppointment({
    required String appointmentId,
    required DateTime newStartTime,
    String? newDoctorId,
  }) async {
    if (_clinicId == null) return null;

    try {
      final result = await _repo.rescheduleAppointment(
        appointmentId: appointmentId,
        newStartTime: newStartTime,
        newDoctorId: newDoctorId,
      );

      if (result.success) {
        // Refresh grid
        loadAppointments();
      }

      return result;
    } catch (e) {
      // In case repository throws plain error
      return RescheduleResult(
        success: false,
        message: e.toString(),
        financialWarning: false,
      );
    }
  }

  Future<List<TimeSlot>> fetchSlotsForReschedule({
    required String doctorId,
    required DateTime date,
  }) async {
    try {
      return await _repo.getAvailableSlots(doctorId: doctorId, date: date);
    } catch (e) {
      // Return empty list or rethrow depending on UI needs.
      // Re-throwing allows UI to show error.
      rethrow;
    }
  }

  Future<String?> getAppointmentDoctorId(String appointmentId) async {
    return _repo.getAppointmentDoctorId(appointmentId);
  }
}
