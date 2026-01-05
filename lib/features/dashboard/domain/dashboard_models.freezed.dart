// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DashboardStats _$DashboardStatsFromJson(Map<String, dynamic> json) {
  return _DashboardStats.fromJson(json);
}

/// @nodoc
mixin _$DashboardStats {
  @JsonKey(name: 'waiting_count')
  int get waitingCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_today')
  int get completedToday => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_consult_time_mins')
  num get avgConsultTimeMins => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_wait_time_mins')
  num get avgWaitTimeMins => throw _privateConstructorUsedError;

  /// Serializes this DashboardStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardStatsCopyWith<DashboardStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStatsCopyWith<$Res> {
  factory $DashboardStatsCopyWith(
    DashboardStats value,
    $Res Function(DashboardStats) then,
  ) = _$DashboardStatsCopyWithImpl<$Res, DashboardStats>;
  @useResult
  $Res call({
    @JsonKey(name: 'waiting_count') int waitingCount,
    @JsonKey(name: 'completed_today') int completedToday,
    @JsonKey(name: 'avg_consult_time_mins') num avgConsultTimeMins,
    @JsonKey(name: 'avg_wait_time_mins') num avgWaitTimeMins,
  });
}

/// @nodoc
class _$DashboardStatsCopyWithImpl<$Res, $Val extends DashboardStats>
    implements $DashboardStatsCopyWith<$Res> {
  _$DashboardStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waitingCount = null,
    Object? completedToday = null,
    Object? avgConsultTimeMins = null,
    Object? avgWaitTimeMins = null,
  }) {
    return _then(
      _value.copyWith(
            waitingCount: null == waitingCount
                ? _value.waitingCount
                : waitingCount // ignore: cast_nullable_to_non_nullable
                      as int,
            completedToday: null == completedToday
                ? _value.completedToday
                : completedToday // ignore: cast_nullable_to_non_nullable
                      as int,
            avgConsultTimeMins: null == avgConsultTimeMins
                ? _value.avgConsultTimeMins
                : avgConsultTimeMins // ignore: cast_nullable_to_non_nullable
                      as num,
            avgWaitTimeMins: null == avgWaitTimeMins
                ? _value.avgWaitTimeMins
                : avgWaitTimeMins // ignore: cast_nullable_to_non_nullable
                      as num,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DashboardStatsImplCopyWith<$Res>
    implements $DashboardStatsCopyWith<$Res> {
  factory _$$DashboardStatsImplCopyWith(
    _$DashboardStatsImpl value,
    $Res Function(_$DashboardStatsImpl) then,
  ) = __$$DashboardStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'waiting_count') int waitingCount,
    @JsonKey(name: 'completed_today') int completedToday,
    @JsonKey(name: 'avg_consult_time_mins') num avgConsultTimeMins,
    @JsonKey(name: 'avg_wait_time_mins') num avgWaitTimeMins,
  });
}

