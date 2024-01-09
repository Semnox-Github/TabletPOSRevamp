// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_data_set_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomDataSetDTO _$CustomDataSetDTOFromJson(Map<String, dynamic> json) {
  return _CustomDataSetDTO.fromJson(json);
}

/// @nodoc
mixin _$CustomDataSetDTO {
  @JsonKey(name: 'CustomDataSetId')
  int get customDataSetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Dummy')
  String get dummy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreationDate')
  String get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedBy')
  String? get lastUpdatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterEntityId')
  int get masterEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SynchStatus')
  bool get synchStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String? get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool get isChanged => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive => throw _privateConstructorUsedError;
  @JsonKey(name: 'CustomDataDTOList')
  List<dynamic> get customDataDTOList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomDataSetDTOCopyWith<CustomDataSetDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomDataSetDTOCopyWith<$Res> {
  factory $CustomDataSetDTOCopyWith(
          CustomDataSetDTO value, $Res Function(CustomDataSetDTO) then) =
      _$CustomDataSetDTOCopyWithImpl<$Res, CustomDataSetDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CustomDataSetId') int customDataSetId,
      @JsonKey(name: 'Dummy') String dummy,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreationDate') String creationDate,
      @JsonKey(name: 'LastUpdatedBy') String? lastUpdatedBy,
      @JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'MasterEntityId') int masterEntityId,
      @JsonKey(name: 'SynchStatus') bool synchStatus,
      @JsonKey(name: 'Guid') String? guid,
      @JsonKey(name: 'IsChanged') bool isChanged,
      @JsonKey(name: 'IsChangedRecursive') bool isChangedRecursive,
      @JsonKey(name: 'CustomDataDTOList') List<dynamic> customDataDTOList});
}

/// @nodoc
class _$CustomDataSetDTOCopyWithImpl<$Res, $Val extends CustomDataSetDTO>
    implements $CustomDataSetDTOCopyWith<$Res> {
  _$CustomDataSetDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customDataSetId = null,
    Object? dummy = null,
    Object? createdBy = freezed,
    Object? creationDate = null,
    Object? lastUpdatedBy = freezed,
    Object? siteId = null,
    Object? masterEntityId = null,
    Object? synchStatus = null,
    Object? guid = freezed,
    Object? isChanged = null,
    Object? isChangedRecursive = null,
    Object? customDataDTOList = null,
  }) {
    return _then(_value.copyWith(
      customDataSetId: null == customDataSetId
          ? _value.customDataSetId
          : customDataSetId // ignore: cast_nullable_to_non_nullable
              as int,
      dummy: null == dummy
          ? _value.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      masterEntityId: null == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      synchStatus: null == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      isChangedRecursive: null == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool,
      customDataDTOList: null == customDataDTOList
          ? _value.customDataDTOList
          : customDataDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomDataSetDTOCopyWith<$Res>
    implements $CustomDataSetDTOCopyWith<$Res> {
  factory _$$_CustomDataSetDTOCopyWith(
          _$_CustomDataSetDTO value, $Res Function(_$_CustomDataSetDTO) then) =
      __$$_CustomDataSetDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CustomDataSetId') int customDataSetId,
      @JsonKey(name: 'Dummy') String dummy,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreationDate') String creationDate,
      @JsonKey(name: 'LastUpdatedBy') String? lastUpdatedBy,
      @JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'MasterEntityId') int masterEntityId,
      @JsonKey(name: 'SynchStatus') bool synchStatus,
      @JsonKey(name: 'Guid') String? guid,
      @JsonKey(name: 'IsChanged') bool isChanged,
      @JsonKey(name: 'IsChangedRecursive') bool isChangedRecursive,
      @JsonKey(name: 'CustomDataDTOList') List<dynamic> customDataDTOList});
}

