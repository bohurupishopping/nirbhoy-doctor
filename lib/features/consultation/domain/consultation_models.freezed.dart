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

ConsultationContext _$ConsultationContextFromJson(Map<String, dynamic> json) {
  return _ConsultationContext.fromJson(json);
}

/// @nodoc
mixin _$ConsultationContext {
  PersonBasicDetails get patient => throw _privateConstructorUsedError;
  String get consultationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'medical_profile')
  MedicalProfile get safetyProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit_history')
  List<VisitHistoryItem> get visitHistory => throw _privateConstructorUsedError;
  List<PatientDocument> get documents => throw _privateConstructorUsedError;
  @JsonKey(name: 'vitals_trend')
  List<VitalsTrendItem> get vitalsTrend => throw _privateConstructorUsedError;
  @JsonKey(name: 'ai_summary')
  String? get aiSummary => throw _privateConstructorUsedError;

  /// Serializes this ConsultationContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsultationContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsultationContextCopyWith<ConsultationContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationContextCopyWith<$Res> {
  factory $ConsultationContextCopyWith(
    ConsultationContext value,
    $Res Function(ConsultationContext) then,
  ) = _$ConsultationContextCopyWithImpl<$Res, ConsultationContext>;
  @useResult
  $Res call({
    PersonBasicDetails patient,
    String consultationId,
    @JsonKey(name: 'medical_profile') MedicalProfile safetyProfile,
    @JsonKey(name: 'visit_history') List<VisitHistoryItem> visitHistory,
    List<PatientDocument> documents,
    @JsonKey(name: 'vitals_trend') List<VitalsTrendItem> vitalsTrend,
    @JsonKey(name: 'ai_summary') String? aiSummary,
  });

  $PersonBasicDetailsCopyWith<$Res> get patient;
  $MedicalProfileCopyWith<$Res> get safetyProfile;
}

