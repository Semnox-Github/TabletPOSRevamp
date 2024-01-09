// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionLineAccountDto _$TransactionLineAccountDtoFromJson(
    Map<String, dynamic> json) {
  return _TransactionLineAccountDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionLineAccountDto {
  @JsonKey(name: 'TransactionAccountId')
  int? get transactionAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionId')
  int? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionLineId')
  int? get transactionLineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AccountId')
  int? get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TagNumber')
  String? get tagNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'SerialNumber')
  String? get serialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExistingAccount')
  bool? get existingAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreationDate')
  String? get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedBy')
  String? get lastUpdatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedDate')
  String? get lastUpdatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String? get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int? get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SynchStatus')
  bool? get synchStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterEntityId')
  int? get masterEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionLineAccountDiscountMappingDTOList')
  List<dynamic>? get transactionLineAccountDiscountMappingDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionLineAccountGameMappingDTOList')
  List<dynamic>? get transactionLineAccountGameMappingDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionLineAccountCreditPlusMappingDTOList')
  List<dynamic>? get transactionLineAccountCreditPlusMappingDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool? get isChanged => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChangedRecursive')
  bool? get isChangedRecursive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionLineAccountDtoCopyWith<TransactionLineAccountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionLineAccountDtoCopyWith<$Res> {
  factory $TransactionLineAccountDtoCopyWith(TransactionLineAccountDto value,
          $Res Function(TransactionLineAccountDto) then) =
      _$TransactionLineAccountDtoCopyWithImpl<$Res, TransactionLineAccountDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionAccountId')
          int? transactionAccountId,
      @JsonKey(name: 'TransactionId')
          int? transactionId,
      @JsonKey(name: 'TransactionLineId')
          int? transactionLineId,
      @JsonKey(name: 'AccountId')
          int? accountId,
      @JsonKey(name: 'TagNumber')
          String? tagNumber,
      @JsonKey(name: 'SerialNumber')
          String? serialNumber,
      @JsonKey(name: 'ExistingAccount')
          bool? existingAccount,
      @JsonKey(name: 'IsActive')
          bool? isActive,
      @JsonKey(name: 'CreatedBy')
          String? createdBy,
      @JsonKey(name: 'CreationDate')
          String? creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdatedDate')
          String? lastUpdatedDate,
      @JsonKey(name: 'Guid')
          String? guid,
      @JsonKey(name: 'SiteId')
          int? siteId,
      @JsonKey(name: 'SynchStatus')
          bool? synchStatus,
      @JsonKey(name: 'MasterEntityId')
          int? masterEntityId,
      @JsonKey(name: 'TransactionLineAccountDiscountMappingDTOList')
          List<dynamic>? transactionLineAccountDiscountMappingDTOList,
      @JsonKey(name: 'TransactionLineAccountGameMappingDTOList')
          List<dynamic>? transactionLineAccountGameMappingDTOList,
      @JsonKey(name: 'TransactionLineAccountCreditPlusMappingDTOList')
          List<dynamic>? transactionLineAccountCreditPlusMappingDTOList,
      @JsonKey(name: 'IsChanged')
          bool? isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          bool? isChangedRecursive});
}