/// @nodoc
class __$$_CustomDataSetDTOCopyWithImpl<$Res>
    extends _$CustomDataSetDTOCopyWithImpl<$Res, _$_CustomDataSetDTO>
    implements _$$_CustomDataSetDTOCopyWith<$Res> {
  __$$_CustomDataSetDTOCopyWithImpl(
      _$_CustomDataSetDTO _value, $Res Function(_$_CustomDataSetDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customDataSetId = null,
    Object? dummy = null,
    Object? createdBy = freezed,
    Object? creationDate = null,
    Object? lastUpdatedBy = freezed,
    Object? siteId = null,
    Object? masterEntityId = null,
    Object? synchStatus = null,
    Object? guid = freezed,
    Object? isChanged = null,
    Object? isChangedRecursive = null,
    Object? customDataDTOList = null,
  }) {
    return _then(_$_CustomDataSetDTO(
      customDataSetId: null == customDataSetId
          ? _value.customDataSetId
          : customDataSetId // ignore: cast_nullable_to_non_nullable
              as int,
      dummy: null == dummy
          ? _value.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      masterEntityId: null == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      synchStatus: null == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      isChangedRecursive: null == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool,
      customDataDTOList: null == customDataDTOList
          ? _value._customDataDTOList
          : customDataDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomDataSetDTO
    with DiagnosticableTreeMixin
    implements _CustomDataSetDTO {
  const _$_CustomDataSetDTO(
      {@JsonKey(name: 'CustomDataSetId')
          required this.customDataSetId,
      @JsonKey(name: 'Dummy')
          required this.dummy,
      @JsonKey(name: 'CreatedBy')
          this.createdBy,
      @JsonKey(name: 'CreationDate')
          required this.creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          this.lastUpdatedBy,
      @JsonKey(name: 'SiteId')
          required this.siteId,
      @JsonKey(name: 'MasterEntityId')
          required this.masterEntityId,
      @JsonKey(name: 'SynchStatus')
          required this.synchStatus,
      @JsonKey(name: 'Guid')
          this.guid,
      @JsonKey(name: 'IsChanged')
          required this.isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          required this.isChangedRecursive,
      @JsonKey(name: 'CustomDataDTOList')
          required final List<dynamic> customDataDTOList})
      : _customDataDTOList = customDataDTOList;

  factory _$_CustomDataSetDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CustomDataSetDTOFromJson(json);

  @override
  @JsonKey(name: 'CustomDataSetId')
  final int customDataSetId;
  @override
  @JsonKey(name: 'Dummy')
  final String dummy;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  final String creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  final String? lastUpdatedBy;
  @override
  @JsonKey(name: 'SiteId')
  final int siteId;
  @override
  @JsonKey(name: 'MasterEntityId')
  final int masterEntityId;
  @override
  @JsonKey(name: 'SynchStatus')
  final bool synchStatus;
  @override
  @JsonKey(name: 'Guid')
  final String? guid;
  @override
  @JsonKey(name: 'IsChanged')
  final bool isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  final bool isChangedRecursive;
  final List<dynamic> _customDataDTOList;
  @override
  @JsonKey(name: 'CustomDataDTOList')
  List<dynamic> get customDataDTOList {
    if (_customDataDTOList is EqualUnmodifiableListView)
      return _customDataDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customDataDTOList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CustomDataSetDTO(customDataSetId: $customDataSetId, dummy: $dummy, createdBy: $createdBy, creationDate: $creationDate, lastUpdatedBy: $lastUpdatedBy, siteId: $siteId, masterEntityId: $masterEntityId, synchStatus: $synchStatus, guid: $guid, isChanged: $isChanged, isChangedRecursive: $isChangedRecursive, customDataDTOList: $customDataDTOList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CustomDataSetDTO'))
      ..add(DiagnosticsProperty('customDataSetId', customDataSetId))
      ..add(DiagnosticsProperty('dummy', dummy))
      ..add(DiagnosticsProperty('createdBy', createdBy))
      ..add(DiagnosticsProperty('creationDate', creationDate))
      ..add(DiagnosticsProperty('lastUpdatedBy', lastUpdatedBy))
      ..add(DiagnosticsProperty('siteId', siteId))
      ..add(DiagnosticsProperty('masterEntityId', masterEntityId))
      ..add(DiagnosticsProperty('synchStatus', synchStatus))
      ..add(DiagnosticsProperty('guid', guid))
      ..add(DiagnosticsProperty('isChanged', isChanged))
      ..add(DiagnosticsProperty('isChangedRecursive', isChangedRecursive))
      ..add(DiagnosticsProperty('customDataDTOList', customDataDTOList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomDataSetDTO &&
            (identical(other.customDataSetId, customDataSetId) ||
                other.customDataSetId == customDataSetId) &&
            (identical(other.dummy, dummy) || other.dummy == dummy) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.masterEntityId, masterEntityId) ||
                other.masterEntityId == masterEntityId) &&
            (identical(other.synchStatus, synchStatus) ||
                other.synchStatus == synchStatus) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged) &&
            (identical(other.isChangedRecursive, isChangedRecursive) ||
                other.isChangedRecursive == isChangedRecursive) &&
            const DeepCollectionEquality()
                .equals(other._customDataDTOList, _customDataDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customDataSetId,
      dummy,
      createdBy,
      creationDate,
      lastUpdatedBy,
      siteId,
      masterEntityId,
      synchStatus,
      guid,
      isChanged,
      isChangedRecursive,
      const DeepCollectionEquality().hash(_customDataDTOList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomDataSetDTOCopyWith<_$_CustomDataSetDTO> get copyWith =>
      __$$_CustomDataSetDTOCopyWithImpl<_$_CustomDataSetDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomDataSetDTOToJson(
      this,
    );
  }
}

abstract class _CustomDataSetDTO implements CustomDataSetDTO {
  const factory _CustomDataSetDTO(
          {@JsonKey(name: 'CustomDataSetId')
              required final int customDataSetId,
          @JsonKey(name: 'Dummy')
              required final String dummy,
          @JsonKey(name: 'CreatedBy')
              final String? createdBy,
          @JsonKey(name: 'CreationDate')
              required final String creationDate,
          @JsonKey(name: 'LastUpdatedBy')
              final String? lastUpdatedBy,
          @JsonKey(name: 'SiteId')
              required final int siteId,
          @JsonKey(name: 'MasterEntityId')
              required final int masterEntityId,
          @JsonKey(name: 'SynchStatus')
              required final bool synchStatus,
          @JsonKey(name: 'Guid')
              final String? guid,
          @JsonKey(name: 'IsChanged')
              required final bool isChanged,
          @JsonKey(name: 'IsChangedRecursive')
              required final bool isChangedRecursive,
          @JsonKey(name: 'CustomDataDTOList')
              required final List<dynamic> customDataDTOList}) =
      _$_CustomDataSetDTO;

  factory _CustomDataSetDTO.fromJson(Map<String, dynamic> json) =
      _$_CustomDataSetDTO.fromJson;

  @override
  @JsonKey(name: 'CustomDataSetId')
  int get customDataSetId;
  @override
  @JsonKey(name: 'Dummy')
  String get dummy;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  String get creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  String? get lastUpdatedBy;
  @override
  @JsonKey(name: 'SiteId')
  int get siteId;
  @override
  @JsonKey(name: 'MasterEntityId')
  int get masterEntityId;
  @override
  @JsonKey(name: 'SynchStatus')
  bool get synchStatus;
  @override
  @JsonKey(name: 'Guid')
  String? get guid;
  @override
  @JsonKey(name: 'IsChanged')
  bool get isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive;
  @override
  @JsonKey(name: 'CustomDataDTOList')
  List<dynamic> get customDataDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_CustomDataSetDTOCopyWith<_$_CustomDataSetDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
