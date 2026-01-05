// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finance_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FinanceStats _$FinanceStatsFromJson(Map<String, dynamic> json) {
  return _FinanceStats.fromJson(json);
}

/// @nodoc
mixin _$FinanceStats {
  @JsonKey(name: 'total_billed')
  num get totalBilled => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_collected')
  num get totalCollected => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pending')
  num get totalPending => throw _privateConstructorUsedError;
  @JsonKey(name: 'txn_count')
  int get txnCount => throw _privateConstructorUsedError;

  /// Serializes this FinanceStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinanceStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinanceStatsCopyWith<FinanceStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceStatsCopyWith<$Res> {
  factory $FinanceStatsCopyWith(
    FinanceStats value,
    $Res Function(FinanceStats) then,
  ) = _$FinanceStatsCopyWithImpl<$Res, FinanceStats>;
  @useResult
  $Res call({
    @JsonKey(name: 'total_billed') num totalBilled,
    @JsonKey(name: 'total_collected') num totalCollected,
    @JsonKey(name: 'total_pending') num totalPending,
    @JsonKey(name: 'txn_count') int txnCount,
  });
}

/// @nodoc
class _$FinanceStatsCopyWithImpl<$Res, $Val extends FinanceStats>
    implements $FinanceStatsCopyWith<$Res> {
  _$FinanceStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinanceStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBilled = null,
    Object? totalCollected = null,
    Object? totalPending = null,
    Object? txnCount = null,
  }) {
    return _then(
      _value.copyWith(
            totalBilled: null == totalBilled
                ? _value.totalBilled
                : totalBilled // ignore: cast_nullable_to_non_nullable
                      as num,
            totalCollected: null == totalCollected
                ? _value.totalCollected
                : totalCollected // ignore: cast_nullable_to_non_nullable
                      as num,
            totalPending: null == totalPending
                ? _value.totalPending
                : totalPending // ignore: cast_nullable_to_non_nullable
                      as num,
            txnCount: null == txnCount
                ? _value.txnCount
                : txnCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FinanceStatsImplCopyWith<$Res>
    implements $FinanceStatsCopyWith<$Res> {
  factory _$$FinanceStatsImplCopyWith(
    _$FinanceStatsImpl value,
    $Res Function(_$FinanceStatsImpl) then,
  ) = __$$FinanceStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'total_billed') num totalBilled,
    @JsonKey(name: 'total_collected') num totalCollected,
    @JsonKey(name: 'total_pending') num totalPending,
    @JsonKey(name: 'txn_count') int txnCount,
  });
}

