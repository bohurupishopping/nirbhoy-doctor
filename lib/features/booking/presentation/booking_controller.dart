import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/presentation/auth_controller.dart';
import '../data/booking_repository.dart';
import '../domain/booking_models.dart';

// State
class BookingState {
  final int currentStep;
  final List<Doctor> doctors;
  final Doctor? selectedDoctor;
  final DateTime? selectedDate;
  final List<TimeSlot> availableSlots;
  final TimeSlot? selectedSlot;
  final bool isLoading;
  final String? error;
  final BookingResult? bookingResult;
  final bool isPaymentSuccess;
  final Map<String, dynamic>? printData;

  const BookingState({
    this.currentStep = 0,
    this.doctors = const [],
    this.selectedDoctor,
    this.selectedDate,
    this.availableSlots = const [],
    this.selectedSlot,
    this.isLoading = false,
    this.error,
    this.bookingResult,
    this.isPaymentSuccess = false,
    this.printData,
  });

  BookingState copyWith({
    int? currentStep,
    List<Doctor>? doctors,
    Doctor? selectedDoctor,
    DateTime? selectedDate,
    List<TimeSlot>? availableSlots,
    TimeSlot? selectedSlot,
    bool? isLoading,
    String? error,
    BookingResult? bookingResult,
    bool? isPaymentSuccess,
    Map<String, dynamic>? printData,
  }) {
    return BookingState(
      currentStep: currentStep ?? this.currentStep,
      doctors: doctors ?? this.doctors,
      selectedDoctor: selectedDoctor ?? this.selectedDoctor,
      selectedDate: selectedDate ?? this.selectedDate,
      availableSlots: availableSlots ?? this.availableSlots,
      selectedSlot: selectedSlot ?? this.selectedSlot,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      bookingResult: bookingResult ?? this.bookingResult,
      isPaymentSuccess: isPaymentSuccess ?? this.isPaymentSuccess,
      printData: printData ?? this.printData,
    );
  }
}

// Provider
final bookingControllerProvider =
    StateNotifierProvider.autoDispose<BookingController, BookingState>((ref) {
      final repo = ref.watch(bookingRepositoryProvider);
      final user = ref.watch(currentUserProvider);
      return BookingController(repo, user?.clinicId);
    });

// Controller
class BookingController extends StateNotifier<BookingState> {
  final BookingRepository _repo;
  final String? _clinicId;

  Timer? _debounce;

  BookingController(this._repo, this._clinicId) : super(const BookingState()) {
    loadDoctors();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      loadDoctors(search: query);
    });
  }

  // 1. Load Doctors
  Future<void> loadDoctors({String? search}) async {
    if (_clinicId == null) {
      return;
    }

    state = state.copyWith(isLoading: true, error: null);
    try {
      final docs = await _repo.getDoctors(clinicId: _clinicId, search: search);
      state = state.copyWith(doctors: docs, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // 2. Select Doctor
  void selectDoctor(Doctor doctor) {
    state = state.copyWith(
      selectedDoctor: doctor,
      currentStep: 1,
      selectedDate: DateTime.now(),
    );
    fetchSlots();
  }

  // 3. Date Selection
  void selectDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
    fetchSlots();
  }

  // 4. Fetch Slots
  Future<void> fetchSlots() async {
    if (_clinicId == null ||
        state.selectedDoctor == null ||
        state.selectedDate == null) {
      return;
    }

    state = state.copyWith(isLoading: true, error: null, availableSlots: []);
    try {
      final slots = await _repo.getAvailableSlots(
        doctorId: state.selectedDoctor!.id,
        date: state.selectedDate!,
      );
      state = state.copyWith(availableSlots: slots, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // 5. Select Slot
  void selectSlot(TimeSlot slot) {
    state = state.copyWith(selectedSlot: slot);
  }

  void proceedToReview() {
    if (state.selectedSlot != null) {
      state = state.copyWith(currentStep: 2);
    }
  }

  // 6. Confirm Booking
  Future<void> confirmBooking(String patientId) async {
    if (_clinicId == null ||
        state.selectedDoctor == null ||
        state.selectedSlot == null) {
      return;
    }

    state = state.copyWith(isLoading: true, error: null);
    try {
      final result = await _repo.bookAppointment(
        clinicId: _clinicId,
        patientId: patientId,
        doctorId: state.selectedDoctor!.id,
        startTime: state.selectedSlot!.startTime,
        consultFee: state.selectedDoctor!.consultationFee ?? 0,
      );

      state = state.copyWith(
        bookingResult: result,
        isLoading: false,
        currentStep: 3, // Move to Payment
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  // 7. Process Payment
  Future<void> processPayment(
    double amount,
    String mode, {
    String? reference,
  }) async {
    if (state.bookingResult == null) return;

    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repo.processPayment(
        invoiceId: state.bookingResult!.invoiceId,
        amount: amount,
        mode: mode,
        reference: reference,
      );

      // Fetch print data for success screen
      final printData = await _repo.getInvoicePrintData(
        state.bookingResult!.invoiceId,
      );

      state = state.copyWith(
        isPaymentSuccess: true,
        isLoading: false,
        printData: printData,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void goBack() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void goToStep(int step) {
    state = state.copyWith(currentStep: step);
  }
}
