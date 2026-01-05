// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String? get uhid => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get address =>
      throw _privateConstructorUsedError; // mapped from address or composite
  @JsonKey(name: 'address_street')
  String? get addressStreet => throw _privateConstructorUsedError;
  String? get district => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get pincode => throw _privateConstructorUsedError;
  String? get religion => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_flags')
  Map<String, dynamic>? get flags => throw _privateConstructorUsedError;

  /// Serializes this Patient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'full_name') String fullName,
    String? uhid,
    String phone,
    int? age,
    String? gender,
    String? address,
    @JsonKey(name: 'address_street') String? addressStreet,
    String? district,
    String? state,
    String? pincode,
    String? religion,
    @JsonKey(name: 'access_flags') Map<String, dynamic>? flags,
  });
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? uhid = freezed,
    Object? phone = null,
    Object? age = freezed,
    Object? gender = freezed,
    Object? address = freezed,
    Object? addressStreet = freezed,
    Object? district = freezed,
    Object? state = freezed,
    Object? pincode = freezed,
    Object? religion = freezed,
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
            uhid: freezed == uhid
                ? _value.uhid
                : uhid // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            addressStreet: freezed == addressStreet
                ? _value.addressStreet
                : addressStreet // ignore: cast_nullable_to_non_nullable
                      as String?,
            district: freezed == district
                ? _value.district
                : district // ignore: cast_nullable_to_non_nullable
                      as String?,
            state: freezed == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String?,
            pincode: freezed == pincode
                ? _value.pincode
                : pincode // ignore: cast_nullable_to_non_nullable
                      as String?,
            religion: freezed == religion
                ? _value.religion
                : religion // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PatientImplCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$PatientImplCopyWith(
    _$PatientImpl value,
    $Res Function(_$PatientImpl) then,
  ) = __$$PatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'full_name') String fullName,
    String? uhid,
    String phone,
    int? age,
    String? gender,
    String? address,
    @JsonKey(name: 'address_street') String? addressStreet,
    String? district,
    String? state,
    String? pincode,
    String? religion,
    @JsonKey(name: 'access_flags') Map<String, dynamic>? flags,
  });
}

/// @nodoc
class __$$PatientImplCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$PatientImpl>
    implements _$$PatientImplCopyWith<$Res> {
  __$$PatientImplCopyWithImpl(
    _$PatientImpl _value,
    $Res Function(_$PatientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? uhid = freezed,
    Object? phone = null,
    Object? age = freezed,
    Object? gender = freezed,
    Object? address = freezed,
    Object? addressStreet = freezed,
    Object? district = freezed,
    Object? state = freezed,
    Object? pincode = freezed,
    Object? religion = freezed,
    Object? flags = freezed,
  }) {
    return _then(
      _$PatientImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        uhid: freezed == uhid
            ? _value.uhid
            : uhid // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        addressStreet: freezed == addressStreet
            ? _value.addressStreet
            : addressStreet // ignore: cast_nullable_to_non_nullable
                  as String?,
        district: freezed == district
            ? _value.district
            : district // ignore: cast_nullable_to_non_nullable
                  as String?,
        state: freezed == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String?,
        pincode: freezed == pincode
            ? _value.pincode
            : pincode // ignore: cast_nullable_to_non_nullable
                  as String?,
        religion: freezed == religion
            ? _value.religion
            : religion // ignore: cast_nullable_to_non_nullable
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
class _$PatientImpl implements _Patient {
  const _$PatientImpl({
    required this.id,
    @JsonKey(name: 'full_name') required this.fullName,
    this.uhid,
    required this.phone,
    this.age,
    this.gender,
    this.address,
    @JsonKey(name: 'address_street') this.addressStreet,
    this.district,
    this.state,
    this.pincode,
    this.religion,
    @JsonKey(name: 'access_flags') final Map<String, dynamic>? flags,
  }) : _flags = flags;

  factory _$PatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final String? uhid;
  @override
  final String phone;
  @override
  final int? age;
  @override
  final String? gender;
  @override
  final String? address;
  // mapped from address or composite
  @override
  @JsonKey(name: 'address_street')
  final String? addressStreet;
  @override
  final String? district;
  @override
  final String? state;
  @override
  final String? pincode;
  @override
  final String? religion;
  final Map<String, dynamic>? _flags;
  @override
  @JsonKey(name: 'access_flags')
  Map<String, dynamic>? get flags {
    final value = _flags;
    if (value == null) return null;
    if (_flags is EqualUnmodifiableMapView) return _flags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Patient(id: $id, fullName: $fullName, uhid: $uhid, phone: $phone, age: $age, gender: $gender, address: $address, addressStreet: $addressStreet, district: $district, state: $state, pincode: $pincode, religion: $religion, flags: $flags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.uhid, uhid) || other.uhid == uhid) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressStreet, addressStreet) ||
                other.addressStreet == addressStreet) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.religion, religion) ||
                other.religion == religion) &&
            const DeepCollectionEquality().equals(other._flags, _flags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    fullName,
    uhid,
    phone,
    age,
    gender,
    address,
    addressStreet,
    district,
    state,
    pincode,
    religion,
    const DeepCollectionEquality().hash(_flags),
  );

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      __$$PatientImplCopyWithImpl<_$PatientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientImplToJson(this);
  }
}

