// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_discount_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionDiscountDto _$TransactionDiscountDtoFromJson(
    Map<String, dynamic> json) {
  return _TransactionDiscountDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionDiscountDto {
  @JsonKey(name: 'TransactionDiscountId')
  int? get transactionDiscountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionId')
  int? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountId')
  int? get discountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountName')
  String? get discountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountAmount')
  dynamic get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountPercentage')
  dynamic get discountPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovedBy')
  int? get approvedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApplicationType')
  String? get applicationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApplicationCardId')
  int? get applicationCardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountType')
  String? get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'CouponNumber')
  String? get couponNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Indicator')
  String? get indicator => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'TransactionDiscountCriteriaLineDTOList')
  List<dynamic>? get transactionDiscountCriteriaLineDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionDiscountApplicableLineDTOList')
  List<TransactionDiscountApplicableLineDto>?
      get transactionDiscountApplicableLineDTOList =>
          throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool? get isChanged => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChangedRecursive')
  bool? get isChangedRecursive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionDiscountDtoCopyWith<TransactionDiscountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDiscountDtoCopyWith<$Res> {
  factory $TransactionDiscountDtoCopyWith(TransactionDiscountDto value,
          $Res Function(TransactionDiscountDto) then) =
      _$TransactionDiscountDtoCopyWithImpl<$Res, TransactionDiscountDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionDiscountId')
          int? transactionDiscountId,
      @JsonKey(name: 'TransactionId')
          int? transactionId,
      @JsonKey(name: 'DiscountId')
          int? discountId,
      @JsonKey(name: 'DiscountName')
          String? discountName,
      @JsonKey(name: 'DiscountAmount')
          dynamic discountAmount,
      @JsonKey(name: 'DiscountPercentage')
          dynamic discountPercentage,
      @JsonKey(name: 'ApprovedBy')
          int? approvedBy,
      @JsonKey(name: 'Remarks')
          String? remarks,
      @JsonKey(name: 'ApplicationType')
          String? applicationType,
      @JsonKey(name: 'ApplicationCardId')
          int? applicationCardId,
      @JsonKey(name: 'DiscountType')
          String? discountType,
      @JsonKey(name: 'CouponNumber')
          String? couponNumber,
      @JsonKey(name: 'Indicator')
          String? indicator,
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
      @JsonKey(name: 'TransactionDiscountCriteriaLineDTOList')
          List<dynamic>? transactionDiscountCriteriaLineDTOList,
      @JsonKey(name: 'TransactionDiscountApplicableLineDTOList')
          List<TransactionDiscountApplicableLineDto>?
              transactionDiscountApplicableLineDTOList,
      @JsonKey(name: 'IsChanged')
          bool? isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          bool? isChangedRecursive});
}