/// @nodoc
class _$ConsultationContextCopyWithImpl<$Res, $Val extends ConsultationContext>
    implements $ConsultationContextCopyWith<$Res> {
  _$ConsultationContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsultationContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = null,
    Object? consultationId = null,
    Object? safetyProfile = null,
    Object? visitHistory = null,
    Object? documents = null,
    Object? vitalsTrend = null,
    Object? aiSummary = freezed,
  }) {
    return _then(
      _value.copyWith(
            patient: null == patient
                ? _value.patient
                : patient // ignore: cast_nullable_to_non_nullable
                      as PersonBasicDetails,
            consultationId: null == consultationId
                ? _value.consultationId
                : consultationId // ignore: cast_nullable_to_non_nullable
                      as String,
            safetyProfile: null == safetyProfile
                ? _value.safetyProfile
                : safetyProfile // ignore: cast_nullable_to_non_nullable
                      as MedicalProfile,
            visitHistory: null == visitHistory
                ? _value.visitHistory
                : visitHistory // ignore: cast_nullable_to_non_nullable
                      as List<VisitHistoryItem>,
            documents: null == documents
                ? _value.documents
                : documents // ignore: cast_nullable_to_non_nullable
                      as List<PatientDocument>,
            vitalsTrend: null == vitalsTrend
                ? _value.vitalsTrend
                : vitalsTrend // ignore: cast_nullable_to_non_nullable
                      as List<VitalsTrendItem>,
            aiSummary: freezed == aiSummary
                ? _value.aiSummary
                : aiSummary // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ConsultationContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonBasicDetailsCopyWith<$Res> get patient {
    return $PersonBasicDetailsCopyWith<$Res>(_value.patient, (value) {
      return _then(_value.copyWith(patient: value) as $Val);
    });
  }

  /// Create a copy of ConsultationContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MedicalProfileCopyWith<$Res> get safetyProfile {
    return $MedicalProfileCopyWith<$Res>(_value.safetyProfile, (value) {
      return _then(_value.copyWith(safetyProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultationContextImplCopyWith<$Res>
    implements $ConsultationContextCopyWith<$Res> {
  factory _$$ConsultationContextImplCopyWith(
    _$ConsultationContextImpl value,
    $Res Function(_$ConsultationContextImpl) then,
  ) = __$$ConsultationContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PersonBasicDetails patient,
    String consultationId,
    @JsonKey(name: 'medical_profile') MedicalProfile safetyProfile,
    @JsonKey(name: 'visit_history') List<VisitHistoryItem> visitHistory,
    List<PatientDocument> documents,
    @JsonKey(name: 'vitals_trend') List<VitalsTrendItem> vitalsTrend,
    @JsonKey(name: 'ai_summary') String? aiSummary,
  });

  @override
  $PersonBasicDetailsCopyWith<$Res> get patient;
  @override
  $MedicalProfileCopyWith<$Res> get safetyProfile;
}

/// @nodoc
class __$$ConsultationContextImplCopyWithImpl<$Res>
    extends _$ConsultationContextCopyWithImpl<$Res, _$ConsultationContextImpl>
    implements _$$ConsultationContextImplCopyWith<$Res> {
  __$$ConsultationContextImplCopyWithImpl(
    _$ConsultationContextImpl _value,
    $Res Function(_$ConsultationContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsultationContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? patient = null,
    Object? consultationId = null,
    Object? safetyProfile = null,
    Object? visitHistory = null,
    Object? documents = null,
    Object? vitalsTrend = null,
    Object? aiSummary = freezed,
  }) {
    return _then(
      _$ConsultationContextImpl(
        patient: null == patient
            ? _value.patient
            : patient // ignore: cast_nullable_to_non_nullable
                  as PersonBasicDetails,
        consultationId: null == consultationId
            ? _value.consultationId
            : consultationId // ignore: cast_nullable_to_non_nullable
                  as String,
        safetyProfile: null == safetyProfile
            ? _value.safetyProfile
            : safetyProfile // ignore: cast_nullable_to_non_nullable
                  as MedicalProfile,
        visitHistory: null == visitHistory
            ? _value._visitHistory
            : visitHistory // ignore: cast_nullable_to_non_nullable
                  as List<VisitHistoryItem>,
        documents: null == documents
            ? _value._documents
            : documents // ignore: cast_nullable_to_non_nullable
                  as List<PatientDocument>,
        vitalsTrend: null == vitalsTrend
            ? _value._vitalsTrend
            : vitalsTrend // ignore: cast_nullable_to_non_nullable
                  as List<VitalsTrendItem>,
        aiSummary: freezed == aiSummary
            ? _value.aiSummary
            : aiSummary // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultationContextImpl
    with DiagnosticableTreeMixin
    implements _ConsultationContext {
  const _$ConsultationContextImpl({
    required this.patient,
    required this.consultationId,
    @JsonKey(name: 'medical_profile') required this.safetyProfile,
    @JsonKey(name: 'visit_history')
    final List<VisitHistoryItem> visitHistory = const [],
    final List<PatientDocument> documents = const [],
    @JsonKey(name: 'vitals_trend')
    final List<VitalsTrendItem> vitalsTrend = const [],
    @JsonKey(name: 'ai_summary') this.aiSummary,
  }) : _visitHistory = visitHistory,
       _documents = documents,
       _vitalsTrend = vitalsTrend;

  factory _$ConsultationContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationContextImplFromJson(json);

  @override
  final PersonBasicDetails patient;
  @override
  final String consultationId;
  @override
  @JsonKey(name: 'medical_profile')
  final MedicalProfile safetyProfile;
  final List<VisitHistoryItem> _visitHistory;
  @override
  @JsonKey(name: 'visit_history')
  List<VisitHistoryItem> get visitHistory {
    if (_visitHistory is EqualUnmodifiableListView) return _visitHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visitHistory);
  }

  final List<PatientDocument> _documents;
  @override
  @JsonKey()
  List<PatientDocument> get documents {
    if (_documents is EqualUnmodifiableListView) return _documents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_documents);
  }

  final List<VitalsTrendItem> _vitalsTrend;
  @override
  @JsonKey(name: 'vitals_trend')
  List<VitalsTrendItem> get vitalsTrend {
    if (_vitalsTrend is EqualUnmodifiableListView) return _vitalsTrend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vitalsTrend);
  }

  @override
  @JsonKey(name: 'ai_summary')
  final String? aiSummary;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConsultationContext(patient: $patient, consultationId: $consultationId, safetyProfile: $safetyProfile, visitHistory: $visitHistory, documents: $documents, vitalsTrend: $vitalsTrend, aiSummary: $aiSummary)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConsultationContext'))
      ..add(DiagnosticsProperty('patient', patient))
      ..add(DiagnosticsProperty('consultationId', consultationId))
      ..add(DiagnosticsProperty('safetyProfile', safetyProfile))
      ..add(DiagnosticsProperty('visitHistory', visitHistory))
      ..add(DiagnosticsProperty('documents', documents))
      ..add(DiagnosticsProperty('vitalsTrend', vitalsTrend))
      ..add(DiagnosticsProperty('aiSummary', aiSummary));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationContextImpl &&
            (identical(other.patient, patient) || other.patient == patient) &&
            (identical(other.consultationId, consultationId) ||
                other.consultationId == consultationId) &&
            (identical(other.safetyProfile, safetyProfile) ||
                other.safetyProfile == safetyProfile) &&
            const DeepCollectionEquality().equals(
              other._visitHistory,
              _visitHistory,
            ) &&
            const DeepCollectionEquality().equals(
              other._documents,
              _documents,
            ) &&
            const DeepCollectionEquality().equals(
              other._vitalsTrend,
              _vitalsTrend,
            ) &&
            (identical(other.aiSummary, aiSummary) ||
                other.aiSummary == aiSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    patient,
    consultationId,
    safetyProfile,
    const DeepCollectionEquality().hash(_visitHistory),
    const DeepCollectionEquality().hash(_documents),
    const DeepCollectionEquality().hash(_vitalsTrend),
    aiSummary,
  );

  /// Create a copy of ConsultationContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationContextImplCopyWith<_$ConsultationContextImpl> get copyWith =>
      __$$ConsultationContextImplCopyWithImpl<_$ConsultationContextImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationContextImplToJson(this);
  }
}

abstract class _ConsultationContext implements ConsultationContext {
  const factory _ConsultationContext({
    required final PersonBasicDetails patient,
    required final String consultationId,
    @JsonKey(name: 'medical_profile')
    required final MedicalProfile safetyProfile,
    @JsonKey(name: 'visit_history') final List<VisitHistoryItem> visitHistory,
    final List<PatientDocument> documents,
    @JsonKey(name: 'vitals_trend') final List<VitalsTrendItem> vitalsTrend,
    @JsonKey(name: 'ai_summary') final String? aiSummary,
  }) = _$ConsultationContextImpl;

  factory _ConsultationContext.fromJson(Map<String, dynamic> json) =
      _$ConsultationContextImpl.fromJson;

  @override
  PersonBasicDetails get patient;
  @override
  String get consultationId;
  @override
  @JsonKey(name: 'medical_profile')
  MedicalProfile get safetyProfile;
  @override
  @JsonKey(name: 'visit_history')
  List<VisitHistoryItem> get visitHistory;
  @override
  List<PatientDocument> get documents;
  @override
  @JsonKey(name: 'vitals_trend')
  List<VitalsTrendItem> get vitalsTrend;
  @override
  @JsonKey(name: 'ai_summary')
  String? get aiSummary;

  /// Create a copy of ConsultationContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsultationContextImplCopyWith<_$ConsultationContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonBasicDetails _$PersonBasicDetailsFromJson(Map<String, dynamic> json) {
  return _PersonBasicDetails.fromJson(json);
}

/// @nodoc
mixin _$PersonBasicDetails {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  bool get isCritical => throw _privateConstructorUsedError;
  bool get isWheelchair => throw _privateConstructorUsedError;

  /// Serializes this PersonBasicDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonBasicDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonBasicDetailsCopyWith<PersonBasicDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonBasicDetailsCopyWith<$Res> {
  factory $PersonBasicDetailsCopyWith(
    PersonBasicDetails value,
    $Res Function(PersonBasicDetails) then,
  ) = _$PersonBasicDetailsCopyWithImpl<$Res, PersonBasicDetails>;
  @useResult
  $Res call({
    String id,
    String name,
    int age,
    String gender,
    String? phone,
    String? address,
    bool isCritical,
    bool isWheelchair,
  });
}

/// @nodoc
class _$PersonBasicDetailsCopyWithImpl<$Res, $Val extends PersonBasicDetails>
    implements $PersonBasicDetailsCopyWith<$Res> {
  _$PersonBasicDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonBasicDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = null,
    Object? gender = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? isCritical = null,
    Object? isWheelchair = null,
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
            age: null == age
                ? _value.age
                : age // ignore: cast_nullable_to_non_nullable
                      as int,
            gender: null == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            isCritical: null == isCritical
                ? _value.isCritical
                : isCritical // ignore: cast_nullable_to_non_nullable
                      as bool,
            isWheelchair: null == isWheelchair
                ? _value.isWheelchair
                : isWheelchair // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PersonBasicDetailsImplCopyWith<$Res>
    implements $PersonBasicDetailsCopyWith<$Res> {
  factory _$$PersonBasicDetailsImplCopyWith(
    _$PersonBasicDetailsImpl value,
    $Res Function(_$PersonBasicDetailsImpl) then,
  ) = __$$PersonBasicDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    int age,
    String gender,
    String? phone,
    String? address,
    bool isCritical,
    bool isWheelchair,
  });
}

/// @nodoc
class __$$PersonBasicDetailsImplCopyWithImpl<$Res>
    extends _$PersonBasicDetailsCopyWithImpl<$Res, _$PersonBasicDetailsImpl>
    implements _$$PersonBasicDetailsImplCopyWith<$Res> {
  __$$PersonBasicDetailsImplCopyWithImpl(
    _$PersonBasicDetailsImpl _value,
    $Res Function(_$PersonBasicDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PersonBasicDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? age = null,
    Object? gender = null,
    Object? phone = freezed,
    Object? address = freezed,
    Object? isCritical = null,
    Object? isWheelchair = null,
  }) {
    return _then(
      _$PersonBasicDetailsImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        age: null == age
            ? _value.age
            : age // ignore: cast_nullable_to_non_nullable
                  as int,
        gender: null == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        isCritical: null == isCritical
            ? _value.isCritical
            : isCritical // ignore: cast_nullable_to_non_nullable
                  as bool,
        isWheelchair: null == isWheelchair
            ? _value.isWheelchair
            : isWheelchair // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonBasicDetailsImpl
    with DiagnosticableTreeMixin
    implements _PersonBasicDetails {
  const _$PersonBasicDetailsImpl({
    this.id = '',
    this.name = 'Unknown',
    this.age = 0,
    this.gender = '',
    this.phone,
    this.address,
    this.isCritical = false,
    this.isWheelchair = false,
  });

  factory _$PersonBasicDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonBasicDetailsImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int age;
  @override
  @JsonKey()
  final String gender;
  @override
  final String? phone;
  @override
  final String? address;
  @override
  @JsonKey()
  final bool isCritical;
  @override
  @JsonKey()
  final bool isWheelchair;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PersonBasicDetails(id: $id, name: $name, age: $age, gender: $gender, phone: $phone, address: $address, isCritical: $isCritical, isWheelchair: $isWheelchair)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PersonBasicDetails'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('isCritical', isCritical))
      ..add(DiagnosticsProperty('isWheelchair', isWheelchair));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonBasicDetailsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isCritical, isCritical) ||
                other.isCritical == isCritical) &&
            (identical(other.isWheelchair, isWheelchair) ||
                other.isWheelchair == isWheelchair));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    age,
    gender,
    phone,
    address,
    isCritical,
    isWheelchair,
  );

  /// Create a copy of PersonBasicDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonBasicDetailsImplCopyWith<_$PersonBasicDetailsImpl> get copyWith =>
      __$$PersonBasicDetailsImplCopyWithImpl<_$PersonBasicDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonBasicDetailsImplToJson(this);
  }
}

abstract class _PersonBasicDetails implements PersonBasicDetails {
  const factory _PersonBasicDetails({
    final String id,
    final String name,
    final int age,
    final String gender,
    final String? phone,
    final String? address,
    final bool isCritical,
    final bool isWheelchair,
  }) = _$PersonBasicDetailsImpl;

  factory _PersonBasicDetails.fromJson(Map<String, dynamic> json) =
      _$PersonBasicDetailsImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get age;
  @override
  String get gender;
  @override
  String? get phone;
  @override
  String? get address;
  @override
  bool get isCritical;
  @override
  bool get isWheelchair;

  /// Create a copy of PersonBasicDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonBasicDetailsImplCopyWith<_$PersonBasicDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MedicalProfile _$MedicalProfileFromJson(Map<String, dynamic> json) {
  return _MedicalProfile.fromJson(json);
}

/// @nodoc
mixin _$MedicalProfile {
  List<String> get allergies => throw _privateConstructorUsedError;
  @JsonKey(name: 'chronic_conditions')
  List<String> get chronicConditions => throw _privateConstructorUsedError;
  @JsonKey(name: 'family_history')
  List<String> get familyHistory => throw _privateConstructorUsedError;
  @JsonKey(name: 'lifestyle_tags')
  Map<String, dynamic> get lifestyle => throw _privateConstructorUsedError;

  /// Serializes this MedicalProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicalProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicalProfileCopyWith<MedicalProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicalProfileCopyWith<$Res> {
  factory $MedicalProfileCopyWith(
    MedicalProfile value,
    $Res Function(MedicalProfile) then,
  ) = _$MedicalProfileCopyWithImpl<$Res, MedicalProfile>;
  @useResult
  $Res call({
    List<String> allergies,
    @JsonKey(name: 'chronic_conditions') List<String> chronicConditions,
    @JsonKey(name: 'family_history') List<String> familyHistory,
    @JsonKey(name: 'lifestyle_tags') Map<String, dynamic> lifestyle,
  });
}

/// @nodoc
class _$MedicalProfileCopyWithImpl<$Res, $Val extends MedicalProfile>
    implements $MedicalProfileCopyWith<$Res> {
  _$MedicalProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicalProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allergies = null,
    Object? chronicConditions = null,
    Object? familyHistory = null,
    Object? lifestyle = null,
  }) {
    return _then(
      _value.copyWith(
            allergies: null == allergies
                ? _value.allergies
                : allergies // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            chronicConditions: null == chronicConditions
                ? _value.chronicConditions
                : chronicConditions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            familyHistory: null == familyHistory
                ? _value.familyHistory
                : familyHistory // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            lifestyle: null == lifestyle
                ? _value.lifestyle
                : lifestyle // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MedicalProfileImplCopyWith<$Res>
    implements $MedicalProfileCopyWith<$Res> {
  factory _$$MedicalProfileImplCopyWith(
    _$MedicalProfileImpl value,
    $Res Function(_$MedicalProfileImpl) then,
  ) = __$$MedicalProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> allergies,
    @JsonKey(name: 'chronic_conditions') List<String> chronicConditions,
    @JsonKey(name: 'family_history') List<String> familyHistory,
    @JsonKey(name: 'lifestyle_tags') Map<String, dynamic> lifestyle,
  });
}

/// @nodoc
class __$$MedicalProfileImplCopyWithImpl<$Res>
    extends _$MedicalProfileCopyWithImpl<$Res, _$MedicalProfileImpl>
    implements _$$MedicalProfileImplCopyWith<$Res> {
  __$$MedicalProfileImplCopyWithImpl(
    _$MedicalProfileImpl _value,
    $Res Function(_$MedicalProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicalProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allergies = null,
    Object? chronicConditions = null,
    Object? familyHistory = null,
    Object? lifestyle = null,
  }) {
    return _then(
      _$MedicalProfileImpl(
        allergies: null == allergies
            ? _value._allergies
            : allergies // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        chronicConditions: null == chronicConditions
            ? _value._chronicConditions
            : chronicConditions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        familyHistory: null == familyHistory
            ? _value._familyHistory
            : familyHistory // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        lifestyle: null == lifestyle
            ? _value._lifestyle
            : lifestyle // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicalProfileImpl
    with DiagnosticableTreeMixin
    implements _MedicalProfile {
  const _$MedicalProfileImpl({
    final List<String> allergies = const [],
    @JsonKey(name: 'chronic_conditions')
    final List<String> chronicConditions = const [],
    @JsonKey(name: 'family_history')
    final List<String> familyHistory = const [],
    @JsonKey(name: 'lifestyle_tags')
    final Map<String, dynamic> lifestyle = const {},
  }) : _allergies = allergies,
       _chronicConditions = chronicConditions,
       _familyHistory = familyHistory,
       _lifestyle = lifestyle;

  factory _$MedicalProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicalProfileImplFromJson(json);

  final List<String> _allergies;
  @override
  @JsonKey()
  List<String> get allergies {
    if (_allergies is EqualUnmodifiableListView) return _allergies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergies);
  }

  final List<String> _chronicConditions;
  @override
  @JsonKey(name: 'chronic_conditions')
  List<String> get chronicConditions {
    if (_chronicConditions is EqualUnmodifiableListView)
      return _chronicConditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chronicConditions);
  }

  final List<String> _familyHistory;
  @override
  @JsonKey(name: 'family_history')
  List<String> get familyHistory {
    if (_familyHistory is EqualUnmodifiableListView) return _familyHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_familyHistory);
  }

  final Map<String, dynamic> _lifestyle;
  @override
  @JsonKey(name: 'lifestyle_tags')
  Map<String, dynamic> get lifestyle {
    if (_lifestyle is EqualUnmodifiableMapView) return _lifestyle;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lifestyle);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MedicalProfile(allergies: $allergies, chronicConditions: $chronicConditions, familyHistory: $familyHistory, lifestyle: $lifestyle)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MedicalProfile'))
      ..add(DiagnosticsProperty('allergies', allergies))
      ..add(DiagnosticsProperty('chronicConditions', chronicConditions))
      ..add(DiagnosticsProperty('familyHistory', familyHistory))
      ..add(DiagnosticsProperty('lifestyle', lifestyle));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicalProfileImpl &&
            const DeepCollectionEquality().equals(
              other._allergies,
              _allergies,
            ) &&
            const DeepCollectionEquality().equals(
              other._chronicConditions,
              _chronicConditions,
            ) &&
            const DeepCollectionEquality().equals(
              other._familyHistory,
              _familyHistory,
            ) &&
            const DeepCollectionEquality().equals(
              other._lifestyle,
              _lifestyle,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_allergies),
    const DeepCollectionEquality().hash(_chronicConditions),
    const DeepCollectionEquality().hash(_familyHistory),
    const DeepCollectionEquality().hash(_lifestyle),
  );

  /// Create a copy of MedicalProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicalProfileImplCopyWith<_$MedicalProfileImpl> get copyWith =>
      __$$MedicalProfileImplCopyWithImpl<_$MedicalProfileImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicalProfileImplToJson(this);
  }
}