/// @nodoc
class _$TransactionLineAccountDtoCopyWithImpl<$Res,
        $Val extends TransactionLineAccountDto>
    implements $TransactionLineAccountDtoCopyWith<$Res> {
  _$TransactionLineAccountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionAccountId = freezed,
    Object? transactionId = freezed,
    Object? transactionLineId = freezed,
    Object? accountId = freezed,
    Object? tagNumber = freezed,
    Object? serialNumber = freezed,
    Object? existingAccount = freezed,
    Object? isActive = freezed,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = freezed,
    Object? guid = freezed,
    Object? siteId = freezed,
    Object? synchStatus = freezed,
    Object? masterEntityId = freezed,
    Object? transactionLineAccountDiscountMappingDTOList = freezed,
    Object? transactionLineAccountGameMappingDTOList = freezed,
    Object? transactionLineAccountCreditPlusMappingDTOList = freezed,
    Object? isChanged = freezed,
    Object? isChangedRecursive = freezed,
  }) {
    return _then(_value.copyWith(
      transactionAccountId: freezed == transactionAccountId
          ? _value.transactionAccountId
          : transactionAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionLineId: freezed == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      tagNumber: freezed == tagNumber
          ? _value.tagNumber
          : tagNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      existingAccount: freezed == existingAccount
          ? _value.existingAccount
          : existingAccount // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      synchStatus: freezed == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      masterEntityId: freezed == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionLineAccountDiscountMappingDTOList: freezed ==
              transactionLineAccountDiscountMappingDTOList
          ? _value.transactionLineAccountDiscountMappingDTOList
          : transactionLineAccountDiscountMappingDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      transactionLineAccountGameMappingDTOList: freezed ==
              transactionLineAccountGameMappingDTOList
          ? _value.transactionLineAccountGameMappingDTOList
          : transactionLineAccountGameMappingDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      transactionLineAccountCreditPlusMappingDTOList: freezed ==
              transactionLineAccountCreditPlusMappingDTOList
          ? _value.transactionLineAccountCreditPlusMappingDTOList
          : transactionLineAccountCreditPlusMappingDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isChanged: freezed == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
      isChangedRecursive: freezed == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionLineAccountDtoCopyWith<$Res>
    implements $TransactionLineAccountDtoCopyWith<$Res> {
  factory _$$_TransactionLineAccountDtoCopyWith(
          _$_TransactionLineAccountDto value,
          $Res Function(_$_TransactionLineAccountDto) then) =
      __$$_TransactionLineAccountDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionAccountId')
          int? transactionAccountId,
      @JsonKey(name: 'TransactionId')
          int? transactionId,
      @JsonKey(name: 'TransactionLineId')
          int? transactionLineId,
      @JsonKey(name: 'AccountId')
          int? accountId,
      @JsonKey(name: 'TagNumber')
          String? tagNumber,
      @JsonKey(name: 'SerialNumber')
          String? serialNumber,
      @JsonKey(name: 'ExistingAccount')
          bool? existingAccount,
      @JsonKey(name: 'IsActive')
          bool? isActive,
      @JsonKey(name: 'CreatedBy')
          String? createdBy,
      @JsonKey(name: 'CreationDate')
          String? creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdatedDate')
          String? lastUpdatedDate,
      @JsonKey(name: 'Guid')
          String? guid,
      @JsonKey(name: 'SiteId')
          int? siteId,
      @JsonKey(name: 'SynchStatus')
          bool? synchStatus,
      @JsonKey(name: 'MasterEntityId')
          int? masterEntityId,
      @JsonKey(name: 'TransactionLineAccountDiscountMappingDTOList')
          List<dynamic>? transactionLineAccountDiscountMappingDTOList,
      @JsonKey(name: 'TransactionLineAccountGameMappingDTOList')
          List<dynamic>? transactionLineAccountGameMappingDTOList,
      @JsonKey(name: 'TransactionLineAccountCreditPlusMappingDTOList')
          List<dynamic>? transactionLineAccountCreditPlusMappingDTOList,
      @JsonKey(name: 'IsChanged')
          bool? isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          bool? isChangedRecursive});
}

/// @nodoc
class __$$_TransactionLineAccountDtoCopyWithImpl<$Res>
    extends _$TransactionLineAccountDtoCopyWithImpl<$Res,
        _$_TransactionLineAccountDto>
    implements _$$_TransactionLineAccountDtoCopyWith<$Res> {
  __$$_TransactionLineAccountDtoCopyWithImpl(
      _$_TransactionLineAccountDto _value,
      $Res Function(_$_TransactionLineAccountDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionAccountId = freezed,
    Object? transactionId = freezed,
    Object? transactionLineId = freezed,
    Object? accountId = freezed,
    Object? tagNumber = freezed,
    Object? serialNumber = freezed,
    Object? existingAccount = freezed,
    Object? isActive = freezed,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = freezed,
    Object? guid = freezed,
    Object? siteId = freezed,
    Object? synchStatus = freezed,
    Object? masterEntityId = freezed,
    Object? transactionLineAccountDiscountMappingDTOList = freezed,
    Object? transactionLineAccountGameMappingDTOList = freezed,
    Object? transactionLineAccountCreditPlusMappingDTOList = freezed,
    Object? isChanged = freezed,
    Object? isChangedRecursive = freezed,
  }) {
    return _then(_$_TransactionLineAccountDto(
      transactionAccountId: freezed == transactionAccountId
          ? _value.transactionAccountId
          : transactionAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionLineId: freezed == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      tagNumber: freezed == tagNumber
          ? _value.tagNumber
          : tagNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      existingAccount: freezed == existingAccount
          ? _value.existingAccount
          : existingAccount // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      lastUpdatedDate: freezed == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      synchStatus: freezed == synchStatus
          ? _value.synchStatus
          : synchStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      masterEntityId: freezed == masterEntityId
          ? _value.masterEntityId
          : masterEntityId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionLineAccountDiscountMappingDTOList: freezed ==
              transactionLineAccountDiscountMappingDTOList
          ? _value._transactionLineAccountDiscountMappingDTOList
          : transactionLineAccountDiscountMappingDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      transactionLineAccountGameMappingDTOList: freezed ==
              transactionLineAccountGameMappingDTOList
          ? _value._transactionLineAccountGameMappingDTOList
          : transactionLineAccountGameMappingDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      transactionLineAccountCreditPlusMappingDTOList: freezed ==
              transactionLineAccountCreditPlusMappingDTOList
          ? _value._transactionLineAccountCreditPlusMappingDTOList
          : transactionLineAccountCreditPlusMappingDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isChanged: freezed == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool?,
      isChangedRecursive: freezed == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionLineAccountDto implements _TransactionLineAccountDto {
  const _$_TransactionLineAccountDto(
      {@JsonKey(name: 'TransactionAccountId')
          this.transactionAccountId,
      @JsonKey(name: 'TransactionId')
          this.transactionId,
      @JsonKey(name: 'TransactionLineId')
          this.transactionLineId,
      @JsonKey(name: 'AccountId')
          this.accountId,
      @JsonKey(name: 'TagNumber')
          this.tagNumber,
      @JsonKey(name: 'SerialNumber')
          this.serialNumber,
      @JsonKey(name: 'ExistingAccount')
          this.existingAccount,
      @JsonKey(name: 'IsActive')
          this.isActive,
      @JsonKey(name: 'CreatedBy')
          this.createdBy,
      @JsonKey(name: 'CreationDate')
          this.creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          this.lastUpdatedBy,
      @JsonKey(name: 'LastUpdatedDate')
          this.lastUpdatedDate,
      @JsonKey(name: 'Guid')
          this.guid,
      @JsonKey(name: 'SiteId')
          this.siteId,
      @JsonKey(name: 'SynchStatus')
          this.synchStatus,
      @JsonKey(name: 'MasterEntityId')
          this.masterEntityId,
      @JsonKey(name: 'TransactionLineAccountDiscountMappingDTOList')
          final List<dynamic>? transactionLineAccountDiscountMappingDTOList,
      @JsonKey(name: 'TransactionLineAccountGameMappingDTOList')
          final List<dynamic>? transactionLineAccountGameMappingDTOList,
      @JsonKey(name: 'TransactionLineAccountCreditPlusMappingDTOList')
          final List<dynamic>? transactionLineAccountCreditPlusMappingDTOList,
      @JsonKey(name: 'IsChanged')
          this.isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          this.isChangedRecursive})
      : _transactionLineAccountDiscountMappingDTOList =
            transactionLineAccountDiscountMappingDTOList,
        _transactionLineAccountGameMappingDTOList =
            transactionLineAccountGameMappingDTOList,
        _transactionLineAccountCreditPlusMappingDTOList =
            transactionLineAccountCreditPlusMappingDTOList;

  factory _$_TransactionLineAccountDto.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionLineAccountDtoFromJson(json);

  @override
  @JsonKey(name: 'TransactionAccountId')
  final int? transactionAccountId;
  @override
  @JsonKey(name: 'TransactionId')
  final int? transactionId;
  @override
  @JsonKey(name: 'TransactionLineId')
  final int? transactionLineId;
  @override
  @JsonKey(name: 'AccountId')
  final int? accountId;
  @override
  @JsonKey(name: 'TagNumber')
  final String? tagNumber;
  @override
  @JsonKey(name: 'SerialNumber')
  final String? serialNumber;
  @override
  @JsonKey(name: 'ExistingAccount')
  final bool? existingAccount;
  @override
  @JsonKey(name: 'IsActive')
  final bool? isActive;
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
  final String? lastUpdatedDate;
  @override
  @JsonKey(name: 'Guid')
  final String? guid;
  @override
  @JsonKey(name: 'SiteId')
  final int? siteId;
  @override
  @JsonKey(name: 'SynchStatus')
  final bool? synchStatus;
  @override
  @JsonKey(name: 'MasterEntityId')
  final int? masterEntityId;
  final List<dynamic>? _transactionLineAccountDiscountMappingDTOList;
  @override
  @JsonKey(name: 'TransactionLineAccountDiscountMappingDTOList')
  List<dynamic>? get transactionLineAccountDiscountMappingDTOList {
    final value = _transactionLineAccountDiscountMappingDTOList;
    if (value == null) return null;
    if (_transactionLineAccountDiscountMappingDTOList
        is EqualUnmodifiableListView)
      return _transactionLineAccountDiscountMappingDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _transactionLineAccountGameMappingDTOList;
  @override
  @JsonKey(name: 'TransactionLineAccountGameMappingDTOList')
  List<dynamic>? get transactionLineAccountGameMappingDTOList {
    final value = _transactionLineAccountGameMappingDTOList;
    if (value == null) return null;
    if (_transactionLineAccountGameMappingDTOList is EqualUnmodifiableListView)
      return _transactionLineAccountGameMappingDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _transactionLineAccountCreditPlusMappingDTOList;
  @override
  @JsonKey(name: 'TransactionLineAccountCreditPlusMappingDTOList')
  List<dynamic>? get transactionLineAccountCreditPlusMappingDTOList {
    final value = _transactionLineAccountCreditPlusMappingDTOList;
    if (value == null) return null;
    if (_transactionLineAccountCreditPlusMappingDTOList
        is EqualUnmodifiableListView)
      return _transactionLineAccountCreditPlusMappingDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'IsChanged')
  final bool? isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  final bool? isChangedRecursive;

  @override
  String toString() {
    return 'TransactionLineAccountDto(transactionAccountId: $transactionAccountId, transactionId: $transactionId, transactionLineId: $transactionLineId, accountId: $accountId, tagNumber: $tagNumber, serialNumber: $serialNumber, existingAccount: $existingAccount, isActive: $isActive, createdBy: $createdBy, creationDate: $creationDate, lastUpdatedBy: $lastUpdatedBy, lastUpdatedDate: $lastUpdatedDate, guid: $guid, siteId: $siteId, synchStatus: $synchStatus, masterEntityId: $masterEntityId, transactionLineAccountDiscountMappingDTOList: $transactionLineAccountDiscountMappingDTOList, transactionLineAccountGameMappingDTOList: $transactionLineAccountGameMappingDTOList, transactionLineAccountCreditPlusMappingDTOList: $transactionLineAccountCreditPlusMappingDTOList, isChanged: $isChanged, isChangedRecursive: $isChangedRecursive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionLineAccountDto &&
            (identical(other.transactionAccountId, transactionAccountId) ||
                other.transactionAccountId == transactionAccountId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.transactionLineId, transactionLineId) ||
                other.transactionLineId == transactionLineId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.tagNumber, tagNumber) ||
                other.tagNumber == tagNumber) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.existingAccount, existingAccount) ||
                other.existingAccount == existingAccount) &&
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
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.synchStatus, synchStatus) ||
                other.synchStatus == synchStatus) &&
            (identical(other.masterEntityId, masterEntityId) ||
                other.masterEntityId == masterEntityId) &&
            const DeepCollectionEquality().equals(
                other._transactionLineAccountDiscountMappingDTOList,
                _transactionLineAccountDiscountMappingDTOList) &&
            const DeepCollectionEquality().equals(
                other._transactionLineAccountGameMappingDTOList,
                _transactionLineAccountGameMappingDTOList) &&
            const DeepCollectionEquality().equals(
                other._transactionLineAccountCreditPlusMappingDTOList,
                _transactionLineAccountCreditPlusMappingDTOList) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged) &&
            (identical(other.isChangedRecursive, isChangedRecursive) ||
                other.isChangedRecursive == isChangedRecursive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        transactionAccountId,
        transactionId,
        transactionLineId,
        accountId,
        tagNumber,
        serialNumber,
        existingAccount,
        isActive,
        createdBy,
        creationDate,
        lastUpdatedBy,
        lastUpdatedDate,
        guid,
        siteId,
        synchStatus,
        masterEntityId,
        const DeepCollectionEquality()
            .hash(_transactionLineAccountDiscountMappingDTOList),
        const DeepCollectionEquality()
            .hash(_transactionLineAccountGameMappingDTOList),
        const DeepCollectionEquality()
            .hash(_transactionLineAccountCreditPlusMappingDTOList),
        isChanged,
        isChangedRecursive
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionLineAccountDtoCopyWith<_$_TransactionLineAccountDto>
      get copyWith => __$$_TransactionLineAccountDtoCopyWithImpl<
          _$_TransactionLineAccountDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionLineAccountDtoToJson(
      this,
    );
  }
}

abstract class _TransactionLineAccountDto implements TransactionLineAccountDto {
  const factory _TransactionLineAccountDto(
      {@JsonKey(name: 'TransactionAccountId')
          final int? transactionAccountId,
      @JsonKey(name: 'TransactionId')
          final int? transactionId,
      @JsonKey(name: 'TransactionLineId')
          final int? transactionLineId,
      @JsonKey(name: 'AccountId')
          final int? accountId,
      @JsonKey(name: 'TagNumber')
          final String? tagNumber,
      @JsonKey(name: 'SerialNumber')
          final String? serialNumber,
      @JsonKey(name: 'ExistingAccount')
          final bool? existingAccount,
      @JsonKey(name: 'IsActive')
          final bool? isActive,
      @JsonKey(name: 'CreatedBy')
          final String? createdBy,
      @JsonKey(name: 'CreationDate')
          final String? creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          final String? lastUpdatedBy,
      @JsonKey(name: 'LastUpdatedDate')
          final String? lastUpdatedDate,
      @JsonKey(name: 'Guid')
          final String? guid,
      @JsonKey(name: 'SiteId')
          final int? siteId,
      @JsonKey(name: 'SynchStatus')
          final bool? synchStatus,
      @JsonKey(name: 'MasterEntityId')
          final int? masterEntityId,
      @JsonKey(name: 'TransactionLineAccountDiscountMappingDTOList')
          final List<dynamic>? transactionLineAccountDiscountMappingDTOList,
      @JsonKey(name: 'TransactionLineAccountGameMappingDTOList')
          final List<dynamic>? transactionLineAccountGameMappingDTOList,
      @JsonKey(name: 'TransactionLineAccountCreditPlusMappingDTOList')
          final List<dynamic>? transactionLineAccountCreditPlusMappingDTOList,
      @JsonKey(name: 'IsChanged')
          final bool? isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          final bool? isChangedRecursive}) = _$_TransactionLineAccountDto;

  factory _TransactionLineAccountDto.fromJson(Map<String, dynamic> json) =
      _$_TransactionLineAccountDto.fromJson;

  @override
  @JsonKey(name: 'TransactionAccountId')
  int? get transactionAccountId;
  @override
  @JsonKey(name: 'TransactionId')
  int? get transactionId;
  @override
  @JsonKey(name: 'TransactionLineId')
  int? get transactionLineId;
  @override
  @JsonKey(name: 'AccountId')
  int? get accountId;
  @override
  @JsonKey(name: 'TagNumber')
  String? get tagNumber;
  @override
  @JsonKey(name: 'SerialNumber')
  String? get serialNumber;
  @override
  @JsonKey(name: 'ExistingAccount')
  bool? get existingAccount;
  @override
  @JsonKey(name: 'IsActive')
  bool? get isActive;
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
  String? get lastUpdatedDate;
  @override
  @JsonKey(name: 'Guid')
  String? get guid;
  @override
  @JsonKey(name: 'SiteId')
  int? get siteId;
  @override
  @JsonKey(name: 'SynchStatus')
  bool? get synchStatus;
  @override
  @JsonKey(name: 'MasterEntityId')
  int? get masterEntityId;
  @override
  @JsonKey(name: 'TransactionLineAccountDiscountMappingDTOList')
  List<dynamic>? get transactionLineAccountDiscountMappingDTOList;
  @override
  @JsonKey(name: 'TransactionLineAccountGameMappingDTOList')
  List<dynamic>? get transactionLineAccountGameMappingDTOList;
  @override
  @JsonKey(name: 'TransactionLineAccountCreditPlusMappingDTOList')
  List<dynamic>? get transactionLineAccountCreditPlusMappingDTOList;
  @override
  @JsonKey(name: 'IsChanged')
  bool? get isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  bool? get isChangedRecursive;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionLineAccountDtoCopyWith<_$_TransactionLineAccountDto>
      get copyWith => throw _privateConstructorUsedError;
}
