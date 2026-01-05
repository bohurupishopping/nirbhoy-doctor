// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clinical_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppointmentClinicalDetails _$AppointmentClinicalDetailsFromJson(
  Map<String, dynamic> json,
) {
  return _AppointmentClinicalDetails.fromJson(json);
}

/// @nodoc
mixin _$AppointmentClinicalDetails {
  ClinicalPatientInfo get patient => throw _privateConstructorUsedError;
  ClinicalMeta get meta => throw _privateConstructorUsedError;
  ClinicalConsultation? get consultation => throw _privateConstructorUsedError;
  List<ClinicalMedicine> get medicines => throw _privateConstructorUsedError;
  List<ClinicalLab> get labs => throw _privateConstructorUsedError;

  /// Serializes this AppointmentClinicalDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentClinicalDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentClinicalDetailsCopyWith<AppointmentClinicalDetails>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentClinicalDetailsCopyWith<$Res> {
  factory $AppointmentClinicalDetailsCopyWith(
    AppointmentClinicalDetails value,
    $Res Function(AppointmentClinicalDetails) then,
  ) =
      _$AppointmentClinicalDetailsCopyWithImpl<
        $Res,
        AppointmentClinicalDetails
      >;
  @useResult
  $Res call({
    ClinicalPatientInfo patient,
    ClinicalMeta meta,
    ClinicalConsultation? consultation,
    List<ClinicalMedicine> medicines,
    List<ClinicalLab> labs,
  });

  $ClinicalPatientInfoCopyWith<$Res> get patient;
  $ClinicalMetaCopyWith<$Res> get meta;
  $ClinicalConsultationCopyWith<$Res>? get consultation;
}

/// @nodoc
class _$AppointmentClinicalDetailsCopyWithImpl<
  $Res,
  $Val extends AppointmentClinicalDetails
>
    implements $AppointmentClinicalDetailsCopyWith<$Res> {
  _$AppointmentClinicalDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentClinicalDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = null,
    Object? meta = null,
    Object? consultation = freezed,
    Object? medicines = null,
    Object? labs = null,
  }) {
    return _then(
      _value.copyWith(
            patient: null == patient
                ? _value.patient
                : patient // ignore: cast_nullable_to_non_nullable
                      as ClinicalPatientInfo,
            meta: null == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as ClinicalMeta,
            consultation: freezed == consultation
                ? _value.consultation
                : consultation // ignore: cast_nullable_to_non_nullable
                      as ClinicalConsultation?,
            medicines: null == medicines
                ? _value.medicines
                : medicines // ignore: cast_nullable_to_non_nullable
                      as List<ClinicalMedicine>,
            labs: null == labs
                ? _value.labs
                : labs // ignore: cast_nullable_to_non_nullable
                      as List<ClinicalLab>,
          )
          as $Val,
    );
  }

  /// Create a copy of AppointmentClinicalDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClinicalPatientInfoCopyWith<$Res> get patient {
    return $ClinicalPatientInfoCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }

  /// Create a copy of AppointmentClinicalDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClinicalMetaCopyWith<$Res> get meta {
    return $ClinicalMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of AppointmentClinicalDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClinicalConsultationCopyWith<$Res>? get consultation {
    if (_value.consultation == null) {
      return null;
    }

    return $ClinicalConsultationCopyWith<$Res>(_value.consultation!, (value) {
      return _then(_value.copyWith(consultation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppointmentClinicalDetailsImplCopyWith<$Res>
    implements $AppointmentClinicalDetailsCopyWith<$Res> {
  factory _$$AppointmentClinicalDetailsImplCopyWith(
    _$AppointmentClinicalDetailsImpl value,
    $Res Function(_$AppointmentClinicalDetailsImpl) then,
  ) = __$$AppointmentClinicalDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ClinicalPatientInfo patient,
    ClinicalMeta meta,
    ClinicalConsultation? consultation,
    List<ClinicalMedicine> medicines,
    List<ClinicalLab> labs,
  });

  @override
  $ClinicalPatientInfoCopyWith<$Res> get patient;
  @override
  $ClinicalMetaCopyWith<$Res> get meta;
  @override
  $ClinicalConsultationCopyWith<$Res>? get consultation;
}

/// @nodoc
class __$$AppointmentClinicalDetailsImplCopyWithImpl<$Res>
    extends
        _$AppointmentClinicalDetailsCopyWithImpl<
          $Res,
          _$AppointmentClinicalDetailsImpl
        >
    implements _$$AppointmentClinicalDetailsImplCopyWith<$Res> {
  __$$AppointmentClinicalDetailsImplCopyWithImpl(
    _$AppointmentClinicalDetailsImpl _value,
    $Res Function(_$AppointmentClinicalDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentClinicalDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = null,
    Object? meta = null,
    Object? consultation = freezed,
    Object? medicines = null,
    Object? labs = null,
  }) {
    return _then(
      _$AppointmentClinicalDetailsImpl(
        patient: null == patient
            ? _value.patient
            : patient // ignore: cast_nullable_to_non_nullable
                  as ClinicalPatientInfo,
        meta: null == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as ClinicalMeta,
        consultation: freezed == consultation
            ? _value.consultation
            : consultation // ignore: cast_nullable_to_non_nullable
                  as ClinicalConsultation?,
        medicines: null == medicines
            ? _value._medicines
            : medicines // ignore: cast_nullable_to_non_nullable
                  as List<ClinicalMedicine>,
        labs: null == labs
            ? _value._labs
            : labs // ignore: cast_nullable_to_non_nullable
                  as List<ClinicalLab>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppointmentClinicalDetailsImpl implements _AppointmentClinicalDetails {
  const _$AppointmentClinicalDetailsImpl({
    required this.patient,
    required this.meta,
    this.consultation,
    final List<ClinicalMedicine> medicines = const [],
    final List<ClinicalLab> labs = const [],
  }) : _medicines = medicines,
       _labs = labs;

  factory _$AppointmentClinicalDetailsImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$AppointmentClinicalDetailsImplFromJson(json);

  @override
  final ClinicalPatientInfo patient;
  @override
  final ClinicalMeta meta;
  @override
  final ClinicalConsultation? consultation;
  final List<ClinicalMedicine> _medicines;
  @override
  @JsonKey()
  List<ClinicalMedicine> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  final List<ClinicalLab> _labs;
  @override
  @JsonKey()
  List<ClinicalLab> get labs {
    if (_labs is EqualUnmodifiableListView) return _labs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labs);
  }

  @override
  String toString() {
    return 'AppointmentClinicalDetails(patient: $patient, meta: $meta, consultation: $consultation, medicines: $medicines, labs: $labs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentClinicalDetailsImpl &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.consultation, consultation) ||
                other.consultation == consultation) &&
            const DeepCollectionEquality().equals(
              other._medicines,
              _medicines,
            ) &&
            const DeepCollectionEquality().equals(other._labs, _labs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    patient,
    meta,
    consultation,
    const DeepCollectionEquality().hash(_medicines),
    const DeepCollectionEquality().hash(_labs),
  );

  /// Create a copy of AppointmentClinicalDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentClinicalDetailsImplCopyWith<_$AppointmentClinicalDetailsImpl>
  get copyWith =>
      __$$AppointmentClinicalDetailsImplCopyWithImpl<
        _$AppointmentClinicalDetailsImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentClinicalDetailsImplToJson(this);
  }
}

abstract class _AppointmentClinicalDetails
    implements AppointmentClinicalDetails {
  const factory _AppointmentClinicalDetails({
    required final ClinicalPatientInfo patient,
    required final ClinicalMeta meta,
    final ClinicalConsultation? consultation,
    final List<ClinicalMedicine> medicines,
    final List<ClinicalLab> labs,
  }) = _$AppointmentClinicalDetailsImpl;

  factory _AppointmentClinicalDetails.fromJson(Map<String, dynamic> json) =
      _$AppointmentClinicalDetailsImpl.fromJson;

  @override
  ClinicalPatientInfo get patient;
  @override
  ClinicalMeta get meta;
  @override
  ClinicalConsultation? get consultation;
  @override
  List<ClinicalMedicine> get medicines;
  @override
  List<ClinicalLab> get labs;

  /// Create a copy of AppointmentClinicalDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentClinicalDetailsImplCopyWith<_$AppointmentClinicalDetailsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ClinicalPatientInfo _$ClinicalPatientInfoFromJson(Map<String, dynamic> json) {
  return _ClinicalPatientInfo.fromJson(json);
}

/// @nodoc
mixin _$ClinicalPatientInfo {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get uhid => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  Map<String, dynamic>? get flags => throw _privateConstructorUsedError;

  /// Serializes this ClinicalPatientInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicalPatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicalPatientInfoCopyWith<ClinicalPatientInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicalPatientInfoCopyWith<$Res> {
  factory $ClinicalPatientInfoCopyWith(
    ClinicalPatientInfo value,
    $Res Function(ClinicalPatientInfo) then,
  ) = _$ClinicalPatientInfoCopyWithImpl<$Res, ClinicalPatientInfo>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'full_name') String fullName,
    int? age,
    String? gender,
    String? uhid,
    String? phone,
    Map<String, dynamic>? flags,
  });
}

/// @nodoc
class _$ClinicalPatientInfoCopyWithImpl<$Res, $Val extends ClinicalPatientInfo>
    implements $ClinicalPatientInfoCopyWith<$Res> {
  _$ClinicalPatientInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicalPatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? age = freezed,
    Object? gender = freezed,
    Object? uhid = freezed,
    Object? phone = freezed,
    Object? flags = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            fullName: null == fullName
                ? _value.fullName
                : fullName // ignore: cast_nullable_to_non_nullable
                      as String,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            uhid: freezed == uhid
                ? _value.uhid
                : uhid // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            flags: freezed == flags
                ? _value.flags
                : flags // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClinicalPatientInfoImplCopyWith<$Res>
    implements $ClinicalPatientInfoCopyWith<$Res> {
  factory _$$ClinicalPatientInfoImplCopyWith(
    _$ClinicalPatientInfoImpl value,
    $Res Function(_$ClinicalPatientInfoImpl) then,
  ) = __$$ClinicalPatientInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'full_name') String fullName,
    int? age,
    String? gender,
    String? uhid,
    String? phone,
    Map<String, dynamic>? flags,
  });
}

/// @nodoc
class __$$ClinicalPatientInfoImplCopyWithImpl<$Res>
    extends _$ClinicalPatientInfoCopyWithImpl<$Res, _$ClinicalPatientInfoImpl>
    implements _$$ClinicalPatientInfoImplCopyWith<$Res> {
  __$$ClinicalPatientInfoImplCopyWithImpl(
    _$ClinicalPatientInfoImpl _value,
    $Res Function(_$ClinicalPatientInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicalPatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? age = freezed,
    Object? gender = freezed,
    Object? uhid = freezed,
    Object? phone = freezed,
    Object? flags = freezed,
  }) {
    return _then(
      _$ClinicalPatientInfoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        uhid: freezed == uhid
            ? _value.uhid
            : uhid // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        flags: freezed == flags
            ? _value._flags
            : flags // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicalPatientInfoImpl implements _ClinicalPatientInfo {
  const _$ClinicalPatientInfoImpl({
    required this.id,
    @JsonKey(name: 'full_name') required this.fullName,
    this.age,
    this.gender,
    this.uhid,
    this.phone,
    final Map<String, dynamic>? flags,
  }) : _flags = flags;

  factory _$ClinicalPatientInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicalPatientInfoImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final int? age;
  @override
  final String? gender;
  @override
  final String? uhid;
  @override
  final String? phone;
  final Map<String, dynamic>? _flags;
  @override
  Map<String, dynamic>? get flags {
    final value = _flags;
    if (value == null) return null;
    if (_flags is EqualUnmodifiableMapView) return _flags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ClinicalPatientInfo(id: $id, fullName: $fullName, age: $age, gender: $gender, uhid: $uhid, phone: $phone, flags: $flags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicalPatientInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.uhid, uhid) || other.uhid == uhid) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other._flags, _flags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    fullName,
    age,
    gender,
    uhid,
    phone,
    const DeepCollectionEquality().hash(_flags),
  );

  /// Create a copy of ClinicalPatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicalPatientInfoImplCopyWith<_$ClinicalPatientInfoImpl> get copyWith =>
      __$$ClinicalPatientInfoImplCopyWithImpl<_$ClinicalPatientInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicalPatientInfoImplToJson(this);
  }
}

abstract class _ClinicalPatientInfo implements ClinicalPatientInfo {
  const factory _ClinicalPatientInfo({
    required final String id,
    @JsonKey(name: 'full_name') required final String fullName,
    final int? age,
    final String? gender,
    final String? uhid,
    final String? phone,
    final Map<String, dynamic>? flags,
  }) = _$ClinicalPatientInfoImpl;

  factory _ClinicalPatientInfo.fromJson(Map<String, dynamic> json) =
      _$ClinicalPatientInfoImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  int? get age;
  @override
  String? get gender;
  @override
  String? get uhid;
  @override
  String? get phone;
  @override
  Map<String, dynamic>? get flags;

  /// Create a copy of ClinicalPatientInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicalPatientInfoImplCopyWith<_$ClinicalPatientInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicalMeta _$ClinicalMetaFromJson(Map<String, dynamic> json) {
  return _ClinicalMeta.fromJson(json);
}

/// @nodoc
mixin _$ClinicalMeta {
  @JsonKey(name: 'appointment_id')
  String get appointmentId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_name')
  String? get doctorName => throw _privateConstructorUsedError;
  String? get specialty => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_number')
  int? get tokenNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_id')
  String? get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_number')
  String? get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String? get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  num? get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_paid')
  num? get amountPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance_due')
  num? get balanceDue => throw _privateConstructorUsedError;

  /// Serializes this ClinicalMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicalMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicalMetaCopyWith<ClinicalMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicalMetaCopyWith<$Res> {
  factory $ClinicalMetaCopyWith(
    ClinicalMeta value,
    $Res Function(ClinicalMeta) then,
  ) = _$ClinicalMetaCopyWithImpl<$Res, ClinicalMeta>;
  @useResult
  $Res call({
    @JsonKey(name: 'appointment_id') String appointmentId,
    String date,
    String status,
    @JsonKey(name: 'doctor_name') String? doctorName,
    String? specialty,
    @JsonKey(name: 'token_number') int? tokenNumber,
    @JsonKey(name: 'invoice_id') String? invoiceId,
    @JsonKey(name: 'invoice_number') String? invoiceNumber,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'total_amount') num? totalAmount,
    @JsonKey(name: 'amount_paid') num? amountPaid,
    @JsonKey(name: 'balance_due') num? balanceDue,
  });
}

/// @nodoc
class _$ClinicalMetaCopyWithImpl<$Res, $Val extends ClinicalMeta>
    implements $ClinicalMetaCopyWith<$Res> {
  _$ClinicalMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicalMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? date = null,
    Object? status = null,
    Object? doctorName = freezed,
    Object? specialty = freezed,
    Object? tokenNumber = freezed,
    Object? invoiceId = freezed,
    Object? invoiceNumber = freezed,
    Object? paymentStatus = freezed,
    Object? totalAmount = freezed,
    Object? amountPaid = freezed,
    Object? balanceDue = freezed,
  }) {
    return _then(
      _value.copyWith(
            appointmentId: null == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorName: freezed == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String?,
            specialty: freezed == specialty
                ? _value.specialty
                : specialty // ignore: cast_nullable_to_non_nullable
                      as String?,
            tokenNumber: freezed == tokenNumber
                ? _value.tokenNumber
                : tokenNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
            invoiceId: freezed == invoiceId
                ? _value.invoiceId
                : invoiceId // ignore: cast_nullable_to_non_nullable
                      as String?,
            invoiceNumber: freezed == invoiceNumber
                ? _value.invoiceNumber
                : invoiceNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentStatus: freezed == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalAmount: freezed == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                      as num?,
            amountPaid: freezed == amountPaid
                ? _value.amountPaid
                : amountPaid // ignore: cast_nullable_to_non_nullable
                      as num?,
            balanceDue: freezed == balanceDue
                ? _value.balanceDue
                : balanceDue // ignore: cast_nullable_to_non_nullable
                      as num?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClinicalMetaImplCopyWith<$Res>
    implements $ClinicalMetaCopyWith<$Res> {
  factory _$$ClinicalMetaImplCopyWith(
    _$ClinicalMetaImpl value,
    $Res Function(_$ClinicalMetaImpl) then,
  ) = __$$ClinicalMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'appointment_id') String appointmentId,
    String date,
    String status,
    @JsonKey(name: 'doctor_name') String? doctorName,
    String? specialty,
    @JsonKey(name: 'token_number') int? tokenNumber,
    @JsonKey(name: 'invoice_id') String? invoiceId,
    @JsonKey(name: 'invoice_number') String? invoiceNumber,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'total_amount') num? totalAmount,
    @JsonKey(name: 'amount_paid') num? amountPaid,
    @JsonKey(name: 'balance_due') num? balanceDue,
  });
}

