import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/presentation/auth_controller.dart';
import '../../patient/data/patient_repository.dart';
import '../../patient/domain/patient_models.dart';

// State for List Page
class PatientListState {
  final List<Patient> patients;
  final bool isLoading;
  final String? error;
  final int page;
  final bool hasMore;
  final String searchQuery;

  const PatientListState({
    this.patients = const [],
    this.isLoading = false,
    this.error,
    this.page = 1,
    this.hasMore = true,
    this.searchQuery = '',
  });

  PatientListState copyWith({
    List<Patient>? patients,
    bool? isLoading,
    String? error,
    int? page,
    bool? hasMore,
    String? searchQuery,
  }) {
    return PatientListState(
      patients: patients ?? this.patients,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

// Registration State
class RegistrationState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  const RegistrationState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });
}

final registrationControllerProvider =
    StateNotifierProvider.autoDispose<
      RegistrationController,
      RegistrationState
    >((ref) {
      final repo = ref.watch(patientRepositoryProvider);
      final user = ref.watch(currentUserProvider);
      return RegistrationController(repo, user?.clinicId);
    });

class RegistrationController extends StateNotifier<RegistrationState> {
  final PatientRepository _repo;
  final String? _clinicId;

  RegistrationController(this._repo, this._clinicId)
    : super(const RegistrationState());

  Future<void> register({
    required String fullName,
    required String phone,
    required int age,
    required String gender,
    String? address,
    String? district,
    String? stateProvince,
    String? pincode,
    String? religion,
    Map<String, dynamic>? accessFlags,
  }) async {
    if (_clinicId == null) {
      state = const RegistrationState(error: 'No Clinic ID found');
      return;
    }

    state = const RegistrationState(isLoading: true);

    try {
      await _repo.registerPatient(
        clinicId: _clinicId,
        fullName: fullName,
        phone: phone,
        age: age,
        gender: gender,
        address: address,
        district: district,
        state: stateProvince,
        pincode: pincode,
        religion: religion,
        accessFlags: accessFlags,
      );

      state = const RegistrationState(isSuccess: true);
    } catch (e) {
      state = RegistrationState(isLoading: false, error: e.toString());
    }
  }

  Future<void> update({
    required String patientId,
    required String fullName,
    required String phone,
    required int age,
    required String gender,
    String? address,
    String? district,
    String? pincode,
    bool? isWheelchair,
    bool? isCritical,
  }) async {
    state = const RegistrationState(isLoading: true);

    try {
      await _repo.updatePatientDemographics(
        patientId: patientId,
        fullName: fullName,
        phone: phone,
        age: age,
        gender: gender,
        address: address,
        district: district,
        pincode: pincode,
        isWheelchair: isWheelchair,
        isCritical: isCritical,
      );

      state = const RegistrationState(isSuccess: true);
    } catch (e) {
      state = RegistrationState(isLoading: false, error: e.toString());
    }
  }
}

final patientListControllerProvider =
    StateNotifierProvider.autoDispose<PatientListController, PatientListState>((
      ref,
    ) {
      final repo = ref.watch(patientRepositoryProvider);
      final user = ref.watch(currentUserProvider);
      return PatientListController(repo, user?.clinicId);
    });

class PatientListController extends StateNotifier<PatientListState> {
  final PatientRepository _repo;
  final String? _clinicId;
  Timer? _debounce;

  PatientListController(this._repo, this._clinicId)
    : super(const PatientListState()) {
    if (_clinicId != null) {
      loadPatients();
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  // 1. Load Initial / Pagination
  Future<void> loadPatients({bool isRefresh = false}) async {
    if (_clinicId == null) return;
    if (state.isLoading) return;

    if (isRefresh) {
      state = state.copyWith(
        page: 1,
        patients: [],
        hasMore: true,
        isLoading: true,
        error: null,
      );
    } else {
      state = state.copyWith(isLoading: true, error: null);
    }

    try {
      // NOTE: Using 'getPatientsList' for paginated regular view
      // If search query is present, we might want to switch to 'searchPatients' OR use 'getPatientsList' with search param
      // The Plan says getPatientsList supports search. Ideally use that.

      final result = await _repo.getPatientsList(
        clinicId: _clinicId,
        page: state.page,
        search: state.searchQuery,
      );

      final newPatients = isRefresh
          ? result.data
          : [...state.patients, ...result.data];
      // Has more if we got a full page (assuming pageSize 10)
      final hasMore = result.data.length >= 10;

      state = state.copyWith(
        patients: newPatients,
        isLoading: false,
        page: state.page + 1,
        hasMore: hasMore,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // 2. Search (Debounced)
  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      state = state.copyWith(searchQuery: query);
      loadPatients(isRefresh: true);
    });
  }
}