abstract class _MedicalProfile implements MedicalProfile {
  const factory _MedicalProfile({
    final List<String> allergies,
    @JsonKey(name: 'chronic_conditions') final List<String> chronicConditions,
    @JsonKey(name: 'family_history') final List<String> familyHistory,
    @JsonKey(name: 'lifestyle_tags') final Map<String, dynamic> lifestyle,
  }) = _$MedicalProfileImpl;

  factory _MedicalProfile.fromJson(Map<String, dynamic> json) =
      _$MedicalProfileImpl.fromJson;

  @override
  List<String> get allergies;
  @override
  @JsonKey(name: 'chronic_conditions')
  List<String> get chronicConditions;
  @override
  @JsonKey(name: 'family_history')
  List<String> get familyHistory;
  @override
  @JsonKey(name: 'lifestyle_tags')
  Map<String, dynamic> get lifestyle;

  /// Create a copy of MedicalProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicalProfileImplCopyWith<_$MedicalProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VisitHistoryItem _$VisitHistoryItemFromJson(Map<String, dynamic> json) {
  return _VisitHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$VisitHistoryItem {
  @JsonKey(name: 'appointment_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit_date')
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'doctor_name')
  String? get doctorName => throw _privateConstructorUsedError;
  String? get specialty => throw _privateConstructorUsedError;
  List<dynamic> get diagnosis => throw _privateConstructorUsedError;
  Map<String, dynamic>? get vitals => throw _privateConstructorUsedError;
  List<dynamic> get prescriptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'lab_orders')
  List<dynamic> get labOrders => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  Map<String, dynamic>? get advice => throw _privateConstructorUsedError;

  /// Serializes this VisitHistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VisitHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VisitHistoryItemCopyWith<VisitHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitHistoryItemCopyWith<$Res> {
  factory $VisitHistoryItemCopyWith(
    VisitHistoryItem value,
    $Res Function(VisitHistoryItem) then,
  ) = _$VisitHistoryItemCopyWithImpl<$Res, VisitHistoryItem>;
  @useResult
  $Res call({
    @JsonKey(name: 'appointment_id') String id,
    @JsonKey(name: 'visit_date') DateTime date,
    @JsonKey(name: 'doctor_name') String? doctorName,
    String? specialty,
    List<dynamic> diagnosis,
    Map<String, dynamic>? vitals,
    List<dynamic> prescriptions,
    @JsonKey(name: 'lab_orders') List<dynamic> labOrders,
    String? notes,
    Map<String, dynamic>? advice,
  });
}

