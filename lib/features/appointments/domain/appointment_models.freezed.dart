// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppointmentGridItem _$AppointmentGridItemFromJson(Map<String, dynamic> json) {
  return _AppointmentGridItem.fromJson(json);
}

/// @nodoc
mixin _$AppointmentGridItem {
  String get id => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get patientName => throw _privateConstructorUsedError;
  String get uhid => throw _privateConstructorUsedError;
  String get doctorName => throw _privateConstructorUsedError;
  String get doctorId => throw _privateConstructorUsedError;

  /// Serializes this AppointmentGridItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentGridItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentGridItemCopyWith<AppointmentGridItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentGridItemCopyWith<$Res> {
  factory $AppointmentGridItemCopyWith(
    AppointmentGridItem value,
    $Res Function(AppointmentGridItem) then,
  ) = _$AppointmentGridItemCopyWithImpl<$Res, AppointmentGridItem>;
  @useResult
  $Res call({
    String id,
    DateTime startTime,
    DateTime endTime,
    String status,
    String type,
    String patientName,
    String uhid,
    String doctorName,
    String doctorId,
  });
}

/// @nodoc
class _$AppointmentGridItemCopyWithImpl<$Res, $Val extends AppointmentGridItem>
    implements $AppointmentGridItemCopyWith<$Res> {
  _$AppointmentGridItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentGridItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
    Object? type = null,
    Object? patientName = null,
    Object? uhid = null,
    Object? doctorName = null,
    Object? doctorId = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            patientName: null == patientName
                ? _value.patientName
                : patientName // ignore: cast_nullable_to_non_nullable
                      as String,
            uhid: null == uhid
                ? _value.uhid
                : uhid // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorName: null == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorId: null == doctorId
                ? _value.doctorId
                : doctorId // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppointmentGridItemImplCopyWith<$Res>
    implements $AppointmentGridItemCopyWith<$Res> {
  factory _$$AppointmentGridItemImplCopyWith(
    _$AppointmentGridItemImpl value,
    $Res Function(_$AppointmentGridItemImpl) then,
  ) = __$$AppointmentGridItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime startTime,
    DateTime endTime,
    String status,
    String type,
    String patientName,
    String uhid,
    String doctorName,
    String doctorId,
  });
}