/// @nodoc
class __$$ClinicalMetaImplCopyWithImpl<$Res>
    extends _$ClinicalMetaCopyWithImpl<$Res, _$ClinicalMetaImpl>
    implements _$$ClinicalMetaImplCopyWith<$Res> {
  __$$ClinicalMetaImplCopyWithImpl(
    _$ClinicalMetaImpl _value,
    $Res Function(_$ClinicalMetaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicalMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? date = null,
    Object? status = null,
    Object? doctorName = freezed,
    Object? specialty = freezed,
    Object? tokenNumber = freezed,
    Object? invoiceId = freezed,
    Object? invoiceNumber = freezed,
    Object? paymentStatus = freezed,
    Object? totalAmount = freezed,
    Object? amountPaid = freezed,
    Object? balanceDue = freezed,
  }) {
    return _then(
      _$ClinicalMetaImpl(
        appointmentId: null == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorName: freezed == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        specialty: freezed == specialty
            ? _value.specialty
            : specialty // ignore: cast_nullable_to_non_nullable
                  as String?,
        tokenNumber: freezed == tokenNumber
            ? _value.tokenNumber
            : tokenNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
        invoiceId: freezed == invoiceId
            ? _value.invoiceId
            : invoiceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        invoiceNumber: freezed == invoiceNumber
            ? _value.invoiceNumber
            : invoiceNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentStatus: freezed == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalAmount: freezed == totalAmount
            ? _value.totalAmount
            : totalAmount // ignore: cast_nullable_to_non_nullable
                  as num?,
        amountPaid: freezed == amountPaid
            ? _value.amountPaid
            : amountPaid // ignore: cast_nullable_to_non_nullable
                  as num?,
        balanceDue: freezed == balanceDue
            ? _value.balanceDue
            : balanceDue // ignore: cast_nullable_to_non_nullable
                  as num?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicalMetaImpl implements _ClinicalMeta {
  const _$ClinicalMetaImpl({
    @JsonKey(name: 'appointment_id') required this.appointmentId,
    required this.date,
    required this.status,
    @JsonKey(name: 'doctor_name') this.doctorName,
    this.specialty,
    @JsonKey(name: 'token_number') this.tokenNumber,
    @JsonKey(name: 'invoice_id') this.invoiceId,
    @JsonKey(name: 'invoice_number') this.invoiceNumber,
    @JsonKey(name: 'payment_status') this.paymentStatus,
    @JsonKey(name: 'total_amount') this.totalAmount,
    @JsonKey(name: 'amount_paid') this.amountPaid,
    @JsonKey(name: 'balance_due') this.balanceDue,
  });

  factory _$ClinicalMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicalMetaImplFromJson(json);

  @override
  @JsonKey(name: 'appointment_id')
  final String appointmentId;
  @override
  final String date;
  @override
  final String status;
  @override
  @JsonKey(name: 'doctor_name')
  final String? doctorName;
  @override
  final String? specialty;
  @override
  @JsonKey(name: 'token_number')
  final int? tokenNumber;
  @override
  @JsonKey(name: 'invoice_id')
  final String? invoiceId;
  @override
  @JsonKey(name: 'invoice_number')
  final String? invoiceNumber;
  @override
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  @override
  @JsonKey(name: 'total_amount')
  final num? totalAmount;
  @override
  @JsonKey(name: 'amount_paid')
  final num? amountPaid;
  @override
  @JsonKey(name: 'balance_due')
  final num? balanceDue;

  @override
  String toString() {
    return 'ClinicalMeta(appointmentId: $appointmentId, date: $date, status: $status, doctorName: $doctorName, specialty: $specialty, tokenNumber: $tokenNumber, invoiceId: $invoiceId, invoiceNumber: $invoiceNumber, paymentStatus: $paymentStatus, totalAmount: $totalAmount, amountPaid: $amountPaid, balanceDue: $balanceDue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicalMetaImpl &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.tokenNumber, tokenNumber) ||
                other.tokenNumber == tokenNumber) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.balanceDue, balanceDue) ||
                other.balanceDue == balanceDue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appointmentId,
    date,
    status,
    doctorName,
    specialty,
    tokenNumber,
    invoiceId,
    invoiceNumber,
    paymentStatus,
    totalAmount,
    amountPaid,
    balanceDue,
  );

  /// Create a copy of ClinicalMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicalMetaImplCopyWith<_$ClinicalMetaImpl> get copyWith =>
      __$$ClinicalMetaImplCopyWithImpl<_$ClinicalMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicalMetaImplToJson(this);
  }
}

abstract class _ClinicalMeta implements ClinicalMeta {
  const factory _ClinicalMeta({
    @JsonKey(name: 'appointment_id') required final String appointmentId,
    required final String date,
    required final String status,
    @JsonKey(name: 'doctor_name') final String? doctorName,
    final String? specialty,
    @JsonKey(name: 'token_number') final int? tokenNumber,
    @JsonKey(name: 'invoice_id') final String? invoiceId,
    @JsonKey(name: 'invoice_number') final String? invoiceNumber,
    @JsonKey(name: 'payment_status') final String? paymentStatus,
    @JsonKey(name: 'total_amount') final num? totalAmount,
    @JsonKey(name: 'amount_paid') final num? amountPaid,
    @JsonKey(name: 'balance_due') final num? balanceDue,
  }) = _$ClinicalMetaImpl;

  factory _ClinicalMeta.fromJson(Map<String, dynamic> json) =
      _$ClinicalMetaImpl.fromJson;

  @override
  @JsonKey(name: 'appointment_id')
  String get appointmentId;
  @override
  String get date;
  @override
  String get status;
  @override
  @JsonKey(name: 'doctor_name')
  String? get doctorName;
  @override
  String? get specialty;
  @override
  @JsonKey(name: 'token_number')
  int? get tokenNumber;
  @override
  @JsonKey(name: 'invoice_id')
  String? get invoiceId;
  @override
  @JsonKey(name: 'invoice_number')
  String? get invoiceNumber;
  @override
  @JsonKey(name: 'payment_status')
  String? get paymentStatus;
  @override
  @JsonKey(name: 'total_amount')
  num? get totalAmount;
  @override
  @JsonKey(name: 'amount_paid')
  num? get amountPaid;
  @override
  @JsonKey(name: 'balance_due')
  num? get balanceDue;

  /// Create a copy of ClinicalMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicalMetaImplCopyWith<_$ClinicalMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicalConsultation _$ClinicalConsultationFromJson(Map<String, dynamic> json) {
  return _ClinicalConsultation.fromJson(json);
}

/// @nodoc
mixin _$ClinicalConsultation {
  @JsonKey(name: 'consultation_id')
  String get consultationId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get vitals => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_visit_date')
  String? get nextVisitDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_visit_text')
  String? get nextVisitText => throw _privateConstructorUsedError;
  List<dynamic>? get diagnosis => throw _privateConstructorUsedError;

  /// Serializes this ClinicalConsultation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicalConsultation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicalConsultationCopyWith<ClinicalConsultation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicalConsultationCopyWith<$Res> {
  factory $ClinicalConsultationCopyWith(
    ClinicalConsultation value,
    $Res Function(ClinicalConsultation) then,
  ) = _$ClinicalConsultationCopyWithImpl<$Res, ClinicalConsultation>;
  @useResult
  $Res call({
    @JsonKey(name: 'consultation_id') String consultationId,
    Map<String, dynamic>? vitals,
    @JsonKey(name: 'next_visit_date') String? nextVisitDate,
    @JsonKey(name: 'next_visit_text') String? nextVisitText,
    List<dynamic>? diagnosis,
  });
}

/// @nodoc
class _$ClinicalConsultationCopyWithImpl<
  $Res,
  $Val extends ClinicalConsultation
>
    implements $ClinicalConsultationCopyWith<$Res> {
  _$ClinicalConsultationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicalConsultation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultationId = null,
    Object? vitals = freezed,
    Object? nextVisitDate = freezed,
    Object? nextVisitText = freezed,
    Object? diagnosis = freezed,
  }) {
    return _then(
      _value.copyWith(
            consultationId: null == consultationId
                ? _value.consultationId
                : consultationId // ignore: cast_nullable_to_non_nullable
                      as String,
            vitals: freezed == vitals
                ? _value.vitals
                : vitals // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            nextVisitDate: freezed == nextVisitDate
                ? _value.nextVisitDate
                : nextVisitDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            nextVisitText: freezed == nextVisitText
                ? _value.nextVisitText
                : nextVisitText // ignore: cast_nullable_to_non_nullable
                      as String?,
            diagnosis: freezed == diagnosis
                ? _value.diagnosis
                : diagnosis // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClinicalConsultationImplCopyWith<$Res>
    implements $ClinicalConsultationCopyWith<$Res> {
  factory _$$ClinicalConsultationImplCopyWith(
    _$ClinicalConsultationImpl value,
    $Res Function(_$ClinicalConsultationImpl) then,
  ) = __$$ClinicalConsultationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'consultation_id') String consultationId,
    Map<String, dynamic>? vitals,
    @JsonKey(name: 'next_visit_date') String? nextVisitDate,
    @JsonKey(name: 'next_visit_text') String? nextVisitText,
    List<dynamic>? diagnosis,
  });
}