/// @nodoc
class _$TransactionDiscountDtoCopyWithImpl<$Res,
        $Val extends TransactionDiscountDto>
    implements $TransactionDiscountDtoCopyWith<$Res> {
  _$TransactionDiscountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDiscountId = freezed,
    Object? transactionId = freezed,
    Object? discountId = freezed,
    Object? discountName = freezed,
    Object? discountAmount = freezed,
    Object? discountPercentage = freezed,
    Object? approvedBy = freezed,
    Object? remarks = freezed,
    Object? applicationType = freezed,
    Object? applicationCardId = freezed,
    Object? discountType = freezed,
    Object? couponNumber = freezed,
    Object? indicator = freezed,
    Object? isActive = freezed,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = freezed,
    Object? guid = freezed,
    Object? siteId = freezed,
    Object? synchStatus = freezed,
    Object? masterEntityId = freezed,
    Object? transactionDiscountCriteriaLineDTOList = freezed,
    Object? transactionDiscountApplicableLineDTOList = freezed,
    Object? isChanged = freezed,
    Object? isChangedRecursive = freezed,
  }) {
    return _then(_value.copyWith(
      transactionDiscountId: freezed == transactionDiscountId
          ? _value.transactionDiscountId
          : transactionDiscountId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      discountId: freezed == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as int?,
      discountName: freezed == discountName
          ? _value.discountName
          : discountName // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      discountPercentage: freezed == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationType: freezed == applicationType
          ? _value.applicationType
          : applicationType // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationCardId: freezed == applicationCardId
          ? _value.applicationCardId
          : applicationCardId // ignore: cast_nullable_to_non_nullable
              as int?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      couponNumber: freezed == couponNumber
          ? _value.couponNumber
          : couponNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      indicator: freezed == indicator
          ? _value.indicator
          : indicator // ignore: cast_nullable_to_non_nullable
              as String?,
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
      transactionDiscountCriteriaLineDTOList: freezed ==
              transactionDiscountCriteriaLineDTOList
          ? _value.transactionDiscountCriteriaLineDTOList
          : transactionDiscountCriteriaLineDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      transactionDiscountApplicableLineDTOList: freezed ==
              transactionDiscountApplicableLineDTOList
          ? _value.transactionDiscountApplicableLineDTOList
          : transactionDiscountApplicableLineDTOList // ignore: cast_nullable_to_non_nullable
              as List<TransactionDiscountApplicableLineDto>?,
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
abstract class _$$_TransactionDiscountDtoCopyWith<$Res>
    implements $TransactionDiscountDtoCopyWith<$Res> {
  factory _$$_TransactionDiscountDtoCopyWith(_$_TransactionDiscountDto value,
          $Res Function(_$_TransactionDiscountDto) then) =
      __$$_TransactionDiscountDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionDiscountId')
          int? transactionDiscountId,
      @JsonKey(name: 'TransactionId')
          int? transactionId,
      @JsonKey(name: 'DiscountId')
          int? discountId,
      @JsonKey(name: 'DiscountName')
          String? discountName,
      @JsonKey(name: 'DiscountAmount')
          dynamic discountAmount,
      @JsonKey(name: 'DiscountPercentage')
          dynamic discountPercentage,
      @JsonKey(name: 'ApprovedBy')
          int? approvedBy,
      @JsonKey(name: 'Remarks')
          String? remarks,
      @JsonKey(name: 'ApplicationType')
          String? applicationType,
      @JsonKey(name: 'ApplicationCardId')
          int? applicationCardId,
      @JsonKey(name: 'DiscountType')
          String? discountType,
      @JsonKey(name: 'CouponNumber')
          String? couponNumber,
      @JsonKey(name: 'Indicator')
          String? indicator,
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
      @JsonKey(name: 'TransactionDiscountCriteriaLineDTOList')
          List<dynamic>? transactionDiscountCriteriaLineDTOList,
      @JsonKey(name: 'TransactionDiscountApplicableLineDTOList')
          List<TransactionDiscountApplicableLineDto>?
              transactionDiscountApplicableLineDTOList,
      @JsonKey(name: 'IsChanged')
          bool? isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          bool? isChangedRecursive});
}

/// @nodoc
class __$$_TransactionDiscountDtoCopyWithImpl<$Res>
    extends _$TransactionDiscountDtoCopyWithImpl<$Res,
        _$_TransactionDiscountDto>
    implements _$$_TransactionDiscountDtoCopyWith<$Res> {
  __$$_TransactionDiscountDtoCopyWithImpl(_$_TransactionDiscountDto _value,
      $Res Function(_$_TransactionDiscountDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDiscountId = freezed,
    Object? transactionId = freezed,
    Object? discountId = freezed,
    Object? discountName = freezed,
    Object? discountAmount = freezed,
    Object? discountPercentage = freezed,
    Object? approvedBy = freezed,
    Object? remarks = freezed,
    Object? applicationType = freezed,
    Object? applicationCardId = freezed,
    Object? discountType = freezed,
    Object? couponNumber = freezed,
    Object? indicator = freezed,
    Object? isActive = freezed,
    Object? createdBy = freezed,
    Object? creationDate = freezed,
    Object? lastUpdatedBy = freezed,
    Object? lastUpdatedDate = freezed,
    Object? guid = freezed,
    Object? siteId = freezed,
    Object? synchStatus = freezed,
    Object? masterEntityId = freezed,
    Object? transactionDiscountCriteriaLineDTOList = freezed,
    Object? transactionDiscountApplicableLineDTOList = freezed,
    Object? isChanged = freezed,
    Object? isChangedRecursive = freezed,
  }) {
    return _then(_$_TransactionDiscountDto(
      transactionDiscountId: freezed == transactionDiscountId
          ? _value.transactionDiscountId
          : transactionDiscountId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      discountId: freezed == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as int?,
      discountName: freezed == discountName
          ? _value.discountName
          : discountName // ignore: cast_nullable_to_non_nullable
              as String?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      discountPercentage: freezed == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationType: freezed == applicationType
          ? _value.applicationType
          : applicationType // ignore: cast_nullable_to_non_nullable
              as String?,
      applicationCardId: freezed == applicationCardId
          ? _value.applicationCardId
          : applicationCardId // ignore: cast_nullable_to_non_nullable
              as int?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      couponNumber: freezed == couponNumber
          ? _value.couponNumber
          : couponNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      indicator: freezed == indicator
          ? _value.indicator
          : indicator // ignore: cast_nullable_to_non_nullable
              as String?,
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
      transactionDiscountCriteriaLineDTOList: freezed ==
              transactionDiscountCriteriaLineDTOList
          ? _value._transactionDiscountCriteriaLineDTOList
          : transactionDiscountCriteriaLineDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      transactionDiscountApplicableLineDTOList: freezed ==
              transactionDiscountApplicableLineDTOList
          ? _value._transactionDiscountApplicableLineDTOList
          : transactionDiscountApplicableLineDTOList // ignore: cast_nullable_to_non_nullable
              as List<TransactionDiscountApplicableLineDto>?,
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
class _$_TransactionDiscountDto implements _TransactionDiscountDto {
  const _$_TransactionDiscountDto(
      {@JsonKey(name: 'TransactionDiscountId')
          this.transactionDiscountId,
      @JsonKey(name: 'TransactionId')
          this.transactionId,
      @JsonKey(name: 'DiscountId')
          this.discountId,
      @JsonKey(name: 'DiscountName')
          this.discountName,
      @JsonKey(name: 'DiscountAmount')
          this.discountAmount,
      @JsonKey(name: 'DiscountPercentage')
          this.discountPercentage,
      @JsonKey(name: 'ApprovedBy')
          this.approvedBy,
      @JsonKey(name: 'Remarks')
          this.remarks,
      @JsonKey(name: 'ApplicationType')
          this.applicationType,
      @JsonKey(name: 'ApplicationCardId')
          this.applicationCardId,
      @JsonKey(name: 'DiscountType')
          this.discountType,
      @JsonKey(name: 'CouponNumber')
          this.couponNumber,
      @JsonKey(name: 'Indicator')
          this.indicator,
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
      @JsonKey(name: 'TransactionDiscountCriteriaLineDTOList')
          final List<dynamic>? transactionDiscountCriteriaLineDTOList,
      @JsonKey(name: 'TransactionDiscountApplicableLineDTOList')
          final List<TransactionDiscountApplicableLineDto>?
              transactionDiscountApplicableLineDTOList,
      @JsonKey(name: 'IsChanged')
          this.isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          this.isChangedRecursive})
      : _transactionDiscountCriteriaLineDTOList =
            transactionDiscountCriteriaLineDTOList,
        _transactionDiscountApplicableLineDTOList =
            transactionDiscountApplicableLineDTOList;

  factory _$_TransactionDiscountDto.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionDiscountDtoFromJson(json);

  @override
  @JsonKey(name: 'TransactionDiscountId')
  final int? transactionDiscountId;
  @override
  @JsonKey(name: 'TransactionId')
  final int? transactionId;
  @override
  @JsonKey(name: 'DiscountId')
  final int? discountId;
  @override
  @JsonKey(name: 'DiscountName')
  final String? discountName;
  @override
  @JsonKey(name: 'DiscountAmount')
  final dynamic discountAmount;
  @override
  @JsonKey(name: 'DiscountPercentage')
  final dynamic discountPercentage;
  @override
  @JsonKey(name: 'ApprovedBy')
  final int? approvedBy;
  @override
  @JsonKey(name: 'Remarks')
  final String? remarks;
  @override
  @JsonKey(name: 'ApplicationType')
  final String? applicationType;
  @override
  @JsonKey(name: 'ApplicationCardId')
  final int? applicationCardId;
  @override
  @JsonKey(name: 'DiscountType')
  final String? discountType;
  @override
  @JsonKey(name: 'CouponNumber')
  final String? couponNumber;
  @override
  @JsonKey(name: 'Indicator')
  final String? indicator;
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
  final List<dynamic>? _transactionDiscountCriteriaLineDTOList;
  @override
  @JsonKey(name: 'TransactionDiscountCriteriaLineDTOList')
  List<dynamic>? get transactionDiscountCriteriaLineDTOList {
    final value = _transactionDiscountCriteriaLineDTOList;
    if (value == null) return null;
    if (_transactionDiscountCriteriaLineDTOList is EqualUnmodifiableListView)
      return _transactionDiscountCriteriaLineDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TransactionDiscountApplicableLineDto>?
      _transactionDiscountApplicableLineDTOList;
  @override
  @JsonKey(name: 'TransactionDiscountApplicableLineDTOList')
  List<TransactionDiscountApplicableLineDto>?
      get transactionDiscountApplicableLineDTOList {
    final value = _transactionDiscountApplicableLineDTOList;
    if (value == null) return null;
    if (_transactionDiscountApplicableLineDTOList is EqualUnmodifiableListView)
      return _transactionDiscountApplicableLineDTOList;
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
    return 'TransactionDiscountDto(transactionDiscountId: $transactionDiscountId, transactionId: $transactionId, discountId: $discountId, discountName: $discountName, discountAmount: $discountAmount, discountPercentage: $discountPercentage, approvedBy: $approvedBy, remarks: $remarks, applicationType: $applicationType, applicationCardId: $applicationCardId, discountType: $discountType, couponNumber: $couponNumber, indicator: $indicator, isActive: $isActive, createdBy: $createdBy, creationDate: $creationDate, lastUpdatedBy: $lastUpdatedBy, lastUpdatedDate: $lastUpdatedDate, guid: $guid, siteId: $siteId, synchStatus: $synchStatus, masterEntityId: $masterEntityId, transactionDiscountCriteriaLineDTOList: $transactionDiscountCriteriaLineDTOList, transactionDiscountApplicableLineDTOList: $transactionDiscountApplicableLineDTOList, isChanged: $isChanged, isChangedRecursive: $isChangedRecursive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionDiscountDto &&
            (identical(other.transactionDiscountId, transactionDiscountId) ||
                other.transactionDiscountId == transactionDiscountId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.discountId, discountId) ||
                other.discountId == discountId) &&
            (identical(other.discountName, discountName) ||
                other.discountName == discountName) &&
            const DeepCollectionEquality()
                .equals(other.discountAmount, discountAmount) &&
            const DeepCollectionEquality()
                .equals(other.discountPercentage, discountPercentage) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.applicationType, applicationType) ||
                other.applicationType == applicationType) &&
            (identical(other.applicationCardId, applicationCardId) ||
                other.applicationCardId == applicationCardId) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.couponNumber, couponNumber) ||
                other.couponNumber == couponNumber) &&
            (identical(other.indicator, indicator) ||
                other.indicator == indicator) &&
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
                other._transactionDiscountCriteriaLineDTOList,
                _transactionDiscountCriteriaLineDTOList) &&
            const DeepCollectionEquality().equals(
                other._transactionDiscountApplicableLineDTOList,
                _transactionDiscountApplicableLineDTOList) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged) &&
            (identical(other.isChangedRecursive, isChangedRecursive) ||
                other.isChangedRecursive == isChangedRecursive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        transactionDiscountId,
        transactionId,
        discountId,
        discountName,
        const DeepCollectionEquality().hash(discountAmount),
        const DeepCollectionEquality().hash(discountPercentage),
        approvedBy,
        remarks,
        applicationType,
        applicationCardId,
        discountType,
        couponNumber,
        indicator,
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
            .hash(_transactionDiscountCriteriaLineDTOList),
        const DeepCollectionEquality()
            .hash(_transactionDiscountApplicableLineDTOList),
        isChanged,
        isChangedRecursive
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionDiscountDtoCopyWith<_$_TransactionDiscountDto> get copyWith =>
      __$$_TransactionDiscountDtoCopyWithImpl<_$_TransactionDiscountDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionDiscountDtoToJson(
      this,
    );
  }
}