/// @nodoc
class __$$DashboardStatsImplCopyWithImpl<$Res>
    extends _$DashboardStatsCopyWithImpl<$Res, _$DashboardStatsImpl>
    implements _$$DashboardStatsImplCopyWith<$Res> {
  __$$DashboardStatsImplCopyWithImpl(
    _$DashboardStatsImpl _value,
    $Res Function(_$DashboardStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? waitingCount = null,
    Object? completedToday = null,
    Object? avgConsultTimeMins = null,
    Object? avgWaitTimeMins = null,
  }) {
    return _then(
      _$DashboardStatsImpl(
        waitingCount: null == waitingCount
            ? _value.waitingCount
            : waitingCount // ignore: cast_nullable_to_non_nullable
                  as int,
        completedToday: null == completedToday
            ? _value.completedToday
            : completedToday // ignore: cast_nullable_to_non_nullable
                  as int,
        avgConsultTimeMins: null == avgConsultTimeMins
            ? _value.avgConsultTimeMins
            : avgConsultTimeMins // ignore: cast_nullable_to_non_nullable
                  as num,
        avgWaitTimeMins: null == avgWaitTimeMins
            ? _value.avgWaitTimeMins
            : avgWaitTimeMins // ignore: cast_nullable_to_non_nullable
                  as num,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardStatsImpl implements _DashboardStats {
  const _$DashboardStatsImpl({
    @JsonKey(name: 'waiting_count') this.waitingCount = 0,
    @JsonKey(name: 'completed_today') this.completedToday = 0,
    @JsonKey(name: 'avg_consult_time_mins') this.avgConsultTimeMins = 0,
    @JsonKey(name: 'avg_wait_time_mins') this.avgWaitTimeMins = 0,
  });

  factory _$DashboardStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardStatsImplFromJson(json);

  @override
  @JsonKey(name: 'waiting_count')
  final int waitingCount;
  @override
  @JsonKey(name: 'completed_today')
  final int completedToday;
  @override
  @JsonKey(name: 'avg_consult_time_mins')
  final num avgConsultTimeMins;
  @override
  @JsonKey(name: 'avg_wait_time_mins')
  final num avgWaitTimeMins;

  @override
  String toString() {
    return 'DashboardStats(waitingCount: $waitingCount, completedToday: $completedToday, avgConsultTimeMins: $avgConsultTimeMins, avgWaitTimeMins: $avgWaitTimeMins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStatsImpl &&
            (identical(other.waitingCount, waitingCount) ||
                other.waitingCount == waitingCount) &&
            (identical(other.completedToday, completedToday) ||
                other.completedToday == completedToday) &&
            (identical(other.avgConsultTimeMins, avgConsultTimeMins) ||
                other.avgConsultTimeMins == avgConsultTimeMins) &&
            (identical(other.avgWaitTimeMins, avgWaitTimeMins) ||
                other.avgWaitTimeMins == avgWaitTimeMins));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    waitingCount,
    completedToday,
    avgConsultTimeMins,
    avgWaitTimeMins,
  );

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      __$$DashboardStatsImplCopyWithImpl<_$DashboardStatsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardStatsImplToJson(this);
  }
}

abstract class _DashboardStats implements DashboardStats {
  const factory _DashboardStats({
    @JsonKey(name: 'waiting_count') final int waitingCount,
    @JsonKey(name: 'completed_today') final int completedToday,
    @JsonKey(name: 'avg_consult_time_mins') final num avgConsultTimeMins,
    @JsonKey(name: 'avg_wait_time_mins') final num avgWaitTimeMins,
  }) = _$DashboardStatsImpl;

  factory _DashboardStats.fromJson(Map<String, dynamic> json) =
      _$DashboardStatsImpl.fromJson;

  @override
  @JsonKey(name: 'waiting_count')
  int get waitingCount;
  @override
  @JsonKey(name: 'completed_today')
  int get completedToday;
  @override
  @JsonKey(name: 'avg_consult_time_mins')
  num get avgConsultTimeMins;
  @override
  @JsonKey(name: 'avg_wait_time_mins')
  num get avgWaitTimeMins;

  /// Create a copy of DashboardStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardStatsImplCopyWith<_$DashboardStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QueueItem _$QueueItemFromJson(Map<String, dynamic> json) {
  return _QueueItem.fromJson(json);
}

/// @nodoc
mixin _$QueueItem {
  @JsonKey(name: 'appointment_id')
  String get appointmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'patient_name')
  String get patientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_number')
  int get tokenNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'uhid')
  String get uhid => throw _privateConstructorUsedError; // New fields from get_doctor_active_queue
  @JsonKey(name: 'age')
  int? get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'queue_status')
  String? get queueStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String? get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_due')
  num? get amountDue => throw _privateConstructorUsedError;
  @JsonKey(name: 'wait_time_mins')
  num? get waitTimeMins => throw _privateConstructorUsedError;
  @JsonKey(name: 'checked_in_at')
  String? get checkedInAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_flags')
  Map<String, dynamic>? get accessFlags => throw _privateConstructorUsedError;

  /// Serializes this QueueItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QueueItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueueItemCopyWith<QueueItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueItemCopyWith<$Res> {
  factory $QueueItemCopyWith(QueueItem value, $Res Function(QueueItem) then) =
      _$QueueItemCopyWithImpl<$Res, QueueItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'appointment_id') String appointmentId,
    @JsonKey(name: 'patient_name') String patientName,
    @JsonKey(name: 'token_number') int tokenNumber,
    @JsonKey(name: 'uhid') String uhid,
    @JsonKey(name: 'age') int? age,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'queue_status') String? queueStatus,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'amount_due') num? amountDue,
    @JsonKey(name: 'wait_time_mins') num? waitTimeMins,
    @JsonKey(name: 'checked_in_at') String? checkedInAt,
    @JsonKey(name: 'access_flags') Map<String, dynamic>? accessFlags,
  });
}