/// @nodoc
class __$$ClinicalConsultationImplCopyWithImpl<$Res>
    extends _$ClinicalConsultationCopyWithImpl<$Res, _$ClinicalConsultationImpl>
    implements _$$ClinicalConsultationImplCopyWith<$Res> {
  __$$ClinicalConsultationImplCopyWithImpl(
    _$ClinicalConsultationImpl _value,
    $Res Function(_$ClinicalConsultationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicalConsultation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consultationId = null,
    Object? vitals = freezed,
    Object? nextVisitDate = freezed,
    Object? nextVisitText = freezed,
    Object? diagnosis = freezed,
  }) {
    return _then(
      _$ClinicalConsultationImpl(
        consultationId: null == consultationId
            ? _value.consultationId
            : consultationId // ignore: cast_nullable_to_non_nullable
                  as String,
        vitals: freezed == vitals
            ? _value._vitals
            : vitals // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        nextVisitDate: freezed == nextVisitDate
            ? _value.nextVisitDate
            : nextVisitDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        nextVisitText: freezed == nextVisitText
            ? _value.nextVisitText
            : nextVisitText // ignore: cast_nullable_to_non_nullable
                  as String?,
        diagnosis: freezed == diagnosis
            ? _value._diagnosis
            : diagnosis // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicalConsultationImpl implements _ClinicalConsultation {
  const _$ClinicalConsultationImpl({
    @JsonKey(name: 'consultation_id') required this.consultationId,
    final Map<String, dynamic>? vitals,
    @JsonKey(name: 'next_visit_date') this.nextVisitDate,
    @JsonKey(name: 'next_visit_text') this.nextVisitText,
    final List<dynamic>? diagnosis,
  }) : _vitals = vitals,
       _diagnosis = diagnosis;

  factory _$ClinicalConsultationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicalConsultationImplFromJson(json);

  @override
  @JsonKey(name: 'consultation_id')
  final String consultationId;
  final Map<String, dynamic>? _vitals;
  @override
  Map<String, dynamic>? get vitals {
    final value = _vitals;
    if (value == null) return null;
    if (_vitals is EqualUnmodifiableMapView) return _vitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'next_visit_date')
  final String? nextVisitDate;
  @override
  @JsonKey(name: 'next_visit_text')
  final String? nextVisitText;
  final List<dynamic>? _diagnosis;
  @override
  List<dynamic>? get diagnosis {
    final value = _diagnosis;
    if (value == null) return null;
    if (_diagnosis is EqualUnmodifiableListView) return _diagnosis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClinicalConsultation(consultationId: $consultationId, vitals: $vitals, nextVisitDate: $nextVisitDate, nextVisitText: $nextVisitText, diagnosis: $diagnosis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicalConsultationImpl &&
            (identical(other.consultationId, consultationId) ||
                other.consultationId == consultationId) &&
            const DeepCollectionEquality().equals(other._vitals, _vitals) &&
            (identical(other.nextVisitDate, nextVisitDate) ||
                other.nextVisitDate == nextVisitDate) &&
            (identical(other.nextVisitText, nextVisitText) ||
                other.nextVisitText == nextVisitText) &&
            const DeepCollectionEquality().equals(
              other._diagnosis,
              _diagnosis,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    consultationId,
    const DeepCollectionEquality().hash(_vitals),
    nextVisitDate,
    nextVisitText,
    const DeepCollectionEquality().hash(_diagnosis),
  );

  /// Create a copy of ClinicalConsultation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicalConsultationImplCopyWith<_$ClinicalConsultationImpl>
  get copyWith =>
      __$$ClinicalConsultationImplCopyWithImpl<_$ClinicalConsultationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicalConsultationImplToJson(this);
  }
}

abstract class _ClinicalConsultation implements ClinicalConsultation {
  const factory _ClinicalConsultation({
    @JsonKey(name: 'consultation_id') required final String consultationId,
    final Map<String, dynamic>? vitals,
    @JsonKey(name: 'next_visit_date') final String? nextVisitDate,
    @JsonKey(name: 'next_visit_text') final String? nextVisitText,
    final List<dynamic>? diagnosis,
  }) = _$ClinicalConsultationImpl;

  factory _ClinicalConsultation.fromJson(Map<String, dynamic> json) =
      _$ClinicalConsultationImpl.fromJson;

  @override
  @JsonKey(name: 'consultation_id')
  String get consultationId;
  @override
  Map<String, dynamic>? get vitals;
  @override
  @JsonKey(name: 'next_visit_date')
  String? get nextVisitDate;
  @override
  @JsonKey(name: 'next_visit_text')
  String? get nextVisitText;
  @override
  List<dynamic>? get diagnosis;

  /// Create a copy of ClinicalConsultation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicalConsultationImplCopyWith<_$ClinicalConsultationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ClinicalMedicine _$ClinicalMedicineFromJson(Map<String, dynamic> json) {
  return _ClinicalMedicine.fromJson(json);
}

/// @nodoc
mixin _$ClinicalMedicine {
  String get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get frequency => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  String? get instruction => throw _privateConstructorUsedError;

  /// Serializes this ClinicalMedicine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicalMedicine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicalMedicineCopyWith<ClinicalMedicine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicalMedicineCopyWith<$Res> {
  factory $ClinicalMedicineCopyWith(
    ClinicalMedicine value,
    $Res Function(ClinicalMedicine) then,
  ) = _$ClinicalMedicineCopyWithImpl<$Res, ClinicalMedicine>;
  @useResult
  $Res call({
    String name,
    String? type,
    String? frequency,
    String? duration,
    String? instruction,
  });
}

/// @nodoc
class _$ClinicalMedicineCopyWithImpl<$Res, $Val extends ClinicalMedicine>
    implements $ClinicalMedicineCopyWith<$Res> {
  _$ClinicalMedicineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicalMedicine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = freezed,
    Object? frequency = freezed,
    Object? duration = freezed,
    Object? instruction = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            frequency: freezed == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String?,
            instruction: freezed == instruction
                ? _value.instruction
                : instruction // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClinicalMedicineImplCopyWith<$Res>
    implements $ClinicalMedicineCopyWith<$Res> {
  factory _$$ClinicalMedicineImplCopyWith(
    _$ClinicalMedicineImpl value,
    $Res Function(_$ClinicalMedicineImpl) then,
  ) = __$$ClinicalMedicineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String? type,
    String? frequency,
    String? duration,
    String? instruction,
  });
}

/// @nodoc
class __$$ClinicalMedicineImplCopyWithImpl<$Res>
    extends _$ClinicalMedicineCopyWithImpl<$Res, _$ClinicalMedicineImpl>
    implements _$$ClinicalMedicineImplCopyWith<$Res> {
  __$$ClinicalMedicineImplCopyWithImpl(
    _$ClinicalMedicineImpl _value,
    $Res Function(_$ClinicalMedicineImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicalMedicine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = freezed,
    Object? frequency = freezed,
    Object? duration = freezed,
    Object? instruction = freezed,
  }) {
    return _then(
      _$ClinicalMedicineImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        frequency: freezed == frequency
            ? _value.frequency
            : frequency // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String?,
        instruction: freezed == instruction
            ? _value.instruction
            : instruction // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicalMedicineImpl implements _ClinicalMedicine {
  const _$ClinicalMedicineImpl({
    required this.name,
    this.type,
    this.frequency,
    this.duration,
    this.instruction,
  });

  factory _$ClinicalMedicineImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicalMedicineImplFromJson(json);

  @override
  final String name;
  @override
  final String? type;
  @override
  final String? frequency;
  @override
  final String? duration;
  @override
  final String? instruction;

  @override
  String toString() {
    return 'ClinicalMedicine(name: $name, type: $type, frequency: $frequency, duration: $duration, instruction: $instruction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicalMedicineImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, type, frequency, duration, instruction);

  /// Create a copy of ClinicalMedicine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicalMedicineImplCopyWith<_$ClinicalMedicineImpl> get copyWith =>
      __$$ClinicalMedicineImplCopyWithImpl<_$ClinicalMedicineImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicalMedicineImplToJson(this);
  }
}

abstract class _ClinicalMedicine implements ClinicalMedicine {
  const factory _ClinicalMedicine({
    required final String name,
    final String? type,
    final String? frequency,
    final String? duration,
    final String? instruction,
  }) = _$ClinicalMedicineImpl;

  factory _ClinicalMedicine.fromJson(Map<String, dynamic> json) =
      _$ClinicalMedicineImpl.fromJson;

  @override
  String get name;
  @override
  String? get type;
  @override
  String? get frequency;
  @override
  String? get duration;
  @override
  String? get instruction;

  /// Create a copy of ClinicalMedicine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicalMedicineImplCopyWith<_$ClinicalMedicineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClinicalLab _$ClinicalLabFromJson(Map<String, dynamic> json) {
  return _ClinicalLab.fromJson(json);
}

/// @nodoc
mixin _$ClinicalLab {
  String get test => throw _privateConstructorUsedError;
  String? get instruction => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  /// Serializes this ClinicalLab to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClinicalLab
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClinicalLabCopyWith<ClinicalLab> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClinicalLabCopyWith<$Res> {
  factory $ClinicalLabCopyWith(
    ClinicalLab value,
    $Res Function(ClinicalLab) then,
  ) = _$ClinicalLabCopyWithImpl<$Res, ClinicalLab>;
  @useResult
  $Res call({String test, String? instruction, bool completed});
}

/// @nodoc
class _$ClinicalLabCopyWithImpl<$Res, $Val extends ClinicalLab>
    implements $ClinicalLabCopyWith<$Res> {
  _$ClinicalLabCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClinicalLab
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? test = null,
    Object? instruction = freezed,
    Object? completed = null,
  }) {
    return _then(
      _value.copyWith(
            test: null == test
                ? _value.test
                : test // ignore: cast_nullable_to_non_nullable
                      as String,
            instruction: freezed == instruction
                ? _value.instruction
                : instruction // ignore: cast_nullable_to_non_nullable
                      as String?,
            completed: null == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ClinicalLabImplCopyWith<$Res>
    implements $ClinicalLabCopyWith<$Res> {
  factory _$$ClinicalLabImplCopyWith(
    _$ClinicalLabImpl value,
    $Res Function(_$ClinicalLabImpl) then,
  ) = __$$ClinicalLabImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String test, String? instruction, bool completed});
}

/// @nodoc
class __$$ClinicalLabImplCopyWithImpl<$Res>
    extends _$ClinicalLabCopyWithImpl<$Res, _$ClinicalLabImpl>
    implements _$$ClinicalLabImplCopyWith<$Res> {
  __$$ClinicalLabImplCopyWithImpl(
    _$ClinicalLabImpl _value,
    $Res Function(_$ClinicalLabImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ClinicalLab
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? test = null,
    Object? instruction = freezed,
    Object? completed = null,
  }) {
    return _then(
      _$ClinicalLabImpl(
        test: null == test
            ? _value.test
            : test // ignore: cast_nullable_to_non_nullable
                  as String,
        instruction: freezed == instruction
            ? _value.instruction
            : instruction // ignore: cast_nullable_to_non_nullable
                  as String?,
        completed: null == completed
            ? _value.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ClinicalLabImpl implements _ClinicalLab {
  const _$ClinicalLabImpl({
    required this.test,
    this.instruction,
    required this.completed,
  });

  factory _$ClinicalLabImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClinicalLabImplFromJson(json);

  @override
  final String test;
  @override
  final String? instruction;
  @override
  final bool completed;

  @override
  String toString() {
    return 'ClinicalLab(test: $test, instruction: $instruction, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClinicalLabImpl &&
            (identical(other.test, test) || other.test == test) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, test, instruction, completed);

  /// Create a copy of ClinicalLab
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClinicalLabImplCopyWith<_$ClinicalLabImpl> get copyWith =>
      __$$ClinicalLabImplCopyWithImpl<_$ClinicalLabImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClinicalLabImplToJson(this);
  }
}

abstract class _ClinicalLab implements ClinicalLab {
  const factory _ClinicalLab({
    required final String test,
    final String? instruction,
    required final bool completed,
  }) = _$ClinicalLabImpl;

  factory _ClinicalLab.fromJson(Map<String, dynamic> json) =
      _$ClinicalLabImpl.fromJson;

  @override
  String get test;
  @override
  String? get instruction;
  @override
  bool get completed;

  /// Create a copy of ClinicalLab
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClinicalLabImplCopyWith<_$ClinicalLabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoicePrintData _$InvoicePrintDataFromJson(Map<String, dynamic> json) {
  return _InvoicePrintData.fromJson(json);
}

/// @nodoc
mixin _$InvoicePrintData {
  InvoiceMeta get meta => throw _privateConstructorUsedError;
  InvoiceClinic get clinic => throw _privateConstructorUsedError;
  InvoiceDoctor get doctor => throw _privateConstructorUsedError;
  InvoicePatient get patient => throw _privateConstructorUsedError;
  InvoiceAppointment get appointment => throw _privateConstructorUsedError;
  InvoiceFinancials get financials => throw _privateConstructorUsedError;

  /// Serializes this InvoicePrintData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoicePrintData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoicePrintDataCopyWith<InvoicePrintData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoicePrintDataCopyWith<$Res> {
  factory $InvoicePrintDataCopyWith(
    InvoicePrintData value,
    $Res Function(InvoicePrintData) then,
  ) = _$InvoicePrintDataCopyWithImpl<$Res, InvoicePrintData>;
  @useResult
  $Res call({
    InvoiceMeta meta,
    InvoiceClinic clinic,
    InvoiceDoctor doctor,
    InvoicePatient patient,
    InvoiceAppointment appointment,
    InvoiceFinancials financials,
  });

  $InvoiceMetaCopyWith<$Res> get meta;
  $InvoiceClinicCopyWith<$Res> get clinic;
  $InvoiceDoctorCopyWith<$Res> get doctor;
  $InvoicePatientCopyWith<$Res> get patient;
  $InvoiceAppointmentCopyWith<$Res> get appointment;
  $InvoiceFinancialsCopyWith<$Res> get financials;
}

/// @nodoc
class _$InvoicePrintDataCopyWithImpl<$Res, $Val extends InvoicePrintData>
    implements $InvoicePrintDataCopyWith<$Res> {
  _$InvoicePrintDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoicePrintData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? clinic = null,
    Object? doctor = null,
    Object? patient = null,
    Object? appointment = null,
    Object? financials = null,
  }) {
    return _then(
      _value.copyWith(
            meta: null == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as InvoiceMeta,
            clinic: null == clinic
                ? _value.clinic
                : clinic // ignore: cast_nullable_to_non_nullable
                      as InvoiceClinic,
            doctor: null == doctor
                ? _value.doctor
                : doctor // ignore: cast_nullable_to_non_nullable
                      as InvoiceDoctor,
            patient: null == patient
                ? _value.patient
                : patient // ignore: cast_nullable_to_non_nullable
                      as InvoicePatient,
            appointment: null == appointment
                ? _value.appointment
                : appointment // ignore: cast_nullable_to_non_nullable
                      as InvoiceAppointment,
            financials: null == financials
                ? _value.financials
                : financials // ignore: cast_nullable_to_non_nullable
                      as InvoiceFinancials,
          )
          as $Val,
    );
  }

  /// Create a copy of InvoicePrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceMetaCopyWith<$Res> get meta {
    return $InvoiceMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of InvoicePrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceClinicCopyWith<$Res> get clinic {
    return $InvoiceClinicCopyWith<$Res>(_value.clinic, (value) {
      return _then(_value.copyWith(clinic: value) as $Val);
    });
  }

  /// Create a copy of InvoicePrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceDoctorCopyWith<$Res> get doctor {
    return $InvoiceDoctorCopyWith<$Res>(_value.doctor, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }

  /// Create a copy of InvoicePrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoicePatientCopyWith<$Res> get patient {
    return $InvoicePatientCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }

  /// Create a copy of InvoicePrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceAppointmentCopyWith<$Res> get appointment {
    return $InvoiceAppointmentCopyWith<$Res>(_value.appointment, (value) {
      return _then(_value.copyWith(appointment: value) as $Val);
    });
  }

  /// Create a copy of InvoicePrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceFinancialsCopyWith<$Res> get financials {
    return $InvoiceFinancialsCopyWith<$Res>(_value.financials, (value) {
      return _then(_value.copyWith(financials: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoicePrintDataImplCopyWith<$Res>
    implements $InvoicePrintDataCopyWith<$Res> {
  factory _$$InvoicePrintDataImplCopyWith(
    _$InvoicePrintDataImpl value,
    $Res Function(_$InvoicePrintDataImpl) then,
  ) = __$$InvoicePrintDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    InvoiceMeta meta,
    InvoiceClinic clinic,
    InvoiceDoctor doctor,
    InvoicePatient patient,
    InvoiceAppointment appointment,
    InvoiceFinancials financials,
  });

  @override
  $InvoiceMetaCopyWith<$Res> get meta;
  @override
  $InvoiceClinicCopyWith<$Res> get clinic;
  @override
  $InvoiceDoctorCopyWith<$Res> get doctor;
  @override
  $InvoicePatientCopyWith<$Res> get patient;
  @override
  $InvoiceAppointmentCopyWith<$Res> get appointment;
  @override
  $InvoiceFinancialsCopyWith<$Res> get financials;
}

/// @nodoc
class __$$InvoicePrintDataImplCopyWithImpl<$Res>
    extends _$InvoicePrintDataCopyWithImpl<$Res, _$InvoicePrintDataImpl>
    implements _$$InvoicePrintDataImplCopyWith<$Res> {
  __$$InvoicePrintDataImplCopyWithImpl(
    _$InvoicePrintDataImpl _value,
    $Res Function(_$InvoicePrintDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvoicePrintData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? clinic = null,
    Object? doctor = null,
    Object? patient = null,
    Object? appointment = null,
    Object? financials = null,
  }) {
    return _then(
      _$InvoicePrintDataImpl(
        meta: null == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as InvoiceMeta,
        clinic: null == clinic
            ? _value.clinic
            : clinic // ignore: cast_nullable_to_non_nullable
                  as InvoiceClinic,
        doctor: null == doctor
            ? _value.doctor
            : doctor // ignore: cast_nullable_to_non_nullable
                  as InvoiceDoctor,
        patient: null == patient
            ? _value.patient
            : patient // ignore: cast_nullable_to_non_nullable
                  as InvoicePatient,
        appointment: null == appointment
            ? _value.appointment
            : appointment // ignore: cast_nullable_to_non_nullable
                  as InvoiceAppointment,
        financials: null == financials
            ? _value.financials
            : financials // ignore: cast_nullable_to_non_nullable
                  as InvoiceFinancials,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoicePrintDataImpl implements _InvoicePrintData {
  const _$InvoicePrintDataImpl({
    required this.meta,
    required this.clinic,
    required this.doctor,
    required this.patient,
    required this.appointment,
    required this.financials,
  });

  factory _$InvoicePrintDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoicePrintDataImplFromJson(json);

  @override
  final InvoiceMeta meta;
  @override
  final InvoiceClinic clinic;
  @override
  final InvoiceDoctor doctor;
  @override
  final InvoicePatient patient;
  @override
  final InvoiceAppointment appointment;
  @override
  final InvoiceFinancials financials;

  @override
  String toString() {
    return 'InvoicePrintData(meta: $meta, clinic: $clinic, doctor: $doctor, patient: $patient, appointment: $appointment, financials: $financials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoicePrintDataImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.clinic, clinic) || other.clinic == clinic) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.appointment, appointment) ||
                other.appointment == appointment) &&
            (identical(other.financials, financials) ||
                other.financials == financials));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    meta,
    clinic,
    doctor,
    patient,
    appointment,
    financials,
  );

  /// Create a copy of InvoicePrintData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoicePrintDataImplCopyWith<_$InvoicePrintDataImpl> get copyWith =>
      __$$InvoicePrintDataImplCopyWithImpl<_$InvoicePrintDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoicePrintDataImplToJson(this);
  }
}

abstract class _InvoicePrintData implements InvoicePrintData {
  const factory _InvoicePrintData({
    required final InvoiceMeta meta,
    required final InvoiceClinic clinic,
    required final InvoiceDoctor doctor,
    required final InvoicePatient patient,
    required final InvoiceAppointment appointment,
    required final InvoiceFinancials financials,
  }) = _$InvoicePrintDataImpl;

  factory _InvoicePrintData.fromJson(Map<String, dynamic> json) =
      _$InvoicePrintDataImpl.fromJson;

  @override
  InvoiceMeta get meta;
  @override
  InvoiceClinic get clinic;
  @override
  InvoiceDoctor get doctor;
  @override
  InvoicePatient get patient;
  @override
  InvoiceAppointment get appointment;
  @override
  InvoiceFinancials get financials;

  /// Create a copy of InvoicePrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoicePrintDataImplCopyWith<_$InvoicePrintDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceMeta _$InvoiceMetaFromJson(Map<String, dynamic> json) {
  return _InvoiceMeta.fromJson(json);
}

/// @nodoc
mixin _$InvoiceMeta {
  @JsonKey(name: 'generated_at')
  String get generatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_no')
  String get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_invoice_id')
  String get fullInvoiceId => throw _privateConstructorUsedError;

  /// Serializes this InvoiceMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceMetaCopyWith<InvoiceMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceMetaCopyWith<$Res> {
  factory $InvoiceMetaCopyWith(
    InvoiceMeta value,
    $Res Function(InvoiceMeta) then,
  ) = _$InvoiceMetaCopyWithImpl<$Res, InvoiceMeta>;
  @useResult
  $Res call({
    @JsonKey(name: 'generated_at') String generatedAt,
    @JsonKey(name: 'invoice_no') String invoiceNo,
    @JsonKey(name: 'full_invoice_id') String fullInvoiceId,
  });
}

/// @nodoc
class _$InvoiceMetaCopyWithImpl<$Res, $Val extends InvoiceMeta>
    implements $InvoiceMetaCopyWith<$Res> {
  _$InvoiceMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedAt = null,
    Object? invoiceNo = null,
    Object? fullInvoiceId = null,
  }) {
    return _then(
      _value.copyWith(
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            invoiceNo: null == invoiceNo
                ? _value.invoiceNo
                : invoiceNo // ignore: cast_nullable_to_non_nullable
                      as String,
            fullInvoiceId: null == fullInvoiceId
                ? _value.fullInvoiceId
                : fullInvoiceId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvoiceMetaImplCopyWith<$Res>
    implements $InvoiceMetaCopyWith<$Res> {
  factory _$$InvoiceMetaImplCopyWith(
    _$InvoiceMetaImpl value,
    $Res Function(_$InvoiceMetaImpl) then,
  ) = __$$InvoiceMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'generated_at') String generatedAt,
    @JsonKey(name: 'invoice_no') String invoiceNo,
    @JsonKey(name: 'full_invoice_id') String fullInvoiceId,
  });
}

/// @nodoc
class __$$InvoiceMetaImplCopyWithImpl<$Res>
    extends _$InvoiceMetaCopyWithImpl<$Res, _$InvoiceMetaImpl>
    implements _$$InvoiceMetaImplCopyWith<$Res> {
  __$$InvoiceMetaImplCopyWithImpl(
    _$InvoiceMetaImpl _value,
    $Res Function(_$InvoiceMetaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvoiceMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedAt = null,
    Object? invoiceNo = null,
    Object? fullInvoiceId = null,
  }) {
    return _then(
      _$InvoiceMetaImpl(
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        invoiceNo: null == invoiceNo
            ? _value.invoiceNo
            : invoiceNo // ignore: cast_nullable_to_non_nullable
                  as String,
        fullInvoiceId: null == fullInvoiceId
            ? _value.fullInvoiceId
            : fullInvoiceId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceMetaImpl implements _InvoiceMeta {
  const _$InvoiceMetaImpl({
    @JsonKey(name: 'generated_at') required this.generatedAt,
    @JsonKey(name: 'invoice_no') required this.invoiceNo,
    @JsonKey(name: 'full_invoice_id') required this.fullInvoiceId,
  });

  factory _$InvoiceMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceMetaImplFromJson(json);

  @override
  @JsonKey(name: 'generated_at')
  final String generatedAt;
  @override
  @JsonKey(name: 'invoice_no')
  final String invoiceNo;
  @override
  @JsonKey(name: 'full_invoice_id')
  final String fullInvoiceId;

  @override
  String toString() {
    return 'InvoiceMeta(generatedAt: $generatedAt, invoiceNo: $invoiceNo, fullInvoiceId: $fullInvoiceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceMetaImpl &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.fullInvoiceId, fullInvoiceId) ||
                other.fullInvoiceId == fullInvoiceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, generatedAt, invoiceNo, fullInvoiceId);

  /// Create a copy of InvoiceMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceMetaImplCopyWith<_$InvoiceMetaImpl> get copyWith =>
      __$$InvoiceMetaImplCopyWithImpl<_$InvoiceMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceMetaImplToJson(this);
  }
}

abstract class _InvoiceMeta implements InvoiceMeta {
  const factory _InvoiceMeta({
    @JsonKey(name: 'generated_at') required final String generatedAt,
    @JsonKey(name: 'invoice_no') required final String invoiceNo,
    @JsonKey(name: 'full_invoice_id') required final String fullInvoiceId,
  }) = _$InvoiceMetaImpl;

  factory _InvoiceMeta.fromJson(Map<String, dynamic> json) =
      _$InvoiceMetaImpl.fromJson;

  @override
  @JsonKey(name: 'generated_at')
  String get generatedAt;
  @override
  @JsonKey(name: 'invoice_no')
  String get invoiceNo;
  @override
  @JsonKey(name: 'full_invoice_id')
  String get fullInvoiceId;

  /// Create a copy of InvoiceMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceMetaImplCopyWith<_$InvoiceMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceClinic _$InvoiceClinicFromJson(Map<String, dynamic> json) {
  return _InvoiceClinic.fromJson(json);
}

/// @nodoc
mixin _$InvoiceClinic {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_full')
  String get addressFull => throw _privateConstructorUsedError;
  Map<String, dynamic>? get contacts =>
      throw _privateConstructorUsedError; // primary, email etc
  Map<String, dynamic>? get branding =>
      throw _privateConstructorUsedError; // logo, footer_msg
  @JsonKey(name: 'tax_info')
  String? get taxInfo => throw _privateConstructorUsedError;

  /// Serializes this InvoiceClinic to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceClinic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceClinicCopyWith<InvoiceClinic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceClinicCopyWith<$Res> {
  factory $InvoiceClinicCopyWith(
    InvoiceClinic value,
    $Res Function(InvoiceClinic) then,
  ) = _$InvoiceClinicCopyWithImpl<$Res, InvoiceClinic>;
  @useResult
  $Res call({
    String name,
    @JsonKey(name: 'address_full') String addressFull,
    Map<String, dynamic>? contacts,
    Map<String, dynamic>? branding,
    @JsonKey(name: 'tax_info') String? taxInfo,
  });
}

/// @nodoc
class _$InvoiceClinicCopyWithImpl<$Res, $Val extends InvoiceClinic>
    implements $InvoiceClinicCopyWith<$Res> {
  _$InvoiceClinicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceClinic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? addressFull = null,
    Object? contacts = freezed,
    Object? branding = freezed,
    Object? taxInfo = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            addressFull: null == addressFull
                ? _value.addressFull
                : addressFull // ignore: cast_nullable_to_non_nullable
                      as String,
            contacts: freezed == contacts
                ? _value.contacts
                : contacts // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            branding: freezed == branding
                ? _value.branding
                : branding // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            taxInfo: freezed == taxInfo
                ? _value.taxInfo
                : taxInfo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvoiceClinicImplCopyWith<$Res>
    implements $InvoiceClinicCopyWith<$Res> {
  factory _$$InvoiceClinicImplCopyWith(
    _$InvoiceClinicImpl value,
    $Res Function(_$InvoiceClinicImpl) then,
  ) = __$$InvoiceClinicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    @JsonKey(name: 'address_full') String addressFull,
    Map<String, dynamic>? contacts,
    Map<String, dynamic>? branding,
    @JsonKey(name: 'tax_info') String? taxInfo,
  });
}

/// @nodoc
class __$$InvoiceClinicImplCopyWithImpl<$Res>
    extends _$InvoiceClinicCopyWithImpl<$Res, _$InvoiceClinicImpl>
    implements _$$InvoiceClinicImplCopyWith<$Res> {
  __$$InvoiceClinicImplCopyWithImpl(
    _$InvoiceClinicImpl _value,
    $Res Function(_$InvoiceClinicImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvoiceClinic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? addressFull = null,
    Object? contacts = freezed,
    Object? branding = freezed,
    Object? taxInfo = freezed,
  }) {
    return _then(
      _$InvoiceClinicImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        addressFull: null == addressFull
            ? _value.addressFull
            : addressFull // ignore: cast_nullable_to_non_nullable
                  as String,
        contacts: freezed == contacts
            ? _value._contacts
            : contacts // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        branding: freezed == branding
            ? _value._branding
            : branding // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        taxInfo: freezed == taxInfo
            ? _value.taxInfo
            : taxInfo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceClinicImpl implements _InvoiceClinic {
  const _$InvoiceClinicImpl({
    required this.name,
    @JsonKey(name: 'address_full') required this.addressFull,
    final Map<String, dynamic>? contacts,
    final Map<String, dynamic>? branding,
    @JsonKey(name: 'tax_info') this.taxInfo,
  }) : _contacts = contacts,
       _branding = branding;

  factory _$InvoiceClinicImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceClinicImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'address_full')
  final String addressFull;
  final Map<String, dynamic>? _contacts;
  @override
  Map<String, dynamic>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    if (_contacts is EqualUnmodifiableMapView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  // primary, email etc
  final Map<String, dynamic>? _branding;
  // primary, email etc
  @override
  Map<String, dynamic>? get branding {
    final value = _branding;
    if (value == null) return null;
    if (_branding is EqualUnmodifiableMapView) return _branding;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  // logo, footer_msg
  @override
  @JsonKey(name: 'tax_info')
  final String? taxInfo;

  @override
  String toString() {
    return 'InvoiceClinic(name: $name, addressFull: $addressFull, contacts: $contacts, branding: $branding, taxInfo: $taxInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceClinicImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.addressFull, addressFull) ||
                other.addressFull == addressFull) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            const DeepCollectionEquality().equals(other._branding, _branding) &&
            (identical(other.taxInfo, taxInfo) || other.taxInfo == taxInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    addressFull,
    const DeepCollectionEquality().hash(_contacts),
    const DeepCollectionEquality().hash(_branding),
    taxInfo,
  );

  /// Create a copy of InvoiceClinic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceClinicImplCopyWith<_$InvoiceClinicImpl> get copyWith =>
      __$$InvoiceClinicImplCopyWithImpl<_$InvoiceClinicImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceClinicImplToJson(this);
  }
}

abstract class _InvoiceClinic implements InvoiceClinic {
  const factory _InvoiceClinic({
    required final String name,
    @JsonKey(name: 'address_full') required final String addressFull,
    final Map<String, dynamic>? contacts,
    final Map<String, dynamic>? branding,
    @JsonKey(name: 'tax_info') final String? taxInfo,
  }) = _$InvoiceClinicImpl;

  factory _InvoiceClinic.fromJson(Map<String, dynamic> json) =
      _$InvoiceClinicImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'address_full')
  String get addressFull;
  @override
  Map<String, dynamic>? get contacts; // primary, email etc
  @override
  Map<String, dynamic>? get branding; // logo, footer_msg
  @override
  @JsonKey(name: 'tax_info')
  String? get taxInfo;

  /// Create a copy of InvoiceClinic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceClinicImplCopyWith<_$InvoiceClinicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceDoctor _$InvoiceDoctorFromJson(Map<String, dynamic> json) {
  return _InvoiceDoctor.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDoctor {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'reg_no')
  String? get regNo => throw _privateConstructorUsedError;
  String? get specialty => throw _privateConstructorUsedError;
  String? get qualifications => throw _privateConstructorUsedError;
  String? get signature => throw _privateConstructorUsedError;

  /// Serializes this InvoiceDoctor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceDoctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceDoctorCopyWith<InvoiceDoctor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDoctorCopyWith<$Res> {
  factory $InvoiceDoctorCopyWith(
    InvoiceDoctor value,
    $Res Function(InvoiceDoctor) then,
  ) = _$InvoiceDoctorCopyWithImpl<$Res, InvoiceDoctor>;
  @useResult
  $Res call({
    String name,
    @JsonKey(name: 'reg_no') String? regNo,
    String? specialty,
    String? qualifications,
    String? signature,
  });
}

/// @nodoc
class _$InvoiceDoctorCopyWithImpl<$Res, $Val extends InvoiceDoctor>
    implements $InvoiceDoctorCopyWith<$Res> {
  _$InvoiceDoctorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceDoctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? regNo = freezed,
    Object? specialty = freezed,
    Object? qualifications = freezed,
    Object? signature = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            regNo: freezed == regNo
                ? _value.regNo
                : regNo // ignore: cast_nullable_to_non_nullable
                      as String?,
            specialty: freezed == specialty
                ? _value.specialty
                : specialty // ignore: cast_nullable_to_non_nullable
                      as String?,
            qualifications: freezed == qualifications
                ? _value.qualifications
                : qualifications // ignore: cast_nullable_to_non_nullable
                      as String?,
            signature: freezed == signature
                ? _value.signature
                : signature // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvoiceDoctorImplCopyWith<$Res>
    implements $InvoiceDoctorCopyWith<$Res> {
  factory _$$InvoiceDoctorImplCopyWith(
    _$InvoiceDoctorImpl value,
    $Res Function(_$InvoiceDoctorImpl) then,
  ) = __$$InvoiceDoctorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    @JsonKey(name: 'reg_no') String? regNo,
    String? specialty,
    String? qualifications,
    String? signature,
  });
}

/// @nodoc
class __$$InvoiceDoctorImplCopyWithImpl<$Res>
    extends _$InvoiceDoctorCopyWithImpl<$Res, _$InvoiceDoctorImpl>
    implements _$$InvoiceDoctorImplCopyWith<$Res> {
  __$$InvoiceDoctorImplCopyWithImpl(
    _$InvoiceDoctorImpl _value,
    $Res Function(_$InvoiceDoctorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvoiceDoctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? regNo = freezed,
    Object? specialty = freezed,
    Object? qualifications = freezed,
    Object? signature = freezed,
  }) {
    return _then(
      _$InvoiceDoctorImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        regNo: freezed == regNo
            ? _value.regNo
            : regNo // ignore: cast_nullable_to_non_nullable
                  as String?,
        specialty: freezed == specialty
            ? _value.specialty
            : specialty // ignore: cast_nullable_to_non_nullable
                  as String?,
        qualifications: freezed == qualifications
            ? _value.qualifications
            : qualifications // ignore: cast_nullable_to_non_nullable
                  as String?,
        signature: freezed == signature
            ? _value.signature
            : signature // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceDoctorImpl implements _InvoiceDoctor {
  const _$InvoiceDoctorImpl({
    required this.name,
    @JsonKey(name: 'reg_no') this.regNo,
    this.specialty,
    this.qualifications,
    this.signature,
  });

  factory _$InvoiceDoctorImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceDoctorImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'reg_no')
  final String? regNo;
  @override
  final String? specialty;
  @override
  final String? qualifications;
  @override
  final String? signature;

  @override
  String toString() {
    return 'InvoiceDoctor(name: $name, regNo: $regNo, specialty: $specialty, qualifications: $qualifications, signature: $signature)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceDoctorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.regNo, regNo) || other.regNo == regNo) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.qualifications, qualifications) ||
                other.qualifications == qualifications) &&
            (identical(other.signature, signature) ||
                other.signature == signature));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    regNo,
    specialty,
    qualifications,
    signature,
  );

  /// Create a copy of InvoiceDoctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceDoctorImplCopyWith<_$InvoiceDoctorImpl> get copyWith =>
      __$$InvoiceDoctorImplCopyWithImpl<_$InvoiceDoctorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceDoctorImplToJson(this);
  }
}

abstract class _InvoiceDoctor implements InvoiceDoctor {
  const factory _InvoiceDoctor({
    required final String name,
    @JsonKey(name: 'reg_no') final String? regNo,
    final String? specialty,
    final String? qualifications,
    final String? signature,
  }) = _$InvoiceDoctorImpl;

  factory _InvoiceDoctor.fromJson(Map<String, dynamic> json) =
      _$InvoiceDoctorImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'reg_no')
  String? get regNo;
  @override
  String? get specialty;
  @override
  String? get qualifications;
  @override
  String? get signature;

  /// Create a copy of InvoiceDoctor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceDoctorImplCopyWith<_$InvoiceDoctorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoicePatient _$InvoicePatientFromJson(Map<String, dynamic> json) {
  return _InvoicePatient.fromJson(json);
}

/// @nodoc
mixin _$InvoicePatient {
  String get name => throw _privateConstructorUsedError;
  String get uhid => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'age_gender')
  String? get ageGender => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_full')
  String? get addressFull => throw _privateConstructorUsedError;

  /// Serializes this InvoicePatient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoicePatient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoicePatientCopyWith<InvoicePatient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoicePatientCopyWith<$Res> {
  factory $InvoicePatientCopyWith(
    InvoicePatient value,
    $Res Function(InvoicePatient) then,
  ) = _$InvoicePatientCopyWithImpl<$Res, InvoicePatient>;
  @useResult
  $Res call({
    String name,
    String uhid,
    String? phone,
    @JsonKey(name: 'age_gender') String? ageGender,
    @JsonKey(name: 'address_full') String? addressFull,
  });
}

/// @nodoc
class _$InvoicePatientCopyWithImpl<$Res, $Val extends InvoicePatient>
    implements $InvoicePatientCopyWith<$Res> {
  _$InvoicePatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoicePatient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uhid = null,
    Object? phone = freezed,
    Object? ageGender = freezed,
    Object? addressFull = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            uhid: null == uhid
                ? _value.uhid
                : uhid // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            ageGender: freezed == ageGender
                ? _value.ageGender
                : ageGender // ignore: cast_nullable_to_non_nullable
                      as String?,
            addressFull: freezed == addressFull
                ? _value.addressFull
                : addressFull // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvoicePatientImplCopyWith<$Res>
    implements $InvoicePatientCopyWith<$Res> {
  factory _$$InvoicePatientImplCopyWith(
    _$InvoicePatientImpl value,
    $Res Function(_$InvoicePatientImpl) then,
  ) = __$$InvoicePatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String uhid,
    String? phone,
    @JsonKey(name: 'age_gender') String? ageGender,
    @JsonKey(name: 'address_full') String? addressFull,
  });
}

/// @nodoc
class __$$InvoicePatientImplCopyWithImpl<$Res>
    extends _$InvoicePatientCopyWithImpl<$Res, _$InvoicePatientImpl>
    implements _$$InvoicePatientImplCopyWith<$Res> {
  __$$InvoicePatientImplCopyWithImpl(
    _$InvoicePatientImpl _value,
    $Res Function(_$InvoicePatientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvoicePatient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uhid = null,
    Object? phone = freezed,
    Object? ageGender = freezed,
    Object? addressFull = freezed,
  }) {
    return _then(
      _$InvoicePatientImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        uhid: null == uhid
            ? _value.uhid
            : uhid // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        ageGender: freezed == ageGender
            ? _value.ageGender
            : ageGender // ignore: cast_nullable_to_non_nullable
                  as String?,
        addressFull: freezed == addressFull
            ? _value.addressFull
            : addressFull // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoicePatientImpl implements _InvoicePatient {
  const _$InvoicePatientImpl({
    required this.name,
    required this.uhid,
    this.phone,
    @JsonKey(name: 'age_gender') this.ageGender,
    @JsonKey(name: 'address_full') this.addressFull,
  });

  factory _$InvoicePatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoicePatientImplFromJson(json);

  @override
  final String name;
  @override
  final String uhid;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'age_gender')
  final String? ageGender;
  @override
  @JsonKey(name: 'address_full')
  final String? addressFull;

  @override
  String toString() {
    return 'InvoicePatient(name: $name, uhid: $uhid, phone: $phone, ageGender: $ageGender, addressFull: $addressFull)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoicePatientImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uhid, uhid) || other.uhid == uhid) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.ageGender, ageGender) ||
                other.ageGender == ageGender) &&
            (identical(other.addressFull, addressFull) ||
                other.addressFull == addressFull));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, uhid, phone, ageGender, addressFull);

  /// Create a copy of InvoicePatient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoicePatientImplCopyWith<_$InvoicePatientImpl> get copyWith =>
      __$$InvoicePatientImplCopyWithImpl<_$InvoicePatientImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoicePatientImplToJson(this);
  }
}

abstract class _InvoicePatient implements InvoicePatient {
  const factory _InvoicePatient({
    required final String name,
    required final String uhid,
    final String? phone,
    @JsonKey(name: 'age_gender') final String? ageGender,
    @JsonKey(name: 'address_full') final String? addressFull,
  }) = _$InvoicePatientImpl;

  factory _InvoicePatient.fromJson(Map<String, dynamic> json) =
      _$InvoicePatientImpl.fromJson;

  @override
  String get name;
  @override
  String get uhid;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'age_gender')
  String? get ageGender;
  @override
  @JsonKey(name: 'address_full')
  String? get addressFull;

  /// Create a copy of InvoicePatient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoicePatientImplCopyWith<_$InvoicePatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceAppointment _$InvoiceAppointmentFromJson(Map<String, dynamic> json) {
  return _InvoiceAppointment.fromJson(json);
}

/// @nodoc
mixin _$InvoiceAppointment {
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'appt_number')
  String? get apptNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_number')
  int get tokenNumber => throw _privateConstructorUsedError;
  String? get room => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_name')
  String? get createdByName => throw _privateConstructorUsedError;

  /// Serializes this InvoiceAppointment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceAppointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceAppointmentCopyWith<InvoiceAppointment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceAppointmentCopyWith<$Res> {
  factory $InvoiceAppointmentCopyWith(
    InvoiceAppointment value,
    $Res Function(InvoiceAppointment) then,
  ) = _$InvoiceAppointmentCopyWithImpl<$Res, InvoiceAppointment>;
  @useResult
  $Res call({
    String date,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    String type,
    @JsonKey(name: 'appt_number') String? apptNumber,
    @JsonKey(name: 'token_number') int tokenNumber,
    String? room,
    @JsonKey(name: 'created_by_name') String? createdByName,
  });
}

/// @nodoc
class _$InvoiceAppointmentCopyWithImpl<$Res, $Val extends InvoiceAppointment>
    implements $InvoiceAppointmentCopyWith<$Res> {
  _$InvoiceAppointmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceAppointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? apptNumber = freezed,
    Object? tokenNumber = null,
    Object? room = freezed,
    Object? createdByName = freezed,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            apptNumber: freezed == apptNumber
                ? _value.apptNumber
                : apptNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            tokenNumber: null == tokenNumber
                ? _value.tokenNumber
                : tokenNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            room: freezed == room
                ? _value.room
                : room // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdByName: freezed == createdByName
                ? _value.createdByName
                : createdByName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvoiceAppointmentImplCopyWith<$Res>
    implements $InvoiceAppointmentCopyWith<$Res> {
  factory _$$InvoiceAppointmentImplCopyWith(
    _$InvoiceAppointmentImpl value,
    $Res Function(_$InvoiceAppointmentImpl) then,
  ) = __$$InvoiceAppointmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String date,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'end_time') String endTime,
    String type,
    @JsonKey(name: 'appt_number') String? apptNumber,
    @JsonKey(name: 'token_number') int tokenNumber,
    String? room,
    @JsonKey(name: 'created_by_name') String? createdByName,
  });
}

/// @nodoc
class __$$InvoiceAppointmentImplCopyWithImpl<$Res>
    extends _$InvoiceAppointmentCopyWithImpl<$Res, _$InvoiceAppointmentImpl>
    implements _$$InvoiceAppointmentImplCopyWith<$Res> {
  __$$InvoiceAppointmentImplCopyWithImpl(
    _$InvoiceAppointmentImpl _value,
    $Res Function(_$InvoiceAppointmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvoiceAppointment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? type = null,
    Object? apptNumber = freezed,
    Object? tokenNumber = null,
    Object? room = freezed,
    Object? createdByName = freezed,
  }) {
    return _then(
      _$InvoiceAppointmentImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        apptNumber: freezed == apptNumber
            ? _value.apptNumber
            : apptNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        tokenNumber: null == tokenNumber
            ? _value.tokenNumber
            : tokenNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        room: freezed == room
            ? _value.room
            : room // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdByName: freezed == createdByName
            ? _value.createdByName
            : createdByName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceAppointmentImpl implements _InvoiceAppointment {
  const _$InvoiceAppointmentImpl({
    required this.date,
    @JsonKey(name: 'start_time') required this.startTime,
    @JsonKey(name: 'end_time') required this.endTime,
    required this.type,
    @JsonKey(name: 'appt_number') this.apptNumber,
    @JsonKey(name: 'token_number') required this.tokenNumber,
    this.room,
    @JsonKey(name: 'created_by_name') this.createdByName,
  });

  factory _$InvoiceAppointmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceAppointmentImplFromJson(json);

  @override
  final String date;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;
  @override
  final String type;
  @override
  @JsonKey(name: 'appt_number')
  final String? apptNumber;
  @override
  @JsonKey(name: 'token_number')
  final int tokenNumber;
  @override
  final String? room;
  @override
  @JsonKey(name: 'created_by_name')
  final String? createdByName;

  @override
  String toString() {
    return 'InvoiceAppointment(date: $date, startTime: $startTime, endTime: $endTime, type: $type, apptNumber: $apptNumber, tokenNumber: $tokenNumber, room: $room, createdByName: $createdByName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceAppointmentImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.apptNumber, apptNumber) ||
                other.apptNumber == apptNumber) &&
            (identical(other.tokenNumber, tokenNumber) ||
                other.tokenNumber == tokenNumber) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.createdByName, createdByName) ||
                other.createdByName == createdByName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    startTime,
    endTime,
    type,
    apptNumber,
    tokenNumber,
    room,
    createdByName,
  );

  /// Create a copy of InvoiceAppointment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceAppointmentImplCopyWith<_$InvoiceAppointmentImpl> get copyWith =>
      __$$InvoiceAppointmentImplCopyWithImpl<_$InvoiceAppointmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceAppointmentImplToJson(this);
  }
}

abstract class _InvoiceAppointment implements InvoiceAppointment {
  const factory _InvoiceAppointment({
    required final String date,
    @JsonKey(name: 'start_time') required final String startTime,
    @JsonKey(name: 'end_time') required final String endTime,
    required final String type,
    @JsonKey(name: 'appt_number') final String? apptNumber,
    @JsonKey(name: 'token_number') required final int tokenNumber,
    final String? room,
    @JsonKey(name: 'created_by_name') final String? createdByName,
  }) = _$InvoiceAppointmentImpl;

  factory _InvoiceAppointment.fromJson(Map<String, dynamic> json) =
      _$InvoiceAppointmentImpl.fromJson;

  @override
  String get date;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  String get type;
  @override
  @JsonKey(name: 'appt_number')
  String? get apptNumber;
  @override
  @JsonKey(name: 'token_number')
  int get tokenNumber;
  @override
  String? get room;
  @override
  @JsonKey(name: 'created_by_name')
  String? get createdByName;

  /// Create a copy of InvoiceAppointment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceAppointmentImplCopyWith<_$InvoiceAppointmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceFinancials _$InvoiceFinancialsFromJson(Map<String, dynamic> json) {
  return _InvoiceFinancials.fromJson(json);
}

/// @nodoc
mixin _$InvoiceFinancials {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_total')
  num get subTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_total')
  num get taxTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'grand_total')
  num get grandTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_paid')
  num get amountPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance_due')
  num get balanceDue => throw _privateConstructorUsedError;
  List<InvoiceItem> get items => throw _privateConstructorUsedError;

  /// Serializes this InvoiceFinancials to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceFinancials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceFinancialsCopyWith<InvoiceFinancials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceFinancialsCopyWith<$Res> {
  factory $InvoiceFinancialsCopyWith(
    InvoiceFinancials value,
    $Res Function(InvoiceFinancials) then,
  ) = _$InvoiceFinancialsCopyWithImpl<$Res, InvoiceFinancials>;
  @useResult
  $Res call({
    String? status,
    @JsonKey(name: 'sub_total') num subTotal,
    @JsonKey(name: 'tax_total') num taxTotal,
    @JsonKey(name: 'grand_total') num grandTotal,
    @JsonKey(name: 'amount_paid') num amountPaid,
    @JsonKey(name: 'balance_due') num balanceDue,
    List<InvoiceItem> items,
  });
}

