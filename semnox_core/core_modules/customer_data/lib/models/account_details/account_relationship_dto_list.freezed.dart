// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_relationship_dto_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountRelationshipDTOList _$AccountRelationshipDTOListFromJson(
    Map<String, dynamic> json) {
  return _AccountRelationshipDTOList.fromJson(json);
}

/// @nodoc
mixin _$AccountRelationshipDTOList {
  @JsonKey(name: 'AccountRelationshipId')
  int? get accountRelationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AccountId')
  int? get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RelatedAccountId')
  int? get relatedAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreationDate')
  String? get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedBy')
  String? get lastUpdatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdateDate')
  String? get lastUpdateDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int? get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterEntityId')
  int? get masterEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SynchStatus')
  bool? get synchStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String? get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool? get isChanged => throw _privateConstructorUsedError;
  @JsonKey(name: 'DailyLimitPercentage')
  int? get dailyLimitPercentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountRelationshipDTOListCopyWith<AccountRelationshipDTOList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountRelationshipDTOListCopyWith<$Res> {
  factory $AccountRelationshipDTOListCopyWith(AccountRelationshipDTOList value,
          $Res Function(AccountRelationshipDTOList) then) =
      _$AccountRelationshipDTOListCopyWithImpl<$Res,
          AccountRelationshipDTOList>;
  @useResult
  $Res call(
      {@JsonKey(name: 'AccountRelationshipId') int? accountRelationId,
      @JsonKey(name: 'AccountId') int? accountId,
      @JsonKey(name: 'RelatedAccountId') int? relatedAccountId,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreationDate') String? creationDate,
      @JsonKey(name: 'LastUpdatedBy') String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate') String? lastUpdateDate,
      @JsonKey(name: 'SiteId') int? siteId,
      @JsonKey(name: 'MasterEntityId') int? masterEntityId,
      @JsonKey(name: 'SynchStatus') bool? synchStatus,
      @JsonKey(name: 'Guid') String? guid,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsChanged') bool? isChanged,
      @JsonKey(name: 'DailyLimitPercentage') int? dailyLimitPercentage});
}

/// @nodoc
class _$AccountRelationshipDTOListCopyWithImpl<$Res,
        $Val extends AccountRelationshipDTOList>
    implements $AccountRelationshipDTOListCopyWith<$Res> {
  _$AccountRelationshipDTOListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountRelationId = freezed,
    Object? accountId = freezed,
    Object? relatedAccountId = freezed,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdateDate = freezed,
    Object? siteId = freezed,
    Object? masterEntityId = freezed,
    Object? synchStatus = freezed,
    Object? guid = freezed,
    Object? isActive = freezed,
    Object? isChanged = freezed,
    Object? dailyLimitPercentage = freezed,
  }) {
    return _then(_value.copyWith(
      accountRelationId: freezed == accountRelationId
          ? _value.accountRelationId
          : accountRelationId // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      relatedAccountId: freezed == relatedAccountId
          ? _value.relatedAccountId
          : relatedAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      lastUpdateDate: freezed == lastUpdateDate
          ? _value.lastUpdateDate
          : lastUpdateDate // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      masterEntityId: freezed == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int?,
      synchStatus: freezed == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isChanged: freezed == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
      dailyLimitPercentage: freezed == dailyLimitPercentage
          ? _value.dailyLimitPercentage
          : dailyLimitPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountRelationshipDTOListCopyWith<$Res>
    implements $AccountRelationshipDTOListCopyWith<$Res> {
  factory _$$_AccountRelationshipDTOListCopyWith(
          _$_AccountRelationshipDTOList value,
          $Res Function(_$_AccountRelationshipDTOList) then) =
      __$$_AccountRelationshipDTOListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'AccountRelationshipId') int? accountRelationId,
      @JsonKey(name: 'AccountId') int? accountId,
      @JsonKey(name: 'RelatedAccountId') int? relatedAccountId,
      @JsonKey(name: 'CreatedBy') String? createdBy,
      @JsonKey(name: 'CreationDate') String? creationDate,
      @JsonKey(name: 'LastUpdatedBy') String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate') String? lastUpdateDate,
      @JsonKey(name: 'SiteId') int? siteId,
      @JsonKey(name: 'MasterEntityId') int? masterEntityId,
      @JsonKey(name: 'SynchStatus') bool? synchStatus,
      @JsonKey(name: 'Guid') String? guid,
      @JsonKey(name: 'IsActive') bool? isActive,
      @JsonKey(name: 'IsChanged') bool? isChanged,
      @JsonKey(name: 'DailyLimitPercentage') int? dailyLimitPercentage});
}

