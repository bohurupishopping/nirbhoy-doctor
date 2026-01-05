import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../domain/booking_models.dart';

final bookingRepositoryProvider = Provider<BookingRepository>((ref) {
  return BookingRepository(Supabase.instance.client);
});

class BookingRepository {
  final SupabaseClient _supabase;

  BookingRepository(this._supabase);

  // 1. Get Doctors
  Future<List<Doctor>> getDoctors({String? clinicId, String? search}) async {
    try {
      // Use get_booking_init_data as per booking_flow.md
      // Note: This RPC might return { doctors: [...] } or [...]
      // We will handle both cases.
      final response = await _supabase.rpc(
        'get_booking_init_data',
        params: {'_clinic_id': clinicId},
      );

      List<dynamic> data;
      if (response is Map && response.containsKey('doctors')) {
        data = response['doctors'] as List<dynamic>;
      } else if (response is List) {
        data = response;
      } else {
        data = [];
      }

      // Client-side search if RPC doesn't support it (get_booking_init_data usually doesn't)
      if (search != null && search.isNotEmpty) {
        data = data
            .where(
              (d) => d['full_name'].toString().toLowerCase().contains(
                search.toLowerCase(),
              ),
            )
            .toList();
      }

      return data.map((e) => Doctor.fromJson(e)).toList();
    } catch (e) {
      throw 'Fetch Doctors Error: $e';
    }
  }

  // 2. Get Available Slots (Server-Side Calculation Strategy)
  Future<List<TimeSlot>> getAvailableSlots({
    required String doctorId,
    required DateTime date,
  }) async {
    try {
      final dateStr = DateFormat('yyyy-MM-dd').format(date);

      final response = await _supabase.rpc(
        'get_available_slots',
        params: {'_doctor_id': doctorId, '_date': dateStr},
      );

      final List<dynamic> data = response as List<dynamic>;

      return data.map((json) {
        final timeStr = json['slot_time'] as String;
        final isAvailable = json['is_available'] as bool;
        final parts = timeStr.split(':');
        final startTime = DateTime(
          date.year,
          date.month,
          date.day,
          int.parse(parts[0]),
          int.parse(parts[1]),
        );
        // Assuming 15 min slots from RPC logic if not returned.
        // The RPC returns just start time.
        // Ideally RPC should return duration or end time, but client usually knows avg time.
        // For grid display, we usually just need start time.
        // Let's assume 15 mins for now to keep model consistent.
        return TimeSlot(
          startTime: startTime,
          endTime: startTime.add(const Duration(minutes: 15)),
          isAvailable: isAvailable,
        );
      }).toList();
    } catch (e) {
      throw 'Get Slots Error: $e';
    }
  }

  // 3. Book Appointment
  Future<BookingResult> bookAppointment({
    required String clinicId,
    required String patientId,
    required String doctorId,
    required DateTime startTime,
    required double consultFee,
  }) async {
    try {
      // Calls 'book_appointment_atomic' RPC
      final response = await _supabase.rpc(
        'book_appointment_atomic',
        params: {
          '_clinic_id': clinicId,
          '_patient_id': patientId,
          '_doctor_id': doctorId,
          '_slot_time': startTime.toIso8601String(),
          '_consult_fee': consultFee,
        },
      );

      return BookingResult.fromJson(response);
    } catch (e) {
      if (e.toString().contains('already booked')) {
        throw 'Slot already booked. Please choose another.';
      }
      throw 'Booking Error: $e';
    }
  }

  // 4. Process Payment
  Future<void> processPayment({
    required String invoiceId,
    required double amount,
    required String mode, // 'cash', 'upi'
    String? reference,
  }) async {
    try {
      await _supabase.rpc(
        'record_invoice_payment',
        params: {
          '_invoice_id': invoiceId,
          '_amount': amount,
          '_mode': mode,
          '_reference': reference,
          '_notes': 'Staff App Booking',
        },
      );
    } catch (e) {
      throw 'Payment Error: $e';
    }
  }

  // 5. Get Invoice Print Data
  Future<Map<String, dynamic>> getInvoicePrintData(String invoiceId) async {
    try {
      final response = await _supabase.rpc(
        'get_invoice_print_data',
        params: {'_invoice_id': invoiceId},
      );

      // RPC returns either a single object or a list with one object
      if (response is List && response.isNotEmpty) {
        return response[0] as Map<String, dynamic>;
      } else if (response is Map) {
        return response as Map<String, dynamic>;
      }
      return {};
    } catch (e) {
      throw 'Print Data Error: $e';
    }
  }
}
