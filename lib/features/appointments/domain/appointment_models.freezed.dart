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