/// @nodoc
class _$QueueItemCopyWithImpl<$Res, $Val extends QueueItem>
    implements $QueueItemCopyWith<$Res> {
  _$QueueItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueueItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? patientName = null,
    Object? tokenNumber = null,
    Object? uhid = null,
    Object? age = freezed,
    Object? gender = freezed,
    Object? queueStatus = freezed,
    Object? paymentStatus = freezed,
    Object? amountDue = freezed,
    Object? waitTimeMins = freezed,
    Object? checkedInAt = freezed,
    Object? accessFlags = freezed,
  }) {
    return _then(
      _value.copyWith(
            appointmentId: null == appointmentId
                ? _value.appointmentId
                : appointmentId // ignore: cast_nullable_to_non_nullable
                      as String,
            patientName: null == patientName
                ? _value.patientName
                : patientName // ignore: cast_nullable_to_non_nullable
                      as String,
            tokenNumber: null == tokenNumber
                ? _value.tokenNumber
                : tokenNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            uhid: null == uhid
                ? _value.uhid
                : uhid // ignore: cast_nullable_to_non_nullable
                      as String,
            age: freezed == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
            queueStatus: freezed == queueStatus
                ? _value.queueStatus
                : queueStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentStatus: freezed == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            amountDue: freezed == amountDue
                ? _value.amountDue
                : amountDue // ignore: cast_nullable_to_non_nullable
                      as num?,
            waitTimeMins: freezed == waitTimeMins
                ? _value.waitTimeMins
                : waitTimeMins // ignore: cast_nullable_to_non_nullable
                      as num?,
            checkedInAt: freezed == checkedInAt
                ? _value.checkedInAt
                : checkedInAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            accessFlags: freezed == accessFlags
                ? _value.accessFlags
                : accessFlags // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QueueItemImplCopyWith<$Res>
    implements $QueueItemCopyWith<$Res> {
  factory _$$QueueItemImplCopyWith(
    _$QueueItemImpl value,
    $Res Function(_$QueueItemImpl) then,
  ) = __$$QueueItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'appointment_id') String appointmentId,
    @JsonKey(name: 'patient_name') String patientName,
    @JsonKey(name: 'token_number') int tokenNumber,
    @JsonKey(name: 'uhid') String uhid,
    @JsonKey(name: 'age') int? age,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'queue_status') String? queueStatus,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'amount_due') num? amountDue,
    @JsonKey(name: 'wait_time_mins') num? waitTimeMins,
    @JsonKey(name: 'checked_in_at') String? checkedInAt,
    @JsonKey(name: 'access_flags') Map<String, dynamic>? accessFlags,
  });
}