abstract class _Patient implements Patient {
  const factory _Patient({
    required final String id,
    @JsonKey(name: 'full_name') required final String fullName,
    final String? uhid,
    required final String phone,
    final int? age,
    final String? gender,
    final String? address,
    @JsonKey(name: 'address_street') final String? addressStreet,
    final String? district,
    final String? state,
    final String? pincode,
    final String? religion,
    @JsonKey(name: 'access_flags') final Map<String, dynamic>? flags,
  }) = _$PatientImpl;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$PatientImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String? get uhid;
  @override
  String get phone;
  @override
  int? get age;
  @override
  String? get gender;
  @override
  String? get address; // mapped from address or composite
  @override
  @JsonKey(name: 'address_street')
  String? get addressStreet;
  @override
  String? get district;
  @override
  String? get state;
  @override
  String? get pincode;
  @override
  String? get religion;
  @override
  @JsonKey(name: 'access_flags')
  Map<String, dynamic>? get flags;

  /// Create a copy of Patient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientImplCopyWith<_$PatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientHistoryItem _$PatientHistoryItemFromJson(Map<String, dynamic> json) {
  return _PatientHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$PatientHistoryItem {
  @JsonKey(name: 'appointment_id')
  String get appointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_name')
  String? get doctorName => throw _privateConstructorUsedError;
  String? get specialty => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_id')
  String? get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  num? get grandTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance_due')
  num? get balanceDue => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String? get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_number')
  int? get tokenNumber => throw _privateConstructorUsedError;

  /// Serializes this PatientHistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientHistoryItemCopyWith<PatientHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientHistoryItemCopyWith<$Res> {
  factory $PatientHistoryItemCopyWith(
    PatientHistoryItem value,
    $Res Function(PatientHistoryItem) then,
  ) = _$PatientHistoryItemCopyWithImpl<$Res, PatientHistoryItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'appointment_id') String appointmentId,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'doctor_name') String? doctorName,
    String? specialty,
    String status,
    @JsonKey(name: 'invoice_id') String? invoiceId,
    @JsonKey(name: 'amount') num? grandTotal,
    @JsonKey(name: 'balance_due') num? balanceDue,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'token_number') int? tokenNumber,
  });
}

/// @nodoc
class _$PatientHistoryItemCopyWithImpl<$Res, $Val extends PatientHistoryItem>
    implements $PatientHistoryItemCopyWith<$Res> {
  _$PatientHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? startTime = null,
    Object? doctorName = freezed,
    Object? specialty = freezed,
    Object? status = null,
    Object? invoiceId = freezed,
    Object? grandTotal = freezed,
    Object? balanceDue = freezed,
    Object? paymentStatus = freezed,
    Object? tokenNumber = freezed,
  }) {
    return _then(
      _value.copyWith(
            appointmentId: null == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorName: freezed == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String?,
            specialty: freezed == specialty
                ? _value.specialty
                : specialty // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            invoiceId: freezed == invoiceId
                ? _value.invoiceId
                : invoiceId // ignore: cast_nullable_to_non_nullable
                      as String?,
            grandTotal: freezed == grandTotal
                ? _value.grandTotal
                : grandTotal // ignore: cast_nullable_to_non_nullable
                      as num?,
            balanceDue: freezed == balanceDue
                ? _value.balanceDue
                : balanceDue // ignore: cast_nullable_to_non_nullable
                      as num?,
            paymentStatus: freezed == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            tokenNumber: freezed == tokenNumber
                ? _value.tokenNumber
                : tokenNumber // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PatientHistoryItemImplCopyWith<$Res>
    implements $PatientHistoryItemCopyWith<$Res> {
  factory _$$PatientHistoryItemImplCopyWith(
    _$PatientHistoryItemImpl value,
    $Res Function(_$PatientHistoryItemImpl) then,
  ) = __$$PatientHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'appointment_id') String appointmentId,
    @JsonKey(name: 'start_time') String startTime,
    @JsonKey(name: 'doctor_name') String? doctorName,
    String? specialty,
    String status,
    @JsonKey(name: 'invoice_id') String? invoiceId,
    @JsonKey(name: 'amount') num? grandTotal,
    @JsonKey(name: 'balance_due') num? balanceDue,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'token_number') int? tokenNumber,
  });
}