/// @nodoc
class _$VisitHistoryItemCopyWithImpl<$Res, $Val extends VisitHistoryItem>
    implements $VisitHistoryItemCopyWith<$Res> {
  _$VisitHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VisitHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? doctorName = freezed,
    Object? specialty = freezed,
    Object? diagnosis = null,
    Object? vitals = freezed,
    Object? prescriptions = null,
    Object? labOrders = null,
    Object? notes = freezed,
    Object? advice = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            doctorName: freezed == doctorName
                ? _value.doctorName
                : doctorName // ignore: cast_nullable_to_non_nullable
                      as String?,
            specialty: freezed == specialty
                ? _value.specialty
                : specialty // ignore: cast_nullable_to_non_nullable
                      as String?,
            diagnosis: null == diagnosis
                ? _value.diagnosis
                : diagnosis // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            vitals: freezed == vitals
                ? _value.vitals
                : vitals // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            prescriptions: null == prescriptions
                ? _value.prescriptions
                : prescriptions // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            labOrders: null == labOrders
                ? _value.labOrders
                : labOrders // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            advice: freezed == advice
                ? _value.advice
                : advice // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VisitHistoryItemImplCopyWith<$Res>
    implements $VisitHistoryItemCopyWith<$Res> {
  factory _$$VisitHistoryItemImplCopyWith(
    _$VisitHistoryItemImpl value,
    $Res Function(_$VisitHistoryItemImpl) then,
  ) = __$$VisitHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'appointment_id') String id,
    @JsonKey(name: 'visit_date') DateTime date,
    @JsonKey(name: 'doctor_name') String? doctorName,
    String? specialty,
    List<dynamic> diagnosis,
    Map<String, dynamic>? vitals,
    List<dynamic> prescriptions,
    @JsonKey(name: 'lab_orders') List<dynamic> labOrders,
    String? notes,
    Map<String, dynamic>? advice,
  });
}

/// @nodoc
class __$$VisitHistoryItemImplCopyWithImpl<$Res>
    extends _$VisitHistoryItemCopyWithImpl<$Res, _$VisitHistoryItemImpl>
    implements _$$VisitHistoryItemImplCopyWith<$Res> {
  __$$VisitHistoryItemImplCopyWithImpl(
    _$VisitHistoryItemImpl _value,
    $Res Function(_$VisitHistoryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VisitHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? doctorName = freezed,
    Object? specialty = freezed,
    Object? diagnosis = null,
    Object? vitals = freezed,
    Object? prescriptions = null,
    Object? labOrders = null,
    Object? notes = freezed,
    Object? advice = freezed,
  }) {
    return _then(
      _$VisitHistoryItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        doctorName: freezed == doctorName
            ? _value.doctorName
            : doctorName // ignore: cast_nullable_to_non_nullable
                  as String?,
        specialty: freezed == specialty
            ? _value.specialty
            : specialty // ignore: cast_nullable_to_non_nullable
                  as String?,
        diagnosis: null == diagnosis
            ? _value._diagnosis
            : diagnosis // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        vitals: freezed == vitals
            ? _value._vitals
            : vitals // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        prescriptions: null == prescriptions
            ? _value._prescriptions
            : prescriptions // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        labOrders: null == labOrders
            ? _value._labOrders
            : labOrders // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        advice: freezed == advice
            ? _value._advice
            : advice // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VisitHistoryItemImpl
    with DiagnosticableTreeMixin
    implements _VisitHistoryItem {
  const _$VisitHistoryItemImpl({
    @JsonKey(name: 'appointment_id') required this.id,
    @JsonKey(name: 'visit_date') required this.date,
    @JsonKey(name: 'doctor_name') this.doctorName,
    this.specialty,
    final List<dynamic> diagnosis = const [],
    final Map<String, dynamic>? vitals,
    final List<dynamic> prescriptions = const [],
    @JsonKey(name: 'lab_orders') final List<dynamic> labOrders = const [],
    this.notes,
    final Map<String, dynamic>? advice,
  }) : _diagnosis = diagnosis,
       _vitals = vitals,
       _prescriptions = prescriptions,
       _labOrders = labOrders,
       _advice = advice;

  factory _$VisitHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$VisitHistoryItemImplFromJson(json);

  @override
  @JsonKey(name: 'appointment_id')
  final String id;
  @override
  @JsonKey(name: 'visit_date')
  final DateTime date;
  @override
  @JsonKey(name: 'doctor_name')
  final String? doctorName;
  @override
  final String? specialty;
  final List<dynamic> _diagnosis;
  @override
  @JsonKey()
  List<dynamic> get diagnosis {
    if (_diagnosis is EqualUnmodifiableListView) return _diagnosis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diagnosis);
  }

  final Map<String, dynamic>? _vitals;
  @override
  Map<String, dynamic>? get vitals {
    final value = _vitals;
    if (value == null) return null;
    if (_vitals is EqualUnmodifiableMapView) return _vitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<dynamic> _prescriptions;
  @override
  @JsonKey()
  List<dynamic> get prescriptions {
    if (_prescriptions is EqualUnmodifiableListView) return _prescriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prescriptions);
  }

  final List<dynamic> _labOrders;
  @override
  @JsonKey(name: 'lab_orders')
  List<dynamic> get labOrders {
    if (_labOrders is EqualUnmodifiableListView) return _labOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labOrders);
  }

  @override
  final String? notes;
  final Map<String, dynamic>? _advice;
  @override
  Map<String, dynamic>? get advice {
    final value = _advice;
    if (value == null) return null;
    if (_advice is EqualUnmodifiableMapView) return _advice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VisitHistoryItem(id: $id, date: $date, doctorName: $doctorName, specialty: $specialty, diagnosis: $diagnosis, vitals: $vitals, prescriptions: $prescriptions, labOrders: $labOrders, notes: $notes, advice: $advice)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VisitHistoryItem'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('doctorName', doctorName))
      ..add(DiagnosticsProperty('specialty', specialty))
      ..add(DiagnosticsProperty('diagnosis', diagnosis))
      ..add(DiagnosticsProperty('vitals', vitals))
      ..add(DiagnosticsProperty('prescriptions', prescriptions))
      ..add(DiagnosticsProperty('labOrders', labOrders))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('advice', advice));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VisitHistoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.doctorName, doctorName) ||
                other.doctorName == doctorName) &&
            (identical(other.specialty, specialty) ||
                other.specialty == specialty) &&
            const DeepCollectionEquality().equals(
              other._diagnosis,
              _diagnosis,
            ) &&
            const DeepCollectionEquality().equals(other._vitals, _vitals) &&
            const DeepCollectionEquality().equals(
              other._prescriptions,
              _prescriptions,
            ) &&
            const DeepCollectionEquality().equals(
              other._labOrders,
              _labOrders,
            ) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._advice, _advice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    doctorName,
    specialty,
    const DeepCollectionEquality().hash(_diagnosis),
    const DeepCollectionEquality().hash(_vitals),
    const DeepCollectionEquality().hash(_prescriptions),
    const DeepCollectionEquality().hash(_labOrders),
    notes,
    const DeepCollectionEquality().hash(_advice),
  );

  /// Create a copy of VisitHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VisitHistoryItemImplCopyWith<_$VisitHistoryItemImpl> get copyWith =>
      __$$VisitHistoryItemImplCopyWithImpl<_$VisitHistoryItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VisitHistoryItemImplToJson(this);
  }
}

abstract class _VisitHistoryItem implements VisitHistoryItem {
  const factory _VisitHistoryItem({
    @JsonKey(name: 'appointment_id') required final String id,
    @JsonKey(name: 'visit_date') required final DateTime date,
    @JsonKey(name: 'doctor_name') final String? doctorName,
    final String? specialty,
    final List<dynamic> diagnosis,
    final Map<String, dynamic>? vitals,
    final List<dynamic> prescriptions,
    @JsonKey(name: 'lab_orders') final List<dynamic> labOrders,
    final String? notes,
    final Map<String, dynamic>? advice,
  }) = _$VisitHistoryItemImpl;

  factory _VisitHistoryItem.fromJson(Map<String, dynamic> json) =
      _$VisitHistoryItemImpl.fromJson;

  @override
  @JsonKey(name: 'appointment_id')
  String get id;
  @override
  @JsonKey(name: 'visit_date')
  DateTime get date;
  @override
  @JsonKey(name: 'doctor_name')
  String? get doctorName;
  @override
  String? get specialty;
  @override
  List<dynamic> get diagnosis;
  @override
  Map<String, dynamic>? get vitals;
  @override
  List<dynamic> get prescriptions;
  @override
  @JsonKey(name: 'lab_orders')
  List<dynamic> get labOrders;
  @override
  String? get notes;
  @override
  Map<String, dynamic>? get advice;