abstract class _TransactionDiscountDto implements TransactionDiscountDto {
  const factory _TransactionDiscountDto(
      {@JsonKey(name: 'TransactionDiscountId')
          final int? transactionDiscountId,
      @JsonKey(name: 'TransactionId')
          final int? transactionId,
      @JsonKey(name: 'DiscountId')
          final int? discountId,
      @JsonKey(name: 'DiscountName')
          final String? discountName,
      @JsonKey(name: 'DiscountAmount')
          final dynamic discountAmount,
      @JsonKey(name: 'DiscountPercentage')
          final dynamic discountPercentage,
      @JsonKey(name: 'ApprovedBy')
          final int? approvedBy,
      @JsonKey(name: 'Remarks')
          final String? remarks,
      @JsonKey(name: 'ApplicationType')
          final String? applicationType,
      @JsonKey(name: 'ApplicationCardId')
          final int? applicationCardId,
      @JsonKey(name: 'DiscountType')
          final String? discountType,
      @JsonKey(name: 'CouponNumber')
          final String? couponNumber,
      @JsonKey(name: 'Indicator')
          final String? indicator,
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
      @JsonKey(name: 'TransactionDiscountCriteriaLineDTOList')
          final List<dynamic>? transactionDiscountCriteriaLineDTOList,
      @JsonKey(name: 'TransactionDiscountApplicableLineDTOList')
          final List<TransactionDiscountApplicableLineDto>?
              transactionDiscountApplicableLineDTOList,
      @JsonKey(name: 'IsChanged')
          final bool? isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          final bool? isChangedRecursive}) = _$_TransactionDiscountDto;

