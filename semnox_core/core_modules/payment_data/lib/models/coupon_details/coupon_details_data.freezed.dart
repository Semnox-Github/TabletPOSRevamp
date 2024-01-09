// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_details_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CouponDetailsData _$CouponDetailsDataFromJson(Map<String, dynamic> json) {
  return _CouponDetailsData.fromJson(json);
}

/// @nodoc
mixin _$CouponDetailsData {
  @JsonKey(name: 'CouponSetId')
  int get couponSetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'FromNumber')
  String get fromNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ToNumber')
  String get toNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Count')
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'UsedCount')
  int get usedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentModeId')
  int get paymentModeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StartDate')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryDate')
  String get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CouponValue')
  double get couponValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedDate')
  String get lastUpdatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreatedBy')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'CreationDate')
  String get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastUpdatedBy')
  String get lastUpdatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MasterEntityId')
  int get masterEntityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SynchStatus')
  bool get synchStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentCouponsUsedDTOList')
  List<PaymentCouponsUsedDTO> get paymentCouponsUsedDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool get isChanged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponDetailsDataCopyWith<CouponDetailsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponDetailsDataCopyWith<$Res> {
  factory $CouponDetailsDataCopyWith(
          CouponDetailsData value, $Res Function(CouponDetailsData) then) =
      _$CouponDetailsDataCopyWithImpl<$Res, CouponDetailsData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CouponSetId')
          int couponSetId,
      @JsonKey(name: 'FromNumber')
          String fromNumber,
      @JsonKey(name: 'ToNumber')
          String toNumber,
      @JsonKey(name: 'Count')
          int count,
      @JsonKey(name: 'UsedCount')
          int usedCount,
      @JsonKey(name: 'PaymentModeId')
          int paymentModeId,
      @JsonKey(name: 'StartDate')
          String startDate,
      @JsonKey(name: 'ExpiryDate')
          String expiryDate,
      @JsonKey(name: 'CouponValue')
          double couponValue,
      @JsonKey(name: 'IsActive')
          bool isActive,
      @JsonKey(name: 'LastUpdatedDate')
          String lastUpdatedDate,
      @JsonKey(name: 'CreatedBy')
          String createdBy,
      @JsonKey(name: 'CreationDate')
          String creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          String lastUpdatedBy,
      @JsonKey(name: 'SiteId')
          int siteId,
      @JsonKey(name: 'MasterEntityId')
          int masterEntityId,
      @JsonKey(name: 'SynchStatus')
          bool synchStatus,
      @JsonKey(name: 'Guid')
          String guid,
      @JsonKey(name: 'PaymentCouponsUsedDTOList')
          List<PaymentCouponsUsedDTO> paymentCouponsUsedDTOList,
      @JsonKey(name: 'IsChangedRecursive')
          bool isChangedRecursive,
      @JsonKey(name: 'IsChanged')
          bool isChanged});
}