/// @nodoc
class __$$QueueItemImplCopyWithImpl<$Res>
    extends _$QueueItemCopyWithImpl<$Res, _$QueueItemImpl>
    implements _$$QueueItemImplCopyWith<$Res> {
  __$$QueueItemImplCopyWithImpl(
    _$QueueItemImpl _value,
    $Res Function(_$QueueItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QueueItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appointmentId = null,
    Object? patientName = null,
    Object? tokenNumber = null,
    Object? uhid = null,
    Object? age = freezed,
    Object? gender = freezed,
    Object? queueStatus = freezed,
    Object? paymentStatus = freezed,
    Object? amountDue = freezed,
    Object? waitTimeMins = freezed,
    Object? checkedInAt = freezed,
    Object? accessFlags = freezed,
  }) {
    return _then(
      _$QueueItemImpl(
        appointmentId: null == appointmentId
            ? _value.appointmentId
            : appointmentId // ignore: cast_nullable_to_non_nullable
                  as String,
        patientName: null == patientName
            ? _value.patientName
            : patientName // ignore: cast_nullable_to_non_nullable
                  as String,
        tokenNumber: null == tokenNumber
            ? _value.tokenNumber
            : tokenNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        uhid: null == uhid
            ? _value.uhid
            : uhid // ignore: cast_nullable_to_non_nullable
                  as String,
        age: freezed == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
        queueStatus: freezed == queueStatus
            ? _value.queueStatus
            : queueStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentStatus: freezed == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        amountDue: freezed == amountDue
            ? _value.amountDue
            : amountDue // ignore: cast_nullable_to_non_nullable
                  as num?,
        waitTimeMins: freezed == waitTimeMins
            ? _value.waitTimeMins
            : waitTimeMins // ignore: cast_nullable_to_non_nullable
                  as num?,
        checkedInAt: freezed == checkedInAt
            ? _value.checkedInAt
            : checkedInAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        accessFlags: freezed == accessFlags
            ? _value._accessFlags
            : accessFlags // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QueueItemImpl implements _QueueItem {
  const _$QueueItemImpl({
    @JsonKey(name: 'appointment_id') required this.appointmentId,
    @JsonKey(name: 'patient_name') required this.patientName,
    @JsonKey(name: 'token_number') required this.tokenNumber,
    @JsonKey(name: 'uhid') required this.uhid,
    @JsonKey(name: 'age') this.age,
    @JsonKey(name: 'gender') this.gender,
    @JsonKey(name: 'queue_status') this.queueStatus,
    @JsonKey(name: 'payment_status') this.paymentStatus,
    @JsonKey(name: 'amount_due') this.amountDue,
    @JsonKey(name: 'wait_time_mins') this.waitTimeMins,
    @JsonKey(name: 'checked_in_at') this.checkedInAt,
    @JsonKey(name: 'access_flags') final Map<String, dynamic>? accessFlags,
  }) : _accessFlags = accessFlags;

  factory _$QueueItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueueItemImplFromJson(json);

  @override
  @JsonKey(name: 'appointment_id')
  final String appointmentId;
  @override
  @JsonKey(name: 'patient_name')
  final String patientName;
  @override
  @JsonKey(name: 'token_number')
  final int tokenNumber;
  @override
  @JsonKey(name: 'uhid')
  final String uhid;
  // New fields from get_doctor_active_queue
  @override
  @JsonKey(name: 'age')
  final int? age;
  @override
  @JsonKey(name: 'gender')
  final String? gender;
  @override
  @JsonKey(name: 'queue_status')
  final String? queueStatus;
  @override
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  @override
  @JsonKey(name: 'amount_due')
  final num? amountDue;
  @override
  @JsonKey(name: 'wait_time_mins')
  final num? waitTimeMins;
  @override
  @JsonKey(name: 'checked_in_at')
  final String? checkedInAt;
  final Map<String, dynamic>? _accessFlags;
  @override
  @JsonKey(name: 'access_flags')
  Map<String, dynamic>? get accessFlags {
    final value = _accessFlags;
    if (value == null) return null;
    if (_accessFlags is EqualUnmodifiableMapView) return _accessFlags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'QueueItem(appointmentId: $appointmentId, patientName: $patientName, tokenNumber: $tokenNumber, uhid: $uhid, age: $age, gender: $gender, queueStatus: $queueStatus, paymentStatus: $paymentStatus, amountDue: $amountDue, waitTimeMins: $waitTimeMins, checkedInAt: $checkedInAt, accessFlags: $accessFlags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueItemImpl &&
            (identical(other.appointmentId, appointmentId) ||
                other.appointmentId == appointmentId) &&
            (identical(other.patientName, patientName) ||
                other.patientName == patientName) &&
            (identical(other.tokenNumber, tokenNumber) ||
                other.tokenNumber == tokenNumber) &&
            (identical(other.uhid, uhid) || other.uhid == uhid) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.queueStatus, queueStatus) ||
                other.queueStatus == queueStatus) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.amountDue, amountDue) ||
                other.amountDue == amountDue) &&
            (identical(other.waitTimeMins, waitTimeMins) ||
                other.waitTimeMins == waitTimeMins) &&
            (identical(other.checkedInAt, checkedInAt) ||
                other.checkedInAt == checkedInAt) &&
            const DeepCollectionEquality().equals(
              other._accessFlags,
              _accessFlags,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    appointmentId,
    patientName,
    tokenNumber,
    uhid,
    age,
    gender,
    queueStatus,
    paymentStatus,
    amountDue,
    waitTimeMins,
    checkedInAt,
    const DeepCollectionEquality().hash(_accessFlags),
  );

  /// Create a copy of QueueItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueItemImplCopyWith<_$QueueItemImpl> get copyWith =>
      __$$QueueItemImplCopyWithImpl<_$QueueItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueueItemImplToJson(this);
  }
}