/// @nodoc
class __$$AppointmentGridItemImplCopyWithImpl<$Res>
    extends _$AppointmentGridItemCopyWithImpl<$Res, _$AppointmentGridItemImpl>
    implements _$$AppointmentGridItemImplCopyWith<$Res> {
  __$$AppointmentGridItemImplCopyWithImpl(
    _$AppointmentGridItemImpl _value,
    $Res Function(_$AppointmentGridItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentGridItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? status = null,
    Object? type = null,
    Object? patientName = null,
    Object? uhid = null,
    Object? doctorName = null,
    Object? doctorId = null,
  }) {
    return _then(
      _$AppointmentGridItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        patientName: null == patientName
            ? _value.patientName
            : patientName // ignore: cast_nullable_to_non_nullable
                  as String,
        uhid: null == uhid
            ? _value.uhid
            : uhid // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorName: null == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorId: null == doctorId
            ? _value.doctorId
            : doctorId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AppointmentGridItemImpl implements _AppointmentGridItem {
  const _$AppointmentGridItemImpl({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.type,
    required this.patientName,
    required this.uhid,
    required this.doctorName,
    required this.doctorId,
  });

  factory _$AppointmentGridItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentGridItemImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final String status;
  @override
  final String type;
  @override
  final String patientName;
  @override
  final String uhid;
  @override
  final String doctorName;
  @override
  final String doctorId;

  @override
  String toString() {
    return 'AppointmentGridItem(id: $id, startTime: $startTime, endTime: $endTime, status: $status, type: $type, patientName: $patientName, uhid: $uhid, doctorName: $doctorName, doctorId: $doctorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentGridItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.uhid, uhid) || other.uhid == uhid) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    startTime,
    endTime,
    status,
    type,
    patientName,
    uhid,
    doctorName,
    doctorId,
  );

  /// Create a copy of AppointmentGridItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentGridItemImplCopyWith<_$AppointmentGridItemImpl> get copyWith =>
      __$$AppointmentGridItemImplCopyWithImpl<_$AppointmentGridItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentGridItemImplToJson(this);
  }
}

abstract class _AppointmentGridItem implements AppointmentGridItem {
  const factory _AppointmentGridItem({
    required final String id,
    required final DateTime startTime,
    required final DateTime endTime,
    required final String status,
    required final String type,
    required final String patientName,
    required final String uhid,
    required final String doctorName,
    required final String doctorId,
  }) = _$AppointmentGridItemImpl;

  factory _AppointmentGridItem.fromJson(Map<String, dynamic> json) =
      _$AppointmentGridItemImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  String get status;
  @override
  String get type;
  @override
  String get patientName;
  @override
  String get uhid;
  @override
  String get doctorName;
  @override
  String get doctorId;

  /// Create a copy of AppointmentGridItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentGridItemImplCopyWith<_$AppointmentGridItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DoctorSchedule _$DoctorScheduleFromJson(Map<String, dynamic> json) {
  return _DoctorSchedule.fromJson(json);
}

/// @nodoc
mixin _$DoctorSchedule {
  int get day => throw _privateConstructorUsedError;
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;

  /// Serializes this DoctorSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DoctorSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorScheduleCopyWith<DoctorSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorScheduleCopyWith<$Res> {
  factory $DoctorScheduleCopyWith(
    DoctorSchedule value,
    $Res Function(DoctorSchedule) then,
  ) = _$DoctorScheduleCopyWithImpl<$Res, DoctorSchedule>;
  @useResult
  $Res call({int day, String start, String end});
}

/// @nodoc
class _$DoctorScheduleCopyWithImpl<$Res, $Val extends DoctorSchedule>
    implements $DoctorScheduleCopyWith<$Res> {
  _$DoctorScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DoctorSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? day = null, Object? start = null, Object? end = null}) {
    return _then(
      _value.copyWith(
            day: null == day
                ? _value.day
                : day // ignore: cast_nullable_to_non_nullable
                      as int,
            start: null == start
                ? _value.start
                : start // ignore: cast_nullable_to_non_nullable
                      as String,
            end: null == end
                ? _value.end
                : end // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorScheduleImplCopyWith<$Res>
    implements $DoctorScheduleCopyWith<$Res> {
  factory _$$DoctorScheduleImplCopyWith(
    _$DoctorScheduleImpl value,
    $Res Function(_$DoctorScheduleImpl) then,
  ) = __$$DoctorScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, String start, String end});
}

/// @nodoc
class __$$DoctorScheduleImplCopyWithImpl<$Res>
    extends _$DoctorScheduleCopyWithImpl<$Res, _$DoctorScheduleImpl>
    implements _$$DoctorScheduleImplCopyWith<$Res> {
  __$$DoctorScheduleImplCopyWithImpl(
    _$DoctorScheduleImpl _value,
    $Res Function(_$DoctorScheduleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DoctorSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? day = null, Object? start = null, Object? end = null}) {
    return _then(
      _$DoctorScheduleImpl(
        day: null == day
            ? _value.day
            : day // ignore: cast_nullable_to_non_nullable
                  as int,
        start: null == start
            ? _value.start
            : start // ignore: cast_nullable_to_non_nullable
                  as String,
        end: null == end
            ? _value.end
            : end // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DoctorScheduleImpl implements _DoctorSchedule {
  const _$DoctorScheduleImpl({
    required this.day,
    required this.start,
    required this.end,
  });

  factory _$DoctorScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorScheduleImplFromJson(json);

  @override
  final int day;
  @override
  final String start;
  @override
  final String end;

  @override
  String toString() {
    return 'DoctorSchedule(day: $day, start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorScheduleImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, start, end);

  /// Create a copy of DoctorSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorScheduleImplCopyWith<_$DoctorScheduleImpl> get copyWith =>
      __$$DoctorScheduleImplCopyWithImpl<_$DoctorScheduleImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorScheduleImplToJson(this);
  }
}

abstract class _DoctorSchedule implements DoctorSchedule {
  const factory _DoctorSchedule({
    required final int day,
    required final String start,
    required final String end,
  }) = _$DoctorScheduleImpl;

  factory _DoctorSchedule.fromJson(Map<String, dynamic> json) =
      _$DoctorScheduleImpl.fromJson;

  @override
  int get day;
  @override
  String get start;
  @override
  String get end;

  /// Create a copy of DoctorSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorScheduleImplCopyWith<_$DoctorScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Doctor _$DoctorFromJson(Map<String, dynamic> json) {
  return _Doctor.fromJson(json);
}

/// @nodoc
mixin _$Doctor {
  @JsonKey(name: 'doctor_id')
  String get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String? get specialty => throw _privateConstructorUsedError;
  @JsonKey(name: 'consult_fee')
  double? get consultationFee => throw _privateConstructorUsedError;
  int get avgConsultTimeMin => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;
  List<DoctorSchedule> get schedule => throw _privateConstructorUsedError;

  /// Serializes this Doctor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DoctorCopyWith<Doctor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorCopyWith<$Res> {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) then) =
      _$DoctorCopyWithImpl<$Res, Doctor>;
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String id,
    String fullName,
    String? specialty,
    @JsonKey(name: 'consult_fee') double? consultationFee,
    int avgConsultTimeMin,
    bool isAvailable,
    List<DoctorSchedule> schedule,
  });
}

/// @nodoc
class _$DoctorCopyWithImpl<$Res, $Val extends Doctor>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? specialty = freezed,
    Object? consultationFee = freezed,
    Object? avgConsultTimeMin = null,
    Object? isAvailable = null,
    Object? schedule = null,
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
            specialty: freezed == specialty
                ? _value.specialty
                : specialty // ignore: cast_nullable_to_non_nullable
                      as String?,
            consultationFee: freezed == consultationFee
                ? _value.consultationFee
                : consultationFee // ignore: cast_nullable_to_non_nullable
                      as double?,
            avgConsultTimeMin: null == avgConsultTimeMin
                ? _value.avgConsultTimeMin
                : avgConsultTimeMin // ignore: cast_nullable_to_non_nullable
                      as int,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            schedule: null == schedule
                ? _value.schedule
                : schedule // ignore: cast_nullable_to_non_nullable
                      as List<DoctorSchedule>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DoctorImplCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$$DoctorImplCopyWith(
    _$DoctorImpl value,
    $Res Function(_$DoctorImpl) then,
  ) = __$$DoctorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'doctor_id') String id,
    String fullName,
    String? specialty,
    @JsonKey(name: 'consult_fee') double? consultationFee,
    int avgConsultTimeMin,
    bool isAvailable,
    List<DoctorSchedule> schedule,
  });
}