/// @nodoc
class _$CouponDetailsDataCopyWithImpl<$Res, $Val extends CouponDetailsData>
    implements $CouponDetailsDataCopyWith<$Res> {
  _$CouponDetailsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couponSetId = null,
    Object? fromNumber = null,
    Object? toNumber = null,
    Object? count = null,
    Object? usedCount = null,
    Object? paymentModeId = null,
    Object? startDate = null,
    Object? expiryDate = null,
    Object? couponValue = null,
    Object? isActive = null,
    Object? lastUpdatedDate = null,
    Object? createdBy = null,
    Object? creationDate = null,
    Object? lastUpdatedBy = null,
    Object? siteId = null,
    Object? masterEntityId = null,
    Object? synchStatus = null,
    Object? guid = null,
    Object? paymentCouponsUsedDTOList = null,
    Object? isChangedRecursive = null,
    Object? isChanged = null,
  }) {
    return _then(_value.copyWith(
      couponSetId: null == couponSetId
          ? _value.couponSetId
          : couponSetId // ignore: cast_nullable_to_non_nullable
              as int,
      fromNumber: null == fromNumber
          ? _value.fromNumber
          : fromNumber // ignore: cast_nullable_to_non_nullable
              as String,
      toNumber: null == toNumber
          ? _value.toNumber
          : toNumber // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      usedCount: null == usedCount
          ? _value.usedCount
          : usedCount // ignore: cast_nullable_to_non_nullable
              as int,
      paymentModeId: null == paymentModeId
          ? _value.paymentModeId
          : paymentModeId // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      couponValue: null == couponValue
          ? _value.couponValue
          : couponValue // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdatedDate: null == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
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
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCouponsUsedDTOList: null == paymentCouponsUsedDTOList
          ? _value.paymentCouponsUsedDTOList
          : paymentCouponsUsedDTOList // ignore: cast_nullable_to_non_nullable
              as List<PaymentCouponsUsedDTO>,
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
abstract class _$$_CouponDetailsDataCopyWith<$Res>
    implements $CouponDetailsDataCopyWith<$Res> {
  factory _$$_CouponDetailsDataCopyWith(_$_CouponDetailsData value,
          $Res Function(_$_CouponDetailsData) then) =
      __$$_CouponDetailsDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CouponSetId')
          int couponSetId,
      @JsonKey(name: 'FromNumber')
          String fromNumber,
      @JsonKey(name: 'ToNumber')
          String toNumber,
      @JsonKey(name: 'Count')
          int count,
      @JsonKey(name: 'UsedCount')
          int usedCount,
      @JsonKey(name: 'PaymentModeId')
          int paymentModeId,
      @JsonKey(name: 'StartDate')
          String startDate,
      @JsonKey(name: 'ExpiryDate')
          String expiryDate,
      @JsonKey(name: 'CouponValue')
          double couponValue,
      @JsonKey(name: 'IsActive')
          bool isActive,
      @JsonKey(name: 'LastUpdatedDate')
          String lastUpdatedDate,
      @JsonKey(name: 'CreatedBy')
          String createdBy,
      @JsonKey(name: 'CreationDate')
          String creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          String lastUpdatedBy,
      @JsonKey(name: 'SiteId')
          int siteId,
      @JsonKey(name: 'MasterEntityId')
          int masterEntityId,
      @JsonKey(name: 'SynchStatus')
          bool synchStatus,
      @JsonKey(name: 'Guid')
          String guid,
      @JsonKey(name: 'PaymentCouponsUsedDTOList')
          List<PaymentCouponsUsedDTO> paymentCouponsUsedDTOList,
      @JsonKey(name: 'IsChangedRecursive')
          bool isChangedRecursive,
      @JsonKey(name: 'IsChanged')
          bool isChanged});
}

/// @nodoc
class __$$_CouponDetailsDataCopyWithImpl<$Res>
    extends _$CouponDetailsDataCopyWithImpl<$Res, _$_CouponDetailsData>
    implements _$$_CouponDetailsDataCopyWith<$Res> {
  __$$_CouponDetailsDataCopyWithImpl(
      _$_CouponDetailsData _value, $Res Function(_$_CouponDetailsData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? couponSetId = null,
    Object? fromNumber = null,
    Object? toNumber = null,
    Object? count = null,
    Object? usedCount = null,
    Object? paymentModeId = null,
    Object? startDate = null,
    Object? expiryDate = null,
    Object? couponValue = null,
    Object? isActive = null,
    Object? lastUpdatedDate = null,
    Object? createdBy = null,
    Object? creationDate = null,
    Object? lastUpdatedBy = null,
    Object? siteId = null,
    Object? masterEntityId = null,
    Object? synchStatus = null,
    Object? guid = null,
    Object? paymentCouponsUsedDTOList = null,
    Object? isChangedRecursive = null,
    Object? isChanged = null,
  }) {
    return _then(_$_CouponDetailsData(
      couponSetId: null == couponSetId
          ? _value.couponSetId
          : couponSetId // ignore: cast_nullable_to_non_nullable
              as int,
      fromNumber: null == fromNumber
          ? _value.fromNumber
          : fromNumber // ignore: cast_nullable_to_non_nullable
              as String,
      toNumber: null == toNumber
          ? _value.toNumber
          : toNumber // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      usedCount: null == usedCount
          ? _value.usedCount
          : usedCount // ignore: cast_nullable_to_non_nullable
              as int,
      paymentModeId: null == paymentModeId
          ? _value.paymentModeId
          : paymentModeId // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      couponValue: null == couponValue
          ? _value.couponValue
          : couponValue // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastUpdatedDate: null == lastUpdatedDate
          ? _value.lastUpdatedDate
          : lastUpdatedDate // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedBy: null == lastUpdatedBy
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
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
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCouponsUsedDTOList: null == paymentCouponsUsedDTOList
          ? _value._paymentCouponsUsedDTOList
          : paymentCouponsUsedDTOList // ignore: cast_nullable_to_non_nullable
              as List<PaymentCouponsUsedDTO>,
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
class _$_CouponDetailsData implements _CouponDetailsData {
  const _$_CouponDetailsData(
      {@JsonKey(name: 'CouponSetId')
          required this.couponSetId,
      @JsonKey(name: 'FromNumber')
          required this.fromNumber,
      @JsonKey(name: 'ToNumber')
          required this.toNumber,
      @JsonKey(name: 'Count')
          required this.count,
      @JsonKey(name: 'UsedCount')
          required this.usedCount,
      @JsonKey(name: 'PaymentModeId')
          required this.paymentModeId,
      @JsonKey(name: 'StartDate')
          required this.startDate,
      @JsonKey(name: 'ExpiryDate')
          required this.expiryDate,
      @JsonKey(name: 'CouponValue')
          required this.couponValue,
      @JsonKey(name: 'IsActive')
          required this.isActive,
      @JsonKey(name: 'LastUpdatedDate')
          required this.lastUpdatedDate,
      @JsonKey(name: 'CreatedBy')
          required this.createdBy,
      @JsonKey(name: 'CreationDate')
          required this.creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          required this.lastUpdatedBy,
      @JsonKey(name: 'SiteId')
          required this.siteId,
      @JsonKey(name: 'MasterEntityId')
          required this.masterEntityId,
      @JsonKey(name: 'SynchStatus')
          required this.synchStatus,
      @JsonKey(name: 'Guid')
          required this.guid,
      @JsonKey(name: 'PaymentCouponsUsedDTOList')
          required final List<PaymentCouponsUsedDTO> paymentCouponsUsedDTOList,
      @JsonKey(name: 'IsChangedRecursive')
          required this.isChangedRecursive,
      @JsonKey(name: 'IsChanged')
          required this.isChanged})
      : _paymentCouponsUsedDTOList = paymentCouponsUsedDTOList;

  factory _$_CouponDetailsData.fromJson(Map<String, dynamic> json) =>
      _$$_CouponDetailsDataFromJson(json);

  @override
  @JsonKey(name: 'CouponSetId')
  final int couponSetId;
  @override
  @JsonKey(name: 'FromNumber')
  final String fromNumber;
  @override
  @JsonKey(name: 'ToNumber')
  final String toNumber;
  @override
  @JsonKey(name: 'Count')
  final int count;
  @override
  @JsonKey(name: 'UsedCount')
  final int usedCount;
  @override
  @JsonKey(name: 'PaymentModeId')
  final int paymentModeId;
  @override
  @JsonKey(name: 'StartDate')
  final String startDate;
  @override
  @JsonKey(name: 'ExpiryDate')
  final String expiryDate;
  @override
  @JsonKey(name: 'CouponValue')
  final double couponValue;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;
  @override
  @JsonKey(name: 'LastUpdatedDate')
  final String lastUpdatedDate;
  @override
  @JsonKey(name: 'CreatedBy')
  final String createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  final String creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  final String lastUpdatedBy;
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
  final String guid;
  final List<PaymentCouponsUsedDTO> _paymentCouponsUsedDTOList;
  @override
  @JsonKey(name: 'PaymentCouponsUsedDTOList')
  List<PaymentCouponsUsedDTO> get paymentCouponsUsedDTOList {
    if (_paymentCouponsUsedDTOList is EqualUnmodifiableListView)
      return _paymentCouponsUsedDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentCouponsUsedDTOList);
  }

  @override
  @JsonKey(name: 'IsChangedRecursive')
  final bool isChangedRecursive;
  @override
  @JsonKey(name: 'IsChanged')
  final bool isChanged;

  @override
  String toString() {
    return 'CouponDetailsData(couponSetId: $couponSetId, fromNumber: $fromNumber, toNumber: $toNumber, count: $count, usedCount: $usedCount, paymentModeId: $paymentModeId, startDate: $startDate, expiryDate: $expiryDate, couponValue: $couponValue, isActive: $isActive, lastUpdatedDate: $lastUpdatedDate, createdBy: $createdBy, creationDate: $creationDate, lastUpdatedBy: $lastUpdatedBy, siteId: $siteId, masterEntityId: $masterEntityId, synchStatus: $synchStatus, guid: $guid, paymentCouponsUsedDTOList: $paymentCouponsUsedDTOList, isChangedRecursive: $isChangedRecursive, isChanged: $isChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouponDetailsData &&
            (identical(other.couponSetId, couponSetId) ||
                other.couponSetId == couponSetId) &&
            (identical(other.fromNumber, fromNumber) ||
                other.fromNumber == fromNumber) &&
            (identical(other.toNumber, toNumber) ||
                other.toNumber == toNumber) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.usedCount, usedCount) ||
                other.usedCount == usedCount) &&
            (identical(other.paymentModeId, paymentModeId) ||
                other.paymentModeId == paymentModeId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.couponValue, couponValue) ||
                other.couponValue == couponValue) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastUpdatedDate, lastUpdatedDate) ||
                other.lastUpdatedDate == lastUpdatedDate) &&
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
            const DeepCollectionEquality().equals(
                other._paymentCouponsUsedDTOList, _paymentCouponsUsedDTOList) &&
            (identical(other.isChangedRecursive, isChangedRecursive) ||
                other.isChangedRecursive == isChangedRecursive) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        couponSetId,
        fromNumber,
        toNumber,
        count,
        usedCount,
        paymentModeId,
        startDate,
        expiryDate,
        couponValue,
        isActive,
        lastUpdatedDate,
        createdBy,
        creationDate,
        lastUpdatedBy,
        siteId,
        masterEntityId,
        synchStatus,
        guid,
        const DeepCollectionEquality().hash(_paymentCouponsUsedDTOList),
        isChangedRecursive,
        isChanged
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CouponDetailsDataCopyWith<_$_CouponDetailsData> get copyWith =>
      __$$_CouponDetailsDataCopyWithImpl<_$_CouponDetailsData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponDetailsDataToJson(
      this,
    );
  }
}