  /// Create a copy of VisitHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VisitHistoryItemImplCopyWith<_$VisitHistoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PatientDocument _$PatientDocumentFromJson(Map<String, dynamic> json) {
  return _PatientDocument.fromJson(json);
}

/// @nodoc
mixin _$PatientDocument {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get fileUrl => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

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
    @JsonKey(name: 'name') String fileName,
    @JsonKey(name: 'url') String fileUrl,
    String category,
    DateTime? date,
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
    Object? date = freezed,
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
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
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
    @JsonKey(name: 'name') String fileName,
    @JsonKey(name: 'url') String fileUrl,
    String category,
    DateTime? date,
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
    Object? date = freezed,
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
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PatientDocumentImpl
    with DiagnosticableTreeMixin
    implements _PatientDocument {
  const _$PatientDocumentImpl({
    this.id = '',
    @JsonKey(name: 'name') this.fileName = '',
    @JsonKey(name: 'url') this.fileUrl = '',
    this.category = '',
    this.date,
  });

  factory _$PatientDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PatientDocumentImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'name')
  final String fileName;
  @override
  @JsonKey(name: 'url')
  final String fileUrl;
  @override
  @JsonKey()
  final String category;
  @override
  final DateTime? date;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PatientDocument(id: $id, fileName: $fileName, fileUrl: $fileUrl, category: $category, date: $date)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PatientDocument'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('fileUrl', fileUrl))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('date', date));
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
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fileName, fileUrl, category, date);

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
    final String id,
    @JsonKey(name: 'name') final String fileName,
    @JsonKey(name: 'url') final String fileUrl,
    final String category,
    final DateTime? date,
  }) = _$PatientDocumentImpl;

  factory _PatientDocument.fromJson(Map<String, dynamic> json) =
      _$PatientDocumentImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'name')
  String get fileName;
  @override
  @JsonKey(name: 'url')
  String get fileUrl;
  @override
  String get category;
  @override
  DateTime? get date;

  /// Create a copy of PatientDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PatientDocumentImplCopyWith<_$PatientDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VitalsTrendItem _$VitalsTrendItemFromJson(Map<String, dynamic> json) {
  return _VitalsTrendItem.fromJson(json);
}

/// @nodoc
mixin _$VitalsTrendItem {
  DateTime? get date => throw _privateConstructorUsedError;
  String? get weight => throw _privateConstructorUsedError;
  String? get temp => throw _privateConstructorUsedError;
  String? get bp => throw _privateConstructorUsedError;

  /// Serializes this VitalsTrendItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VitalsTrendItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VitalsTrendItemCopyWith<VitalsTrendItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VitalsTrendItemCopyWith<$Res> {
  factory $VitalsTrendItemCopyWith(
    VitalsTrendItem value,
    $Res Function(VitalsTrendItem) then,
  ) = _$VitalsTrendItemCopyWithImpl<$Res, VitalsTrendItem>;
  @useResult
  $Res call({DateTime? date, String? weight, String? temp, String? bp});
}

/// @nodoc
class _$VitalsTrendItemCopyWithImpl<$Res, $Val extends VitalsTrendItem>
    implements $VitalsTrendItemCopyWith<$Res> {
  _$VitalsTrendItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VitalsTrendItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? weight = freezed,
    Object? temp = freezed,
    Object? bp = freezed,
  }) {
    return _then(
      _value.copyWith(
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            weight: freezed == weight
                ? _value.weight
                : weight // ignore: cast_nullable_to_non_nullable
                      as String?,
            temp: freezed == temp
                ? _value.temp
                : temp // ignore: cast_nullable_to_non_nullable
                      as String?,
            bp: freezed == bp
                ? _value.bp
                : bp // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VitalsTrendItemImplCopyWith<$Res>
    implements $VitalsTrendItemCopyWith<$Res> {
  factory _$$VitalsTrendItemImplCopyWith(
    _$VitalsTrendItemImpl value,
    $Res Function(_$VitalsTrendItemImpl) then,
  ) = __$$VitalsTrendItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? date, String? weight, String? temp, String? bp});
}

/// @nodoc
class __$$VitalsTrendItemImplCopyWithImpl<$Res>
    extends _$VitalsTrendItemCopyWithImpl<$Res, _$VitalsTrendItemImpl>
    implements _$$VitalsTrendItemImplCopyWith<$Res> {
  __$$VitalsTrendItemImplCopyWithImpl(
    _$VitalsTrendItemImpl _value,
    $Res Function(_$VitalsTrendItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VitalsTrendItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? weight = freezed,
    Object? temp = freezed,
    Object? bp = freezed,
  }) {
    return _then(
      _$VitalsTrendItemImpl(
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        weight: freezed == weight
            ? _value.weight
            : weight // ignore: cast_nullable_to_non_nullable
                  as String?,
        temp: freezed == temp
            ? _value.temp
            : temp // ignore: cast_nullable_to_non_nullable
                  as String?,
        bp: freezed == bp
            ? _value.bp
            : bp // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VitalsTrendItemImpl
    with DiagnosticableTreeMixin
    implements _VitalsTrendItem {
  const _$VitalsTrendItemImpl({this.date, this.weight, this.temp, this.bp});

  factory _$VitalsTrendItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$VitalsTrendItemImplFromJson(json);

  @override
  final DateTime? date;
  @override
  final String? weight;
  @override
  final String? temp;
  @override
  final String? bp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VitalsTrendItem(date: $date, weight: $weight, temp: $temp, bp: $bp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VitalsTrendItem'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('temp', temp))
      ..add(DiagnosticsProperty('bp', bp));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VitalsTrendItemImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.bp, bp) || other.bp == bp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, weight, temp, bp);

  /// Create a copy of VitalsTrendItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VitalsTrendItemImplCopyWith<_$VitalsTrendItemImpl> get copyWith =>
      __$$VitalsTrendItemImplCopyWithImpl<_$VitalsTrendItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VitalsTrendItemImplToJson(this);
  }
}

abstract class _VitalsTrendItem implements VitalsTrendItem {
  const factory _VitalsTrendItem({
    final DateTime? date,
    final String? weight,
    final String? temp,
    final String? bp,
  }) = _$VitalsTrendItemImpl;

  factory _VitalsTrendItem.fromJson(Map<String, dynamic> json) =
      _$VitalsTrendItemImpl.fromJson;

  @override
  DateTime? get date;
  @override
  String? get weight;
  @override
  String? get temp;
  @override
  String? get bp;

  /// Create a copy of VitalsTrendItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VitalsTrendItemImplCopyWith<_$VitalsTrendItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MedicineSearchResult _$MedicineSearchResultFromJson(Map<String, dynamic> json) {
  return _MedicineSearchResult.fromJson(json);
}

/// @nodoc
mixin _$MedicineSearchResult {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'brand_name')
  String get brandName => throw _privateConstructorUsedError;
  @JsonKey(name: 'generic_name')
  String? get genericName => throw _privateConstructorUsedError;
  String? get strength => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get manufacturer => throw _privateConstructorUsedError;
  String? get composition => throw _privateConstructorUsedError;

  /// Serializes this MedicineSearchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MedicineSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MedicineSearchResultCopyWith<MedicineSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicineSearchResultCopyWith<$Res> {
  factory $MedicineSearchResultCopyWith(
    MedicineSearchResult value,
    $Res Function(MedicineSearchResult) then,
  ) = _$MedicineSearchResultCopyWithImpl<$Res, MedicineSearchResult>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'brand_name') String brandName,
    @JsonKey(name: 'generic_name') String? genericName,
    String? strength,
    String? type,
    String? manufacturer,
    String? composition,
  });
}

/// @nodoc
class _$MedicineSearchResultCopyWithImpl<
  $Res,
  $Val extends MedicineSearchResult