/// @nodoc
class __$$_AccountRelationshipDTOListCopyWithImpl<$Res>
    extends _$AccountRelationshipDTOListCopyWithImpl<$Res,
        _$_AccountRelationshipDTOList>
    implements _$$_AccountRelationshipDTOListCopyWith<$Res> {
  __$$_AccountRelationshipDTOListCopyWithImpl(
      _$_AccountRelationshipDTOList _value,
      $Res Function(_$_AccountRelationshipDTOList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountRelationId = freezed,
    Object? accountId = freezed,
    Object? relatedAccountId = freezed,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdateDate = freezed,
    Object? siteId = freezed,
    Object? masterEntityId = freezed,
    Object? synchStatus = freezed,
    Object? guid = freezed,
    Object? isActive = freezed,
    Object? isChanged = freezed,
    Object? dailyLimitPercentage = freezed,
  }) {
    return _then(_$_AccountRelationshipDTOList(
      accountRelationId: freezed == accountRelationId
          ? _value.accountRelationId
          : accountRelationId // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      relatedAccountId: freezed == relatedAccountId
          ? _value.relatedAccountId
          : relatedAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      lastUpdateDate: freezed == lastUpdateDate
          ? _value.lastUpdateDate
          : lastUpdateDate // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      masterEntityId: freezed == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int?,
      synchStatus: freezed == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isChanged: freezed == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
      dailyLimitPercentage: freezed == dailyLimitPercentage
          ? _value.dailyLimitPercentage
          : dailyLimitPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountRelationshipDTOList implements _AccountRelationshipDTOList {
  const _$_AccountRelationshipDTOList(
      {@JsonKey(name: 'AccountRelationshipId') this.accountRelationId,
      @JsonKey(name: 'AccountId') this.accountId,
      @JsonKey(name: 'RelatedAccountId') this.relatedAccountId,
      @JsonKey(name: 'CreatedBy') this.createdBy,
      @JsonKey(name: 'CreationDate') this.creationDate,
      @JsonKey(name: 'LastUpdatedBy') this.lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate') this.lastUpdateDate,
      @JsonKey(name: 'SiteId') this.siteId,
      @JsonKey(name: 'MasterEntityId') this.masterEntityId,
      @JsonKey(name: 'SynchStatus') this.synchStatus,
      @JsonKey(name: 'Guid') this.guid,
      @JsonKey(name: 'IsActive') this.isActive,
      @JsonKey(name: 'IsChanged') this.isChanged,
      @JsonKey(name: 'DailyLimitPercentage') this.dailyLimitPercentage});

  factory _$_AccountRelationshipDTOList.fromJson(Map<String, dynamic> json) =>
      _$$_AccountRelationshipDTOListFromJson(json);

  @override
  @JsonKey(name: 'AccountRelationshipId')
  final int? accountRelationId;
  @override
  @JsonKey(name: 'AccountId')
  final int? accountId;
  @override
  @JsonKey(name: 'RelatedAccountId')
  final int? relatedAccountId;
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
  @JsonKey(name: 'LastUpdateDate')
  final String? lastUpdateDate;
  @override
  @JsonKey(name: 'SiteId')
  final int? siteId;
  @override
  @JsonKey(name: 'MasterEntityId')
  final int? masterEntityId;
  @override
  @JsonKey(name: 'SynchStatus')
  final bool? synchStatus;
  @override
  @JsonKey(name: 'Guid')
  final String? guid;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
  @override
  @JsonKey(name: 'IsChanged')
  final bool? isChanged;
  @override
  @JsonKey(name: 'DailyLimitPercentage')
  final int? dailyLimitPercentage;

  @override
  String toString() {
    return 'AccountRelationshipDTOList(accountRelationId: $accountRelationId, accountId: $accountId, relatedAccountId: $relatedAccountId, createdBy: $createdBy, creationDate: $creationDate, lastUpdatedBy: $lastUpdatedBy, lastUpdateDate: $lastUpdateDate, siteId: $siteId, masterEntityId: $masterEntityId, synchStatus: $synchStatus, guid: $guid, isActive: $isActive, isChanged: $isChanged, dailyLimitPercentage: $dailyLimitPercentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountRelationshipDTOList &&
            (identical(other.accountRelationId, accountRelationId) ||
                other.accountRelationId == accountRelationId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.relatedAccountId, relatedAccountId) ||
                other.relatedAccountId == relatedAccountId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.lastUpdatedBy, lastUpdatedBy) ||
                other.lastUpdatedBy == lastUpdatedBy) &&
            (identical(other.lastUpdateDate, lastUpdateDate) ||
                other.lastUpdateDate == lastUpdateDate) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.masterEntityId, masterEntityId) ||
                other.masterEntityId == masterEntityId) &&
            (identical(other.synchStatus, synchStatus) ||
                other.synchStatus == synchStatus) &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged) &&
            (identical(other.dailyLimitPercentage, dailyLimitPercentage) ||
                other.dailyLimitPercentage == dailyLimitPercentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountRelationId,
      accountId,
      relatedAccountId,
      createdBy,
      creationDate,
      lastUpdatedBy,
      lastUpdateDate,
      siteId,
      masterEntityId,
      synchStatus,
      guid,
      isActive,
      isChanged,
      dailyLimitPercentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountRelationshipDTOListCopyWith<_$_AccountRelationshipDTOList>
      get copyWith => __$$_AccountRelationshipDTOListCopyWithImpl<
          _$_AccountRelationshipDTOList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountRelationshipDTOListToJson(
      this,
    );
  }
}