abstract class _CouponDetailsData implements CouponDetailsData {
  const factory _CouponDetailsData(
      {@JsonKey(name: 'CouponSetId')
          required final int couponSetId,
      @JsonKey(name: 'FromNumber')
          required final String fromNumber,
      @JsonKey(name: 'ToNumber')
          required final String toNumber,
      @JsonKey(name: 'Count')
          required final int count,
      @JsonKey(name: 'UsedCount')
          required final int usedCount,
      @JsonKey(name: 'PaymentModeId')
          required final int paymentModeId,
      @JsonKey(name: 'StartDate')
          required final String startDate,
      @JsonKey(name: 'ExpiryDate')
          required final String expiryDate,
      @JsonKey(name: 'CouponValue')
          required final double couponValue,
      @JsonKey(name: 'IsActive')
          required final bool isActive,
      @JsonKey(name: 'LastUpdatedDate')
          required final String lastUpdatedDate,
      @JsonKey(name: 'CreatedBy')
          required final String createdBy,
      @JsonKey(name: 'CreationDate')
          required final String creationDate,
      @JsonKey(name: 'LastUpdatedBy')
          required final String lastUpdatedBy,
      @JsonKey(name: 'SiteId')
          required final int siteId,
      @JsonKey(name: 'MasterEntityId')
          required final int masterEntityId,
      @JsonKey(name: 'SynchStatus')
          required final bool synchStatus,
      @JsonKey(name: 'Guid')
          required final String guid,
      @JsonKey(name: 'PaymentCouponsUsedDTOList')
          required final List<PaymentCouponsUsedDTO> paymentCouponsUsedDTOList,
      @JsonKey(name: 'IsChangedRecursive')
          required final bool isChangedRecursive,
      @JsonKey(name: 'IsChanged')
          required final bool isChanged}) = _$_CouponDetailsData;