/// @nodoc
class __$$PatientHistoryItemImplCopyWithImpl<$Res>
    extends _$PatientHistoryItemCopyWithImpl<$Res, _$PatientHistoryItemImpl>
    implements _$$PatientHistoryItemImplCopyWith<$Res> {
  __$$PatientHistoryItemImplCopyWithImpl(
    _$PatientHistoryItemImpl _value,
    $Res Function(_$PatientHistoryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? startTime = null,
    Object? doctorName = freezed,
    Object? specialty = freezed,
    Object? status = null,
    Object? invoiceId = freezed,
    Object? grandTotal = freezed,
    Object? balanceDue = freezed,
    Object? paymentStatus = freezed,
    Object? tokenNumber = freezed,
  }) {
    return _then(
      _$PatientHistoryItemImpl(
        appointmentId: null == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorName: freezed == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        specialty: freezed == specialty
            ? _value.specialty
            : specialty // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        invoiceId: freezed == invoiceId
            ? _value.invoiceId
            : invoiceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        grandTotal: freezed == grandTotal
            ? _value.grandTotal
            : grandTotal // ignore: cast_nullable_to_non_nullable
                  as num?,
        balanceDue: freezed == balanceDue
            ? _value.balanceDue
            : balanceDue // ignore: cast_nullable_to_non_nullable
                  as num?,
        paymentStatus: freezed == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        tokenNumber: freezed == tokenNumber
            ? _value.tokenNumber
            : tokenNumber // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientHistoryItemImpl implements _PatientHistoryItem {
  const _$PatientHistoryItemImpl({
    @JsonKey(name: 'appointment_id') required this.appointmentId,
    @JsonKey(name: 'start_time') required this.startTime,
    @JsonKey(name: 'doctor_name') this.doctorName,
    this.specialty,
    required this.status,
    @JsonKey(name: 'invoice_id') this.invoiceId,
    @JsonKey(name: 'amount') this.grandTotal,
    @JsonKey(name: 'balance_due') this.balanceDue,
    @JsonKey(name: 'payment_status') this.paymentStatus,
    @JsonKey(name: 'token_number') this.tokenNumber,
  });

  factory _$PatientHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientHistoryItemImplFromJson(json);

  @override
  @JsonKey(name: 'appointment_id')
  final String appointmentId;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'doctor_name')
  final String? doctorName;
  @override
  final String? specialty;
  @override
  final String status;
  @override
  @JsonKey(name: 'invoice_id')
  final String? invoiceId;
  @override
  @JsonKey(name: 'amount')
  final num? grandTotal;
  @override
  @JsonKey(name: 'balance_due')
  final num? balanceDue;
  @override
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  @override
  @JsonKey(name: 'token_number')
  final int? tokenNumber;

  @override
  String toString() {
    return 'PatientHistoryItem(appointmentId: $appointmentId, startTime: $startTime, doctorName: $doctorName, specialty: $specialty, status: $status, invoiceId: $invoiceId, grandTotal: $grandTotal, balanceDue: $balanceDue, paymentStatus: $paymentStatus, tokenNumber: $tokenNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientHistoryItemImpl &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.balanceDue, balanceDue) ||
                other.balanceDue == balanceDue) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.tokenNumber, tokenNumber) ||
                other.tokenNumber == tokenNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appointmentId,
    startTime,
    doctorName,
    specialty,
    status,
    invoiceId,
    grandTotal,
    balanceDue,
    paymentStatus,
    tokenNumber,
  );

  /// Create a copy of PatientHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientHistoryItemImplCopyWith<_$PatientHistoryItemImpl> get copyWith =>
      __$$PatientHistoryItemImplCopyWithImpl<_$PatientHistoryItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientHistoryItemImplToJson(this);
  }
}