/// @nodoc
class __$$DoctorImplCopyWithImpl<$Res>
    extends _$DoctorCopyWithImpl<$Res, _$DoctorImpl>
    implements _$$DoctorImplCopyWith<$Res> {
  __$$DoctorImplCopyWithImpl(
    _$DoctorImpl _value,
    $Res Function(_$DoctorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? specialty = freezed,
    Object? consultationFee = freezed,
    Object? avgConsultTimeMin = null,
    Object? isAvailable = null,
    Object? schedule = null,
  }) {
    return _then(
      _$DoctorImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        fullName: null == fullName
            ? _value.fullName
            : fullName // ignore: cast_nullable_to_non_nullable
                  as String,
        specialty: freezed == specialty
            ? _value.specialty
            : specialty // ignore: cast_nullable_to_non_nullable
                  as String?,
        consultationFee: freezed == consultationFee
            ? _value.consultationFee
            : consultationFee // ignore: cast_nullable_to_non_nullable
                  as double?,
        avgConsultTimeMin: null == avgConsultTimeMin
            ? _value.avgConsultTimeMin
            : avgConsultTimeMin // ignore: cast_nullable_to_non_nullable
                  as int,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        schedule: null == schedule
            ? _value._schedule
            : schedule // ignore: cast_nullable_to_non_nullable
                  as List<DoctorSchedule>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DoctorImpl implements _Doctor {
  const _$DoctorImpl({
    @JsonKey(name: 'doctor_id') required this.id,
    required this.fullName,
    this.specialty,
    @JsonKey(name: 'consult_fee') this.consultationFee,
    this.avgConsultTimeMin = 15,
    this.isAvailable = true,
    final List<DoctorSchedule> schedule = const [],
  }) : _schedule = schedule;

  factory _$DoctorImpl.fromJson(Map<String, dynamic> json) =>
      _$$DoctorImplFromJson(json);

  @override
  @JsonKey(name: 'doctor_id')
  final String id;
  @override
  final String fullName;
  @override
  final String? specialty;
  @override
  @JsonKey(name: 'consult_fee')
  final double? consultationFee;
  @override
  @JsonKey()
  final int avgConsultTimeMin;
  @override
  @JsonKey()
  final bool isAvailable;
  final List<DoctorSchedule> _schedule;
  @override
  @JsonKey()
  List<DoctorSchedule> get schedule {
    if (_schedule is EqualUnmodifiableListView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedule);
  }

  @override
  String toString() {
    return 'Doctor(id: $id, fullName: $fullName, specialty: $specialty, consultationFee: $consultationFee, avgConsultTimeMin: $avgConsultTimeMin, isAvailable: $isAvailable, schedule: $schedule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoctorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            (identical(other.consultationFee, consultationFee) ||
                other.consultationFee == consultationFee) &&
            (identical(other.avgConsultTimeMin, avgConsultTimeMin) ||
                other.avgConsultTimeMin == avgConsultTimeMin) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    fullName,
    specialty,
    consultationFee,
    avgConsultTimeMin,
    isAvailable,
    const DeepCollectionEquality().hash(_schedule),
  );

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoctorImplCopyWith<_$DoctorImpl> get copyWith =>
      __$$DoctorImplCopyWithImpl<_$DoctorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DoctorImplToJson(this);
  }
}

abstract class _Doctor implements Doctor {
  const factory _Doctor({
    @JsonKey(name: 'doctor_id') required final String id,
    required final String fullName,
    final String? specialty,
    @JsonKey(name: 'consult_fee') final double? consultationFee,
    final int avgConsultTimeMin,
    final bool isAvailable,
    final List<DoctorSchedule> schedule,
  }) = _$DoctorImpl;

  factory _Doctor.fromJson(Map<String, dynamic> json) = _$DoctorImpl.fromJson;

  @override
  @JsonKey(name: 'doctor_id')
  String get id;
  @override
  String get fullName;
  @override
  String? get specialty;
  @override
  @JsonKey(name: 'consult_fee')
  double? get consultationFee;
  @override
  int get avgConsultTimeMin;
  @override
  bool get isAvailable;
  @override
  List<DoctorSchedule> get schedule;

  /// Create a copy of Doctor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoctorImplCopyWith<_$DoctorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) {
  return _TimeSlot.fromJson(json);
}

/// @nodoc
mixin _$TimeSlot {
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  bool get isAvailable => throw _privateConstructorUsedError;

  /// Serializes this TimeSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeSlotCopyWith<TimeSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSlotCopyWith<$Res> {
  factory $TimeSlotCopyWith(TimeSlot value, $Res Function(TimeSlot) then) =
      _$TimeSlotCopyWithImpl<$Res, TimeSlot>;
  @useResult
  $Res call({DateTime startTime, DateTime endTime, bool isAvailable});
}

/// @nodoc
class _$TimeSlotCopyWithImpl<$Res, $Val extends TimeSlot>
    implements $TimeSlotCopyWith<$Res> {
  _$TimeSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? isAvailable = null,
  }) {
    return _then(
      _value.copyWith(
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: null == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TimeSlotImplCopyWith<$Res>
    implements $TimeSlotCopyWith<$Res> {
  factory _$$TimeSlotImplCopyWith(
    _$TimeSlotImpl value,
    $Res Function(_$TimeSlotImpl) then,
  ) = __$$TimeSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime startTime, DateTime endTime, bool isAvailable});
}

/// @nodoc
class __$$TimeSlotImplCopyWithImpl<$Res>
    extends _$TimeSlotCopyWithImpl<$Res, _$TimeSlotImpl>
    implements _$$TimeSlotImplCopyWith<$Res> {
  __$$TimeSlotImplCopyWithImpl(
    _$TimeSlotImpl _value,
    $Res Function(_$TimeSlotImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? isAvailable = null,
  }) {
    return _then(
      _$TimeSlotImpl(
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: null == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSlotImpl implements _TimeSlot {
  const _$TimeSlotImpl({
    required this.startTime,
    required this.endTime,
    required this.isAvailable,
  });

  factory _$TimeSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSlotImplFromJson(json);

  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final bool isAvailable;

  @override
  String toString() {
    return 'TimeSlot(startTime: $startTime, endTime: $endTime, isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSlotImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime, isAvailable);

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      __$$TimeSlotImplCopyWithImpl<_$TimeSlotImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSlotImplToJson(this);
  }
}

abstract class _TimeSlot implements TimeSlot {
  const factory _TimeSlot({
    required final DateTime startTime,
    required final DateTime endTime,
    required final bool isAvailable,
  }) = _$TimeSlotImpl;

  factory _TimeSlot.fromJson(Map<String, dynamic> json) =
      _$TimeSlotImpl.fromJson;

  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  bool get isAvailable;

  /// Create a copy of TimeSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeSlotImplCopyWith<_$TimeSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RescheduleResult _$RescheduleResultFromJson(Map<String, dynamic> json) {
  return _RescheduleResult.fromJson(json);
}

/// @nodoc
mixin _$RescheduleResult {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get financialWarning => throw _privateConstructorUsedError;

  /// Serializes this RescheduleResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RescheduleResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RescheduleResultCopyWith<RescheduleResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RescheduleResultCopyWith<$Res> {
  factory $RescheduleResultCopyWith(
    RescheduleResult value,
    $Res Function(RescheduleResult) then,
  ) = _$RescheduleResultCopyWithImpl<$Res, RescheduleResult>;
  @useResult
  $Res call({bool success, String message, bool financialWarning});
}

/// @nodoc
class _$RescheduleResultCopyWithImpl<$Res, $Val extends RescheduleResult>
    implements $RescheduleResultCopyWith<$Res> {
  _$RescheduleResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RescheduleResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? financialWarning = null,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            financialWarning: null == financialWarning
                ? _value.financialWarning
                : financialWarning // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RescheduleResultImplCopyWith<$Res>
    implements $RescheduleResultCopyWith<$Res> {
  factory _$$RescheduleResultImplCopyWith(
    _$RescheduleResultImpl value,
    $Res Function(_$RescheduleResultImpl) then,
  ) = __$$RescheduleResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, bool financialWarning});
}

/// @nodoc
class __$$RescheduleResultImplCopyWithImpl<$Res>
    extends _$RescheduleResultCopyWithImpl<$Res, _$RescheduleResultImpl>
    implements _$$RescheduleResultImplCopyWith<$Res> {
  __$$RescheduleResultImplCopyWithImpl(
    _$RescheduleResultImpl _value,
    $Res Function(_$RescheduleResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RescheduleResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? financialWarning = null,
  }) {
    return _then(
      _$RescheduleResultImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        financialWarning: null == financialWarning
            ? _value.financialWarning
            : financialWarning // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$RescheduleResultImpl implements _RescheduleResult {
  const _$RescheduleResultImpl({
    required this.success,
    required this.message,
    this.financialWarning = false,
  });

  factory _$RescheduleResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$RescheduleResultImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  @JsonKey()
  final bool financialWarning;

  @override
  String toString() {
    return 'RescheduleResult(success: $success, message: $message, financialWarning: $financialWarning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RescheduleResultImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.financialWarning, financialWarning) ||
                other.financialWarning == financialWarning));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, message, financialWarning);

  /// Create a copy of RescheduleResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RescheduleResultImplCopyWith<_$RescheduleResultImpl> get copyWith =>
      __$$RescheduleResultImplCopyWithImpl<_$RescheduleResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RescheduleResultImplToJson(this);
  }
}

abstract class _RescheduleResult implements RescheduleResult {
  const factory _RescheduleResult({
    required final bool success,
    required final String message,
    final bool financialWarning,
  }) = _$RescheduleResultImpl;

  factory _RescheduleResult.fromJson(Map<String, dynamic> json) =
      _$RescheduleResultImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  bool get financialWarning;

  /// Create a copy of RescheduleResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RescheduleResultImplCopyWith<_$RescheduleResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HistoryPatient _$HistoryPatientFromJson(Map<String, dynamic> json) {
  return _HistoryPatient.fromJson(json);
}

/// @nodoc
mixin _$HistoryPatient {
  String get name => throw _privateConstructorUsedError;
  String get uhid => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this HistoryPatient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HistoryPatient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryPatientCopyWith<HistoryPatient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryPatientCopyWith<$Res> {
  factory $HistoryPatientCopyWith(
    HistoryPatient value,
    $Res Function(HistoryPatient) then,
  ) = _$HistoryPatientCopyWithImpl<$Res, HistoryPatient>;
  @useResult
  $Res call({String name, String uhid, String details, String phone});
}

/// @nodoc
class _$HistoryPatientCopyWithImpl<$Res, $Val extends HistoryPatient>
    implements $HistoryPatientCopyWith<$Res> {
  _$HistoryPatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryPatient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uhid = null,
    Object? details = null,
    Object? phone = null,
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
            details: null == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HistoryPatientImplCopyWith<$Res>
    implements $HistoryPatientCopyWith<$Res> {
  factory _$$HistoryPatientImplCopyWith(
    _$HistoryPatientImpl value,
    $Res Function(_$HistoryPatientImpl) then,
  ) = __$$HistoryPatientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String uhid, String details, String phone});
}

/// @nodoc
class __$$HistoryPatientImplCopyWithImpl<$Res>
    extends _$HistoryPatientCopyWithImpl<$Res, _$HistoryPatientImpl>
    implements _$$HistoryPatientImplCopyWith<$Res> {
  __$$HistoryPatientImplCopyWithImpl(
    _$HistoryPatientImpl _value,
    $Res Function(_$HistoryPatientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HistoryPatient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uhid = null,
    Object? details = null,
    Object? phone = null,
  }) {
    return _then(
      _$HistoryPatientImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        uhid: null == uhid
            ? _value.uhid
            : uhid // ignore: cast_nullable_to_non_nullable
                  as String,
        details: null == details
            ? _value.details
            : details // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryPatientImpl implements _HistoryPatient {
  const _$HistoryPatientImpl({
    required this.name,
    required this.uhid,
    required this.details,
    required this.phone,
  });

  factory _$HistoryPatientImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryPatientImplFromJson(json);

  @override
  final String name;
  @override
  final String uhid;
  @override
  final String details;
  @override
  final String phone;

  @override
  String toString() {
    return 'HistoryPatient(name: $name, uhid: $uhid, details: $details, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryPatientImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uhid, uhid) || other.uhid == uhid) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, uhid, details, phone);

  /// Create a copy of HistoryPatient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryPatientImplCopyWith<_$HistoryPatientImpl> get copyWith =>
      __$$HistoryPatientImplCopyWithImpl<_$HistoryPatientImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryPatientImplToJson(this);
  }
}

abstract class _HistoryPatient implements HistoryPatient {
  const factory _HistoryPatient({
    required final String name,
    required final String uhid,
    required final String details,
    required final String phone,
  }) = _$HistoryPatientImpl;

  factory _HistoryPatient.fromJson(Map<String, dynamic> json) =
      _$HistoryPatientImpl.fromJson;

  @override
  String get name;
  @override
  String get uhid;
  @override
  String get details;
  @override
  String get phone;

  /// Create a copy of HistoryPatient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryPatientImplCopyWith<_$HistoryPatientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppointmentHistoryItem _$AppointmentHistoryItemFromJson(
  Map<String, dynamic> json,
) {
  return _AppointmentHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$AppointmentHistoryItem {
  String get appointmentId => throw _privateConstructorUsedError;
  String get appointmentNumber => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  HistoryPatient get patient => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parseDiagnosis)
  String? get diagnosis => throw _privateConstructorUsedError;
  bool get canPrint => throw _privateConstructorUsedError;

  /// Serializes this AppointmentHistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppointmentHistoryItemCopyWith<AppointmentHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentHistoryItemCopyWith<$Res> {
  factory $AppointmentHistoryItemCopyWith(
    AppointmentHistoryItem value,
    $Res Function(AppointmentHistoryItem) then,
  ) = _$AppointmentHistoryItemCopyWithImpl<$Res, AppointmentHistoryItem>;
  @useResult
  $Res call({
    String appointmentId,
    String appointmentNumber,
    DateTime date,
    String status,
    String type,
    HistoryPatient patient,
    @JsonKey(fromJson: _parseDiagnosis) String? diagnosis,
    bool canPrint,
  });

  $HistoryPatientCopyWith<$Res> get patient;
}

/// @nodoc
class _$AppointmentHistoryItemCopyWithImpl<
  $Res,
  $Val extends AppointmentHistoryItem
>
    implements $AppointmentHistoryItemCopyWith<$Res> {
  _$AppointmentHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? appointmentNumber = null,
    Object? date = null,
    Object? status = null,
    Object? type = null,
    Object? patient = null,
    Object? diagnosis = freezed,
    Object? canPrint = null,
  }) {
    return _then(
      _value.copyWith(
            appointmentId: null == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            appointmentNumber: null == appointmentNumber
                ? _value.appointmentNumber
                : appointmentNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            patient: null == patient
                ? _value.patient
                : patient // ignore: cast_nullable_to_non_nullable
                      as HistoryPatient,
            diagnosis: freezed == diagnosis
                ? _value.diagnosis
                : diagnosis // ignore: cast_nullable_to_non_nullable
                      as String?,
            canPrint: null == canPrint
                ? _value.canPrint
                : canPrint // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HistoryPatientCopyWith<$Res> get patient {
    return $HistoryPatientCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppointmentHistoryItemImplCopyWith<$Res>
    implements $AppointmentHistoryItemCopyWith<$Res> {
  factory _$$AppointmentHistoryItemImplCopyWith(
    _$AppointmentHistoryItemImpl value,
    $Res Function(_$AppointmentHistoryItemImpl) then,
  ) = __$$AppointmentHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String appointmentId,
    String appointmentNumber,
    DateTime date,
    String status,
    String type,
    HistoryPatient patient,
    @JsonKey(fromJson: _parseDiagnosis) String? diagnosis,
    bool canPrint,
  });

  @override
  $HistoryPatientCopyWith<$Res> get patient;
}

/// @nodoc
class __$$AppointmentHistoryItemImplCopyWithImpl<$Res>
    extends
        _$AppointmentHistoryItemCopyWithImpl<$Res, _$AppointmentHistoryItemImpl>
    implements _$$AppointmentHistoryItemImplCopyWith<$Res> {
  __$$AppointmentHistoryItemImplCopyWithImpl(
    _$AppointmentHistoryItemImpl _value,
    $Res Function(_$AppointmentHistoryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? appointmentNumber = null,
    Object? date = null,
    Object? status = null,
    Object? type = null,
    Object? patient = null,
    Object? diagnosis = freezed,
    Object? canPrint = null,
  }) {
    return _then(
      _$AppointmentHistoryItemImpl(
        appointmentId: null == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        appointmentNumber: null == appointmentNumber
            ? _value.appointmentNumber
            : appointmentNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        patient: null == patient
            ? _value.patient
            : patient // ignore: cast_nullable_to_non_nullable
                  as HistoryPatient,
        diagnosis: freezed == diagnosis
            ? _value.diagnosis
            : diagnosis // ignore: cast_nullable_to_non_nullable
                  as String?,
        canPrint: null == canPrint
            ? _value.canPrint
            : canPrint // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AppointmentHistoryItemImpl implements _AppointmentHistoryItem {
  const _$AppointmentHistoryItemImpl({
    required this.appointmentId,
    required this.appointmentNumber,
    required this.date,
    required this.status,
    required this.type,
    required this.patient,
    @JsonKey(fromJson: _parseDiagnosis) this.diagnosis,
    this.canPrint = false,
  });

  factory _$AppointmentHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppointmentHistoryItemImplFromJson(json);

  @override
  final String appointmentId;
  @override
  final String appointmentNumber;
  @override
  final DateTime date;
  @override
  final String status;
  @override
  final String type;
  @override
  final HistoryPatient patient;
  @override
  @JsonKey(fromJson: _parseDiagnosis)
  final String? diagnosis;
  @override
  @JsonKey()
  final bool canPrint;

  @override
  String toString() {
    return 'AppointmentHistoryItem(appointmentId: $appointmentId, appointmentNumber: $appointmentNumber, date: $date, status: $status, type: $type, patient: $patient, diagnosis: $diagnosis, canPrint: $canPrint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppointmentHistoryItemImpl &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.appointmentNumber, appointmentNumber) ||
                other.appointmentNumber == appointmentNumber) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.diagnosis, diagnosis) ||
                other.diagnosis == diagnosis) &&
            (identical(other.canPrint, canPrint) ||
                other.canPrint == canPrint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appointmentId,
    appointmentNumber,
    date,
    status,
    type,
    patient,
    diagnosis,
    canPrint,
  );

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppointmentHistoryItemImplCopyWith<_$AppointmentHistoryItemImpl>
  get copyWith =>
      __$$AppointmentHistoryItemImplCopyWithImpl<_$AppointmentHistoryItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AppointmentHistoryItemImplToJson(this);
  }
}

abstract class _AppointmentHistoryItem implements AppointmentHistoryItem {
  const factory _AppointmentHistoryItem({
    required final String appointmentId,
    required final String appointmentNumber,
    required final DateTime date,
    required final String status,
    required final String type,
    required final HistoryPatient patient,
    @JsonKey(fromJson: _parseDiagnosis) final String? diagnosis,
    final bool canPrint,
  }) = _$AppointmentHistoryItemImpl;

  factory _AppointmentHistoryItem.fromJson(Map<String, dynamic> json) =
      _$AppointmentHistoryItemImpl.fromJson;

  @override
  String get appointmentId;
  @override
  String get appointmentNumber;
  @override
  DateTime get date;
  @override
  String get status;
  @override
  String get type;
  @override
  HistoryPatient get patient;
  @override
  @JsonKey(fromJson: _parseDiagnosis)
  String? get diagnosis;
  @override
  bool get canPrint;

  /// Create a copy of AppointmentHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppointmentHistoryItemImplCopyWith<_$AppointmentHistoryItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}

HistoryResponse _$HistoryResponseFromJson(Map<String, dynamic> json) {
  return _HistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$HistoryResponse {
  List<AppointmentHistoryItem> get data => throw _privateConstructorUsedError;
  Map<String, dynamic> get meta => throw _privateConstructorUsedError;

  /// Serializes this HistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryResponseCopyWith<HistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryResponseCopyWith<$Res> {
  factory $HistoryResponseCopyWith(
    HistoryResponse value,
    $Res Function(HistoryResponse) then,
  ) = _$HistoryResponseCopyWithImpl<$Res, HistoryResponse>;
  @useResult
  $Res call({List<AppointmentHistoryItem> data, Map<String, dynamic> meta});
}

/// @nodoc
class _$HistoryResponseCopyWithImpl<$Res, $Val extends HistoryResponse>
    implements $HistoryResponseCopyWith<$Res> {
  _$HistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null, Object? meta = null}) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<AppointmentHistoryItem>,
            meta: null == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HistoryResponseImplCopyWith<$Res>
    implements $HistoryResponseCopyWith<$Res> {
  factory _$$HistoryResponseImplCopyWith(
    _$HistoryResponseImpl value,
    $Res Function(_$HistoryResponseImpl) then,
  ) = __$$HistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppointmentHistoryItem> data, Map<String, dynamic> meta});
}

/// @nodoc
class __$$HistoryResponseImplCopyWithImpl<$Res>
    extends _$HistoryResponseCopyWithImpl<$Res, _$HistoryResponseImpl>
    implements _$$HistoryResponseImplCopyWith<$Res> {
  __$$HistoryResponseImplCopyWithImpl(
    _$HistoryResponseImpl _value,
    $Res Function(_$HistoryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null, Object? meta = null}) {
    return _then(
      _$HistoryResponseImpl(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<AppointmentHistoryItem>,
        meta: null == meta
            ? _value._meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$HistoryResponseImpl implements _HistoryResponse {
  const _$HistoryResponseImpl({
    final List<AppointmentHistoryItem> data = const [],
    required final Map<String, dynamic> meta,
  }) : _data = data,
       _meta = meta;

  factory _$HistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryResponseImplFromJson(json);

  final List<AppointmentHistoryItem> _data;
  @override
  @JsonKey()
  List<AppointmentHistoryItem> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  final Map<String, dynamic> _meta;
  @override
  Map<String, dynamic> get meta {
    if (_meta is EqualUnmodifiableMapView) return _meta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_meta);
  }

  @override
  String toString() {
    return 'HistoryResponse(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._meta, _meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    const DeepCollectionEquality().hash(_meta),
  );

  /// Create a copy of HistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryResponseImplCopyWith<_$HistoryResponseImpl> get copyWith =>
      __$$HistoryResponseImplCopyWithImpl<_$HistoryResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryResponseImplToJson(this);
  }
}

abstract class _HistoryResponse implements HistoryResponse {
  const factory _HistoryResponse({
    final List<AppointmentHistoryItem> data,
    required final Map<String, dynamic> meta,
  }) = _$HistoryResponseImpl;

  factory _HistoryResponse.fromJson(Map<String, dynamic> json) =
      _$HistoryResponseImpl.fromJson;

  @override
  List<AppointmentHistoryItem> get data;
  @override
  Map<String, dynamic> get meta;

  /// Create a copy of HistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryResponseImplCopyWith<_$HistoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
