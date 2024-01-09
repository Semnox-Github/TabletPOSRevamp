// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_access_rule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataAccessRuleDto _$DataAccessRuleDtoFromJson(Map<String, dynamic> json) {
  return _DataAccessRuleDto.fromJson(json);
}

/// @nodoc
mixin _$DataAccessRuleDto {
  @JsonKey(name: 'DataAccessRuleId')
  int get dataAccessRuleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  dynamic get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreationDate')
  String? get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedBy')
  String? get lastUpdatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedDate')
  String get lastUpdatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  dynamic get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SynchStatus')
  bool get synchStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterEntityId')
  int get masterEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataAccessDetailDTOList')
  dynamic get dataAccessDetailDtoList => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool get isChanged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataAccessRuleDtoCopyWith<DataAccessRuleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataAccessRuleDtoCopyWith<$Res> {
  factory $DataAccessRuleDtoCopyWith(
          DataAccessRuleDto value, $Res Function(DataAccessRuleDto) then) =
      _$DataAccessRuleDtoCopyWithImpl<$Res, DataAccessRuleDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DataAccessRuleId') int dataAccessRuleId,
      @JsonKey(name: 'Name') dynamic name,
      @JsonKey(name: 'IsActive') bool isActive,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreationDate') String? creationDate,
      @JsonKey(name: 'LastUpdatedBy') String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdatedDate') String lastUpdatedDate,
      @JsonKey(name: 'Guid') dynamic guid,
      @JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'SynchStatus') bool synchStatus,
      @JsonKey(name: 'MasterEntityId') int masterEntityId,
      @JsonKey(name: 'DataAccessDetailDTOList') dynamic dataAccessDetailDtoList,
      @JsonKey(name: 'IsChangedRecursive') bool isChangedRecursive,
      @JsonKey(name: 'IsChanged') bool isChanged});
}