abstract class _PatientHistoryItem implements PatientHistoryItem {
  const factory _PatientHistoryItem({
    @JsonKey(name: 'appointment_id') required final String appointmentId,
    @JsonKey(name: 'start_time') required final String startTime,
    @JsonKey(name: 'doctor_name') final String? doctorName,
    final String? specialty,
    required final String status,
    @JsonKey(name: 'invoice_id') final String? invoiceId,
    @JsonKey(name: 'amount') final num? grandTotal,
    @JsonKey(name: 'balance_due') final num? balanceDue,
    @JsonKey(name: 'payment_status') final String? paymentStatus,
    @JsonKey(name: 'token_number') final int? tokenNumber,
  }) = _$PatientHistoryItemImpl;

  factory _PatientHistoryItem.fromJson(Map<String, dynamic> json) =
      _$PatientHistoryItemImpl.fromJson;

  @override
  @JsonKey(name: 'appointment_id')
  String get appointmentId;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'doctor_name')
  String? get doctorName;
  @override
  String? get specialty;
  @override
  String get status;
  @override
  @JsonKey(name: 'invoice_id')
  String? get invoiceId;
  @override
  @JsonKey(name: 'amount')
  num? get grandTotal;
  @override
  @JsonKey(name: 'balance_due')
  num? get balanceDue;
  @override
  @JsonKey(name: 'payment_status')
  String? get paymentStatus;
  @override
  @JsonKey(name: 'token_number')
  int? get tokenNumber;

  /// Create a copy of PatientHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientHistoryItemImplCopyWith<_$PatientHistoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientDocument _$PatientDocumentFromJson(Map<String, dynamic> json) {
  return _PatientDocument.fromJson(json);
}

/// @nodoc
mixin _$PatientDocument {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_name')
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_url')
  String get fileUrl => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_at')
  String get uploadedAt => throw _privateConstructorUsedError;

  /// Serializes this PatientDocument to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientDocumentCopyWith<PatientDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientDocumentCopyWith<$Res> {
  factory $PatientDocumentCopyWith(
    PatientDocument value,
    $Res Function(PatientDocument) then,
  ) = _$PatientDocumentCopyWithImpl<$Res, PatientDocument>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'file_name') String fileName,
    @JsonKey(name: 'file_url') String fileUrl,
    String category,
    @JsonKey(name: 'uploaded_at') String uploadedAt,
  });
}

/// @nodoc
class _$PatientDocumentCopyWithImpl<$Res, $Val extends PatientDocument>
    implements $PatientDocumentCopyWith<$Res> {
  _$PatientDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? fileUrl = null,
    Object? category = null,
    Object? uploadedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            fileName: null == fileName
                ? _value.fileName
                : fileName // ignore: cast_nullable_to_non_nullable
                      as String,
            fileUrl: null == fileUrl
                ? _value.fileUrl
                : fileUrl // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            uploadedAt: null == uploadedAt
                ? _value.uploadedAt
                : uploadedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PatientDocumentImplCopyWith<$Res>
    implements $PatientDocumentCopyWith<$Res> {
  factory _$$PatientDocumentImplCopyWith(
    _$PatientDocumentImpl value,
    $Res Function(_$PatientDocumentImpl) then,
  ) = __$$PatientDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'file_name') String fileName,
    @JsonKey(name: 'file_url') String fileUrl,
    String category,
    @JsonKey(name: 'uploaded_at') String uploadedAt,
  });
}

