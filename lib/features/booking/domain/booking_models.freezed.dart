// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

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

BookingResult _$BookingResultFromJson(Map<String, dynamic> json) {
  return _BookingResult.fromJson(json);
}

/// @nodoc
mixin _$BookingResult {
  String get appointmentId => throw _privateConstructorUsedError;
  String get invoiceId => throw _privateConstructorUsedError;
  double get amountDue => throw _privateConstructorUsedError;
  String get appointmentNumber => throw _privateConstructorUsedError;
  String get invoiceNumber => throw _privateConstructorUsedError;
  String get doctorName => throw _privateConstructorUsedError;

  /// Serializes this BookingResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingResultCopyWith<BookingResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingResultCopyWith<$Res> {
  factory $BookingResultCopyWith(
    BookingResult value,
    $Res Function(BookingResult) then,
  ) = _$BookingResultCopyWithImpl<$Res, BookingResult>;
  @useResult
  $Res call({
    String appointmentId,
    String invoiceId,
    double amountDue,
    String appointmentNumber,
    String invoiceNumber,
    String doctorName,
  });
}

/// @nodoc
class _$BookingResultCopyWithImpl<$Res, $Val extends BookingResult>
    implements $BookingResultCopyWith<$Res> {
  _$BookingResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? invoiceId = null,
    Object? amountDue = null,
    Object? appointmentNumber = null,
    Object? invoiceNumber = null,
    Object? doctorName = null,
  }) {
    return _then(
      _value.copyWith(
            appointmentId: null == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            invoiceId: null == invoiceId
                ? _value.invoiceId
                : invoiceId // ignore: cast_nullable_to_non_nullable
                      as String,
            amountDue: null == amountDue
                ? _value.amountDue
                : amountDue // ignore: cast_nullable_to_non_nullable
                      as double,
            appointmentNumber: null == appointmentNumber
                ? _value.appointmentNumber
                : appointmentNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            invoiceNumber: null == invoiceNumber
                ? _value.invoiceNumber
                : invoiceNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            doctorName: null == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingResultImplCopyWith<$Res>
    implements $BookingResultCopyWith<$Res> {
  factory _$$BookingResultImplCopyWith(
    _$BookingResultImpl value,
    $Res Function(_$BookingResultImpl) then,
  ) = __$$BookingResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String appointmentId,
    String invoiceId,
    double amountDue,
    String appointmentNumber,
    String invoiceNumber,
    String doctorName,
  });
}

/// @nodoc
class __$$BookingResultImplCopyWithImpl<$Res>
    extends _$BookingResultCopyWithImpl<$Res, _$BookingResultImpl>
    implements _$$BookingResultImplCopyWith<$Res> {
  __$$BookingResultImplCopyWithImpl(
    _$BookingResultImpl _value,
    $Res Function(_$BookingResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BookingResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? invoiceId = null,
    Object? amountDue = null,
    Object? appointmentNumber = null,
    Object? invoiceNumber = null,
    Object? doctorName = null,
  }) {
    return _then(
      _$BookingResultImpl(
        appointmentId: null == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        invoiceId: null == invoiceId
            ? _value.invoiceId
            : invoiceId // ignore: cast_nullable_to_non_nullable
                  as String,
        amountDue: null == amountDue
            ? _value.amountDue
            : amountDue // ignore: cast_nullable_to_non_nullable
                  as double,
        appointmentNumber: null == appointmentNumber
            ? _value.appointmentNumber
            : appointmentNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        invoiceNumber: null == invoiceNumber
            ? _value.invoiceNumber
            : invoiceNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        doctorName: null == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BookingResultImpl implements _BookingResult {
  const _$BookingResultImpl({
    required this.appointmentId,
    required this.invoiceId,
    required this.amountDue,
    required this.appointmentNumber,
    required this.invoiceNumber,
    required this.doctorName,
  });

  factory _$BookingResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingResultImplFromJson(json);

  @override
  final String appointmentId;
  @override
  final String invoiceId;
  @override
  final double amountDue;
  @override
  final String appointmentNumber;
  @override
  final String invoiceNumber;
  @override
  final String doctorName;

  @override
  String toString() {
    return 'BookingResult(appointmentId: $appointmentId, invoiceId: $invoiceId, amountDue: $amountDue, appointmentNumber: $appointmentNumber, invoiceNumber: $invoiceNumber, doctorName: $doctorName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingResultImpl &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.amountDue, amountDue) ||
                other.amountDue == amountDue) &&
            (identical(other.appointmentNumber, appointmentNumber) ||
                other.appointmentNumber == appointmentNumber) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appointmentId,
    invoiceId,
    amountDue,
    appointmentNumber,
    invoiceNumber,
    doctorName,
  );

  /// Create a copy of BookingResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingResultImplCopyWith<_$BookingResultImpl> get copyWith =>
      __$$BookingResultImplCopyWithImpl<_$BookingResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingResultImplToJson(this);
  }
}

abstract class _BookingResult implements BookingResult {
  const factory _BookingResult({
    required final String appointmentId,
    required final String invoiceId,
    required final double amountDue,
    required final String appointmentNumber,
    required final String invoiceNumber,
    required final String doctorName,
  }) = _$BookingResultImpl;

  factory _BookingResult.fromJson(Map<String, dynamic> json) =
      _$BookingResultImpl.fromJson;

  @override
  String get appointmentId;
  @override
  String get invoiceId;
  @override
  double get amountDue;
  @override
  String get appointmentNumber;
  @override
  String get invoiceNumber;
  @override
  String get doctorName;

  /// Create a copy of BookingResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingResultImplCopyWith<_$BookingResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