  factory _CouponDetailsData.fromJson(Map<String, dynamic> json) =
      _$_CouponDetailsData.fromJson;

  @override
  @JsonKey(name: 'CouponSetId')
  int get couponSetId;
  @override
  @JsonKey(name: 'FromNumber')
  String get fromNumber;
  @override
  @JsonKey(name: 'ToNumber')
  String get toNumber;
  @override
  @JsonKey(name: 'Count')
  int get count;
  @override
  @JsonKey(name: 'UsedCount')
  int get usedCount;
  @override
  @JsonKey(name: 'PaymentModeId')
  int get paymentModeId;
  @override
  @JsonKey(name: 'StartDate')
  String get startDate;
  @override
  @JsonKey(name: 'ExpiryDate')
  String get expiryDate;
  @override
  @JsonKey(name: 'CouponValue')
  double get couponValue;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(name: 'LastUpdatedDate')
  String get lastUpdatedDate;
  @override
  @JsonKey(name: 'CreatedBy')
  String get createdBy;
  @override
  @JsonKey(name: 'CreationDate')
  String get creationDate;
  @override
  @JsonKey(name: 'LastUpdatedBy')
  String get lastUpdatedBy;
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
  String get guid;
  @override
  @JsonKey(name: 'PaymentCouponsUsedDTOList')
  List<PaymentCouponsUsedDTO> get paymentCouponsUsedDTOList;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive;
  @override
  @JsonKey(name: 'IsChanged')
  bool get isChanged;
  @override
  @JsonKey(ignore: true)
  _$$_CouponDetailsDataCopyWith<_$_CouponDetailsData> get copyWith =>
      throw _privateConstructorUsedError;
}