/// @nodoc
class __$$PatientDocumentImplCopyWithImpl<$Res>
    extends _$PatientDocumentCopyWithImpl<$Res, _$PatientDocumentImpl>
    implements _$$PatientDocumentImplCopyWith<$Res> {
  __$$PatientDocumentImplCopyWithImpl(
    _$PatientDocumentImpl _value,
    $Res Function(_$PatientDocumentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileName = null,
    Object? fileUrl = null,
    Object? category = null,
    Object? uploadedAt = null,
  }) {
    return _then(
      _$PatientDocumentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        fileName: null == fileName
            ? _value.fileName
            : fileName // ignore: cast_nullable_to_non_nullable
                  as String,
        fileUrl: null == fileUrl
            ? _value.fileUrl
            : fileUrl // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        uploadedAt: null == uploadedAt
            ? _value.uploadedAt
            : uploadedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientDocumentImpl implements _PatientDocument {
  const _$PatientDocumentImpl({
    required this.id,
    @JsonKey(name: 'file_name') required this.fileName,
    @JsonKey(name: 'file_url') required this.fileUrl,
    required this.category,
    @JsonKey(name: 'uploaded_at') required this.uploadedAt,
  });

  factory _$PatientDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientDocumentImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'file_name')
  final String fileName;
  @override
  @JsonKey(name: 'file_url')
  final String fileUrl;
  @override
  final String category;
  @override
  @JsonKey(name: 'uploaded_at')
  final String uploadedAt;

  @override
  String toString() {
    return 'PatientDocument(id: $id, fileName: $fileName, fileUrl: $fileUrl, category: $category, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientDocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fileName, fileUrl, category, uploadedAt);

  /// Create a copy of PatientDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientDocumentImplCopyWith<_$PatientDocumentImpl> get copyWith =>
      __$$PatientDocumentImplCopyWithImpl<_$PatientDocumentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientDocumentImplToJson(this);
  }
}

abstract class _PatientDocument implements PatientDocument {
  const factory _PatientDocument({
    required final String id,
    @JsonKey(name: 'file_name') required final String fileName,
    @JsonKey(name: 'file_url') required final String fileUrl,
    required final String category,
    @JsonKey(name: 'uploaded_at') required final String uploadedAt,
  }) = _$PatientDocumentImpl;

  factory _PatientDocument.fromJson(Map<String, dynamic> json) =
      _$PatientDocumentImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'file_name')
  String get fileName;
  @override
  @JsonKey(name: 'file_url')
  String get fileUrl;
  @override
  String get category;
  @override
  @JsonKey(name: 'uploaded_at')
  String get uploadedAt;

  /// Create a copy of PatientDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientDocumentImplCopyWith<_$PatientDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientDetail _$PatientDetailFromJson(Map<String, dynamic> json) {
  return _PatientDetail.fromJson(json);
}

/// @nodoc
mixin _$PatientDetail {
  Patient get profile => throw _privateConstructorUsedError;
  List<PatientHistoryItem> get appointments =>
      throw _privateConstructorUsedError;
  List<PatientDocument> get documents => throw _privateConstructorUsedError;

  /// Serializes this PatientDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientDetailCopyWith<PatientDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientDetailCopyWith<$Res> {
  factory $PatientDetailCopyWith(
    PatientDetail value,
    $Res Function(PatientDetail) then,
  ) = _$PatientDetailCopyWithImpl<$Res, PatientDetail>;
  @useResult
  $Res call({
    Patient profile,
    List<PatientHistoryItem> appointments,
    List<PatientDocument> documents,
  });

  $PatientCopyWith<$Res> get profile;
}

/// @nodoc
class _$PatientDetailCopyWithImpl<$Res, $Val extends PatientDetail>
    implements $PatientDetailCopyWith<$Res> {
  _$PatientDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? appointments = null,
    Object? documents = null,
  }) {
    return _then(
      _value.copyWith(
            profile: null == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                      as Patient,
            appointments: null == appointments
                ? _value.appointments
                : appointments // ignore: cast_nullable_to_non_nullable
                      as List<PatientHistoryItem>,
            documents: null == documents
                ? _value.documents
                : documents // ignore: cast_nullable_to_non_nullable
                      as List<PatientDocument>,
          )
          as $Val,
    );
  }

  /// Create a copy of PatientDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PatientCopyWith<$Res> get profile {
    return $PatientCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PatientDetailImplCopyWith<$Res>
    implements $PatientDetailCopyWith<$Res> {
  factory _$$PatientDetailImplCopyWith(
    _$PatientDetailImpl value,
    $Res Function(_$PatientDetailImpl) then,
  ) = __$$PatientDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Patient profile,
    List<PatientHistoryItem> appointments,
    List<PatientDocument> documents,
  });

  @override
  $PatientCopyWith<$Res> get profile;
}

