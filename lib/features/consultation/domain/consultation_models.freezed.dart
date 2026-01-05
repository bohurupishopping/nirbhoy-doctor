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