/// @nodoc
class _$InvoiceFinancialsCopyWithImpl<$Res, $Val extends InvoiceFinancials>
    implements $InvoiceFinancialsCopyWith<$Res> {
  _$InvoiceFinancialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceFinancials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? subTotal = null,
    Object? taxTotal = null,
    Object? grandTotal = null,
    Object? amountPaid = null,
    Object? balanceDue = null,
    Object? items = null,
  }) {
    return _then(
      _value.copyWith(
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            subTotal: null == subTotal
                ? _value.subTotal
                : subTotal // ignore: cast_nullable_to_non_nullable
                      as num,
            taxTotal: null == taxTotal
                ? _value.taxTotal
                : taxTotal // ignore: cast_nullable_to_non_nullable
                      as num,
            grandTotal: null == grandTotal
                ? _value.grandTotal
                : grandTotal // ignore: cast_nullable_to_non_nullable
                      as num,
            amountPaid: null == amountPaid
                ? _value.amountPaid
                : amountPaid // ignore: cast_nullable_to_non_nullable
                      as num,
            balanceDue: null == balanceDue
                ? _value.balanceDue
                : balanceDue // ignore: cast_nullable_to_non_nullable
                      as num,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<InvoiceItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvoiceFinancialsImplCopyWith<$Res>
    implements $InvoiceFinancialsCopyWith<$Res> {
  factory _$$InvoiceFinancialsImplCopyWith(
    _$InvoiceFinancialsImpl value,
    $Res Function(_$InvoiceFinancialsImpl) then,
  ) = __$$InvoiceFinancialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? status,
    @JsonKey(name: 'sub_total') num subTotal,
    @JsonKey(name: 'tax_total') num taxTotal,
    @JsonKey(name: 'grand_total') num grandTotal,
    @JsonKey(name: 'amount_paid') num amountPaid,
    @JsonKey(name: 'balance_due') num balanceDue,
    List<InvoiceItem> items,
  });
}

/// @nodoc
class __$$InvoiceFinancialsImplCopyWithImpl<$Res>
    extends _$InvoiceFinancialsCopyWithImpl<$Res, _$InvoiceFinancialsImpl>
    implements _$$InvoiceFinancialsImplCopyWith<$Res> {
  __$$InvoiceFinancialsImplCopyWithImpl(
    _$InvoiceFinancialsImpl _value,
    $Res Function(_$InvoiceFinancialsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvoiceFinancials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? subTotal = null,
    Object? taxTotal = null,
    Object? grandTotal = null,
    Object? amountPaid = null,
    Object? balanceDue = null,
    Object? items = null,
  }) {
    return _then(
      _$InvoiceFinancialsImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        subTotal: null == subTotal
            ? _value.subTotal
            : subTotal // ignore: cast_nullable_to_non_nullable
                  as num,
        taxTotal: null == taxTotal
            ? _value.taxTotal
            : taxTotal // ignore: cast_nullable_to_non_nullable
                  as num,
        grandTotal: null == grandTotal
            ? _value.grandTotal
            : grandTotal // ignore: cast_nullable_to_non_nullable
                  as num,
        amountPaid: null == amountPaid
            ? _value.amountPaid
            : amountPaid // ignore: cast_nullable_to_non_nullable
                  as num,
        balanceDue: null == balanceDue
            ? _value.balanceDue
            : balanceDue // ignore: cast_nullable_to_non_nullable
                  as num,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<InvoiceItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceFinancialsImpl implements _InvoiceFinancials {
  const _$InvoiceFinancialsImpl({
    this.status,
    @JsonKey(name: 'sub_total') required this.subTotal,
    @JsonKey(name: 'tax_total') required this.taxTotal,
    @JsonKey(name: 'grand_total') required this.grandTotal,
    @JsonKey(name: 'amount_paid') required this.amountPaid,
    @JsonKey(name: 'balance_due') required this.balanceDue,
    final List<InvoiceItem> items = const [],
  }) : _items = items;

  factory _$InvoiceFinancialsImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceFinancialsImplFromJson(json);

  @override
  final String? status;
  @override
  @JsonKey(name: 'sub_total')
  final num subTotal;
  @override
  @JsonKey(name: 'tax_total')
  final num taxTotal;
  @override
  @JsonKey(name: 'grand_total')
  final num grandTotal;
  @override
  @JsonKey(name: 'amount_paid')
  final num amountPaid;
  @override
  @JsonKey(name: 'balance_due')
  final num balanceDue;
  final List<InvoiceItem> _items;
  @override
  @JsonKey()
  List<InvoiceItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'InvoiceFinancials(status: $status, subTotal: $subTotal, taxTotal: $taxTotal, grandTotal: $grandTotal, amountPaid: $amountPaid, balanceDue: $balanceDue, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceFinancialsImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.taxTotal, taxTotal) ||
                other.taxTotal == taxTotal) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.balanceDue, balanceDue) ||
                other.balanceDue == balanceDue) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    subTotal,
    taxTotal,
    grandTotal,
    amountPaid,
    balanceDue,
    const DeepCollectionEquality().hash(_items),
  );

  /// Create a copy of InvoiceFinancials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceFinancialsImplCopyWith<_$InvoiceFinancialsImpl> get copyWith =>
      __$$InvoiceFinancialsImplCopyWithImpl<_$InvoiceFinancialsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceFinancialsImplToJson(this);
  }
}