abstract class _AccountRelationshipDTOList
    implements AccountRelationshipDTOList {
  const factory _AccountRelationshipDTOList(
      {@JsonKey(name: 'AccountRelationshipId')
          final int? accountRelationId,
      @JsonKey(name: 'AccountId')
          final int? accountId,
      @JsonKey(name: 'RelatedAccountId')
          final int? relatedAccountId,
      @JsonKey(name: 'CreatedBy')
          final String? createdBy,
      @JsonKey(name: 'CreationDate')
          final String? creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          final String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdateDate')
          final String? lastUpdateDate,
      @JsonKey(name: 'SiteId')
          final int? siteId,
      @JsonKey(name: 'MasterEntityId')
          final int? masterEntityId,
      @JsonKey(name: 'SynchStatus')
          final bool? synchStatus,
      @JsonKey(name: 'Guid')
          final String? guid,
      @JsonKey(name: 'IsActive')
          final bool? isActive,
      @JsonKey(name: 'IsChanged')
          final bool? isChanged,
      @JsonKey(name: 'DailyLimitPercentage')
          final int? dailyLimitPercentage}) = _$_AccountRelationshipDTOList;

  factory _AccountRelationshipDTOList.fromJson(Map<String, dynamic> json) =
      _$_AccountRelationshipDTOList.fromJson;

  @override
  @JsonKey(name: 'AccountRelationshipId')
  int? get accountRelationId;
  @override
  @JsonKey(name: 'AccountId')
  int? get accountId;
  @override
  @JsonKey(name: 'RelatedAccountId')
  int? get relatedAccountId;
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
  @JsonKey(name: 'LastUpdateDate')
  String? get lastUpdateDate;
  @override
  @JsonKey(name: 'SiteId')
  int? get siteId;
  @override
  @JsonKey(name: 'MasterEntityId')
  int? get masterEntityId;
  @override
  @JsonKey(name: 'SynchStatus')
  bool? get synchStatus;
  @override
  @JsonKey(name: 'Guid')
  String? get guid;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
  @override
  @JsonKey(name: 'IsChanged')
  bool? get isChanged;
  @override
  @JsonKey(name: 'DailyLimitPercentage')
  int? get dailyLimitPercentage;
  @override
  @JsonKey(ignore: true)
  _$$_AccountRelationshipDTOListCopyWith<_$_AccountRelationshipDTOList>
      get copyWith => throw _privateConstructorUsedError;
}