>
    implements $MedicineSearchResultCopyWith<$Res> {
  _$MedicineSearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MedicineSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brandName = null,
    Object? genericName = freezed,
    Object? strength = freezed,
    Object? type = freezed,
    Object? manufacturer = freezed,
    Object? composition = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            brandName: null == brandName
                ? _value.brandName
                : brandName // ignore: cast_nullable_to_non_nullable
                      as String,
            genericName: freezed == genericName
                ? _value.genericName
                : genericName // ignore: cast_nullable_to_non_nullable
                      as String?,
            strength: freezed == strength
                ? _value.strength
                : strength // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            manufacturer: freezed == manufacturer
                ? _value.manufacturer
                : manufacturer // ignore: cast_nullable_to_non_nullable
                      as String?,
            composition: freezed == composition
                ? _value.composition
                : composition // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MedicineSearchResultImplCopyWith<$Res>
    implements $MedicineSearchResultCopyWith<$Res> {
  factory _$$MedicineSearchResultImplCopyWith(
    _$MedicineSearchResultImpl value,
    $Res Function(_$MedicineSearchResultImpl) then,
  ) = __$$MedicineSearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'brand_name') String brandName,
    @JsonKey(name: 'generic_name') String? genericName,
    String? strength,
    String? type,
    String? manufacturer,
    String? composition,
  });
}

/// @nodoc
class __$$MedicineSearchResultImplCopyWithImpl<$Res>
    extends _$MedicineSearchResultCopyWithImpl<$Res, _$MedicineSearchResultImpl>
    implements _$$MedicineSearchResultImplCopyWith<$Res> {
  __$$MedicineSearchResultImplCopyWithImpl(
    _$MedicineSearchResultImpl _value,
    $Res Function(_$MedicineSearchResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MedicineSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? brandName = null,
    Object? genericName = freezed,
    Object? strength = freezed,
    Object? type = freezed,
    Object? manufacturer = freezed,
    Object? composition = freezed,
  }) {
    return _then(
      _$MedicineSearchResultImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        brandName: null == brandName
            ? _value.brandName
            : brandName // ignore: cast_nullable_to_non_nullable
                  as String,
        genericName: freezed == genericName
            ? _value.genericName
            : genericName // ignore: cast_nullable_to_non_nullable
                  as String?,
        strength: freezed == strength
            ? _value.strength
            : strength // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        manufacturer: freezed == manufacturer
            ? _value.manufacturer
            : manufacturer // ignore: cast_nullable_to_non_nullable
                  as String?,
        composition: freezed == composition
            ? _value.composition
            : composition // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicineSearchResultImpl
    with DiagnosticableTreeMixin
    implements _MedicineSearchResult {
  const _$MedicineSearchResultImpl({
    required this.id,
    @JsonKey(name: 'brand_name') required this.brandName,
    @JsonKey(name: 'generic_name') this.genericName,
    this.strength,
    this.type,
    this.manufacturer,
    this.composition,
  });

  factory _$MedicineSearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicineSearchResultImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'brand_name')
  final String brandName;
  @override
  @JsonKey(name: 'generic_name')
  final String? genericName;
  @override
  final String? strength;
  @override
  final String? type;
  @override
  final String? manufacturer;
  @override
  final String? composition;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MedicineSearchResult(id: $id, brandName: $brandName, genericName: $genericName, strength: $strength, type: $type, manufacturer: $manufacturer, composition: $composition)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MedicineSearchResult'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('brandName', brandName))
      ..add(DiagnosticsProperty('genericName', genericName))
      ..add(DiagnosticsProperty('strength', strength))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('manufacturer', manufacturer))
      ..add(DiagnosticsProperty('composition', composition));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicineSearchResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.genericName, genericName) ||
                other.genericName == genericName) &&
            (identical(other.strength, strength) ||
                other.strength == strength) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.composition, composition) ||
                other.composition == composition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    brandName,
    genericName,
    strength,
    type,
    manufacturer,
    composition,
  );

  /// Create a copy of MedicineSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicineSearchResultImplCopyWith<_$MedicineSearchResultImpl>
  get copyWith =>
      __$$MedicineSearchResultImplCopyWithImpl<_$MedicineSearchResultImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicineSearchResultImplToJson(this);
  }
}

abstract class _MedicineSearchResult implements MedicineSearchResult {
  const factory _MedicineSearchResult({
    required final String id,
    @JsonKey(name: 'brand_name') required final String brandName,
    @JsonKey(name: 'generic_name') final String? genericName,
    final String? strength,
    final String? type,
    final String? manufacturer,
    final String? composition,
  }) = _$MedicineSearchResultImpl;

  factory _MedicineSearchResult.fromJson(Map<String, dynamic> json) =
      _$MedicineSearchResultImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'brand_name')
  String get brandName;
  @override
  @JsonKey(name: 'generic_name')
  String? get genericName;
  @override
  String? get strength;
  @override
  String? get type;
  @override
  String? get manufacturer;
  @override
  String? get composition;

  /// Create a copy of MedicineSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MedicineSearchResultImplCopyWith<_$MedicineSearchResultImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ConsultationMedicine _$ConsultationMedicineFromJson(Map<String, dynamic> json) {
  return _ConsultationMedicine.fromJson(json);
}

/// @nodoc
mixin _$ConsultationMedicine {
  // Store tempId for UI keys if needed, or rely on index
  String get tempId => throw _privateConstructorUsedError;
  String get masterId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError; // brand name
  String? get composition => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get frequency => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  String? get instruction => throw _privateConstructorUsedError;
  String? get specialInstructions => throw _privateConstructorUsedError;

  /// Serializes this ConsultationMedicine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsultationMedicine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsultationMedicineCopyWith<ConsultationMedicine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationMedicineCopyWith<$Res> {
  factory $ConsultationMedicineCopyWith(
    ConsultationMedicine value,
    $Res Function(ConsultationMedicine) then,
  ) = _$ConsultationMedicineCopyWithImpl<$Res, ConsultationMedicine>;
  @useResult
  $Res call({
    String tempId,
    String masterId,
    String name,
    String? composition,
    String? type,
    String? frequency,
    String? duration,
    String? instruction,
    String? specialInstructions,
  });
}

/// @nodoc
class _$ConsultationMedicineCopyWithImpl<
  $Res,
  $Val extends ConsultationMedicine