abstract class _InvoiceFinancials implements InvoiceFinancials {
  const factory _InvoiceFinancials({
    final String? status,
    @JsonKey(name: 'sub_total') required final num subTotal,
    @JsonKey(name: 'tax_total') required final num taxTotal,
    @JsonKey(name: 'grand_total') required final num grandTotal,
    @JsonKey(name: 'amount_paid') required final num amountPaid,
    @JsonKey(name: 'balance_due') required final num balanceDue,
    final List<InvoiceItem> items,
  }) = _$InvoiceFinancialsImpl;

  factory _InvoiceFinancials.fromJson(Map<String, dynamic> json) =
      _$InvoiceFinancialsImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: 'sub_total')
  num get subTotal;
  @override
  @JsonKey(name: 'tax_total')
  num get taxTotal;
  @override
  @JsonKey(name: 'grand_total')
  num get grandTotal;
  @override
  @JsonKey(name: 'amount_paid')
  num get amountPaid;
  @override
  @JsonKey(name: 'balance_due')
  num get balanceDue;
  @override
  List<InvoiceItem> get items;

  /// Create a copy of InvoiceFinancials
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceFinancialsImplCopyWith<_$InvoiceFinancialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceItem _$InvoiceItemFromJson(Map<String, dynamic> json) {
  return _InvoiceItem.fromJson(json);
}

/// @nodoc
mixin _$InvoiceItem {
  String get desc => throw _privateConstructorUsedError;
  num get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_price')
  num get unitPrice => throw _privateConstructorUsedError;
  num get total => throw _privateConstructorUsedError;

  /// Serializes this InvoiceItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceItemCopyWith<InvoiceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceItemCopyWith<$Res> {
  factory $InvoiceItemCopyWith(
    InvoiceItem value,
    $Res Function(InvoiceItem) then,
  ) = _$InvoiceItemCopyWithImpl<$Res, InvoiceItem>;
  @useResult
  $Res call({
    String desc,
    num qty,
    @JsonKey(name: 'unit_price') num unitPrice,
    num total,
  });
}