/// @nodoc
class _$DataAccessRuleDtoCopyWithImpl<$Res, $Val extends DataAccessRuleDto>
    implements $DataAccessRuleDtoCopyWith<$Res> {
  _$DataAccessRuleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataAccessRuleId = null,
    Object? name = freezed,
    Object? isActive = null,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = null,
    Object? guid = freezed,
    Object? siteId = null,
    Object? synchStatus = null,
    Object? masterEntityId = null,
    Object? dataAccessDetailDtoList = freezed,
    Object? isChangedRecursive = null,
    Object? isChanged = null,
  }) {
    return _then(_value.copyWith(
      dataAccessRuleId: null == dataAccessRuleId
          ? _value.dataAccessRuleId
          : dataAccessRuleId // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedDate: null == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as dynamic,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      synchStatus: null == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      masterEntityId: null == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      dataAccessDetailDtoList: freezed == dataAccessDetailDtoList
          ? _value.dataAccessDetailDtoList
          : dataAccessDetailDtoList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isChangedRecursive: null == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataAccessRuleDtoCopyWith<$Res>
    implements $DataAccessRuleDtoCopyWith<$Res> {
  factory _$$_DataAccessRuleDtoCopyWith(_$_DataAccessRuleDto value,
          $Res Function(_$_DataAccessRuleDto) then) =
      __$$_DataAccessRuleDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DataAccessRuleId') int dataAccessRuleId,
      @JsonKey(name: 'Name') dynamic name,
      @JsonKey(name: 'IsActive') bool isActive,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreationDate') String? creationDate,
      @JsonKey(name: 'LastUpdatedBy') String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdatedDate') String lastUpdatedDate,
      @JsonKey(name: 'Guid') dynamic guid,
      @JsonKey(name: 'SiteId') int siteId,
      @JsonKey(name: 'SynchStatus') bool synchStatus,
      @JsonKey(name: 'MasterEntityId') int masterEntityId,
      @JsonKey(name: 'DataAccessDetailDTOList') dynamic dataAccessDetailDtoList,
      @JsonKey(name: 'IsChangedRecursive') bool isChangedRecursive,
      @JsonKey(name: 'IsChanged') bool isChanged});
}

/// @nodoc
class __$$_DataAccessRuleDtoCopyWithImpl<$Res>
    extends _$DataAccessRuleDtoCopyWithImpl<$Res, _$_DataAccessRuleDto>
    implements _$$_DataAccessRuleDtoCopyWith<$Res> {
  __$$_DataAccessRuleDtoCopyWithImpl(
      _$_DataAccessRuleDto _value, $Res Function(_$_DataAccessRuleDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataAccessRuleId = null,
    Object? name = freezed,
    Object? isActive = null,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = null,
    Object? guid = freezed,
    Object? siteId = null,
    Object? synchStatus = null,
    Object? masterEntityId = null,
    Object? dataAccessDetailDtoList = freezed,
    Object? isChangedRecursive = null,
    Object? isChanged = null,
  }) {
    return _then(_$_DataAccessRuleDto(
      dataAccessRuleId: null == dataAccessRuleId
          ? _value.dataAccessRuleId
          : dataAccessRuleId // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedBy: freezed == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedDate: null == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as dynamic,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      synchStatus: null == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      masterEntityId: null == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int,
      dataAccessDetailDtoList: freezed == dataAccessDetailDtoList
          ? _value.dataAccessDetailDtoList
          : dataAccessDetailDtoList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isChangedRecursive: null == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataAccessRuleDto implements _DataAccessRuleDto {
  const _$_DataAccessRuleDto(
      {@JsonKey(name: 'DataAccessRuleId')
          required this.dataAccessRuleId,
      @JsonKey(name: 'Name')
          required this.name,
      @JsonKey(name: 'IsActive')
          required this.isActive,
      @JsonKey(name: 'CreatedBy')
          required this.createdBy,
      @JsonKey(name: 'CreationDate')
          required this.creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          required this.lastUpdatedBy,
      @JsonKey(name: 'LastUpdatedDate')
          required this.lastUpdatedDate,
      @JsonKey(name: 'Guid')
          required this.guid,
      @JsonKey(name: 'SiteId')
          required this.siteId,
      @JsonKey(name: 'SynchStatus')
          required this.synchStatus,
      @JsonKey(name: 'MasterEntityId')
          required this.masterEntityId,
      @JsonKey(name: 'DataAccessDetailDTOList')
          required this.dataAccessDetailDtoList,
      @JsonKey(name: 'IsChangedRecursive')
          required this.isChangedRecursive,
      @JsonKey(name: 'IsChanged')
          required this.isChanged});

  factory _$_DataAccessRuleDto.fromJson(Map<String, dynamic> json) =>
      _$$_DataAccessRuleDtoFromJson(json);

  @override
  @JsonKey(name: 'DataAccessRuleId')
  final int dataAccessRuleId;
  @override
  @JsonKey(name: 'Name')
  final dynamic name;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;
  @override
  @JsonKey(name: 'CreatedBy')
  final String? createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  final String? creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  final String? lastUpdatedBy;
  @override
  @JsonKey(name: 'LastUpdatedDate')
  final String lastUpdatedDate;
  @override
  @JsonKey(name: 'Guid')
  final dynamic guid;
  @override
  @JsonKey(name: 'SiteId')
  final int siteId;
  @override
  @JsonKey(name: 'SynchStatus')
  final bool synchStatus;
  @override
  @JsonKey(name: 'MasterEntityId')
  final int masterEntityId;
  @override
  @JsonKey(name: 'DataAccessDetailDTOList')
  final dynamic dataAccessDetailDtoList;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  final bool isChangedRecursive;
  @override
  @JsonKey(name: 'IsChanged')
  final bool isChanged;

  @override
  String toString() {
    return 'DataAccessRuleDto(dataAccessRuleId: $dataAccessRuleId, name: $name, isActive: $isActive, createdBy: $createdBy, creationDate: $creationDate, lastUpdatedBy: $lastUpdatedBy, lastUpdatedDate: $lastUpdatedDate, guid: $guid, siteId: $siteId, synchStatus: $synchStatus, masterEntityId: $masterEntityId, dataAccessDetailDtoList: $dataAccessDetailDtoList, isChangedRecursive: $isChangedRecursive, isChanged: $isChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataAccessRuleDto &&
            (identical(other.dataAccessRuleId, dataAccessRuleId) ||
                other.dataAccessRuleId == dataAccessRuleId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.lastUpdatedDate, lastUpdatedDate) ||
                other.lastUpdatedDate == lastUpdatedDate) &&
            const DeepCollectionEquality().equals(other.guid, guid) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.synchStatus, synchStatus) ||
                other.synchStatus == synchStatus) &&
            (identical(other.masterEntityId, masterEntityId) ||
                other.masterEntityId == masterEntityId) &&
            const DeepCollectionEquality().equals(
                other.dataAccessDetailDtoList, dataAccessDetailDtoList) &&
            (identical(other.isChangedRecursive, isChangedRecursive) ||
                other.isChangedRecursive == isChangedRecursive) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dataAccessRuleId,
      const DeepCollectionEquality().hash(name),
      isActive,
      createdBy,
      creationDate,
      lastUpdatedBy,
      lastUpdatedDate,
      const DeepCollectionEquality().hash(guid),
      siteId,
      synchStatus,
      masterEntityId,
      const DeepCollectionEquality().hash(dataAccessDetailDtoList),
      isChangedRecursive,
      isChanged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataAccessRuleDtoCopyWith<_$_DataAccessRuleDto> get copyWith =>
      __$$_DataAccessRuleDtoCopyWithImpl<_$_DataAccessRuleDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataAccessRuleDtoToJson(
      this,
    );
  }
}

abstract class _DataAccessRuleDto implements DataAccessRuleDto {
  const factory _DataAccessRuleDto(
      {@JsonKey(name: 'DataAccessRuleId')
          required final int dataAccessRuleId,
      @JsonKey(name: 'Name')
          required final dynamic name,
      @JsonKey(name: 'IsActive')
          required final bool isActive,
      @JsonKey(name: 'CreatedBy')
          required final String? createdBy,
      @JsonKey(name: 'CreationDate')
          required final String? creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          required final String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdatedDate')
          required final String lastUpdatedDate,
      @JsonKey(name: 'Guid')
          required final dynamic guid,
      @JsonKey(name: 'SiteId')
          required final int siteId,
      @JsonKey(name: 'SynchStatus')
          required final bool synchStatus,
      @JsonKey(name: 'MasterEntityId')
          required final int masterEntityId,
      @JsonKey(name: 'DataAccessDetailDTOList')
          required final dynamic dataAccessDetailDtoList,
      @JsonKey(name: 'IsChangedRecursive')
          required final bool isChangedRecursive,
      @JsonKey(name: 'IsChanged')
          required final bool isChanged}) = _$_DataAccessRuleDto;

  factory _DataAccessRuleDto.fromJson(Map<String, dynamic> json) =
      _$_DataAccessRuleDto.fromJson;

  @override
  @JsonKey(name: 'DataAccessRuleId')
  int get dataAccessRuleId;
  @override
  @JsonKey(name: 'Name')
  dynamic get name;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(name: 'CreatedBy')
  String? get createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  String? get creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  String? get lastUpdatedBy;
  @override
  @JsonKey(name: 'LastUpdatedDate')
  String get lastUpdatedDate;
  @override
  @JsonKey(name: 'Guid')
  dynamic get guid;
  @override
  @JsonKey(name: 'SiteId')
  int get siteId;
  @override
  @JsonKey(name: 'SynchStatus')
  bool get synchStatus;
  @override
  @JsonKey(name: 'MasterEntityId')
  int get masterEntityId;
  @override
  @JsonKey(name: 'DataAccessDetailDTOList')
  dynamic get dataAccessDetailDtoList;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive;
  @override
  @JsonKey(name: 'IsChanged')
  bool get isChanged;
  @override
  @JsonKey(ignore: true)
  _$$_DataAccessRuleDtoCopyWith<_$_DataAccessRuleDto> get copyWith =>
      throw _privateConstructorUsedError;
}
