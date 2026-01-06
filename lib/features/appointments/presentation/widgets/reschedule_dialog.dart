// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../domain/appointment_models.dart';
import '../appointments_controller.dart';

class RescheduleSheet extends ConsumerStatefulWidget {
  final AppointmentGridItem? appointment;
  final String? appointmentId;
  final String? patientName;
  final DateTime? currentSlot;

  const RescheduleSheet({
    super.key,
    this.appointment,
    this.appointmentId,
    this.patientName,
    this.currentSlot,
  }) : assert(
         appointment != null || (appointmentId != null && patientName != null),
         'Either appointment OR appointmentId+patientName must be provided',
       );

  @override
  ConsumerState<RescheduleSheet> createState() => _RescheduleSheetState();
}

class _RescheduleSheetState extends ConsumerState<RescheduleSheet> {
  DateTime? _selectedDate;
  TimeSlot? _selectedSlot;
  Doctor? _selectedDoctor;
  bool _isLoading = false;
  bool _isFetchingSlots = false;
  // bool _isInitializing = true; // To show loading while fetching doctorId
  List<Doctor> _doctors = [];
  List<TimeSlot> _availableSlots = [];
  String? _slotError;

  String get _apptId => widget.appointment?.id ?? widget.appointmentId!;
  String get _pName => widget.appointment?.patientName ?? widget.patientName!;
  DateTime? get _initialDate =>
      widget.appointment?.startTime ?? widget.currentSlot;

  @override
  void initState() {
    super.initState();
    _selectedDate = _initialDate;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData();
    });
  }

  Future<void> _initData() async {
    final controller = ref.read(appointmentsControllerProvider.notifier);
    final docs = await controller.getDoctorsList();

    if (!mounted) return;

    String? targetDoctorId = widget.appointment?.doctorId;

    targetDoctorId ??= await controller.getAppointmentDoctorId(_apptId);

    if (mounted) {
      setState(() {
        _doctors = docs;

        if (targetDoctorId != null) {
          try {
            _selectedDoctor = docs.firstWhere((d) => d.id == targetDoctorId);
          } catch (_) {}
        }
      });
      // Fetch slots for initial state
      if (_selectedDoctor != null && _selectedDate != null) {
        _fetchSlots();
      }
    }
  }

  Future<void> _fetchSlots() async {
    if (_selectedDoctor == null || _selectedDate == null) return;

    setState(() {
      _isFetchingSlots = true;
      _slotError = null;
      _availableSlots = [];
      _selectedSlot = null; // Reset slot on fetch
    });

    try {
      final controller = ref.read(appointmentsControllerProvider.notifier);
      final slots = await controller.fetchSlotsForReschedule(
        doctorId: _selectedDoctor!.id,
        date: _selectedDate!,
      );
      if (mounted) {
        setState(() {
          _availableSlots = slots;
          _isFetchingSlots = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _slotError = e.toString();
          _isFetchingSlots = false;
        });
      }
    }
  }

  Future<void> _handleSave() async {
    if (_selectedDate == null || _selectedSlot == null) return;

    setState(() => _isLoading = true);

    final controller = ref.read(appointmentsControllerProvider.notifier);
    final result = await controller.rescheduleAppointment(
      appointmentId: _apptId,
      newStartTime: _selectedSlot!.startTime,
      newDoctorId: _selectedDoctor?.id,
    );

    setState(() => _isLoading = false);

    if (mounted) {
      if (result != null && result.success) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              result.message +
                  (result.financialWarning ? ' (Check Fees!)' : ''),
              style: GoogleFonts.inter(fontWeight: FontWeight.w600),
            ),
            backgroundColor: result.financialWarning
                ? Colors.orange
                : const Color(0xFF10B981), // Emerald
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result?.message ?? 'Unknown Error'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFFFCF8),
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: EdgeInsets.only(
        top: 12,
        left: 24,
        right: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drag handle
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Header
            Text(
              'Reschedule Appointment',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'For $_pName',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: Colors.grey[500],
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 32),

            // Doctor Selection
            Text(
              'SPECIALIST',
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: Colors.grey[400],
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black.withOpacity(0.04)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Doctor>(
                  value: _selectedDoctor,
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey[600],
                  ),
                  dropdownColor: Colors.white,
                  hint: Text(
                    'Select Doctor',
                    style: GoogleFonts.inter(fontSize: 14),
                  ),
                  items: _doctors.map((d) {
                    return DropdownMenuItem(
                      value: d,
                      child: Text(
                        d.fullName,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedDoctor = val;
                      _availableSlots = [];
                      _selectedSlot = null;
                    });
                    _fetchSlots();
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Date Selection
            Text(
              'DATE',
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: Colors.grey[400],
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            _PickerTile(
              label: _selectedDate == null
                  ? 'Select Date'
                  : DateFormat('EEE, MMM d, yyyy').format(_selectedDate!),
              icon: Icons.calendar_today_rounded,
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          onSurface: Colors.black,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (picked != null) {
                  setState(() {
                    _selectedDate = picked;
                    _fetchSlots();
                  });
                }
              },
            ),
            const SizedBox(height: 24),

            // Slot Selection Grid
            if (_selectedDate != null && _selectedDoctor != null) ...[
              Text(
                'AVAILABLE SLOTS',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[400],
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 12),
              if (_isFetchingSlots)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              else if (_slotError != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Error: $_slotError',
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                )
              else if (_availableSlots.isEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'No slots available',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2.4,
                  ),
                  itemCount: _availableSlots.length,
                  itemBuilder: (context, index) {
                    final slot = _availableSlots[index];
                    final isActive =
                        _selectedSlot?.startTime.isAtSameMomentAs(
                          slot.startTime,
                        ) ??
                        false;

                    return InkWell(
                      onTap: slot.isAvailable
                          ? () => setState(() => _selectedSlot = slot)
                          : null,
                      borderRadius: BorderRadius.circular(8),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: isActive
                              ? Colors.black
                              : slot.isAvailable
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isActive
                                ? Colors.black
                                : slot.isAvailable
                                ? Colors.grey[200]!
                                : Colors.grey[200]!,
                          ),
                          boxShadow: isActive
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          DateFormat('hh:mm').format(slot.startTime),
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: isActive
                                ? FontWeight.w700
                                : FontWeight.w600,
                            color: isActive
                                ? Colors.white
                                : slot.isAvailable
                                ? Colors.black87
                                : Colors.grey[400],
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ],

            const SizedBox(height: 40),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: _isLoading ? null : () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: (_isLoading || _selectedSlot == null)
                        ? null
                        : _handleSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF8A65), // Warm orange
                      foregroundColor: Colors.white,
                      disabledBackgroundColor: Colors.grey[200],
                      disabledForegroundColor: Colors.grey[400],
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Confirm Reschedule',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PickerTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _PickerTile({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.grey[600]),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(Icons.unfold_more_rounded, size: 18, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}