abstract class _QueueItem implements QueueItem {
  const factory _QueueItem({
    @JsonKey(name: 'appointment_id') required final String appointmentId,
    @JsonKey(name: 'patient_name') required final String patientName,
    @JsonKey(name: 'token_number') required final int tokenNumber,
    @JsonKey(name: 'uhid') required final String uhid,
    @JsonKey(name: 'age') final int? age,
    @JsonKey(name: 'gender') final String? gender,
    @JsonKey(name: 'queue_status') final String? queueStatus,
    @JsonKey(name: 'payment_status') final String? paymentStatus,
    @JsonKey(name: 'amount_due') final num? amountDue,
    @JsonKey(name: 'wait_time_mins') final num? waitTimeMins,
    @JsonKey(name: 'checked_in_at') final String? checkedInAt,
    @JsonKey(name: 'access_flags') final Map<String, dynamic>? accessFlags,
  }) = _$QueueItemImpl;

  factory _QueueItem.fromJson(Map<String, dynamic> json) =
      _$QueueItemImpl.fromJson;

  @override
  @JsonKey(name: 'appointment_id')
  String get appointmentId;
  @override
  @JsonKey(name: 'patient_name')
  String get patientName;
  @override
  @JsonKey(name: 'token_number')
  int get tokenNumber;
  @override
  @JsonKey(name: 'uhid')
  String get uhid; // New fields from get_doctor_active_queue
  @override
  @JsonKey(name: 'age')
  int? get age;
  @override
  @JsonKey(name: 'gender')
  String? get gender;
  @override
  @JsonKey(name: 'queue_status')
  String? get queueStatus;
  @override
  @JsonKey(name: 'payment_status')
  String? get paymentStatus;
  @override
  @JsonKey(name: 'amount_due')
  num? get amountDue;
  @override
  @JsonKey(name: 'wait_time_mins')
  num? get waitTimeMins;
  @override
  @JsonKey(name: 'checked_in_at')
  String? get checkedInAt;
  @override
  @JsonKey(name: 'access_flags')
  Map<String, dynamic>? get accessFlags;