>
    implements $ConsultationMedicineCopyWith<$Res> {
  _$ConsultationMedicineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsultationMedicine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempId = null,
    Object? masterId = null,
    Object? name = null,
    Object? composition = freezed,
    Object? type = freezed,
    Object? frequency = freezed,
    Object? duration = freezed,
    Object? instruction = freezed,
    Object? specialInstructions = freezed,
  }) {
    return _then(
      _value.copyWith(
            tempId: null == tempId
                ? _value.tempId
                : tempId // ignore: cast_nullable_to_non_nullable
                      as String,
            masterId: null == masterId
                ? _value.masterId
                : masterId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            composition: freezed == composition
                ? _value.composition
                : composition // ignore: cast_nullable_to_non_nullable
                      as String?,
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
            specialInstructions: freezed == specialInstructions
                ? _value.specialInstructions
                : specialInstructions // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsultationMedicineImplCopyWith<$Res>
    implements $ConsultationMedicineCopyWith<$Res> {
  factory _$$ConsultationMedicineImplCopyWith(
    _$ConsultationMedicineImpl value,
    $Res Function(_$ConsultationMedicineImpl) then,
  ) = __$$ConsultationMedicineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String tempId,
    String masterId,
    String name,
    String? composition,
    String? type,
    String? frequency,
    String? duration,
    String? instruction,
    String? specialInstructions,
  });
}

/// @nodoc
class __$$ConsultationMedicineImplCopyWithImpl<$Res>
    extends _$ConsultationMedicineCopyWithImpl<$Res, _$ConsultationMedicineImpl>
    implements _$$ConsultationMedicineImplCopyWith<$Res> {
  __$$ConsultationMedicineImplCopyWithImpl(
    _$ConsultationMedicineImpl _value,
    $Res Function(_$ConsultationMedicineImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsultationMedicine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tempId = null,
    Object? masterId = null,
    Object? name = null,
    Object? composition = freezed,
    Object? type = freezed,
    Object? frequency = freezed,
    Object? duration = freezed,
    Object? instruction = freezed,
    Object? specialInstructions = freezed,
  }) {
    return _then(
      _$ConsultationMedicineImpl(
        tempId: null == tempId
            ? _value.tempId
            : tempId // ignore: cast_nullable_to_non_nullable
                  as String,
        masterId: null == masterId
            ? _value.masterId
            : masterId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        composition: freezed == composition
            ? _value.composition
            : composition // ignore: cast_nullable_to_non_nullable
                  as String?,
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
        specialInstructions: freezed == specialInstructions
            ? _value.specialInstructions
            : specialInstructions // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultationMedicineImpl
    with DiagnosticableTreeMixin
    implements _ConsultationMedicine {
  const _$ConsultationMedicineImpl({
    required this.tempId,
    required this.masterId,
    required this.name,
    this.composition,
    this.type,
    this.frequency,
    this.duration,
    this.instruction,
    this.specialInstructions,
  });

  factory _$ConsultationMedicineImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationMedicineImplFromJson(json);

  // Store tempId for UI keys if needed, or rely on index
  @override
  final String tempId;
  @override
  final String masterId;
  @override
  final String name;
  // brand name
  @override
  final String? composition;
  @override
  final String? type;
  @override
  final String? frequency;
  @override
  final String? duration;
  @override
  final String? instruction;
  @override
  final String? specialInstructions;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConsultationMedicine(tempId: $tempId, masterId: $masterId, name: $name, composition: $composition, type: $type, frequency: $frequency, duration: $duration, instruction: $instruction, specialInstructions: $specialInstructions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConsultationMedicine'))
      ..add(DiagnosticsProperty('tempId', tempId))
      ..add(DiagnosticsProperty('masterId', masterId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('composition', composition))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('frequency', frequency))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('instruction', instruction))
      ..add(DiagnosticsProperty('specialInstructions', specialInstructions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationMedicineImpl &&
            (identical(other.tempId, tempId) || other.tempId == tempId) &&
            (identical(other.masterId, masterId) ||
                other.masterId == masterId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.composition, composition) ||
                other.composition == composition) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    tempId,
    masterId,
    name,
    composition,
    type,
    frequency,
    duration,
    instruction,
    specialInstructions,
  );

  /// Create a copy of ConsultationMedicine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationMedicineImplCopyWith<_$ConsultationMedicineImpl>
  get copyWith =>
      __$$ConsultationMedicineImplCopyWithImpl<_$ConsultationMedicineImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationMedicineImplToJson(this);
  }
}

abstract class _ConsultationMedicine implements ConsultationMedicine {
  const factory _ConsultationMedicine({
    required final String tempId,
    required final String masterId,
    required final String name,
    final String? composition,
    final String? type,
    final String? frequency,
    final String? duration,
    final String? instruction,
    final String? specialInstructions,
  }) = _$ConsultationMedicineImpl;

  factory _ConsultationMedicine.fromJson(Map<String, dynamic> json) =
      _$ConsultationMedicineImpl.fromJson;

  // Store tempId for UI keys if needed, or rely on index
  @override
  String get tempId;
  @override
  String get masterId;
  @override
  String get name; // brand name
  @override
  String? get composition;
  @override
  String? get type;
  @override
  String? get frequency;
  @override
  String? get duration;
  @override
  String? get instruction;
  @override
  String? get specialInstructions;

  /// Create a copy of ConsultationMedicine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsultationMedicineImplCopyWith<_$ConsultationMedicineImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ConsultationLab _$ConsultationLabFromJson(Map<String, dynamic> json) {
  return _ConsultationLab.fromJson(json);
}

/// @nodoc
mixin _$ConsultationLab {
  String get testName => throw _privateConstructorUsedError;
  String? get instruction => throw _privateConstructorUsedError;

  /// Serializes this ConsultationLab to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsultationLab
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsultationLabCopyWith<ConsultationLab> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultationLabCopyWith<$Res> {
  factory $ConsultationLabCopyWith(
    ConsultationLab value,
    $Res Function(ConsultationLab) then,
  ) = _$ConsultationLabCopyWithImpl<$Res, ConsultationLab>;
  @useResult
  $Res call({String testName, String? instruction});
}

/// @nodoc
class _$ConsultationLabCopyWithImpl<$Res, $Val extends ConsultationLab>
    implements $ConsultationLabCopyWith<$Res> {
  _$ConsultationLabCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsultationLab
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
abstract class _$$ConsultationLabImplCopyWith<$Res>
    implements $ConsultationLabCopyWith<$Res> {
  factory _$$ConsultationLabImplCopyWith(
    _$ConsultationLabImpl value,
    $Res Function(_$ConsultationLabImpl) then,
  ) = __$$ConsultationLabImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String testName, String? instruction});
}

/// @nodoc
class __$$ConsultationLabImplCopyWithImpl<$Res>
    extends _$ConsultationLabCopyWithImpl<$Res, _$ConsultationLabImpl>
    implements _$$ConsultationLabImplCopyWith<$Res> {
  __$$ConsultationLabImplCopyWithImpl(
    _$ConsultationLabImpl _value,
    $Res Function(_$ConsultationLabImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsultationLab
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? testName = null, Object? instruction = freezed}) {
    return _then(
      _$ConsultationLabImpl(
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
class _$ConsultationLabImpl
    with DiagnosticableTreeMixin
    implements _ConsultationLab {
  const _$ConsultationLabImpl({required this.testName, this.instruction});

  factory _$ConsultationLabImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsultationLabImplFromJson(json);

  @override
  final String testName;
  @override
  final String? instruction;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConsultationLab(testName: $testName, instruction: $instruction)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConsultationLab'))
      ..add(DiagnosticsProperty('testName', testName))
      ..add(DiagnosticsProperty('instruction', instruction));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsultationLabImpl &&
            (identical(other.testName, testName) ||
                other.testName == testName) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, testName, instruction);

  /// Create a copy of ConsultationLab
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultationLabImplCopyWith<_$ConsultationLabImpl> get copyWith =>
      __$$ConsultationLabImplCopyWithImpl<_$ConsultationLabImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultationLabImplToJson(this);
  }
}

abstract class _ConsultationLab implements ConsultationLab {
  const factory _ConsultationLab({
    required final String testName,
    final String? instruction,
  }) = _$ConsultationLabImpl;

  factory _ConsultationLab.fromJson(Map<String, dynamic> json) =
      _$ConsultationLabImpl.fromJson;

  @override
  String get testName;
  @override
  String? get instruction;

  /// Create a copy of ConsultationLab
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsultationLabImplCopyWith<_$ConsultationLabImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
  ConsultationContext? get context =>
      throw _privateConstructorUsedError; // Form Fields
  Map<String, String> get vitals => throw _privateConstructorUsedError;
  String get chiefComplaint => throw _privateConstructorUsedError;
  List<String> get symptoms => throw _privateConstructorUsedError;
  List<String> get diagnosis => throw _privateConstructorUsedError;
  List<ConsultationMedicine> get medicines =>
      throw _privateConstructorUsedError;
  List<ConsultationLab> get labOrders => throw _privateConstructorUsedError;
  DateTime? get nextVisitDate => throw _privateConstructorUsedError;
  String get adviceNotes => throw _privateConstructorUsedError;

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
    ConsultationContext? context,
    Map<String, String> vitals,
    String chiefComplaint,
    List<String> symptoms,
    List<String> diagnosis,
    List<ConsultationMedicine> medicines,
    List<ConsultationLab> labOrders,
    DateTime? nextVisitDate,
    String adviceNotes,
  });

  $ConsultationContextCopyWith<$Res>? get context;
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
    Object? context = freezed,
    Object? vitals = null,
    Object? chiefComplaint = null,
    Object? symptoms = null,
    Object? diagnosis = null,
    Object? medicines = null,
    Object? labOrders = null,
    Object? nextVisitDate = freezed,
    Object? adviceNotes = null,
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
            context: freezed == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as ConsultationContext?,
            vitals: null == vitals
                ? _value.vitals
                : vitals // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
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
                      as List<ConsultationMedicine>,
            labOrders: null == labOrders
                ? _value.labOrders
                : labOrders // ignore: cast_nullable_to_non_nullable
                      as List<ConsultationLab>,
            nextVisitDate: freezed == nextVisitDate
                ? _value.nextVisitDate
                : nextVisitDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            adviceNotes: null == adviceNotes
                ? _value.adviceNotes
                : adviceNotes // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of ConsultationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConsultationContextCopyWith<$Res>? get context {
    if (_value.context == null) {
      return null;
    }

    return $ConsultationContextCopyWith<$Res>(_value.context!, (value) {
      return _then(_value.copyWith(context: value) as $Val);
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
    ConsultationContext? context,
    Map<String, String> vitals,
    String chiefComplaint,
    List<String> symptoms,
    List<String> diagnosis,
    List<ConsultationMedicine> medicines,
    List<ConsultationLab> labOrders,
    DateTime? nextVisitDate,
    String adviceNotes,
  });

  @override
  $ConsultationContextCopyWith<$Res>? get context;
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
    Object? context = freezed,
    Object? vitals = null,
    Object? chiefComplaint = null,
    Object? symptoms = null,
    Object? diagnosis = null,
    Object? medicines = null,
    Object? labOrders = null,
    Object? nextVisitDate = freezed,
    Object? adviceNotes = null,
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
        context: freezed == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as ConsultationContext?,
        vitals: null == vitals
            ? _value._vitals
            : vitals // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
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
                  as List<ConsultationMedicine>,
        labOrders: null == labOrders
            ? _value._labOrders
            : labOrders // ignore: cast_nullable_to_non_nullable
                  as List<ConsultationLab>,
        nextVisitDate: freezed == nextVisitDate
            ? _value.nextVisitDate
            : nextVisitDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        adviceNotes: null == adviceNotes
            ? _value.adviceNotes
            : adviceNotes // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultationStateImpl
    with DiagnosticableTreeMixin
    implements _ConsultationState {
  const _$ConsultationStateImpl({
    this.isLoading = true,
    this.isSaving = false,
    this.error,
    this.context,
    final Map<String, String> vitals = const {
      'bp': '',
      'temp': '',
      'weight': '',
      'spo2': '',
    },
    this.chiefComplaint = '',
    final List<String> symptoms = const [],
    final List<String> diagnosis = const [],
    final List<ConsultationMedicine> medicines = const [],
    final List<ConsultationLab> labOrders = const [],
    this.nextVisitDate = null,
    this.adviceNotes = '',
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
  final ConsultationContext? context;
  // Form Fields
  final Map<String, String> _vitals;
  // Form Fields
  @override
  @JsonKey()
  Map<String, String> get vitals {
    if (_vitals is EqualUnmodifiableMapView) return _vitals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_vitals);
  }

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

  final List<ConsultationMedicine> _medicines;
  @override
  @JsonKey()
  List<ConsultationMedicine> get medicines {
    if (_medicines is EqualUnmodifiableListView) return _medicines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicines);
  }

  final List<ConsultationLab> _labOrders;
  @override
  @JsonKey()
  List<ConsultationLab> get labOrders {
    if (_labOrders is EqualUnmodifiableListView) return _labOrders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_labOrders);
  }

  @override
  @JsonKey()
  final DateTime? nextVisitDate;
  @override
  @JsonKey()
  final String adviceNotes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConsultationState(isLoading: $isLoading, isSaving: $isSaving, error: $error, context: $context, vitals: $vitals, chiefComplaint: $chiefComplaint, symptoms: $symptoms, diagnosis: $diagnosis, medicines: $medicines, labOrders: $labOrders, nextVisitDate: $nextVisitDate, adviceNotes: $adviceNotes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConsultationState'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isSaving', isSaving))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('context', context))
      ..add(DiagnosticsProperty('vitals', vitals))
      ..add(DiagnosticsProperty('chiefComplaint', chiefComplaint))
      ..add(DiagnosticsProperty('symptoms', symptoms))
      ..add(DiagnosticsProperty('diagnosis', diagnosis))
      ..add(DiagnosticsProperty('medicines', medicines))
      ..add(DiagnosticsProperty('labOrders', labOrders))
      ..add(DiagnosticsProperty('nextVisitDate', nextVisitDate))
      ..add(DiagnosticsProperty('adviceNotes', adviceNotes));
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
            (identical(other.context, context) || other.context == context) &&
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
    context,
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
    final ConsultationContext? context,
    final Map<String, String> vitals,
    final String chiefComplaint,
    final List<String> symptoms,
    final List<String> diagnosis,
    final List<ConsultationMedicine> medicines,
    final List<ConsultationLab> labOrders,
    final DateTime? nextVisitDate,
    final String adviceNotes,
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
  ConsultationContext? get context; // Form Fields
  @override
  Map<String, String> get vitals;
  @override
  String get chiefComplaint;
  @override
  List<String> get symptoms;
  @override
  List<String> get diagnosis;
  @override
  List<ConsultationMedicine> get medicines;
  @override
  List<ConsultationLab> get labOrders;
  @override
  DateTime? get nextVisitDate;
  @override
  String get adviceNotes;

  /// Create a copy of ConsultationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsultationStateImplCopyWith<_$ConsultationStateImpl> get copyWith =>
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
class _$PrescriptionPrintDataImpl
    with DiagnosticableTreeMixin
    implements _PrescriptionPrintData {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionPrintData(meta: $meta, clinic: $clinic, doctor: $doctor, patient: $patient, clinical: $clinical, rxItems: $rxItems, labOrders: $labOrders, advice: $advice)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionPrintData'))
      ..add(DiagnosticsProperty('meta', meta))
      ..add(DiagnosticsProperty('clinic', clinic))
      ..add(DiagnosticsProperty('doctor', doctor))
      ..add(DiagnosticsProperty('patient', patient))
      ..add(DiagnosticsProperty('clinical', clinical))
      ..add(DiagnosticsProperty('rxItems', rxItems))
      ..add(DiagnosticsProperty('labOrders', labOrders))
      ..add(DiagnosticsProperty('advice', advice));
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
class _$PrescriptionMetaImpl
    with DiagnosticableTreeMixin
    implements _PrescriptionMeta {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionMeta(generatedAt: $generatedAt, appointmentNumber: $appointmentNumber, visitType: $visitType, visitDate: $visitDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionMeta'))
      ..add(DiagnosticsProperty('generatedAt', generatedAt))
      ..add(DiagnosticsProperty('appointmentNumber', appointmentNumber))
      ..add(DiagnosticsProperty('visitType', visitType))
      ..add(DiagnosticsProperty('visitDate', visitDate));
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
class _$PrescriptionClinicImpl
    with DiagnosticableTreeMixin
    implements _PrescriptionClinic {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionClinic(name: $name, logoUrl: $logoUrl, headerImageUrl: $headerImageUrl, phone: $phone, email: $email, address: $address, footerText: $footerText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionClinic'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('logoUrl', logoUrl))
      ..add(DiagnosticsProperty('headerImageUrl', headerImageUrl))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('footerText', footerText));
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
class _$PrescriptionDoctorImpl
    with DiagnosticableTreeMixin
    implements _PrescriptionDoctor {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionDoctor(name: $name, specialty: $specialty, qualifications: $qualifications, regNumber: $regNumber, signatureUrl: $signatureUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionDoctor'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('specialty', specialty))
      ..add(DiagnosticsProperty('qualifications', qualifications))
      ..add(DiagnosticsProperty('regNumber', regNumber))
      ..add(DiagnosticsProperty('signatureUrl', signatureUrl));
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
class _$PrescriptionPatientImpl
    with DiagnosticableTreeMixin
    implements _PrescriptionPatient {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionPatient(name: $name, uhid: $uhid, ageGender: $ageGender, phone: $phone, address: $address, knownAllergies: $knownAllergies)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionPatient'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('uhid', uhid))
      ..add(DiagnosticsProperty('ageGender', ageGender))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('knownAllergies', knownAllergies));
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
class _$PrescriptionClinicalImpl
    with DiagnosticableTreeMixin
    implements _PrescriptionClinical {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionClinical(vitals: $vitals, diagnosis: $diagnosis, symptoms: $symptoms, notes: $notes, chiefComplaint: $chiefComplaint)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionClinical'))
      ..add(DiagnosticsProperty('vitals', vitals))
      ..add(DiagnosticsProperty('diagnosis', diagnosis))
      ..add(DiagnosticsProperty('symptoms', symptoms))
      ..add(DiagnosticsProperty('notes', notes))
      ..add(DiagnosticsProperty('chiefComplaint', chiefComplaint));
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
class _$PrescriptionMedicineImpl
    with DiagnosticableTreeMixin
    implements _PrescriptionMedicine {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionMedicine(brandName: $brandName, genericName: $genericName, type: $type, dosage: $dosage, duration: $duration, instruction: $instruction, note: $note)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionMedicine'))
      ..add(DiagnosticsProperty('brandName', brandName))
      ..add(DiagnosticsProperty('genericName', genericName))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('dosage', dosage))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('instruction', instruction))
      ..add(DiagnosticsProperty('note', note));
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
class _$PrescriptionLabImpl
    with DiagnosticableTreeMixin
    implements _PrescriptionLab {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionLab(testName: $testName, instruction: $instruction)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionLab'))
      ..add(DiagnosticsProperty('testName', testName))
      ..add(DiagnosticsProperty('instruction', instruction));
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
class _$PrescriptionAdviceImpl
    with DiagnosticableTreeMixin
    implements _PrescriptionAdvice {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrescriptionAdvice(nextVisitDate: $nextVisitDate, nextVisitText: $nextVisitText)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrescriptionAdvice'))
      ..add(DiagnosticsProperty('nextVisitDate', nextVisitDate))
      ..add(DiagnosticsProperty('nextVisitText', nextVisitText));
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