/// @nodoc
class __$$FinanceStatsImplCopyWithImpl<$Res>
    extends _$FinanceStatsCopyWithImpl<$Res, _$FinanceStatsImpl>
    implements _$$FinanceStatsImplCopyWith<$Res> {
  __$$FinanceStatsImplCopyWithImpl(
    _$FinanceStatsImpl _value,
    $Res Function(_$FinanceStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FinanceStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBilled = null,
    Object? totalCollected = null,
    Object? totalPending = null,
    Object? txnCount = null,
  }) {
    return _then(
      _$FinanceStatsImpl(
        totalBilled: null == totalBilled
            ? _value.totalBilled
            : totalBilled // ignore: cast_nullable_to_non_nullable
                  as num,
        totalCollected: null == totalCollected
            ? _value.totalCollected
            : totalCollected // ignore: cast_nullable_to_non_nullable
                  as num,
        totalPending: null == totalPending
            ? _value.totalPending
            : totalPending // ignore: cast_nullable_to_non_nullable
                  as num,
        txnCount: null == txnCount
            ? _value.txnCount
            : txnCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FinanceStatsImpl implements _FinanceStats {
  const _$FinanceStatsImpl({
    @JsonKey(name: 'total_billed') required this.totalBilled,
    @JsonKey(name: 'total_collected') required this.totalCollected,
    @JsonKey(name: 'total_pending') required this.totalPending,
    @JsonKey(name: 'txn_count') required this.txnCount,
  });

  factory _$FinanceStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinanceStatsImplFromJson(json);

  @override
  @JsonKey(name: 'total_billed')
  final num totalBilled;
  @override
  @JsonKey(name: 'total_collected')
  final num totalCollected;
  @override
  @JsonKey(name: 'total_pending')
  final num totalPending;
  @override
  @JsonKey(name: 'txn_count')
  final int txnCount;

  @override
  String toString() {
    return 'FinanceStats(totalBilled: $totalBilled, totalCollected: $totalCollected, totalPending: $totalPending, txnCount: $txnCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinanceStatsImpl &&
            (identical(other.totalBilled, totalBilled) ||
                other.totalBilled == totalBilled) &&
            (identical(other.totalCollected, totalCollected) ||
                other.totalCollected == totalCollected) &&
            (identical(other.totalPending, totalPending) ||
                other.totalPending == totalPending) &&
            (identical(other.txnCount, txnCount) ||
                other.txnCount == txnCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalBilled,
    totalCollected,
    totalPending,
    txnCount,
  );

  /// Create a copy of FinanceStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinanceStatsImplCopyWith<_$FinanceStatsImpl> get copyWith =>
      __$$FinanceStatsImplCopyWithImpl<_$FinanceStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinanceStatsImplToJson(this);
  }
}

abstract class _FinanceStats implements FinanceStats {
  const factory _FinanceStats({
    @JsonKey(name: 'total_billed') required final num totalBilled,
    @JsonKey(name: 'total_collected') required final num totalCollected,
    @JsonKey(name: 'total_pending') required final num totalPending,
    @JsonKey(name: 'txn_count') required final int txnCount,
  }) = _$FinanceStatsImpl;

  factory _FinanceStats.fromJson(Map<String, dynamic> json) =
      _$FinanceStatsImpl.fromJson;

  @override
  @JsonKey(name: 'total_billed')
  num get totalBilled;
  @override
  @JsonKey(name: 'total_collected')
  num get totalCollected;
  @override
  @JsonKey(name: 'total_pending')
  num get totalPending;
  @override
  @JsonKey(name: 'txn_count')
  int get txnCount;

  /// Create a copy of FinanceStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinanceStatsImplCopyWith<_$FinanceStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FinanceTransaction _$FinanceTransactionFromJson(Map<String, dynamic> json) {
  return _FinanceTransaction.fromJson(json);
}

/// @nodoc
mixin _$FinanceTransaction {
  @JsonKey(name: 'invoice_id')
  String get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_number')
  String get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  num get paid => throw _privateConstructorUsedError;
  num get balance => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get mode => throw _privateConstructorUsedError;
  Map<String, dynamic> get patient => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_name')
  String? get doctorName => throw _privateConstructorUsedError;

  /// Serializes this FinanceTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinanceTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinanceTransactionCopyWith<FinanceTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceTransactionCopyWith<$Res> {
  factory $FinanceTransactionCopyWith(
    FinanceTransaction value,
    $Res Function(FinanceTransaction) then,
  ) = _$FinanceTransactionCopyWithImpl<$Res, FinanceTransaction>;
  @useResult
  $Res call({
    @JsonKey(name: 'invoice_id') String invoiceId,
    @JsonKey(name: 'invoice_number') String invoiceNumber,
    @JsonKey(name: 'created_at') DateTime createdAt,
    num amount,
    num paid,
    num balance,
    String? status,
    String? mode,
    Map<String, dynamic> patient,
    @JsonKey(name: 'doctor_name') String? doctorName,
  });
}

/// @nodoc
class _$FinanceTransactionCopyWithImpl<$Res, $Val extends FinanceTransaction>
    implements $FinanceTransactionCopyWith<$Res> {
  _$FinanceTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinanceTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceId = null,
    Object? invoiceNumber = null,
    Object? createdAt = null,
    Object? amount = null,
    Object? paid = null,
    Object? balance = null,
    Object? status = freezed,
    Object? mode = freezed,
    Object? patient = null,
    Object? doctorName = freezed,
  }) {
    return _then(
      _value.copyWith(
            invoiceId: null == invoiceId
                ? _value.invoiceId
                : invoiceId // ignore: cast_nullable_to_non_nullable
                      as String,
            invoiceNumber: null == invoiceNumber
                ? _value.invoiceNumber
                : invoiceNumber // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as num,
            paid: null == paid
                ? _value.paid
                : paid // ignore: cast_nullable_to_non_nullable
                      as num,
            balance: null == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as num,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            mode: freezed == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                      as String?,
            patient: null == patient
                ? _value.patient
                : patient // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
            doctorName: freezed == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FinanceTransactionImplCopyWith<$Res>
    implements $FinanceTransactionCopyWith<$Res> {
  factory _$$FinanceTransactionImplCopyWith(
    _$FinanceTransactionImpl value,
    $Res Function(_$FinanceTransactionImpl) then,
  ) = __$$FinanceTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'invoice_id') String invoiceId,
    @JsonKey(name: 'invoice_number') String invoiceNumber,
    @JsonKey(name: 'created_at') DateTime createdAt,
    num amount,
    num paid,
    num balance,
    String? status,
    String? mode,
    Map<String, dynamic> patient,
    @JsonKey(name: 'doctor_name') String? doctorName,
  });
}

/// @nodoc
class __$$FinanceTransactionImplCopyWithImpl<$Res>
    extends _$FinanceTransactionCopyWithImpl<$Res, _$FinanceTransactionImpl>
    implements _$$FinanceTransactionImplCopyWith<$Res> {
  __$$FinanceTransactionImplCopyWithImpl(
    _$FinanceTransactionImpl _value,
    $Res Function(_$FinanceTransactionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FinanceTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceId = null,
    Object? invoiceNumber = null,
    Object? createdAt = null,
    Object? amount = null,
    Object? paid = null,
    Object? balance = null,
    Object? status = freezed,
    Object? mode = freezed,
    Object? patient = null,
    Object? doctorName = freezed,
  }) {
    return _then(
      _$FinanceTransactionImpl(
        invoiceId: null == invoiceId
            ? _value.invoiceId
            : invoiceId // ignore: cast_nullable_to_non_nullable
                  as String,
        invoiceNumber: null == invoiceNumber
            ? _value.invoiceNumber
            : invoiceNumber // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as num,
        paid: null == paid
            ? _value.paid
            : paid // ignore: cast_nullable_to_non_nullable
                  as num,
        balance: null == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as num,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        mode: freezed == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as String?,
        patient: null == patient
            ? _value._patient
            : patient // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
        doctorName: freezed == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FinanceTransactionImpl implements _FinanceTransaction {
  const _$FinanceTransactionImpl({
    @JsonKey(name: 'invoice_id') required this.invoiceId,
    @JsonKey(name: 'invoice_number') required this.invoiceNumber,
    @JsonKey(name: 'created_at') required this.createdAt,
    required this.amount,
    required this.paid,
    required this.balance,
    this.status,
    this.mode,
    required final Map<String, dynamic> patient,
    @JsonKey(name: 'doctor_name') this.doctorName,
  }) : _patient = patient;

  factory _$FinanceTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinanceTransactionImplFromJson(json);

  @override
  @JsonKey(name: 'invoice_id')
  final String invoiceId;
  @override
  @JsonKey(name: 'invoice_number')
  final String invoiceNumber;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  final num amount;
  @override
  final num paid;
  @override
  final num balance;
  @override
  final String? status;
  @override
  final String? mode;
  final Map<String, dynamic> _patient;
  @override
  Map<String, dynamic> get patient {
    if (_patient is EqualUnmodifiableMapView) return _patient;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_patient);
  }

  @override
  @JsonKey(name: 'doctor_name')
  final String? doctorName;

  @override
  String toString() {
    return 'FinanceTransaction(invoiceId: $invoiceId, invoiceNumber: $invoiceNumber, createdAt: $createdAt, amount: $amount, paid: $paid, balance: $balance, status: $status, mode: $mode, patient: $patient, doctorName: $doctorName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinanceTransactionImpl &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            const DeepCollectionEquality().equals(other._patient, _patient) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    invoiceId,
    invoiceNumber,
    createdAt,
    amount,
    paid,
    balance,
    status,
    mode,
    const DeepCollectionEquality().hash(_patient),
    doctorName,
  );

  /// Create a copy of FinanceTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinanceTransactionImplCopyWith<_$FinanceTransactionImpl> get copyWith =>
      __$$FinanceTransactionImplCopyWithImpl<_$FinanceTransactionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FinanceTransactionImplToJson(this);
  }
}

abstract class _FinanceTransaction implements FinanceTransaction {
  const factory _FinanceTransaction({
    @JsonKey(name: 'invoice_id') required final String invoiceId,
    @JsonKey(name: 'invoice_number') required final String invoiceNumber,
    @JsonKey(name: 'created_at') required final DateTime createdAt,
    required final num amount,
    required final num paid,
    required final num balance,
    final String? status,
    final String? mode,
    required final Map<String, dynamic> patient,
    @JsonKey(name: 'doctor_name') final String? doctorName,
  }) = _$FinanceTransactionImpl;

  factory _FinanceTransaction.fromJson(Map<String, dynamic> json) =
      _$FinanceTransactionImpl.fromJson;

  @override
  @JsonKey(name: 'invoice_id')
  String get invoiceId;
  @override
  @JsonKey(name: 'invoice_number')
  String get invoiceNumber;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  num get amount;
  @override
  num get paid;
  @override
  num get balance;
  @override
  String? get status;
  @override
  String? get mode;
  @override
  Map<String, dynamic> get patient;
  @override
  @JsonKey(name: 'doctor_name')
  String? get doctorName;

  /// Create a copy of FinanceTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinanceTransactionImplCopyWith<_$FinanceTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FinanceMeta _$FinanceMetaFromJson(Map<String, dynamic> json) {
  return _FinanceMeta.fromJson(json);
}

/// @nodoc
mixin _$FinanceMeta {
  @JsonKey(name: 'total_records')
  int get totalRecords => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;

  /// Serializes this FinanceMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinanceMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinanceMetaCopyWith<FinanceMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceMetaCopyWith<$Res> {
  factory $FinanceMetaCopyWith(
    FinanceMeta value,
    $Res Function(FinanceMeta) then,
  ) = _$FinanceMetaCopyWithImpl<$Res, FinanceMeta>;
  @useResult
  $Res call({
    @JsonKey(name: 'total_records') int totalRecords,
    @JsonKey(name: 'current_page') int currentPage,
  });
}

/// @nodoc
class _$FinanceMetaCopyWithImpl<$Res, $Val extends FinanceMeta>
    implements $FinanceMetaCopyWith<$Res> {
  _$FinanceMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinanceMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? totalRecords = null, Object? currentPage = null}) {
    return _then(
      _value.copyWith(
            totalRecords: null == totalRecords
                ? _value.totalRecords
                : totalRecords // ignore: cast_nullable_to_non_nullable
                      as int,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FinanceMetaImplCopyWith<$Res>
    implements $FinanceMetaCopyWith<$Res> {
  factory _$$FinanceMetaImplCopyWith(
    _$FinanceMetaImpl value,
    $Res Function(_$FinanceMetaImpl) then,
  ) = __$$FinanceMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'total_records') int totalRecords,
    @JsonKey(name: 'current_page') int currentPage,
  });
}

/// @nodoc
class __$$FinanceMetaImplCopyWithImpl<$Res>
    extends _$FinanceMetaCopyWithImpl<$Res, _$FinanceMetaImpl>
    implements _$$FinanceMetaImplCopyWith<$Res> {
  __$$FinanceMetaImplCopyWithImpl(
    _$FinanceMetaImpl _value,
    $Res Function(_$FinanceMetaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FinanceMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? totalRecords = null, Object? currentPage = null}) {
    return _then(
      _$FinanceMetaImpl(
        totalRecords: null == totalRecords
            ? _value.totalRecords
            : totalRecords // ignore: cast_nullable_to_non_nullable
                  as int,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FinanceMetaImpl implements _FinanceMeta {
  const _$FinanceMetaImpl({
    @JsonKey(name: 'total_records') required this.totalRecords,
    @JsonKey(name: 'current_page') required this.currentPage,
  });

  factory _$FinanceMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinanceMetaImplFromJson(json);

  @override
  @JsonKey(name: 'total_records')
  final int totalRecords;
  @override
  @JsonKey(name: 'current_page')
  final int currentPage;

  @override
  String toString() {
    return 'FinanceMeta(totalRecords: $totalRecords, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinanceMetaImpl &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalRecords, currentPage);

  /// Create a copy of FinanceMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinanceMetaImplCopyWith<_$FinanceMetaImpl> get copyWith =>
      __$$FinanceMetaImplCopyWithImpl<_$FinanceMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinanceMetaImplToJson(this);
  }
}

abstract class _FinanceMeta implements FinanceMeta {
  const factory _FinanceMeta({
    @JsonKey(name: 'total_records') required final int totalRecords,
    @JsonKey(name: 'current_page') required final int currentPage,
  }) = _$FinanceMetaImpl;

  factory _FinanceMeta.fromJson(Map<String, dynamic> json) =
      _$FinanceMetaImpl.fromJson;

  @override
  @JsonKey(name: 'total_records')
  int get totalRecords;
  @override
  @JsonKey(name: 'current_page')
  int get currentPage;

  /// Create a copy of FinanceMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinanceMetaImplCopyWith<_$FinanceMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FinanceResponse _$FinanceResponseFromJson(Map<String, dynamic> json) {
  return _FinanceResponse.fromJson(json);
}

/// @nodoc
mixin _$FinanceResponse {
  FinanceStats get stats => throw _privateConstructorUsedError;
  List<FinanceTransaction> get transactions =>
      throw _privateConstructorUsedError;
  FinanceMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this FinanceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinanceResponseCopyWith<FinanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceResponseCopyWith<$Res> {
  factory $FinanceResponseCopyWith(
    FinanceResponse value,
    $Res Function(FinanceResponse) then,
  ) = _$FinanceResponseCopyWithImpl<$Res, FinanceResponse>;
  @useResult
  $Res call({
    FinanceStats stats,
    List<FinanceTransaction> transactions,
    FinanceMeta meta,
  });

  $FinanceStatsCopyWith<$Res> get stats;
  $FinanceMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$FinanceResponseCopyWithImpl<$Res, $Val extends FinanceResponse>
    implements $FinanceResponseCopyWith<$Res> {
  _$FinanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? transactions = null,
    Object? meta = null,
  }) {
    return _then(
      _value.copyWith(
            stats: null == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                      as FinanceStats,
            transactions: null == transactions
                ? _value.transactions
                : transactions // ignore: cast_nullable_to_non_nullable
                      as List<FinanceTransaction>,
            meta: null == meta
                ? _value.meta
                : meta // ignore: cast_nullable_to_non_nullable
                      as FinanceMeta,
          )
          as $Val,
    );
  }

  /// Create a copy of FinanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinanceStatsCopyWith<$Res> get stats {
    return $FinanceStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  /// Create a copy of FinanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinanceMetaCopyWith<$Res> get meta {
    return $FinanceMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FinanceResponseImplCopyWith<$Res>
    implements $FinanceResponseCopyWith<$Res> {
  factory _$$FinanceResponseImplCopyWith(
    _$FinanceResponseImpl value,
    $Res Function(_$FinanceResponseImpl) then,
  ) = __$$FinanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    FinanceStats stats,
    List<FinanceTransaction> transactions,
    FinanceMeta meta,
  });

  @override
  $FinanceStatsCopyWith<$Res> get stats;
  @override
  $FinanceMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$FinanceResponseImplCopyWithImpl<$Res>
    extends _$FinanceResponseCopyWithImpl<$Res, _$FinanceResponseImpl>
    implements _$$FinanceResponseImplCopyWith<$Res> {
  __$$FinanceResponseImplCopyWithImpl(
    _$FinanceResponseImpl _value,
    $Res Function(_$FinanceResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FinanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stats = null,
    Object? transactions = null,
    Object? meta = null,
  }) {
    return _then(
      _$FinanceResponseImpl(
        stats: null == stats
            ? _value.stats
            : stats // ignore: cast_nullable_to_non_nullable
                  as FinanceStats,
        transactions: null == transactions
            ? _value._transactions
            : transactions // ignore: cast_nullable_to_non_nullable
                  as List<FinanceTransaction>,
        meta: null == meta
            ? _value.meta
            : meta // ignore: cast_nullable_to_non_nullable
                  as FinanceMeta,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FinanceResponseImpl implements _FinanceResponse {
  const _$FinanceResponseImpl({
    required this.stats,
    required final List<FinanceTransaction> transactions,
    required this.meta,
  }) : _transactions = transactions;

  factory _$FinanceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinanceResponseImplFromJson(json);

  @override
  final FinanceStats stats;
  final List<FinanceTransaction> _transactions;
  @override
  List<FinanceTransaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final FinanceMeta meta;

  @override
  String toString() {
    return 'FinanceResponse(stats: $stats, transactions: $transactions, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinanceResponseImpl &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(
              other._transactions,
              _transactions,
            ) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    stats,
    const DeepCollectionEquality().hash(_transactions),
    meta,
  );

  /// Create a copy of FinanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinanceResponseImplCopyWith<_$FinanceResponseImpl> get copyWith =>
      __$$FinanceResponseImplCopyWithImpl<_$FinanceResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FinanceResponseImplToJson(this);
  }
}

abstract class _FinanceResponse implements FinanceResponse {
  const factory _FinanceResponse({
    required final FinanceStats stats,
    required final List<FinanceTransaction> transactions,
    required final FinanceMeta meta,
  }) = _$FinanceResponseImpl;

  factory _FinanceResponse.fromJson(Map<String, dynamic> json) =
      _$FinanceResponseImpl.fromJson;

  @override
  FinanceStats get stats;
  @override
  List<FinanceTransaction> get transactions;
  @override
  FinanceMeta get meta;

  /// Create a copy of FinanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinanceResponseImplCopyWith<_$FinanceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