  /// Create a copy of QueueItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueueItemImplCopyWith<_$QueueItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

QueueData _$QueueDataFromJson(Map<String, dynamic> json) {
  return _QueueData.fromJson(json);
}

/// @nodoc
mixin _$QueueData {
  List<QueueItem> get scheduled =>
      throw _privateConstructorUsedError; // Might be empty now
  List<QueueItem> get waiting => throw _privateConstructorUsedError;
  List<QueueItem> get active => throw _privateConstructorUsedError;

  /// Serializes this QueueData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QueueData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueueDataCopyWith<QueueData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueueDataCopyWith<$Res> {
  factory $QueueDataCopyWith(QueueData value, $Res Function(QueueData) then) =
      _$QueueDataCopyWithImpl<$Res, QueueData>;
  @useResult
  $Res call({
    List<QueueItem> scheduled,
    List<QueueItem> waiting,
    List<QueueItem> active,
  });
}

/// @nodoc
class _$QueueDataCopyWithImpl<$Res, $Val extends QueueData>
    implements $QueueDataCopyWith<$Res> {
  _$QueueDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueueData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduled = null,
    Object? waiting = null,
    Object? active = null,
  }) {
    return _then(
      _value.copyWith(
            scheduled: null == scheduled
                ? _value.scheduled
                : scheduled // ignore: cast_nullable_to_non_nullable
                      as List<QueueItem>,
            waiting: null == waiting
                ? _value.waiting
                : waiting // ignore: cast_nullable_to_non_nullable
                      as List<QueueItem>,
            active: null == active
                ? _value.active
                : active // ignore: cast_nullable_to_non_nullable
                      as List<QueueItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QueueDataImplCopyWith<$Res>
    implements $QueueDataCopyWith<$Res> {
  factory _$$QueueDataImplCopyWith(
    _$QueueDataImpl value,
    $Res Function(_$QueueDataImpl) then,
  ) = __$$QueueDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<QueueItem> scheduled,
    List<QueueItem> waiting,
    List<QueueItem> active,
  });
}

/// @nodoc
class __$$QueueDataImplCopyWithImpl<$Res>
    extends _$QueueDataCopyWithImpl<$Res, _$QueueDataImpl>
    implements _$$QueueDataImplCopyWith<$Res> {
  __$$QueueDataImplCopyWithImpl(
    _$QueueDataImpl _value,
    $Res Function(_$QueueDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QueueData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduled = null,
    Object? waiting = null,
    Object? active = null,
  }) {
    return _then(
      _$QueueDataImpl(
        scheduled: null == scheduled
            ? _value._scheduled
            : scheduled // ignore: cast_nullable_to_non_nullable
                  as List<QueueItem>,
        waiting: null == waiting
            ? _value._waiting
            : waiting // ignore: cast_nullable_to_non_nullable
                  as List<QueueItem>,
        active: null == active
            ? _value._active
            : active // ignore: cast_nullable_to_non_nullable
                  as List<QueueItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QueueDataImpl implements _QueueData {
  const _$QueueDataImpl({
    final List<QueueItem> scheduled = const [],
    final List<QueueItem> waiting = const [],
    final List<QueueItem> active = const [],
  }) : _scheduled = scheduled,
       _waiting = waiting,
       _active = active;

  factory _$QueueDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueueDataImplFromJson(json);

  final List<QueueItem> _scheduled;
  @override
  @JsonKey()
  List<QueueItem> get scheduled {
    if (_scheduled is EqualUnmodifiableListView) return _scheduled;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduled);
  }

  // Might be empty now
  final List<QueueItem> _waiting;
  // Might be empty now
  @override
  @JsonKey()
  List<QueueItem> get waiting {
    if (_waiting is EqualUnmodifiableListView) return _waiting;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_waiting);
  }

  final List<QueueItem> _active;
  @override
  @JsonKey()
  List<QueueItem> get active {
    if (_active is EqualUnmodifiableListView) return _active;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_active);
  }

  @override
  String toString() {
    return 'QueueData(scheduled: $scheduled, waiting: $waiting, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueueDataImpl &&
            const DeepCollectionEquality().equals(
              other._scheduled,
              _scheduled,
            ) &&
            const DeepCollectionEquality().equals(other._waiting, _waiting) &&
            const DeepCollectionEquality().equals(other._active, _active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_scheduled),
    const DeepCollectionEquality().hash(_waiting),
    const DeepCollectionEquality().hash(_active),
  );

  /// Create a copy of QueueData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueueDataImplCopyWith<_$QueueDataImpl> get copyWith =>
      __$$QueueDataImplCopyWithImpl<_$QueueDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QueueDataImplToJson(this);
  }
}

abstract class _QueueData implements QueueData {
  const factory _QueueData({
    final List<QueueItem> scheduled,
    final List<QueueItem> waiting,
    final List<QueueItem> active,
  }) = _$QueueDataImpl;

  factory _QueueData.fromJson(Map<String, dynamic> json) =
      _$QueueDataImpl.fromJson;

  @override
  List<QueueItem> get scheduled; // Might be empty now
  @override
  List<QueueItem> get waiting;
  @override
  List<QueueItem> get active;

  /// Create a copy of QueueData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueueDataImplCopyWith<_$QueueDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
