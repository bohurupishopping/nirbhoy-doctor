// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConsultationInitData _$ConsultationInitDataFromJson(Map<String, dynamic> json) {
  return _ConsultationInitData.fromJson(json);
}

/// @nodoc
mixin _$ConsultationInitData {
  AppointmentClinicalDetails get appointmentDetails =>
      throw _privateConstructorUsedError;
  PatientDetail get patient360 => throw _privateConstructorUsedError;

  /// Serializes this ConsultationInitData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsultationInitData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsultationInitDataCopyWith<ConsultationInitData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationInitDataCopyWith<$Res> {
  factory $ConsultationInitDataCopyWith(
    ConsultationInitData value,
    $Res Function(ConsultationInitData) then,
  ) = _$ConsultationInitDataCopyWithImpl<$Res, ConsultationInitData>;
  @useResult
  $Res call({
    AppointmentClinicalDetails appointmentDetails,
    PatientDetail patient360,
  });

  $AppointmentClinicalDetailsCopyWith<$Res> get appointmentDetails;
  $PatientDetailCopyWith<$Res> get patient360;
}

/// @nodoc
class _$ConsultationInitDataCopyWithImpl<
  $Res,
  $Val extends ConsultationInitData
>
    implements $ConsultationInitDataCopyWith<$Res> {
  _$ConsultationInitDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsultationInitData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? appointmentDetails = null, Object? patient360 = null}) {
    return _then(
      _value.copyWith(
            appointmentDetails: null == appointmentDetails
                ? _value.appointmentDetails
                : appointmentDetails // ignore: cast_nullable_to_non_nullable
                      as AppointmentClinicalDetails,
            patient360: null == patient360
                ? _value.patient360
                : patient360 // ignore: cast_nullable_to_non_nullable
                      as PatientDetail,
          )
          as $Val,
    );
  }

  /// Create a copy of ConsultationInitData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppointmentClinicalDetailsCopyWith<$Res> get appointmentDetails {
    return $AppointmentClinicalDetailsCopyWith<$Res>(
      _value.appointmentDetails,
      (value) {
        return _then(_value.copyWith(appointmentDetails: value) as $Val);
      },
    );
  }

  /// Create a copy of ConsultationInitData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PatientDetailCopyWith<$Res> get patient360 {
    return $PatientDetailCopyWith<$Res>(_value.patient360, (value) {
      return _then(_value.copyWith(patient360: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultationInitDataImplCopyWith<$Res>
    implements $ConsultationInitDataCopyWith<$Res> {
  factory _$$ConsultationInitDataImplCopyWith(
    _$ConsultationInitDataImpl value,
    $Res Function(_$ConsultationInitDataImpl) then,
  ) = __$$ConsultationInitDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    AppointmentClinicalDetails appointmentDetails,
    PatientDetail patient360,
  });

  @override
  $AppointmentClinicalDetailsCopyWith<$Res> get appointmentDetails;
  @override
  $PatientDetailCopyWith<$Res> get patient360;
}

/// @nodoc
class __$$ConsultationInitDataImplCopyWithImpl<$Res>
    extends _$ConsultationInitDataCopyWithImpl<$Res, _$ConsultationInitDataImpl>
    implements _$$ConsultationInitDataImplCopyWith<$Res> {
  __$$ConsultationInitDataImplCopyWithImpl(
    _$ConsultationInitDataImpl _value,
    $Res Function(_$ConsultationInitDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsultationInitData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? appointmentDetails = null, Object? patient360 = null}) {
    return _then(
      _$ConsultationInitDataImpl(
        appointmentDetails: null == appointmentDetails
            ? _value.appointmentDetails
            : appointmentDetails // ignore: cast_nullable_to_non_nullable
                  as AppointmentClinicalDetails,
        patient360: null == patient360
            ? _value.patient360
            : patient360 // ignore: cast_nullable_to_non_nullable
                  as PatientDetail,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultationInitDataImpl implements _ConsultationInitData {
  const _$ConsultationInitDataImpl({
    required this.appointmentDetails,
    required this.patient360,
  });

  factory _$ConsultationInitDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationInitDataImplFromJson(json);

  @override
  final AppointmentClinicalDetails appointmentDetails;
  @override
  final PatientDetail patient360;

  @override
  String toString() {
    return 'ConsultationInitData(appointmentDetails: $appointmentDetails, patient360: $patient360)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationInitDataImpl &&
            (identical(other.appointmentDetails, appointmentDetails) ||
                other.appointmentDetails == appointmentDetails) &&
            (identical(other.patient360, patient360) ||
                other.patient360 == patient360));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, appointmentDetails, patient360);

  /// Create a copy of ConsultationInitData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationInitDataImplCopyWith<_$ConsultationInitDataImpl>
  get copyWith =>
      __$$ConsultationInitDataImplCopyWithImpl<_$ConsultationInitDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationInitDataImplToJson(this);
  }
}

abstract class _ConsultationInitData implements ConsultationInitData {
  const factory _ConsultationInitData({
    required final AppointmentClinicalDetails appointmentDetails,
    required final PatientDetail patient360,
  }) = _$ConsultationInitDataImpl;

  factory _ConsultationInitData.fromJson(Map<String, dynamic> json) =
      _$ConsultationInitDataImpl.fromJson;

  @override
  AppointmentClinicalDetails get appointmentDetails;
  @override
  PatientDetail get patient360;

  /// Create a copy of ConsultationInitData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsultationInitDataImplCopyWith<_$ConsultationInitDataImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ConsultationState _$ConsultationStateFromJson(Map<String, dynamic> json) {
  return _ConsultationState.fromJson(json);
}

/// @nodoc
mixin _$ConsultationState {
  // Status
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError; // Core Data
  ConsultationInitData? get initData =>
      throw _privateConstructorUsedError; // Form Fields
  Map<String, dynamic> get vitals =>
      throw _privateConstructorUsedError; // {bp_sys: 120, temp: 98.6 ...}
  String get chiefComplaint => throw _privateConstructorUsedError;
  List<String> get symptoms => throw _privateConstructorUsedError;
  List<String> get diagnosis => throw _privateConstructorUsedError;
  List<PrescriptionMedicine> get medicines =>
      throw _privateConstructorUsedError;
  List<PrescriptionLab> get labOrders => throw _privateConstructorUsedError;
  String? get nextVisitDate =>
      throw _privateConstructorUsedError; // ISO Date String
  String? get adviceNotes => throw _privateConstructorUsedError;

  /// Serializes this ConsultationState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsultationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsultationStateCopyWith<ConsultationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationStateCopyWith<$Res> {
  factory $ConsultationStateCopyWith(
    ConsultationState value,
    $Res Function(ConsultationState) then,
  ) = _$ConsultationStateCopyWithImpl<$Res, ConsultationState>;
  @useResult
  $Res call({
    bool isLoading,
    bool isSaving,
    String? error,
    ConsultationInitData? initData,
    Map<String, dynamic> vitals,
    String chiefComplaint,
    List<String> symptoms,
    List<String> diagnosis,
    List<PrescriptionMedicine> medicines,
    List<PrescriptionLab> labOrders,
    String? nextVisitDate,
    String? adviceNotes,
  });

  $ConsultationInitDataCopyWith<$Res>? get initData;
}

/// @nodoc
class _$ConsultationStateCopyWithImpl<$Res, $Val extends ConsultationState>
    implements $ConsultationStateCopyWith<$Res> {
  _$ConsultationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsultationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? error = freezed,
    Object? initData = freezed,
    Object? vitals = null,
    Object? chiefComplaint = null,
    Object? symptoms = null,
    Object? diagnosis = null,
    Object? medicines = null,
    Object? labOrders = null,
    Object? nextVisitDate = freezed,
    Object? adviceNotes = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSaving: null == isSaving
                ? _value.isSaving
                : isSaving // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            initData: freezed == initData
                ? _value.initData
                : initData // ignore: cast_nullable_to_non_nullable
                      as ConsultationInitData?,
            vitals: null == vitals
                ? _value.vitals
                : vitals // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            chiefComplaint: null == chiefComplaint
                ? _value.chiefComplaint
                : chiefComplaint // ignore: cast_nullable_to_non_nullable
                      as String,
            symptoms: null == symptoms
                ? _value.symptoms
                : symptoms // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            diagnosis: null == diagnosis
                ? _value.diagnosis
                : diagnosis // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            medicines: null == medicines
                ? _value.medicines
                : medicines // ignore: cast_nullable_to_non_nullable
                      as List<PrescriptionMedicine>,
            labOrders: null == labOrders
                ? _value.labOrders
                : labOrders // ignore: cast_nullable_to_non_nullable
                      as List<PrescriptionLab>,
            nextVisitDate: freezed == nextVisitDate
                ? _value.nextVisitDate
                : nextVisitDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            adviceNotes: freezed == adviceNotes
                ? _value.adviceNotes
                : adviceNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ConsultationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConsultationInitDataCopyWith<$Res>? get initData {
    if (_value.initData == null) {
      return null;
    }

    return $ConsultationInitDataCopyWith<$Res>(_value.initData!, (value) {
      return _then(_value.copyWith(initData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultationStateImplCopyWith<$Res>
    implements $ConsultationStateCopyWith<$Res> {
  factory _$$ConsultationStateImplCopyWith(
    _$ConsultationStateImpl value,
    $Res Function(_$ConsultationStateImpl) then,
  ) = __$$ConsultationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    bool isSaving,
    String? error,
    ConsultationInitData? initData,
    Map<String, dynamic> vitals,
    String chiefComplaint,
    List<String> symptoms,
    List<String> diagnosis,
    List<PrescriptionMedicine> medicines,
    List<PrescriptionLab> labOrders,
    String? nextVisitDate,
    String? adviceNotes,
  });

  @override
  $ConsultationInitDataCopyWith<$Res>? get initData;
}

/// @nodoc
class __$$ConsultationStateImplCopyWithImpl<$Res>
    extends _$ConsultationStateCopyWithImpl<$Res, _$ConsultationStateImpl>
    implements _$$ConsultationStateImplCopyWith<$Res> {
  __$$ConsultationStateImplCopyWithImpl(
    _$ConsultationStateImpl _value,
    $Res Function(_$ConsultationStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsultationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? error = freezed,
    Object? initData = freezed,
    Object? vitals = null,
    Object? chiefComplaint = null,
    Object? symptoms = null,
    Object? diagnosis = null,
    Object? medicines = null,
    Object? labOrders = null,
    Object? nextVisitDate = freezed,
    Object? adviceNotes = freezed,
  }) {
    return _then(
      _$ConsultationStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSaving: null == isSaving
            ? _value.isSaving
            : isSaving // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        initData: freezed == initData
            ? _value.initData
            : initData // ignore: cast_nullable_to_non_nullable
                  as ConsultationInitData?,
        vitals: null == vitals
            ? _value._vitals
            : vitals // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        chiefComplaint: null == chiefComplaint
            ? _value.chiefComplaint
            : chiefComplaint // ignore: cast_nullable_to_non_nullable
                  as String,
        symptoms: null == symptoms
            ? _value._symptoms
            : symptoms // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        diagnosis: null == diagnosis
            ? _value._diagnosis
            : diagnosis // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        medicines: null == medicines
            ? _value._medicines
            : medicines // ignore: cast_nullable_to_non_nullable
                  as List<PrescriptionMedicine>,
        labOrders: null == labOrders
            ? _value._labOrders
            : labOrders // ignore: cast_nullable_to_non_nullable
                  as List<PrescriptionLab>,
        nextVisitDate: freezed == nextVisitDate
            ? _value.nextVisitDate
            : nextVisitDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        adviceNotes: freezed == adviceNotes
            ? _value.adviceNotes
            : adviceNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultationStateImpl implements _ConsultationState {
  const _$ConsultationStateImpl({
    this.isLoading = true,
    this.isSaving = false,
    this.error,
    this.initData,
    final Map<String, dynamic> vitals = const {},
    this.chiefComplaint = '',
    final List<String> symptoms = const [],
    final List<String> diagnosis = const [],
    final List<PrescriptionMedicine> medicines = const [],
    final List<PrescriptionLab> labOrders = const [],
    this.nextVisitDate,
    this.adviceNotes,
  }) : _vitals = vitals,
       _symptoms = symptoms,
       _diagnosis = diagnosis,
       _medicines = medicines,
       _labOrders = labOrders;

  factory _$ConsultationStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationStateImplFromJson(json);

  // Status
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  final String? error;
  // Core Data
  @override
  final ConsultationInitData? initData;
  // Form Fields
  final Map<String, dynamic> _vitals;
  // Form Fields
  @override
  @JsonKey()
  Map<String, dynamic> get vitals {
    if (_vitals is EqualUnmodifiableMapView) return _vitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_vitals);
  }

  // {bp_sys: 120, temp: 98.6 ...}
  @override
  @JsonKey()
  final String chiefComplaint;
  final List<String> _symptoms;
  @override
  @JsonKey()
  List<String> get symptoms {
    if (_symptoms is EqualUnmodifiableListView) return _symptoms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_symptoms);
  }

  final List<String> _diagnosis;
  @override
  @JsonKey()
  List<String> get diagnosis {
    if (_diagnosis is EqualUnmodifiableListView) return _diagnosis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diagnosis);
  }

  final List<PrescriptionMedicine> _medicines;
  @override
  @JsonKey()
  List<PrescriptionMedicine> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  final List<PrescriptionLab> _labOrders;
  @override
  @JsonKey()
  List<PrescriptionLab> get labOrders {
    if (_labOrders is EqualUnmodifiableListView) return _labOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labOrders);
  }

  @override
  final String? nextVisitDate;
  // ISO Date String
  @override
  final String? adviceNotes;

  @override
  String toString() {
    return 'ConsultationState(isLoading: $isLoading, isSaving: $isSaving, error: $error, initData: $initData, vitals: $vitals, chiefComplaint: $chiefComplaint, symptoms: $symptoms, diagnosis: $diagnosis, medicines: $medicines, labOrders: $labOrders, nextVisitDate: $nextVisitDate, adviceNotes: $adviceNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.initData, initData) ||
                other.initData == initData) &&
            const DeepCollectionEquality().equals(other._vitals, _vitals) &&
            (identical(other.chiefComplaint, chiefComplaint) ||
                other.chiefComplaint == chiefComplaint) &&
            const DeepCollectionEquality().equals(other._symptoms, _symptoms) &&
            const DeepCollectionEquality().equals(
              other._diagnosis,
              _diagnosis,
            ) &&
            const DeepCollectionEquality().equals(
              other._medicines,
              _medicines,
            ) &&
            const DeepCollectionEquality().equals(
              other._labOrders,
              _labOrders,
            ) &&
            (identical(other.nextVisitDate, nextVisitDate) ||
                other.nextVisitDate == nextVisitDate) &&
            (identical(other.adviceNotes, adviceNotes) ||
                other.adviceNotes == adviceNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    isSaving,
    error,
    initData,
    const DeepCollectionEquality().hash(_vitals),
    chiefComplaint,
    const DeepCollectionEquality().hash(_symptoms),
    const DeepCollectionEquality().hash(_diagnosis),
    const DeepCollectionEquality().hash(_medicines),
    const DeepCollectionEquality().hash(_labOrders),
    nextVisitDate,
    adviceNotes,
  );

  /// Create a copy of ConsultationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationStateImplCopyWith<_$ConsultationStateImpl> get copyWith =>
      __$$ConsultationStateImplCopyWithImpl<_$ConsultationStateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationStateImplToJson(this);
  }
}

abstract class _ConsultationState implements ConsultationState {
  const factory _ConsultationState({
    final bool isLoading,
    final bool isSaving,
    final String? error,
    final ConsultationInitData? initData,
    final Map<String, dynamic> vitals,
    final String chiefComplaint,
    final List<String> symptoms,
    final List<String> diagnosis,
    final List<PrescriptionMedicine> medicines,
    final List<PrescriptionLab> labOrders,
    final String? nextVisitDate,
    final String? adviceNotes,
  }) = _$ConsultationStateImpl;

  factory _ConsultationState.fromJson(Map<String, dynamic> json) =
      _$ConsultationStateImpl.fromJson;

  // Status
  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  String? get error; // Core Data
  @override
  ConsultationInitData? get initData; // Form Fields
  @override
  Map<String, dynamic> get vitals; // {bp_sys: 120, temp: 98.6 ...}
  @override
  String get chiefComplaint;
  @override
  List<String> get symptoms;
  @override
  List<String> get diagnosis;
  @override
  List<PrescriptionMedicine> get medicines;
  @override
  List<PrescriptionLab> get labOrders;
  @override
  String? get nextVisitDate; // ISO Date String
  @override
  String? get adviceNotes;

  /// Create a copy of ConsultationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsultationStateImplCopyWith<_$ConsultationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MedicineMaster _$MedicineMasterFromJson(Map<String, dynamic> json) {
  return _MedicineMaster.fromJson(json);
}

/// @nodoc
mixin _$MedicineMaster {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_name')
  String? get brandName => throw _privateConstructorUsedError;
  @JsonKey(name: 'generic_name')
  String? get genericName => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get strength => throw _privateConstructorUsedError;
  @JsonKey(name: 'dosage_form')
  String? get dosageForm => throw _privateConstructorUsedError;

  /// Serializes this MedicineMaster to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicineMaster
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicineMasterCopyWith<MedicineMaster> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicineMasterCopyWith<$Res> {
  factory $MedicineMasterCopyWith(
    MedicineMaster value,
    $Res Function(MedicineMaster) then,
  ) = _$MedicineMasterCopyWithImpl<$Res, MedicineMaster>;
  @useResult
  $Res call({
    String id,
    String name,
    @JsonKey(name: 'brand_name') String? brandName,
    @JsonKey(name: 'generic_name') String? genericName,
    String? type,
    String? strength,
    @JsonKey(name: 'dosage_form') String? dosageForm,
  });
}

/// @nodoc
class _$MedicineMasterCopyWithImpl<$Res, $Val extends MedicineMaster>
    implements $MedicineMasterCopyWith<$Res> {
  _$MedicineMasterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicineMaster
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brandName = freezed,
    Object? genericName = freezed,
    Object? type = freezed,
    Object? strength = freezed,
    Object? dosageForm = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            brandName: freezed == brandName
                ? _value.brandName
                : brandName // ignore: cast_nullable_to_non_nullable
                      as String?,
            genericName: freezed == genericName
                ? _value.genericName
                : genericName // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            strength: freezed == strength
                ? _value.strength
                : strength // ignore: cast_nullable_to_non_nullable
                      as String?,
            dosageForm: freezed == dosageForm
                ? _value.dosageForm
                : dosageForm // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MedicineMasterImplCopyWith<$Res>
    implements $MedicineMasterCopyWith<$Res> {
  factory _$$MedicineMasterImplCopyWith(
    _$MedicineMasterImpl value,
    $Res Function(_$MedicineMasterImpl) then,
  ) = __$$MedicineMasterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    @JsonKey(name: 'brand_name') String? brandName,
    @JsonKey(name: 'generic_name') String? genericName,
    String? type,
    String? strength,
    @JsonKey(name: 'dosage_form') String? dosageForm,
  });
}

/// @nodoc
class __$$MedicineMasterImplCopyWithImpl<$Res>
    extends _$MedicineMasterCopyWithImpl<$Res, _$MedicineMasterImpl>
    implements _$$MedicineMasterImplCopyWith<$Res> {
  __$$MedicineMasterImplCopyWithImpl(
    _$MedicineMasterImpl _value,
    $Res Function(_$MedicineMasterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineMaster
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? brandName = freezed,
    Object? genericName = freezed,
    Object? type = freezed,
    Object? strength = freezed,
    Object? dosageForm = freezed,
  }) {
    return _then(
      _$MedicineMasterImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        brandName: freezed == brandName
            ? _value.brandName
            : brandName // ignore: cast_nullable_to_non_nullable
                  as String?,
        genericName: freezed == genericName
            ? _value.genericName
            : genericName // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        strength: freezed == strength
            ? _value.strength
            : strength // ignore: cast_nullable_to_non_nullable
                  as String?,
        dosageForm: freezed == dosageForm
            ? _value.dosageForm
            : dosageForm // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicineMasterImpl implements _MedicineMaster {
  const _$MedicineMasterImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'brand_name') this.brandName,
    @JsonKey(name: 'generic_name') this.genericName,
    this.type,
    this.strength,
    @JsonKey(name: 'dosage_form') this.dosageForm,
  });

  factory _$MedicineMasterImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicineMasterImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'brand_name')
  final String? brandName;
  @override
  @JsonKey(name: 'generic_name')
  final String? genericName;
  @override
  final String? type;
  @override
  final String? strength;
  @override
  @JsonKey(name: 'dosage_form')
  final String? dosageForm;

  @override
  String toString() {
    return 'MedicineMaster(id: $id, name: $name, brandName: $brandName, genericName: $genericName, type: $type, strength: $strength, dosageForm: $dosageForm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineMasterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.genericName, genericName) ||
                other.genericName == genericName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.strength, strength) ||
                other.strength == strength) &&
            (identical(other.dosageForm, dosageForm) ||
                other.dosageForm == dosageForm));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    brandName,
    genericName,
    type,
    strength,
    dosageForm,
  );

  /// Create a copy of MedicineMaster
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineMasterImplCopyWith<_$MedicineMasterImpl> get copyWith =>
      __$$MedicineMasterImplCopyWithImpl<_$MedicineMasterImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicineMasterImplToJson(this);
  }
}

abstract class _MedicineMaster implements MedicineMaster {
  const factory _MedicineMaster({
    required final String id,
    required final String name,
    @JsonKey(name: 'brand_name') final String? brandName,
    @JsonKey(name: 'generic_name') final String? genericName,
    final String? type,
    final String? strength,
    @JsonKey(name: 'dosage_form') final String? dosageForm,
  }) = _$MedicineMasterImpl;

  factory _MedicineMaster.fromJson(Map<String, dynamic> json) =
      _$MedicineMasterImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'brand_name')
  String? get brandName;
  @override
  @JsonKey(name: 'generic_name')
  String? get genericName;
  @override
  String? get type;
  @override
  String? get strength;
  @override
  @JsonKey(name: 'dosage_form')
  String? get dosageForm;

  /// Create a copy of MedicineMaster
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicineMasterImplCopyWith<_$MedicineMasterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
