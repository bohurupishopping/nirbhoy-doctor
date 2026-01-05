// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../patient_controller.dart';
import '../../domain/patient_models.dart';

class RegistrationSheet extends ConsumerStatefulWidget {
  final Patient? patient;
  const RegistrationSheet({super.key, this.patient});

  @override
  ConsumerState<RegistrationSheet> createState() => _RegistrationSheetState();
}

class _RegistrationSheetState extends ConsumerState<RegistrationSheet> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _districtCtrl = TextEditingController();
  final _stateCtrl = TextEditingController();
  final _pincodeCtrl = TextEditingController();
  final _religionCtrl = TextEditingController();

  String _gender = 'Male';
  bool _isCritical = false;
  bool _isWheelchair = false;

  @override
  void initState() {
    super.initState();
    if (widget.patient != null) {
      final p = widget.patient!;
      _nameCtrl.text = p.fullName;
      _phoneCtrl.text = p.phone;
      _ageCtrl.text = p.age?.toString() ?? '';
      _addressCtrl.text = p.addressStreet ?? '';
      _districtCtrl.text = p.district ?? '';
      _stateCtrl.text = p.state ?? '';
      _pincodeCtrl.text = p.pincode ?? '';
      _religionCtrl.text = p.religion ?? '';
      _gender = p.gender ?? 'Male';
      _isCritical = p.flags?['critical'] == true;
      _isWheelchair = p.flags?['wheelchair'] == true;
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _ageCtrl.dispose();
    _addressCtrl.dispose();
    _districtCtrl.dispose();
    _stateCtrl.dispose();
    _pincodeCtrl.dispose();
    _religionCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final fullName = _nameCtrl.text.trim();
    final phone = _phoneCtrl.text.trim();
    final age = int.tryParse(_ageCtrl.text) ?? 0;
    final address = _addressCtrl.text.trim().isEmpty
        ? null
        : _addressCtrl.text.trim();
    final district = _districtCtrl.text.trim().isEmpty
        ? null
        : _districtCtrl.text.trim();
    final stateProvince = _stateCtrl.text.trim().isEmpty
        ? null
        : _stateCtrl.text.trim();
    final pincode = _pincodeCtrl.text.trim().isEmpty
        ? null
        : _pincodeCtrl.text.trim();
    final religion = _religionCtrl.text.trim().isEmpty
        ? null
        : _religionCtrl.text.trim();

    if (widget.patient != null) {
      await ref
          .read(registrationControllerProvider.notifier)
          .update(
            patientId: widget.patient!.id,
            fullName: fullName,
            phone: phone,
            age: age,
            gender: _gender,
            address: address,
            district: district,
            pincode: pincode,
            isWheelchair: _isWheelchair,
            isCritical: _isCritical,
          );
    } else {
      await ref
          .read(registrationControllerProvider.notifier)
          .register(
            fullName: fullName,
            phone: phone,
            age: age,
            gender: _gender,
            address: address,
            district: district,
            stateProvince: stateProvince,
            pincode: pincode,
            religion: religion,
            accessFlags: {'critical': _isCritical, 'wheelchair': _isWheelchair},
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<RegistrationState>(registrationControllerProvider, (prev, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
          ),
        );
      }
      if (next.isSuccess) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.patient != null
                  ? 'Patient Updated Successfully!'
                  : 'Patient Registered Successfully!',
              style: GoogleFonts.inter(fontWeight: FontWeight.w600),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color(0xFF10B981),
          ),
        );
        if (widget.patient == null) {
          ref
              .read(patientListControllerProvider.notifier)
              .loadPatients(isRefresh: true);
        }
      }
    });

    final isLoading = ref.watch(registrationControllerProvider).isLoading;

    return Container(
      padding: EdgeInsets.only(
        top: 32,
        left: 24,
        right: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.patient != null ? "Edit Patient" : "Register Patient",
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),

              _PillTextField(
                controller: _nameCtrl,
                hintText: 'Full Name',
                icon: Icons.person_rounded,
                validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _PillTextField(
                      controller: _phoneCtrl,
                      hintText: 'Phone',
                      icon: Icons.phone_rounded,
                      keyboardType: TextInputType.phone,
                      validator: (v) =>
                          (v == null || v.length < 10) ? 'Invalid' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: _PillTextField(
                      controller: _ageCtrl,
                      hintText: 'Age',
                      icon: Icons.calendar_today_rounded,
                      keyboardType: TextInputType.number,
                      validator: (v) => (v == null || v.isEmpty) ? 'Req' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['Male', 'Female', 'Other'].map((g) {
                  final isSelected = _gender == g;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _gender = g),
                      child: Container(
                        margin: EdgeInsets.only(right: g == 'Other' ? 0 : 8),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.black
                              : Colors.grey.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: isSelected
                                ? Colors.black
                                : Colors.black.withOpacity(0.05),
                          ),
                        ),
                        child: Text(
                          g,
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: isSelected ? Colors.white : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),

              _PillTextField(
                controller: _addressCtrl,
                hintText: 'Street Address',
                icon: Icons.location_on_rounded,
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _PillTextField(
                      controller: _districtCtrl,
                      hintText: 'District',
                      icon: Icons.map_rounded,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _PillTextField(
                      controller: _stateCtrl,
                      hintText: 'Province/State',
                      icon: Icons.public_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _PillTextField(
                      controller: _pincodeCtrl,
                      hintText: 'Pincode',
                      icon: Icons.pin_drop_rounded,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _PillTextField(
                      controller: _religionCtrl,
                      hintText: 'Religion',
                      icon: Icons.category_rounded,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: _FlagSwitch(
                      value: _isCritical,
                      label: 'Critical',
                      onChanged: (v) => setState(() => _isCritical = v),
                      activeColor: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _FlagSwitch(
                      value: _isWheelchair,
                      label: 'Wheelchair',
                      onChanged: (v) => setState(() => _isWheelchair = v),
                      activeColor: Colors.amber,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: isLoading ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF8A65),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        widget.patient != null
                            ? "Update Patient"
                            : "Register Patient",
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PillTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const _PillTextField({
    required this.controller,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          color: Colors.grey[400],
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(icon, color: Colors.grey[400], size: 20),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.05)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.05)),
        ),
        focusColor: Colors.black12,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      ),
    );
  }
}

class _FlagSwitch extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool> onChanged;
  final Color activeColor;

  const _FlagSwitch({
    required this.value,
    required this.label,
    required this.onChanged,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: value
              ? activeColor.withOpacity(0.05)
              : Colors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: value
                ? activeColor.withOpacity(0.2)
                : Colors.black.withOpacity(0.05),
          ),
        ),
        child: Row(
          children: [
            Icon(
              value ? Icons.check_circle_rounded : Icons.circle_outlined,
              size: 16,
              color: value ? activeColor : Colors.grey[400],
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: value ? activeColor : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