  factory _TransactionDiscountDto.fromJson(Map<String, dynamic> json) =
      _$_TransactionDiscountDto.fromJson;

  @override
  @JsonKey(name: 'TransactionDiscountId')
  int? get transactionDiscountId;
  @override
  @JsonKey(name: 'TransactionId')
  int? get transactionId;
  @override
  @JsonKey(name: 'DiscountId')
  int? get discountId;
  @override
  @JsonKey(name: 'DiscountName')
  String? get discountName;
  @override
  @JsonKey(name: 'DiscountAmount')
  dynamic get discountAmount;
  @override
  @JsonKey(name: 'DiscountPercentage')
  dynamic get discountPercentage;
  @override
  @JsonKey(name: 'ApprovedBy')
  int? get approvedBy;
  @override
  @JsonKey(name: 'Remarks')
  String? get remarks;
  @override
  @JsonKey(name: 'ApplicationType')
  String? get applicationType;
  @override
  @JsonKey(name: 'ApplicationCardId')
  int? get applicationCardId;
  @override
  @JsonKey(name: 'DiscountType')
  String? get discountType;
  @override
  @JsonKey(name: 'CouponNumber')
  String? get couponNumber;
  @override
  @JsonKey(name: 'Indicator')
  String? get indicator;
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
  @JsonKey(name: 'TransactionDiscountCriteriaLineDTOList')
  List<dynamic>? get transactionDiscountCriteriaLineDTOList;
  @override
  @JsonKey(name: 'TransactionDiscountApplicableLineDTOList')
  List<TransactionDiscountApplicableLineDto>?
      get transactionDiscountApplicableLineDTOList;
  @override
  @JsonKey(name: 'IsChanged')
  bool? get isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  bool? get isChangedRecursive;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionDiscountDtoCopyWith<_$_TransactionDiscountDto> get copyWith =>
      throw _privateConstructorUsedError;
}