/// @nodoc
class __$$PatientDetailImplCopyWithImpl<$Res>
    extends _$PatientDetailCopyWithImpl<$Res, _$PatientDetailImpl>
    implements _$$PatientDetailImplCopyWith<$Res> {
  __$$PatientDetailImplCopyWithImpl(
    _$PatientDetailImpl _value,
    $Res Function(_$PatientDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? appointments = null,
    Object? documents = null,
  }) {
    return _then(
      _$PatientDetailImpl(
        profile: null == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as Patient,
        appointments: null == appointments
            ? _value._appointments
            : appointments // ignore: cast_nullable_to_non_nullable
                  as List<PatientHistoryItem>,
        documents: null == documents
            ? _value._documents
            : documents // ignore: cast_nullable_to_non_nullable
                  as List<PatientDocument>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientDetailImpl implements _PatientDetail {
  const _$PatientDetailImpl({
    required this.profile,
    final List<PatientHistoryItem> appointments = const [],
    final List<PatientDocument> documents = const [],
  }) : _appointments = appointments,
       _documents = documents;

  factory _$PatientDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientDetailImplFromJson(json);

  @override
  final Patient profile;
  final List<PatientHistoryItem> _appointments;
  @override
  @JsonKey()
  List<PatientHistoryItem> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  final List<PatientDocument> _documents;
  @override
  @JsonKey()
  List<PatientDocument> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  @override
  String toString() {
    return 'PatientDetail(profile: $profile, appointments: $appointments, documents: $documents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientDetailImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(
              other._appointments,
              _appointments,
            ) &&
            const DeepCollectionEquality().equals(
              other._documents,
              _documents,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    profile,
    const DeepCollectionEquality().hash(_appointments),
    const DeepCollectionEquality().hash(_documents),
  );

  /// Create a copy of PatientDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientDetailImplCopyWith<_$PatientDetailImpl> get copyWith =>
      __$$PatientDetailImplCopyWithImpl<_$PatientDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientDetailImplToJson(this);
  }
}

abstract class _PatientDetail implements PatientDetail {
  const factory _PatientDetail({
    required final Patient profile,
    final List<PatientHistoryItem> appointments,
    final List<PatientDocument> documents,
  }) = _$PatientDetailImpl;

  factory _PatientDetail.fromJson(Map<String, dynamic> json) =
      _$PatientDetailImpl.fromJson;

  @override
  Patient get profile;
  @override
  List<PatientHistoryItem> get appointments;
  @override
  List<PatientDocument> get documents;

  /// Create a copy of PatientDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientDetailImplCopyWith<_$PatientDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientListResult _$PatientListResultFromJson(Map<String, dynamic> json) {
  return _PatientListResult.fromJson(json);
}

/// @nodoc
mixin _$PatientListResult {
  List<Patient> get data => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this PatientListResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PatientListResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PatientListResultCopyWith<PatientListResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientListResultCopyWith<$Res> {
  factory $PatientListResultCopyWith(
    PatientListResult value,
    $Res Function(PatientListResult) then,
  ) = _$PatientListResultCopyWithImpl<$Res, PatientListResult>;
  @useResult
  $Res call({List<Patient> data, int total});
}

/// @nodoc
class _$PatientListResultCopyWithImpl<$Res, $Val extends PatientListResult>
    implements $PatientListResultCopyWith<$Res> {
  _$PatientListResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PatientListResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null, Object? total = null}) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<Patient>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PatientListResultImplCopyWith<$Res>
    implements $PatientListResultCopyWith<$Res> {
  factory _$$PatientListResultImplCopyWith(
    _$PatientListResultImpl value,
    $Res Function(_$PatientListResultImpl) then,
  ) = __$$PatientListResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Patient> data, int total});
}

/// @nodoc
class __$$PatientListResultImplCopyWithImpl<$Res>
    extends _$PatientListResultCopyWithImpl<$Res, _$PatientListResultImpl>
    implements _$$PatientListResultImplCopyWith<$Res> {
  __$$PatientListResultImplCopyWithImpl(
    _$PatientListResultImpl _value,
    $Res Function(_$PatientListResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PatientListResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null, Object? total = null}) {
    return _then(
      _$PatientListResultImpl(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<Patient>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientListResultImpl implements _PatientListResult {
  const _$PatientListResultImpl({
    final List<Patient> data = const [],
    this.total = 0,
  }) : _data = data;

  factory _$PatientListResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientListResultImplFromJson(json);

  final List<Patient> _data;
  @override
  @JsonKey()
  List<Patient> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final int total;

  @override
  String toString() {
    return 'PatientListResult(data: $data, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PatientListResultImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    total,
  );

  /// Create a copy of PatientListResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PatientListResultImplCopyWith<_$PatientListResultImpl> get copyWith =>
      __$$PatientListResultImplCopyWithImpl<_$PatientListResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PatientListResultImplToJson(this);
  }
}

abstract class _PatientListResult implements PatientListResult {
  const factory _PatientListResult({
    final List<Patient> data,
    final int total,
  }) = _$PatientListResultImpl;

  factory _PatientListResult.fromJson(Map<String, dynamic> json) =
      _$PatientListResultImpl.fromJson;

  @override
  List<Patient> get data;
  @override
  int get total;

  /// Create a copy of PatientListResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientListResultImplCopyWith<_$PatientListResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