/// @nodoc
class _$InvoiceItemCopyWithImpl<$Res, $Val extends InvoiceItem>
    implements $InvoiceItemCopyWith<$Res> {
  _$InvoiceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? desc = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? total = null,
  }) {
    return _then(
      _value.copyWith(
            desc: null == desc
                ? _value.desc
                : desc // ignore: cast_nullable_to_non_nullable
                      as String,
            qty: null == qty
                ? _value.qty
                : qty // ignore: cast_nullable_to_non_nullable
                      as num,
            unitPrice: null == unitPrice
                ? _value.unitPrice
                : unitPrice // ignore: cast_nullable_to_non_nullable
                      as num,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as num,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvoiceItemImplCopyWith<$Res>
    implements $InvoiceItemCopyWith<$Res> {
  factory _$$InvoiceItemImplCopyWith(
    _$InvoiceItemImpl value,
    $Res Function(_$InvoiceItemImpl) then,
  ) = __$$InvoiceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String desc,
    num qty,
    @JsonKey(name: 'unit_price') num unitPrice,
    num total,
  });
}

/// @nodoc
class __$$InvoiceItemImplCopyWithImpl<$Res>
    extends _$InvoiceItemCopyWithImpl<$Res, _$InvoiceItemImpl>
    implements _$$InvoiceItemImplCopyWith<$Res> {
  __$$InvoiceItemImplCopyWithImpl(
    _$InvoiceItemImpl _value,
    $Res Function(_$InvoiceItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? desc = null,
    Object? qty = null,
    Object? unitPrice = null,
    Object? total = null,
  }) {
    return _then(
      _$InvoiceItemImpl(
        desc: null == desc
            ? _value.desc
            : desc // ignore: cast_nullable_to_non_nullable
                  as String,
        qty: null == qty
            ? _value.qty
            : qty // ignore: cast_nullable_to_non_nullable
                  as num,
        unitPrice: null == unitPrice
            ? _value.unitPrice
            : unitPrice // ignore: cast_nullable_to_non_nullable
                  as num,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as num,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceItemImpl implements _InvoiceItem {
  const _$InvoiceItemImpl({
    required this.desc,
    required this.qty,
    @JsonKey(name: 'unit_price') required this.unitPrice,
    required this.total,
  });

  factory _$InvoiceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceItemImplFromJson(json);

  @override
  final String desc;
  @override
  final num qty;
  @override
  @JsonKey(name: 'unit_price')
  final num unitPrice;
  @override
  final num total;

  @override
  String toString() {
    return 'InvoiceItem(desc: $desc, qty: $qty, unitPrice: $unitPrice, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceItemImpl &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, desc, qty, unitPrice, total);

  /// Create a copy of InvoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceItemImplCopyWith<_$InvoiceItemImpl> get copyWith =>
      __$$InvoiceItemImplCopyWithImpl<_$InvoiceItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceItemImplToJson(this);
  }
}

abstract class _InvoiceItem implements InvoiceItem {
  const factory _InvoiceItem({
    required final String desc,
    required final num qty,
    @JsonKey(name: 'unit_price') required final num unitPrice,
    required final num total,
  }) = _$InvoiceItemImpl;

  factory _InvoiceItem.fromJson(Map<String, dynamic> json) =
      _$InvoiceItemImpl.fromJson;

  @override
  String get desc;
  @override
  num get qty;
  @override
  @JsonKey(name: 'unit_price')
  num get unitPrice;
  @override
  num get total;

  /// Create a copy of InvoiceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceItemImplCopyWith<_$InvoiceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrescriptionPrintData _$PrescriptionPrintDataFromJson(
  Map<String, dynamic> json,
) {
  return _PrescriptionPrintData.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionPrintData {
  PrescriptionMeta get meta => throw _privateConstructorUsedError;
  PrescriptionClinic get clinic => throw _privateConstructorUsedError;
  PrescriptionDoctor get doctor => throw _privateConstructorUsedError;
  PrescriptionPatient get patient => throw _privateConstructorUsedError;
  PrescriptionClinical? get clinical => throw _privateConstructorUsedError;
  @JsonKey(name: 'rx_items')
  List<PrescriptionMedicine> get rxItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'lab_orders')
  List<PrescriptionLab> get labOrders => throw _privateConstructorUsedError;
  PrescriptionAdvice get advice => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionPrintData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionPrintData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionPrintDataCopyWith<PrescriptionPrintData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionPrintDataCopyWith<$Res> {
  factory $PrescriptionPrintDataCopyWith(
    PrescriptionPrintData value,
    $Res Function(PrescriptionPrintData) then,
  ) = _$PrescriptionPrintDataCopyWithImpl<$Res, PrescriptionPrintData>;
  @useResult
  $Res call({
    PrescriptionMeta meta,
    PrescriptionClinic clinic,
    PrescriptionDoctor doctor,
    PrescriptionPatient patient,
    PrescriptionClinical? clinical,
    @JsonKey(name: 'rx_items') List<PrescriptionMedicine> rxItems,
    @JsonKey(name: 'lab_orders') List<PrescriptionLab> labOrders,
    PrescriptionAdvice advice,
  });

  $PrescriptionMetaCopyWith<$Res> get meta;
  $PrescriptionClinicCopyWith<$Res> get clinic;
  $PrescriptionDoctorCopyWith<$Res> get doctor;
  $PrescriptionPatientCopyWith<$Res> get patient;
  $PrescriptionClinicalCopyWith<$Res>? get clinical;
  $PrescriptionAdviceCopyWith<$Res> get advice;
}

/// @nodoc
class _$PrescriptionPrintDataCopyWithImpl<
  $Res,
  $Val extends PrescriptionPrintData
>
    implements $PrescriptionPrintDataCopyWith<$Res> {
  _$PrescriptionPrintDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionPrintData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? clinic = null,
    Object? doctor = null,
    Object? patient = null,
    Object? clinical = freezed,
    Object? rxItems = null,
    Object? labOrders = null,
    Object? advice = null,
  }) {
    return _then(
      _value.copyWith(
            meta: null == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as PrescriptionMeta,
            clinic: null == clinic
                ? _value.clinic
                : clinic // ignore: cast_nullable_to_non_nullable
                      as PrescriptionClinic,
            doctor: null == doctor
                ? _value.doctor
                : doctor // ignore: cast_nullable_to_non_nullable
                      as PrescriptionDoctor,
            patient: null == patient
                ? _value.patient
                : patient // ignore: cast_nullable_to_non_nullable
                      as PrescriptionPatient,
            clinical: freezed == clinical
                ? _value.clinical
                : clinical // ignore: cast_nullable_to_non_nullable
                      as PrescriptionClinical?,
            rxItems: null == rxItems
                ? _value.rxItems
                : rxItems // ignore: cast_nullable_to_non_nullable
                      as List<PrescriptionMedicine>,
            labOrders: null == labOrders
                ? _value.labOrders
                : labOrders // ignore: cast_nullable_to_non_nullable
                      as List<PrescriptionLab>,
            advice: null == advice
                ? _value.advice
                : advice // ignore: cast_nullable_to_non_nullable
                      as PrescriptionAdvice,
          )
          as $Val,
    );
  }

  /// Create a copy of PrescriptionPrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrescriptionMetaCopyWith<$Res> get meta {
    return $PrescriptionMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of PrescriptionPrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrescriptionClinicCopyWith<$Res> get clinic {
    return $PrescriptionClinicCopyWith<$Res>(_value.clinic, (value) {
      return _then(_value.copyWith(clinic: value) as $Val);
    });
  }

  /// Create a copy of PrescriptionPrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrescriptionDoctorCopyWith<$Res> get doctor {
    return $PrescriptionDoctorCopyWith<$Res>(_value.doctor, (value) {
      return _then(_value.copyWith(doctor: value) as $Val);
    });
  }

  /// Create a copy of PrescriptionPrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrescriptionPatientCopyWith<$Res> get patient {
    return $PrescriptionPatientCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }

  /// Create a copy of PrescriptionPrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrescriptionClinicalCopyWith<$Res>? get clinical {
    if (_value.clinical == null) {
      return null;
    }

    return $PrescriptionClinicalCopyWith<$Res>(_value.clinical!, (value) {
      return _then(_value.copyWith(clinical: value) as $Val);
    });
  }

  /// Create a copy of PrescriptionPrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrescriptionAdviceCopyWith<$Res> get advice {
    return $PrescriptionAdviceCopyWith<$Res>(_value.advice, (value) {
      return _then(_value.copyWith(advice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrescriptionPrintDataImplCopyWith<$Res>
    implements $PrescriptionPrintDataCopyWith<$Res> {
  factory _$$PrescriptionPrintDataImplCopyWith(
    _$PrescriptionPrintDataImpl value,
    $Res Function(_$PrescriptionPrintDataImpl) then,
  ) = __$$PrescriptionPrintDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PrescriptionMeta meta,
    PrescriptionClinic clinic,
    PrescriptionDoctor doctor,
    PrescriptionPatient patient,
    PrescriptionClinical? clinical,
    @JsonKey(name: 'rx_items') List<PrescriptionMedicine> rxItems,
    @JsonKey(name: 'lab_orders') List<PrescriptionLab> labOrders,
    PrescriptionAdvice advice,
  });

  @override
  $PrescriptionMetaCopyWith<$Res> get meta;
  @override
  $PrescriptionClinicCopyWith<$Res> get clinic;
  @override
  $PrescriptionDoctorCopyWith<$Res> get doctor;
  @override
  $PrescriptionPatientCopyWith<$Res> get patient;
  @override
  $PrescriptionClinicalCopyWith<$Res>? get clinical;
  @override
  $PrescriptionAdviceCopyWith<$Res> get advice;
}

/// @nodoc
class __$$PrescriptionPrintDataImplCopyWithImpl<$Res>
    extends
        _$PrescriptionPrintDataCopyWithImpl<$Res, _$PrescriptionPrintDataImpl>
    implements _$$PrescriptionPrintDataImplCopyWith<$Res> {
  __$$PrescriptionPrintDataImplCopyWithImpl(
    _$PrescriptionPrintDataImpl _value,
    $Res Function(_$PrescriptionPrintDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescriptionPrintData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? clinic = null,
    Object? doctor = null,
    Object? patient = null,
    Object? clinical = freezed,
    Object? rxItems = null,
    Object? labOrders = null,
    Object? advice = null,
  }) {
    return _then(
      _$PrescriptionPrintDataImpl(
        meta: null == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as PrescriptionMeta,
        clinic: null == clinic
            ? _value.clinic
            : clinic // ignore: cast_nullable_to_non_nullable
                  as PrescriptionClinic,
        doctor: null == doctor
            ? _value.doctor
            : doctor // ignore: cast_nullable_to_non_nullable
                  as PrescriptionDoctor,
        patient: null == patient
            ? _value.patient
            : patient // ignore: cast_nullable_to_non_nullable
                  as PrescriptionPatient,
        clinical: freezed == clinical
            ? _value.clinical
            : clinical // ignore: cast_nullable_to_non_nullable
                  as PrescriptionClinical?,
        rxItems: null == rxItems
            ? _value._rxItems
            : rxItems // ignore: cast_nullable_to_non_nullable
                  as List<PrescriptionMedicine>,
        labOrders: null == labOrders
            ? _value._labOrders
            : labOrders // ignore: cast_nullable_to_non_nullable
                  as List<PrescriptionLab>,
        advice: null == advice
            ? _value.advice
            : advice // ignore: cast_nullable_to_non_nullable
                  as PrescriptionAdvice,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionPrintDataImpl implements _PrescriptionPrintData {
  const _$PrescriptionPrintDataImpl({
    required this.meta,
    required this.clinic,
    required this.doctor,
    required this.patient,
    this.clinical,
    @JsonKey(name: 'rx_items')
    final List<PrescriptionMedicine> rxItems = const [],
    @JsonKey(name: 'lab_orders')
    final List<PrescriptionLab> labOrders = const [],
    required this.advice,
  }) : _rxItems = rxItems,
       _labOrders = labOrders;

  factory _$PrescriptionPrintDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionPrintDataImplFromJson(json);

  @override
  final PrescriptionMeta meta;
  @override
  final PrescriptionClinic clinic;
  @override
  final PrescriptionDoctor doctor;
  @override
  final PrescriptionPatient patient;
  @override
  final PrescriptionClinical? clinical;
  final List<PrescriptionMedicine> _rxItems;
  @override
  @JsonKey(name: 'rx_items')
  List<PrescriptionMedicine> get rxItems {
    if (_rxItems is EqualUnmodifiableListView) return _rxItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rxItems);
  }

  final List<PrescriptionLab> _labOrders;
  @override
  @JsonKey(name: 'lab_orders')
  List<PrescriptionLab> get labOrders {
    if (_labOrders is EqualUnmodifiableListView) return _labOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labOrders);
  }

  @override
  final PrescriptionAdvice advice;

  @override
  String toString() {
    return 'PrescriptionPrintData(meta: $meta, clinic: $clinic, doctor: $doctor, patient: $patient, clinical: $clinical, rxItems: $rxItems, labOrders: $labOrders, advice: $advice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionPrintDataImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.clinic, clinic) || other.clinic == clinic) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.clinical, clinical) ||
                other.clinical == clinical) &&
            const DeepCollectionEquality().equals(other._rxItems, _rxItems) &&
            const DeepCollectionEquality().equals(
              other._labOrders,
              _labOrders,
            ) &&
            (identical(other.advice, advice) || other.advice == advice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    meta,
    clinic,
    doctor,
    patient,
    clinical,
    const DeepCollectionEquality().hash(_rxItems),
    const DeepCollectionEquality().hash(_labOrders),
    advice,
  );

  /// Create a copy of PrescriptionPrintData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionPrintDataImplCopyWith<_$PrescriptionPrintDataImpl>
  get copyWith =>
      __$$PrescriptionPrintDataImplCopyWithImpl<_$PrescriptionPrintDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionPrintDataImplToJson(this);
  }
}

abstract class _PrescriptionPrintData implements PrescriptionPrintData {
  const factory _PrescriptionPrintData({
    required final PrescriptionMeta meta,
    required final PrescriptionClinic clinic,
    required final PrescriptionDoctor doctor,
    required final PrescriptionPatient patient,
    final PrescriptionClinical? clinical,
    @JsonKey(name: 'rx_items') final List<PrescriptionMedicine> rxItems,
    @JsonKey(name: 'lab_orders') final List<PrescriptionLab> labOrders,
    required final PrescriptionAdvice advice,
  }) = _$PrescriptionPrintDataImpl;

  factory _PrescriptionPrintData.fromJson(Map<String, dynamic> json) =
      _$PrescriptionPrintDataImpl.fromJson;

  @override
  PrescriptionMeta get meta;
  @override
  PrescriptionClinic get clinic;
  @override
  PrescriptionDoctor get doctor;
  @override
  PrescriptionPatient get patient;
  @override
  PrescriptionClinical? get clinical;
  @override
  @JsonKey(name: 'rx_items')
  List<PrescriptionMedicine> get rxItems;
  @override
  @JsonKey(name: 'lab_orders')
  List<PrescriptionLab> get labOrders;
  @override
  PrescriptionAdvice get advice;

  /// Create a copy of PrescriptionPrintData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionPrintDataImplCopyWith<_$PrescriptionPrintDataImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PrescriptionMeta _$PrescriptionMetaFromJson(Map<String, dynamic> json) {
  return _PrescriptionMeta.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionMeta {
  @JsonKey(name: 'generated_at')
  String get generatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'appointment_number')
  String get appointmentNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit_type')
  String get visitType => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit_date')
  String get visitDate => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionMetaCopyWith<PrescriptionMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionMetaCopyWith<$Res> {
  factory $PrescriptionMetaCopyWith(
    PrescriptionMeta value,
    $Res Function(PrescriptionMeta) then,
  ) = _$PrescriptionMetaCopyWithImpl<$Res, PrescriptionMeta>;
  @useResult
  $Res call({
    @JsonKey(name: 'generated_at') String generatedAt,
    @JsonKey(name: 'appointment_number') String appointmentNumber,
    @JsonKey(name: 'visit_type') String visitType,
    @JsonKey(name: 'visit_date') String visitDate,
  });
}

/// @nodoc
class _$PrescriptionMetaCopyWithImpl<$Res, $Val extends PrescriptionMeta>
    implements $PrescriptionMetaCopyWith<$Res> {
  _$PrescriptionMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedAt = null,
    Object? appointmentNumber = null,
    Object? visitType = null,
    Object? visitDate = null,
  }) {
    return _then(
      _value.copyWith(
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            appointmentNumber: null == appointmentNumber
                ? _value.appointmentNumber
                : appointmentNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            visitType: null == visitType
                ? _value.visitType
                : visitType // ignore: cast_nullable_to_non_nullable
                      as String,
            visitDate: null == visitDate
                ? _value.visitDate
                : visitDate // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrescriptionMetaImplCopyWith<$Res>
    implements $PrescriptionMetaCopyWith<$Res> {
  factory _$$PrescriptionMetaImplCopyWith(
    _$PrescriptionMetaImpl value,
    $Res Function(_$PrescriptionMetaImpl) then,
  ) = __$$PrescriptionMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'generated_at') String generatedAt,
    @JsonKey(name: 'appointment_number') String appointmentNumber,
    @JsonKey(name: 'visit_type') String visitType,
    @JsonKey(name: 'visit_date') String visitDate,
  });
}

/// @nodoc
class __$$PrescriptionMetaImplCopyWithImpl<$Res>
    extends _$PrescriptionMetaCopyWithImpl<$Res, _$PrescriptionMetaImpl>
    implements _$$PrescriptionMetaImplCopyWith<$Res> {
  __$$PrescriptionMetaImplCopyWithImpl(
    _$PrescriptionMetaImpl _value,
    $Res Function(_$PrescriptionMetaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescriptionMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generatedAt = null,
    Object? appointmentNumber = null,
    Object? visitType = null,
    Object? visitDate = null,
  }) {
    return _then(
      _$PrescriptionMetaImpl(
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        appointmentNumber: null == appointmentNumber
            ? _value.appointmentNumber
            : appointmentNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        visitType: null == visitType
            ? _value.visitType
            : visitType // ignore: cast_nullable_to_non_nullable
                  as String,
        visitDate: null == visitDate
            ? _value.visitDate
            : visitDate // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionMetaImpl implements _PrescriptionMeta {
  const _$PrescriptionMetaImpl({
    @JsonKey(name: 'generated_at') required this.generatedAt,
    @JsonKey(name: 'appointment_number') required this.appointmentNumber,
    @JsonKey(name: 'visit_type') required this.visitType,
    @JsonKey(name: 'visit_date') required this.visitDate,
  });

  factory _$PrescriptionMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionMetaImplFromJson(json);

  @override
  @JsonKey(name: 'generated_at')
  final String generatedAt;
  @override
  @JsonKey(name: 'appointment_number')
  final String appointmentNumber;
  @override
  @JsonKey(name: 'visit_type')
  final String visitType;
  @override
  @JsonKey(name: 'visit_date')
  final String visitDate;

  @override
  String toString() {
    return 'PrescriptionMeta(generatedAt: $generatedAt, appointmentNumber: $appointmentNumber, visitType: $visitType, visitDate: $visitDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionMetaImpl &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.appointmentNumber, appointmentNumber) ||
                other.appointmentNumber == appointmentNumber) &&
            (identical(other.visitType, visitType) ||
                other.visitType == visitType) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    generatedAt,
    appointmentNumber,
    visitType,
    visitDate,
  );

  /// Create a copy of PrescriptionMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionMetaImplCopyWith<_$PrescriptionMetaImpl> get copyWith =>
      __$$PrescriptionMetaImplCopyWithImpl<_$PrescriptionMetaImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionMetaImplToJson(this);
  }
}

abstract class _PrescriptionMeta implements PrescriptionMeta {
  const factory _PrescriptionMeta({
    @JsonKey(name: 'generated_at') required final String generatedAt,
    @JsonKey(name: 'appointment_number')
    required final String appointmentNumber,
    @JsonKey(name: 'visit_type') required final String visitType,
    @JsonKey(name: 'visit_date') required final String visitDate,
  }) = _$PrescriptionMetaImpl;

  factory _PrescriptionMeta.fromJson(Map<String, dynamic> json) =
      _$PrescriptionMetaImpl.fromJson;

  @override
  @JsonKey(name: 'generated_at')
  String get generatedAt;
  @override
  @JsonKey(name: 'appointment_number')
  String get appointmentNumber;
  @override
  @JsonKey(name: 'visit_type')
  String get visitType;
  @override
  @JsonKey(name: 'visit_date')
  String get visitDate;

  /// Create a copy of PrescriptionMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionMetaImplCopyWith<_$PrescriptionMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrescriptionClinic _$PrescriptionClinicFromJson(Map<String, dynamic> json) {
  return _PrescriptionClinic.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionClinic {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo_url')
  String? get logoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'header_image_url')
  String? get headerImageUrl => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'footer_text')
  String? get footerText => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionClinic to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionClinic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionClinicCopyWith<PrescriptionClinic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionClinicCopyWith<$Res> {
  factory $PrescriptionClinicCopyWith(
    PrescriptionClinic value,
    $Res Function(PrescriptionClinic) then,
  ) = _$PrescriptionClinicCopyWithImpl<$Res, PrescriptionClinic>;
  @useResult
  $Res call({
    String name,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'header_image_url') String? headerImageUrl,
    String? phone,
    String? email,
    String? address,
    @JsonKey(name: 'footer_text') String? footerText,
  });
}

/// @nodoc
class _$PrescriptionClinicCopyWithImpl<$Res, $Val extends PrescriptionClinic>
    implements $PrescriptionClinicCopyWith<$Res> {
  _$PrescriptionClinicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionClinic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? logoUrl = freezed,
    Object? headerImageUrl = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? footerText = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            logoUrl: freezed == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            headerImageUrl: freezed == headerImageUrl
                ? _value.headerImageUrl
                : headerImageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            footerText: freezed == footerText
                ? _value.footerText
                : footerText // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrescriptionClinicImplCopyWith<$Res>
    implements $PrescriptionClinicCopyWith<$Res> {
  factory _$$PrescriptionClinicImplCopyWith(
    _$PrescriptionClinicImpl value,
    $Res Function(_$PrescriptionClinicImpl) then,
  ) = __$$PrescriptionClinicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    @JsonKey(name: 'logo_url') String? logoUrl,
    @JsonKey(name: 'header_image_url') String? headerImageUrl,
    String? phone,
    String? email,
    String? address,
    @JsonKey(name: 'footer_text') String? footerText,
  });
}

/// @nodoc
class __$$PrescriptionClinicImplCopyWithImpl<$Res>
    extends _$PrescriptionClinicCopyWithImpl<$Res, _$PrescriptionClinicImpl>
    implements _$$PrescriptionClinicImplCopyWith<$Res> {
  __$$PrescriptionClinicImplCopyWithImpl(
    _$PrescriptionClinicImpl _value,
    $Res Function(_$PrescriptionClinicImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescriptionClinic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? logoUrl = freezed,
    Object? headerImageUrl = freezed,
    Object? phone = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? footerText = freezed,
  }) {
    return _then(
      _$PrescriptionClinicImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        logoUrl: freezed == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        headerImageUrl: freezed == headerImageUrl
            ? _value.headerImageUrl
            : headerImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        footerText: freezed == footerText
            ? _value.footerText
            : footerText // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionClinicImpl implements _PrescriptionClinic {
  const _$PrescriptionClinicImpl({
    required this.name,
    @JsonKey(name: 'logo_url') this.logoUrl,
    @JsonKey(name: 'header_image_url') this.headerImageUrl,
    this.phone,
    this.email,
    this.address,
    @JsonKey(name: 'footer_text') this.footerText,
  });

  factory _$PrescriptionClinicImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionClinicImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @override
  @JsonKey(name: 'header_image_url')
  final String? headerImageUrl;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String? address;
  @override
  @JsonKey(name: 'footer_text')
  final String? footerText;

  @override
  String toString() {
    return 'PrescriptionClinic(name: $name, logoUrl: $logoUrl, headerImageUrl: $headerImageUrl, phone: $phone, email: $email, address: $address, footerText: $footerText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionClinicImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.headerImageUrl, headerImageUrl) ||
                other.headerImageUrl == headerImageUrl) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.footerText, footerText) ||
                other.footerText == footerText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    logoUrl,
    headerImageUrl,
    phone,
    email,
    address,
    footerText,
  );

  /// Create a copy of PrescriptionClinic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionClinicImplCopyWith<_$PrescriptionClinicImpl> get copyWith =>
      __$$PrescriptionClinicImplCopyWithImpl<_$PrescriptionClinicImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionClinicImplToJson(this);
  }
}

abstract class _PrescriptionClinic implements PrescriptionClinic {
  const factory _PrescriptionClinic({
    required final String name,
    @JsonKey(name: 'logo_url') final String? logoUrl,
    @JsonKey(name: 'header_image_url') final String? headerImageUrl,
    final String? phone,
    final String? email,
    final String? address,
    @JsonKey(name: 'footer_text') final String? footerText,
  }) = _$PrescriptionClinicImpl;

  factory _PrescriptionClinic.fromJson(Map<String, dynamic> json) =
      _$PrescriptionClinicImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
  @override
  @JsonKey(name: 'header_image_url')
  String? get headerImageUrl;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String? get address;
  @override
  @JsonKey(name: 'footer_text')
  String? get footerText;

  /// Create a copy of PrescriptionClinic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionClinicImplCopyWith<_$PrescriptionClinicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrescriptionDoctor _$PrescriptionDoctorFromJson(Map<String, dynamic> json) {
  return _PrescriptionDoctor.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionDoctor {
  String get name => throw _privateConstructorUsedError;
  String? get specialty => throw _privateConstructorUsedError;
  String? get qualifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'reg_number')
  String? get regNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'signature_url')
  String? get signatureUrl => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionDoctor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionDoctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionDoctorCopyWith<PrescriptionDoctor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionDoctorCopyWith<$Res> {
  factory $PrescriptionDoctorCopyWith(
    PrescriptionDoctor value,
    $Res Function(PrescriptionDoctor) then,
  ) = _$PrescriptionDoctorCopyWithImpl<$Res, PrescriptionDoctor>;
  @useResult
  $Res call({
    String name,
    String? specialty,
    String? qualifications,
    @JsonKey(name: 'reg_number') String? regNumber,
    @JsonKey(name: 'signature_url') String? signatureUrl,
  });
}

/// @nodoc
class _$PrescriptionDoctorCopyWithImpl<$Res, $Val extends PrescriptionDoctor>
    implements $PrescriptionDoctorCopyWith<$Res> {
  _$PrescriptionDoctorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionDoctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? specialty = freezed,
    Object? qualifications = freezed,
    Object? regNumber = freezed,
    Object? signatureUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            specialty: freezed == specialty
                ? _value.specialty
                : specialty // ignore: cast_nullable_to_non_nullable
                      as String?,
            qualifications: freezed == qualifications
                ? _value.qualifications
                : qualifications // ignore: cast_nullable_to_non_nullable
                      as String?,
            regNumber: freezed == regNumber
                ? _value.regNumber
                : regNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            signatureUrl: freezed == signatureUrl
                ? _value.signatureUrl
                : signatureUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrescriptionDoctorImplCopyWith<$Res>
    implements $PrescriptionDoctorCopyWith<$Res> {
  factory _$$PrescriptionDoctorImplCopyWith(
    _$PrescriptionDoctorImpl value,
    $Res Function(_$PrescriptionDoctorImpl) then,
  ) = __$$PrescriptionDoctorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String? specialty,
    String? qualifications,
    @JsonKey(name: 'reg_number') String? regNumber,
    @JsonKey(name: 'signature_url') String? signatureUrl,
  });
}

/// @nodoc
class __$$PrescriptionDoctorImplCopyWithImpl<$Res>
    extends _$PrescriptionDoctorCopyWithImpl<$Res, _$PrescriptionDoctorImpl>
    implements _$$PrescriptionDoctorImplCopyWith<$Res> {
  __$$PrescriptionDoctorImplCopyWithImpl(
    _$PrescriptionDoctorImpl _value,
    $Res Function(_$PrescriptionDoctorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescriptionDoctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? specialty = freezed,
    Object? qualifications = freezed,
    Object? regNumber = freezed,
    Object? signatureUrl = freezed,
  }) {
    return _then(
      _$PrescriptionDoctorImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        specialty: freezed == specialty
            ? _value.specialty
            : specialty // ignore: cast_nullable_to_non_nullable
                  as String?,
        qualifications: freezed == qualifications
            ? _value.qualifications
            : qualifications // ignore: cast_nullable_to_non_nullable
                  as String?,
        regNumber: freezed == regNumber
            ? _value.regNumber
            : regNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        signatureUrl: freezed == signatureUrl
            ? _value.signatureUrl
            : signatureUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionDoctorImpl implements _PrescriptionDoctor {
  const _$PrescriptionDoctorImpl({
    required this.name,
    this.specialty,
    this.qualifications,
    @JsonKey(name: 'reg_number') this.regNumber,
    @JsonKey(name: 'signature_url') this.signatureUrl,
  });

  factory _$PrescriptionDoctorImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionDoctorImplFromJson(json);

  @override
  final String name;
  @override
  final String? specialty;
  @override
  final String? qualifications;
  @override
  @JsonKey(name: 'reg_number')
  final String? regNumber;
  @override
  @JsonKey(name: 'signature_url')
  final String? signatureUrl;

  @override
  String toString() {
    return 'PrescriptionDoctor(name: $name, specialty: $specialty, qualifications: $qualifications, regNumber: $regNumber, signatureUrl: $signatureUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionDoctorImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.qualifications, qualifications) ||
                other.qualifications == qualifications) &&
            (identical(other.regNumber, regNumber) ||
                other.regNumber == regNumber) &&
            (identical(other.signatureUrl, signatureUrl) ||
                other.signatureUrl == signatureUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    specialty,
    qualifications,
    regNumber,
    signatureUrl,
  );

  /// Create a copy of PrescriptionDoctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionDoctorImplCopyWith<_$PrescriptionDoctorImpl> get copyWith =>
      __$$PrescriptionDoctorImplCopyWithImpl<_$PrescriptionDoctorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionDoctorImplToJson(this);
  }
}

abstract class _PrescriptionDoctor implements PrescriptionDoctor {
  const factory _PrescriptionDoctor({
    required final String name,
    final String? specialty,
    final String? qualifications,
    @JsonKey(name: 'reg_number') final String? regNumber,
    @JsonKey(name: 'signature_url') final String? signatureUrl,
  }) = _$PrescriptionDoctorImpl;

  factory _PrescriptionDoctor.fromJson(Map<String, dynamic> json) =
      _$PrescriptionDoctorImpl.fromJson;

  @override
  String get name;
  @override
  String? get specialty;
  @override
  String? get qualifications;
  @override
  @JsonKey(name: 'reg_number')
  String? get regNumber;
  @override
  @JsonKey(name: 'signature_url')
  String? get signatureUrl;

  /// Create a copy of PrescriptionDoctor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionDoctorImplCopyWith<_$PrescriptionDoctorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrescriptionPatient _$PrescriptionPatientFromJson(Map<String, dynamic> json) {
  return _PrescriptionPatient.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionPatient {
  String get name => throw _privateConstructorUsedError;
  String get uhid => throw _privateConstructorUsedError;
  @JsonKey(name: 'age_gender')
  String get ageGender => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'known_allergies')
  List<String> get knownAllergies => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionPatient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionPatient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionPatientCopyWith<PrescriptionPatient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionPatientCopyWith<$Res> {
  factory $PrescriptionPatientCopyWith(
    PrescriptionPatient value,
    $Res Function(PrescriptionPatient) then,
  ) = _$PrescriptionPatientCopyWithImpl<$Res, PrescriptionPatient>;
  @useResult
  $Res call({
    String name,
    String uhid,
    @JsonKey(name: 'age_gender') String ageGender,
    String phone,
    String address,
    @JsonKey(name: 'known_allergies') List<String> knownAllergies,
  });
}

/// @nodoc
class _$PrescriptionPatientCopyWithImpl<$Res, $Val extends PrescriptionPatient>
    implements $PrescriptionPatientCopyWith<$Res> {
  _$PrescriptionPatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionPatient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uhid = null,
    Object? ageGender = null,
    Object? phone = null,
    Object? address = null,
    Object? knownAllergies = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            uhid: null == uhid
                ? _value.uhid
                : uhid // ignore: cast_nullable_to_non_nullable
                      as String,
            ageGender: null == ageGender
                ? _value.ageGender
                : ageGender // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            knownAllergies: null == knownAllergies
                ? _value.knownAllergies
                : knownAllergies // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrescriptionPatientImplCopyWith<$Res>
    implements $PrescriptionPatientCopyWith<$Res> {
  factory _$$PrescriptionPatientImplCopyWith(
    _$PrescriptionPatientImpl value,
    $Res Function(_$PrescriptionPatientImpl) then,
  ) = __$$PrescriptionPatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String uhid,
    @JsonKey(name: 'age_gender') String ageGender,
    String phone,
    String address,
    @JsonKey(name: 'known_allergies') List<String> knownAllergies,
  });
}

/// @nodoc
class __$$PrescriptionPatientImplCopyWithImpl<$Res>
    extends _$PrescriptionPatientCopyWithImpl<$Res, _$PrescriptionPatientImpl>
    implements _$$PrescriptionPatientImplCopyWith<$Res> {
  __$$PrescriptionPatientImplCopyWithImpl(
    _$PrescriptionPatientImpl _value,
    $Res Function(_$PrescriptionPatientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescriptionPatient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uhid = null,
    Object? ageGender = null,
    Object? phone = null,
    Object? address = null,
    Object? knownAllergies = null,
  }) {
    return _then(
      _$PrescriptionPatientImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        uhid: null == uhid
            ? _value.uhid
            : uhid // ignore: cast_nullable_to_non_nullable
                  as String,
        ageGender: null == ageGender
            ? _value.ageGender
            : ageGender // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        knownAllergies: null == knownAllergies
            ? _value._knownAllergies
            : knownAllergies // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionPatientImpl implements _PrescriptionPatient {
  const _$PrescriptionPatientImpl({
    required this.name,
    required this.uhid,
    @JsonKey(name: 'age_gender') required this.ageGender,
    required this.phone,
    required this.address,
    @JsonKey(name: 'known_allergies')
    final List<String> knownAllergies = const [],
  }) : _knownAllergies = knownAllergies;

  factory _$PrescriptionPatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionPatientImplFromJson(json);

  @override
  final String name;
  @override
  final String uhid;
  @override
  @JsonKey(name: 'age_gender')
  final String ageGender;
  @override
  final String phone;
  @override
  final String address;
  final List<String> _knownAllergies;
  @override
  @JsonKey(name: 'known_allergies')
  List<String> get knownAllergies {
    if (_knownAllergies is EqualUnmodifiableListView) return _knownAllergies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knownAllergies);
  }

  @override
  String toString() {
    return 'PrescriptionPatient(name: $name, uhid: $uhid, ageGender: $ageGender, phone: $phone, address: $address, knownAllergies: $knownAllergies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionPatientImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uhid, uhid) || other.uhid == uhid) &&
            (identical(other.ageGender, ageGender) ||
                other.ageGender == ageGender) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(
              other._knownAllergies,
              _knownAllergies,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    uhid,
    ageGender,
    phone,
    address,
    const DeepCollectionEquality().hash(_knownAllergies),
  );

  /// Create a copy of PrescriptionPatient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionPatientImplCopyWith<_$PrescriptionPatientImpl> get copyWith =>
      __$$PrescriptionPatientImplCopyWithImpl<_$PrescriptionPatientImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionPatientImplToJson(this);
  }
}

abstract class _PrescriptionPatient implements PrescriptionPatient {
  const factory _PrescriptionPatient({
    required final String name,
    required final String uhid,
    @JsonKey(name: 'age_gender') required final String ageGender,
    required final String phone,
    required final String address,
    @JsonKey(name: 'known_allergies') final List<String> knownAllergies,
  }) = _$PrescriptionPatientImpl;

  factory _PrescriptionPatient.fromJson(Map<String, dynamic> json) =
      _$PrescriptionPatientImpl.fromJson;

  @override
  String get name;
  @override
  String get uhid;
  @override
  @JsonKey(name: 'age_gender')
  String get ageGender;
  @override
  String get phone;
  @override
  String get address;
  @override
  @JsonKey(name: 'known_allergies')
  List<String> get knownAllergies;

  /// Create a copy of PrescriptionPatient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionPatientImplCopyWith<_$PrescriptionPatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrescriptionClinical _$PrescriptionClinicalFromJson(Map<String, dynamic> json) {
  return _PrescriptionClinical.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionClinical {
  Map<String, dynamic>? get vitals => throw _privateConstructorUsedError;
  dynamic get diagnosis =>
      throw _privateConstructorUsedError; // Can be string or list json, use carefully
  dynamic get symptoms => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  @JsonKey(name: 'chief_complaint')
  String? get chiefComplaint => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionClinical to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionClinical
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionClinicalCopyWith<PrescriptionClinical> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionClinicalCopyWith<$Res> {
  factory $PrescriptionClinicalCopyWith(
    PrescriptionClinical value,
    $Res Function(PrescriptionClinical) then,
  ) = _$PrescriptionClinicalCopyWithImpl<$Res, PrescriptionClinical>;
  @useResult
  $Res call({
    Map<String, dynamic>? vitals,
    dynamic diagnosis,
    dynamic symptoms,
    String? notes,
    @JsonKey(name: 'chief_complaint') String? chiefComplaint,
  });
}

/// @nodoc
class _$PrescriptionClinicalCopyWithImpl<
  $Res,
  $Val extends PrescriptionClinical
>
    implements $PrescriptionClinicalCopyWith<$Res> {
  _$PrescriptionClinicalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionClinical
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vitals = freezed,
    Object? diagnosis = freezed,
    Object? symptoms = freezed,
    Object? notes = freezed,
    Object? chiefComplaint = freezed,
  }) {
    return _then(
      _value.copyWith(
            vitals: freezed == vitals
                ? _value.vitals
                : vitals // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            diagnosis: freezed == diagnosis
                ? _value.diagnosis
                : diagnosis // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            symptoms: freezed == symptoms
                ? _value.symptoms
                : symptoms // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            chiefComplaint: freezed == chiefComplaint
                ? _value.chiefComplaint
                : chiefComplaint // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrescriptionClinicalImplCopyWith<$Res>
    implements $PrescriptionClinicalCopyWith<$Res> {
  factory _$$PrescriptionClinicalImplCopyWith(
    _$PrescriptionClinicalImpl value,
    $Res Function(_$PrescriptionClinicalImpl) then,
  ) = __$$PrescriptionClinicalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Map<String, dynamic>? vitals,
    dynamic diagnosis,
    dynamic symptoms,
    String? notes,
    @JsonKey(name: 'chief_complaint') String? chiefComplaint,
  });
}

/// @nodoc
class __$$PrescriptionClinicalImplCopyWithImpl<$Res>
    extends _$PrescriptionClinicalCopyWithImpl<$Res, _$PrescriptionClinicalImpl>
    implements _$$PrescriptionClinicalImplCopyWith<$Res> {
  __$$PrescriptionClinicalImplCopyWithImpl(
    _$PrescriptionClinicalImpl _value,
    $Res Function(_$PrescriptionClinicalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescriptionClinical
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vitals = freezed,
    Object? diagnosis = freezed,
    Object? symptoms = freezed,
    Object? notes = freezed,
    Object? chiefComplaint = freezed,
  }) {
    return _then(
      _$PrescriptionClinicalImpl(
        vitals: freezed == vitals
            ? _value._vitals
            : vitals // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        diagnosis: freezed == diagnosis
            ? _value.diagnosis
            : diagnosis // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        symptoms: freezed == symptoms
            ? _value.symptoms
            : symptoms // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        chiefComplaint: freezed == chiefComplaint
            ? _value.chiefComplaint
            : chiefComplaint // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionClinicalImpl implements _PrescriptionClinical {
  const _$PrescriptionClinicalImpl({
    final Map<String, dynamic>? vitals,
    this.diagnosis,
    this.symptoms,
    this.notes,
    @JsonKey(name: 'chief_complaint') this.chiefComplaint,
  }) : _vitals = vitals;

  factory _$PrescriptionClinicalImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionClinicalImplFromJson(json);

  final Map<String, dynamic>? _vitals;
  @override
  Map<String, dynamic>? get vitals {
    final value = _vitals;
    if (value == null) return null;
    if (_vitals is EqualUnmodifiableMapView) return _vitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final dynamic diagnosis;
  // Can be string or list json, use carefully
  @override
  final dynamic symptoms;
  @override
  final String? notes;
  @override
  @JsonKey(name: 'chief_complaint')
  final String? chiefComplaint;

  @override
  String toString() {
    return 'PrescriptionClinical(vitals: $vitals, diagnosis: $diagnosis, symptoms: $symptoms, notes: $notes, chiefComplaint: $chiefComplaint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionClinicalImpl &&
            const DeepCollectionEquality().equals(other._vitals, _vitals) &&
            const DeepCollectionEquality().equals(other.diagnosis, diagnosis) &&
            const DeepCollectionEquality().equals(other.symptoms, symptoms) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.chiefComplaint, chiefComplaint) ||
                other.chiefComplaint == chiefComplaint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_vitals),
    const DeepCollectionEquality().hash(diagnosis),
    const DeepCollectionEquality().hash(symptoms),
    notes,
    chiefComplaint,
  );

  /// Create a copy of PrescriptionClinical
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionClinicalImplCopyWith<_$PrescriptionClinicalImpl>
  get copyWith =>
      __$$PrescriptionClinicalImplCopyWithImpl<_$PrescriptionClinicalImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionClinicalImplToJson(this);
  }
}

abstract class _PrescriptionClinical implements PrescriptionClinical {
  const factory _PrescriptionClinical({
    final Map<String, dynamic>? vitals,
    final dynamic diagnosis,
    final dynamic symptoms,
    final String? notes,
    @JsonKey(name: 'chief_complaint') final String? chiefComplaint,
  }) = _$PrescriptionClinicalImpl;

  factory _PrescriptionClinical.fromJson(Map<String, dynamic> json) =
      _$PrescriptionClinicalImpl.fromJson;

  @override
  Map<String, dynamic>? get vitals;
  @override
  dynamic get diagnosis; // Can be string or list json, use carefully
  @override
  dynamic get symptoms;
  @override
  String? get notes;
  @override
  @JsonKey(name: 'chief_complaint')
  String? get chiefComplaint;

  /// Create a copy of PrescriptionClinical
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionClinicalImplCopyWith<_$PrescriptionClinicalImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PrescriptionMedicine _$PrescriptionMedicineFromJson(Map<String, dynamic> json) {
  return _PrescriptionMedicine.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionMedicine {
  @JsonKey(name: 'brand_name')
  String get brandName => throw _privateConstructorUsedError;
  @JsonKey(name: 'generic_name')
  String? get genericName => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get dosage =>
      throw _privateConstructorUsedError; // This maps to frequency in some views
  String? get duration => throw _privateConstructorUsedError;
  String? get instruction => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionMedicine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionMedicine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionMedicineCopyWith<PrescriptionMedicine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionMedicineCopyWith<$Res> {
  factory $PrescriptionMedicineCopyWith(
    PrescriptionMedicine value,
    $Res Function(PrescriptionMedicine) then,
  ) = _$PrescriptionMedicineCopyWithImpl<$Res, PrescriptionMedicine>;
  @useResult
  $Res call({
    @JsonKey(name: 'brand_name') String brandName,
    @JsonKey(name: 'generic_name') String? genericName,
    String? type,
    String? dosage,
    String? duration,
    String? instruction,
    String? note,
  });
}

/// @nodoc
class _$PrescriptionMedicineCopyWithImpl<
  $Res,
  $Val extends PrescriptionMedicine
>
    implements $PrescriptionMedicineCopyWith<$Res> {
  _$PrescriptionMedicineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionMedicine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandName = null,
    Object? genericName = freezed,
    Object? type = freezed,
    Object? dosage = freezed,
    Object? duration = freezed,
    Object? instruction = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _value.copyWith(
            brandName: null == brandName
                ? _value.brandName
                : brandName // ignore: cast_nullable_to_non_nullable
                      as String,
            genericName: freezed == genericName
                ? _value.genericName
                : genericName // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            dosage: freezed == dosage
                ? _value.dosage
                : dosage // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String?,
            instruction: freezed == instruction
                ? _value.instruction
                : instruction // ignore: cast_nullable_to_non_nullable
                      as String?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrescriptionMedicineImplCopyWith<$Res>
    implements $PrescriptionMedicineCopyWith<$Res> {
  factory _$$PrescriptionMedicineImplCopyWith(
    _$PrescriptionMedicineImpl value,
    $Res Function(_$PrescriptionMedicineImpl) then,
  ) = __$$PrescriptionMedicineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'brand_name') String brandName,
    @JsonKey(name: 'generic_name') String? genericName,
    String? type,
    String? dosage,
    String? duration,
    String? instruction,
    String? note,
  });
}

/// @nodoc
class __$$PrescriptionMedicineImplCopyWithImpl<$Res>
    extends _$PrescriptionMedicineCopyWithImpl<$Res, _$PrescriptionMedicineImpl>
    implements _$$PrescriptionMedicineImplCopyWith<$Res> {
  __$$PrescriptionMedicineImplCopyWithImpl(
    _$PrescriptionMedicineImpl _value,
    $Res Function(_$PrescriptionMedicineImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescriptionMedicine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brandName = null,
    Object? genericName = freezed,
    Object? type = freezed,
    Object? dosage = freezed,
    Object? duration = freezed,
    Object? instruction = freezed,
    Object? note = freezed,
  }) {
    return _then(
      _$PrescriptionMedicineImpl(
        brandName: null == brandName
            ? _value.brandName
            : brandName // ignore: cast_nullable_to_non_nullable
                  as String,
        genericName: freezed == genericName
            ? _value.genericName
            : genericName // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        dosage: freezed == dosage
            ? _value.dosage
            : dosage // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String?,
        instruction: freezed == instruction
            ? _value.instruction
            : instruction // ignore: cast_nullable_to_non_nullable
                  as String?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionMedicineImpl implements _PrescriptionMedicine {
  const _$PrescriptionMedicineImpl({
    @JsonKey(name: 'brand_name') required this.brandName,
    @JsonKey(name: 'generic_name') this.genericName,
    this.type,
    this.dosage,
    this.duration,
    this.instruction,
    this.note,
  });

  factory _$PrescriptionMedicineImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionMedicineImplFromJson(json);

  @override
  @JsonKey(name: 'brand_name')
  final String brandName;
  @override
  @JsonKey(name: 'generic_name')
  final String? genericName;
  @override
  final String? type;
  @override
  final String? dosage;
  // This maps to frequency in some views
  @override
  final String? duration;
  @override
  final String? instruction;
  @override
  final String? note;

  @override
  String toString() {
    return 'PrescriptionMedicine(brandName: $brandName, genericName: $genericName, type: $type, dosage: $dosage, duration: $duration, instruction: $instruction, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionMedicineImpl &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.genericName, genericName) ||
                other.genericName == genericName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    brandName,
    genericName,
    type,
    dosage,
    duration,
    instruction,
    note,
  );

  /// Create a copy of PrescriptionMedicine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionMedicineImplCopyWith<_$PrescriptionMedicineImpl>
  get copyWith =>
      __$$PrescriptionMedicineImplCopyWithImpl<_$PrescriptionMedicineImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionMedicineImplToJson(this);
  }
}

abstract class _PrescriptionMedicine implements PrescriptionMedicine {
  const factory _PrescriptionMedicine({
    @JsonKey(name: 'brand_name') required final String brandName,
    @JsonKey(name: 'generic_name') final String? genericName,
    final String? type,
    final String? dosage,
    final String? duration,
    final String? instruction,
    final String? note,
  }) = _$PrescriptionMedicineImpl;

  factory _PrescriptionMedicine.fromJson(Map<String, dynamic> json) =
      _$PrescriptionMedicineImpl.fromJson;

  @override
  @JsonKey(name: 'brand_name')
  String get brandName;
  @override
  @JsonKey(name: 'generic_name')
  String? get genericName;
  @override
  String? get type;
  @override
  String? get dosage; // This maps to frequency in some views
  @override
  String? get duration;
  @override
  String? get instruction;
  @override
  String? get note;

  /// Create a copy of PrescriptionMedicine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionMedicineImplCopyWith<_$PrescriptionMedicineImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PrescriptionLab _$PrescriptionLabFromJson(Map<String, dynamic> json) {
  return _PrescriptionLab.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionLab {
  @JsonKey(name: 'test_name')
  String get testName => throw _privateConstructorUsedError;
  String? get instruction => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionLab to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionLab
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionLabCopyWith<PrescriptionLab> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionLabCopyWith<$Res> {
  factory $PrescriptionLabCopyWith(
    PrescriptionLab value,
    $Res Function(PrescriptionLab) then,
  ) = _$PrescriptionLabCopyWithImpl<$Res, PrescriptionLab>;
  @useResult
  $Res call({@JsonKey(name: 'test_name') String testName, String? instruction});
}

/// @nodoc
class _$PrescriptionLabCopyWithImpl<$Res, $Val extends PrescriptionLab>
    implements $PrescriptionLabCopyWith<$Res> {
  _$PrescriptionLabCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionLab
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? testName = null, Object? instruction = freezed}) {
    return _then(
      _value.copyWith(
            testName: null == testName
                ? _value.testName
                : testName // ignore: cast_nullable_to_non_nullable
                      as String,
            instruction: freezed == instruction
                ? _value.instruction
                : instruction // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrescriptionLabImplCopyWith<$Res>
    implements $PrescriptionLabCopyWith<$Res> {
  factory _$$PrescriptionLabImplCopyWith(
    _$PrescriptionLabImpl value,
    $Res Function(_$PrescriptionLabImpl) then,
  ) = __$$PrescriptionLabImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'test_name') String testName, String? instruction});
}

/// @nodoc
class __$$PrescriptionLabImplCopyWithImpl<$Res>
    extends _$PrescriptionLabCopyWithImpl<$Res, _$PrescriptionLabImpl>
    implements _$$PrescriptionLabImplCopyWith<$Res> {
  __$$PrescriptionLabImplCopyWithImpl(
    _$PrescriptionLabImpl _value,
    $Res Function(_$PrescriptionLabImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescriptionLab
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? testName = null, Object? instruction = freezed}) {
    return _then(
      _$PrescriptionLabImpl(
        testName: null == testName
            ? _value.testName
            : testName // ignore: cast_nullable_to_non_nullable
                  as String,
        instruction: freezed == instruction
            ? _value.instruction
            : instruction // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionLabImpl implements _PrescriptionLab {
  const _$PrescriptionLabImpl({
    @JsonKey(name: 'test_name') required this.testName,
    this.instruction,
  });

  factory _$PrescriptionLabImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionLabImplFromJson(json);

  @override
  @JsonKey(name: 'test_name')
  final String testName;
  @override
  final String? instruction;

  @override
  String toString() {
    return 'PrescriptionLab(testName: $testName, instruction: $instruction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionLabImpl &&
            (identical(other.testName, testName) ||
                other.testName == testName) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, testName, instruction);

  /// Create a copy of PrescriptionLab
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionLabImplCopyWith<_$PrescriptionLabImpl> get copyWith =>
      __$$PrescriptionLabImplCopyWithImpl<_$PrescriptionLabImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionLabImplToJson(this);
  }
}

abstract class _PrescriptionLab implements PrescriptionLab {
  const factory _PrescriptionLab({
    @JsonKey(name: 'test_name') required final String testName,
    final String? instruction,
  }) = _$PrescriptionLabImpl;

  factory _PrescriptionLab.fromJson(Map<String, dynamic> json) =
      _$PrescriptionLabImpl.fromJson;

  @override
  @JsonKey(name: 'test_name')
  String get testName;
  @override
  String? get instruction;

  /// Create a copy of PrescriptionLab
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionLabImplCopyWith<_$PrescriptionLabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrescriptionAdvice _$PrescriptionAdviceFromJson(Map<String, dynamic> json) {
  return _PrescriptionAdvice.fromJson(json);
}

/// @nodoc
mixin _$PrescriptionAdvice {
  @JsonKey(name: 'next_visit_date')
  String? get nextVisitDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_visit_text')
  String? get nextVisitText => throw _privateConstructorUsedError;

  /// Serializes this PrescriptionAdvice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrescriptionAdvice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrescriptionAdviceCopyWith<PrescriptionAdvice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrescriptionAdviceCopyWith<$Res> {
  factory $PrescriptionAdviceCopyWith(
    PrescriptionAdvice value,
    $Res Function(PrescriptionAdvice) then,
  ) = _$PrescriptionAdviceCopyWithImpl<$Res, PrescriptionAdvice>;
  @useResult
  $Res call({
    @JsonKey(name: 'next_visit_date') String? nextVisitDate,
    @JsonKey(name: 'next_visit_text') String? nextVisitText,
  });
}

/// @nodoc
class _$PrescriptionAdviceCopyWithImpl<$Res, $Val extends PrescriptionAdvice>
    implements $PrescriptionAdviceCopyWith<$Res> {
  _$PrescriptionAdviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrescriptionAdvice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextVisitDate = freezed,
    Object? nextVisitText = freezed,
  }) {
    return _then(
      _value.copyWith(
            nextVisitDate: freezed == nextVisitDate
                ? _value.nextVisitDate
                : nextVisitDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            nextVisitText: freezed == nextVisitText
                ? _value.nextVisitText
                : nextVisitText // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrescriptionAdviceImplCopyWith<$Res>
    implements $PrescriptionAdviceCopyWith<$Res> {
  factory _$$PrescriptionAdviceImplCopyWith(
    _$PrescriptionAdviceImpl value,
    $Res Function(_$PrescriptionAdviceImpl) then,
  ) = __$$PrescriptionAdviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'next_visit_date') String? nextVisitDate,
    @JsonKey(name: 'next_visit_text') String? nextVisitText,
  });
}

/// @nodoc
class __$$PrescriptionAdviceImplCopyWithImpl<$Res>
    extends _$PrescriptionAdviceCopyWithImpl<$Res, _$PrescriptionAdviceImpl>
    implements _$$PrescriptionAdviceImplCopyWith<$Res> {
  __$$PrescriptionAdviceImplCopyWithImpl(
    _$PrescriptionAdviceImpl _value,
    $Res Function(_$PrescriptionAdviceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrescriptionAdvice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextVisitDate = freezed,
    Object? nextVisitText = freezed,
  }) {
    return _then(
      _$PrescriptionAdviceImpl(
        nextVisitDate: freezed == nextVisitDate
            ? _value.nextVisitDate
            : nextVisitDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        nextVisitText: freezed == nextVisitText
            ? _value.nextVisitText
            : nextVisitText // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrescriptionAdviceImpl implements _PrescriptionAdvice {
  const _$PrescriptionAdviceImpl({
    @JsonKey(name: 'next_visit_date') this.nextVisitDate,
    @JsonKey(name: 'next_visit_text') this.nextVisitText,
  });

  factory _$PrescriptionAdviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrescriptionAdviceImplFromJson(json);

  @override
  @JsonKey(name: 'next_visit_date')
  final String? nextVisitDate;
  @override
  @JsonKey(name: 'next_visit_text')
  final String? nextVisitText;

  @override
  String toString() {
    return 'PrescriptionAdvice(nextVisitDate: $nextVisitDate, nextVisitText: $nextVisitText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrescriptionAdviceImpl &&
            (identical(other.nextVisitDate, nextVisitDate) ||
                other.nextVisitDate == nextVisitDate) &&
            (identical(other.nextVisitText, nextVisitText) ||
                other.nextVisitText == nextVisitText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nextVisitDate, nextVisitText);

  /// Create a copy of PrescriptionAdvice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrescriptionAdviceImplCopyWith<_$PrescriptionAdviceImpl> get copyWith =>
      __$$PrescriptionAdviceImplCopyWithImpl<_$PrescriptionAdviceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrescriptionAdviceImplToJson(this);
  }
}

abstract class _PrescriptionAdvice implements PrescriptionAdvice {
  const factory _PrescriptionAdvice({
    @JsonKey(name: 'next_visit_date') final String? nextVisitDate,
    @JsonKey(name: 'next_visit_text') final String? nextVisitText,
  }) = _$PrescriptionAdviceImpl;

  factory _PrescriptionAdvice.fromJson(Map<String, dynamic> json) =
      _$PrescriptionAdviceImpl.fromJson;

  @override
  @JsonKey(name: 'next_visit_date')
  String? get nextVisitDate;
  @override
  @JsonKey(name: 'next_visit_text')
  String? get nextVisitText;

  /// Create a copy of PrescriptionAdvice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrescriptionAdviceImplCopyWith<_$PrescriptionAdviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimelineEvent _$TimelineEventFromJson(Map<String, dynamic> json) {
  return _TimelineEvent.fromJson(json);
}

/// @nodoc
mixin _$TimelineEvent {
  @JsonKey(name: 'event_time')
  String get eventTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_type')
  String get eventType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'actor_name')
  String? get actorName => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  /// Serializes this TimelineEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimelineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimelineEventCopyWith<TimelineEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineEventCopyWith<$Res> {
  factory $TimelineEventCopyWith(
    TimelineEvent value,
    $Res Function(TimelineEvent) then,
  ) = _$TimelineEventCopyWithImpl<$Res, TimelineEvent>;
  @useResult
  $Res call({
    @JsonKey(name: 'event_time') String eventTime,
    @JsonKey(name: 'event_type') String eventType,
    String title,
    String? description,
    @JsonKey(name: 'actor_name') String? actorName,
    String? color,
  });
}

/// @nodoc
class _$TimelineEventCopyWithImpl<$Res, $Val extends TimelineEvent>
    implements $TimelineEventCopyWith<$Res> {
  _$TimelineEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimelineEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventTime = null,
    Object? eventType = null,
    Object? title = null,
    Object? description = freezed,
    Object? actorName = freezed,
    Object? color = freezed,
  }) {
    return _then(
      _value.copyWith(
            eventTime: null == eventTime
                ? _value.eventTime
                : eventTime // ignore: cast_nullable_to_non_nullable
                      as String,
            eventType: null == eventType
                ? _value.eventType
                : eventType // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            actorName: freezed == actorName
                ? _value.actorName
                : actorName // ignore: cast_nullable_to_non_nullable
                      as String?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TimelineEventImplCopyWith<$Res>
    implements $TimelineEventCopyWith<$Res> {
  factory _$$TimelineEventImplCopyWith(
    _$TimelineEventImpl value,
    $Res Function(_$TimelineEventImpl) then,
  ) = __$$TimelineEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'event_time') String eventTime,
    @JsonKey(name: 'event_type') String eventType,
    String title,
    String? description,
    @JsonKey(name: 'actor_name') String? actorName,
    String? color,
  });
}

/// @nodoc
class __$$TimelineEventImplCopyWithImpl<$Res>
    extends _$TimelineEventCopyWithImpl<$Res, _$TimelineEventImpl>
    implements _$$TimelineEventImplCopyWith<$Res> {
  __$$TimelineEventImplCopyWithImpl(
    _$TimelineEventImpl _value,
    $Res Function(_$TimelineEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimelineEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventTime = null,
    Object? eventType = null,
    Object? title = null,
    Object? description = freezed,
    Object? actorName = freezed,
    Object? color = freezed,
  }) {
    return _then(
      _$TimelineEventImpl(
        eventTime: null == eventTime
            ? _value.eventTime
            : eventTime // ignore: cast_nullable_to_non_nullable
                  as String,
        eventType: null == eventType
            ? _value.eventType
            : eventType // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        actorName: freezed == actorName
            ? _value.actorName
            : actorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TimelineEventImpl implements _TimelineEvent {
  const _$TimelineEventImpl({
    @JsonKey(name: 'event_time') required this.eventTime,
    @JsonKey(name: 'event_type') required this.eventType,
    required this.title,
    this.description,
    @JsonKey(name: 'actor_name') this.actorName,
    this.color,
  });

  factory _$TimelineEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimelineEventImplFromJson(json);

  @override
  @JsonKey(name: 'event_time')
  final String eventTime;
  @override
  @JsonKey(name: 'event_type')
  final String eventType;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'actor_name')
  final String? actorName;
  @override
  final String? color;

  @override
  String toString() {
    return 'TimelineEvent(eventTime: $eventTime, eventType: $eventType, title: $title, description: $description, actorName: $actorName, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimelineEventImpl &&
            (identical(other.eventTime, eventTime) ||
                other.eventTime == eventTime) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.actorName, actorName) ||
                other.actorName == actorName) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    eventTime,
    eventType,
    title,
    description,
    actorName,
    color,
  );

  /// Create a copy of TimelineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimelineEventImplCopyWith<_$TimelineEventImpl> get copyWith =>
      __$$TimelineEventImplCopyWithImpl<_$TimelineEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimelineEventImplToJson(this);
  }
}

abstract class _TimelineEvent implements TimelineEvent {
  const factory _TimelineEvent({
    @JsonKey(name: 'event_time') required final String eventTime,
    @JsonKey(name: 'event_type') required final String eventType,
    required final String title,
    final String? description,
    @JsonKey(name: 'actor_name') final String? actorName,
    final String? color,
  }) = _$TimelineEventImpl;

  factory _TimelineEvent.fromJson(Map<String, dynamic> json) =
      _$TimelineEventImpl.fromJson;

  @override
  @JsonKey(name: 'event_time')
  String get eventTime;
  @override
  @JsonKey(name: 'event_type')
  String get eventType;
  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'actor_name')
  String? get actorName;
  @override
  String? get color;

  /// Create a copy of TimelineEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimelineEventImplCopyWith<_$TimelineEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
