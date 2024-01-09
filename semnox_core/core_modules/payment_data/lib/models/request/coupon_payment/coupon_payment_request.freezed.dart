// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CouponPaymentRequest _$CouponPaymentRequestFromJson(Map<String, dynamic> json) {
  return _CouponPaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$CouponPaymentRequest {
  @JsonKey(name: 'PaymentId')
  int get paymentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApproverId')
  int get approverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionId')
  int get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentModeId')
  int get paymentModeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Amount')
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'CouponSetId')
  int get couponSetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CouponNumber')
  String get couponNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'CouponValue')
  double get couponValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'CPConsumptionId')
  int get cpConsumptionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsTaxable')
  bool get isTaxable => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentStatusId')
  int get paymentStatusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TenderedAmount')
  dynamic get tenderedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentDate')
  dynamic get paymentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentStatus')
  String get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reference')
  dynamic get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChanged')
  bool get isChanged => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponPaymentRequestCopyWith<CouponPaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponPaymentRequestCopyWith<$Res> {
  factory $CouponPaymentRequestCopyWith(CouponPaymentRequest value,
          $Res Function(CouponPaymentRequest) then) =
      _$CouponPaymentRequestCopyWithImpl<$Res, CouponPaymentRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentId') int paymentId,
      @JsonKey(name: 'ApproverId') int approverId,
      @JsonKey(name: 'TransactionId') int transactionId,
      @JsonKey(name: 'PaymentModeId') int paymentModeId,
      @JsonKey(name: 'Amount') double amount,
      @JsonKey(name: 'CouponSetId') int couponSetId,
      @JsonKey(name: 'CouponNumber') String couponNumber,
      @JsonKey(name: 'CouponValue') double couponValue,
      @JsonKey(name: 'CPConsumptionId') int cpConsumptionId,
      @JsonKey(name: 'IsTaxable') bool isTaxable,
      @JsonKey(name: 'PaymentStatusId') int paymentStatusId,
      @JsonKey(name: 'TenderedAmount') dynamic tenderedAmount,
      @JsonKey(name: 'PaymentDate') dynamic paymentDate,
      @JsonKey(name: 'PaymentStatus') String paymentStatus,
      @JsonKey(name: 'Reference') dynamic reference,
      @JsonKey(name: 'IsChanged') bool isChanged,
      @JsonKey(name: 'IsChangedRecursive') bool isChangedRecursive});
}

/// @nodoc
class _$CouponPaymentRequestCopyWithImpl<$Res,
        $Val extends CouponPaymentRequest>
    implements $CouponPaymentRequestCopyWith<$Res> {
  _$CouponPaymentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
    Object? approverId = null,
    Object? transactionId = null,
    Object? paymentModeId = null,
    Object? amount = null,
    Object? couponSetId = null,
    Object? couponNumber = null,
    Object? couponValue = null,
    Object? cpConsumptionId = null,
    Object? isTaxable = null,
    Object? paymentStatusId = null,
    Object? tenderedAmount = freezed,
    Object? paymentDate = freezed,
    Object? paymentStatus = null,
    Object? reference = freezed,
    Object? isChanged = null,
    Object? isChangedRecursive = null,
  }) {
    return _then(_value.copyWith(
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as int,
      approverId: null == approverId
          ? _value.approverId
          : approverId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      paymentModeId: null == paymentModeId
          ? _value.paymentModeId
          : paymentModeId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      couponSetId: null == couponSetId
          ? _value.couponSetId
          : couponSetId // ignore: cast_nullable_to_non_nullable
              as int,
      couponNumber: null == couponNumber
          ? _value.couponNumber
          : couponNumber // ignore: cast_nullable_to_non_nullable
              as String,
      couponValue: null == couponValue
          ? _value.couponValue
          : couponValue // ignore: cast_nullable_to_non_nullable
              as double,
      cpConsumptionId: null == cpConsumptionId
          ? _value.cpConsumptionId
          : cpConsumptionId // ignore: cast_nullable_to_non_nullable
              as int,
      isTaxable: null == isTaxable
          ? _value.isTaxable
          : isTaxable // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentStatusId: null == paymentStatusId
          ? _value.paymentStatusId
          : paymentStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      tenderedAmount: freezed == tenderedAmount
          ? _value.tenderedAmount
          : tenderedAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      isChangedRecursive: null == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CouponPaymentRequestCopyWith<$Res>
    implements $CouponPaymentRequestCopyWith<$Res> {
  factory _$$_CouponPaymentRequestCopyWith(_$_CouponPaymentRequest value,
          $Res Function(_$_CouponPaymentRequest) then) =
      __$$_CouponPaymentRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentId') int paymentId,
      @JsonKey(name: 'ApproverId') int approverId,
      @JsonKey(name: 'TransactionId') int transactionId,
      @JsonKey(name: 'PaymentModeId') int paymentModeId,
      @JsonKey(name: 'Amount') double amount,
      @JsonKey(name: 'CouponSetId') int couponSetId,
      @JsonKey(name: 'CouponNumber') String couponNumber,
      @JsonKey(name: 'CouponValue') double couponValue,
      @JsonKey(name: 'CPConsumptionId') int cpConsumptionId,
      @JsonKey(name: 'IsTaxable') bool isTaxable,
      @JsonKey(name: 'PaymentStatusId') int paymentStatusId,
      @JsonKey(name: 'TenderedAmount') dynamic tenderedAmount,
      @JsonKey(name: 'PaymentDate') dynamic paymentDate,
      @JsonKey(name: 'PaymentStatus') String paymentStatus,
      @JsonKey(name: 'Reference') dynamic reference,
      @JsonKey(name: 'IsChanged') bool isChanged,
      @JsonKey(name: 'IsChangedRecursive') bool isChangedRecursive});
}

/// @nodoc
class __$$_CouponPaymentRequestCopyWithImpl<$Res>
    extends _$CouponPaymentRequestCopyWithImpl<$Res, _$_CouponPaymentRequest>
    implements _$$_CouponPaymentRequestCopyWith<$Res> {
  __$$_CouponPaymentRequestCopyWithImpl(_$_CouponPaymentRequest _value,
      $Res Function(_$_CouponPaymentRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
    Object? approverId = null,
    Object? transactionId = null,
    Object? paymentModeId = null,
    Object? amount = null,
    Object? couponSetId = null,
    Object? couponNumber = null,
    Object? couponValue = null,
    Object? cpConsumptionId = null,
    Object? isTaxable = null,
    Object? paymentStatusId = null,
    Object? tenderedAmount = freezed,
    Object? paymentDate = freezed,
    Object? paymentStatus = null,
    Object? reference = freezed,
    Object? isChanged = null,
    Object? isChangedRecursive = null,
  }) {
    return _then(_$_CouponPaymentRequest(
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as int,
      approverId: null == approverId
          ? _value.approverId
          : approverId // ignore: cast_nullable_to_non_nullable
              as int,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int,
      paymentModeId: null == paymentModeId
          ? _value.paymentModeId
          : paymentModeId // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      couponSetId: null == couponSetId
          ? _value.couponSetId
          : couponSetId // ignore: cast_nullable_to_non_nullable
              as int,
      couponNumber: null == couponNumber
          ? _value.couponNumber
          : couponNumber // ignore: cast_nullable_to_non_nullable
              as String,
      couponValue: null == couponValue
          ? _value.couponValue
          : couponValue // ignore: cast_nullable_to_non_nullable
              as double,
      cpConsumptionId: null == cpConsumptionId
          ? _value.cpConsumptionId
          : cpConsumptionId // ignore: cast_nullable_to_non_nullable
              as int,
      isTaxable: null == isTaxable
          ? _value.isTaxable
          : isTaxable // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentStatusId: null == paymentStatusId
          ? _value.paymentStatusId
          : paymentStatusId // ignore: cast_nullable_to_non_nullable
              as int,
      tenderedAmount: freezed == tenderedAmount
          ? _value.tenderedAmount
          : tenderedAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isChanged: null == isChanged
          ? _value.isChanged
          : isChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      isChangedRecursive: null == isChangedRecursive
          ? _value.isChangedRecursive
          : isChangedRecursive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CouponPaymentRequest implements _CouponPaymentRequest {
  const _$_CouponPaymentRequest(
      {@JsonKey(name: 'PaymentId') required this.paymentId,
      @JsonKey(name: 'ApproverId') required this.approverId,
      @JsonKey(name: 'TransactionId') required this.transactionId,
      @JsonKey(name: 'PaymentModeId') required this.paymentModeId,
      @JsonKey(name: 'Amount') required this.amount,
      @JsonKey(name: 'CouponSetId') required this.couponSetId,
      @JsonKey(name: 'CouponNumber') required this.couponNumber,
      @JsonKey(name: 'CouponValue') required this.couponValue,
      @JsonKey(name: 'CPConsumptionId') required this.cpConsumptionId,
      @JsonKey(name: 'IsTaxable') required this.isTaxable,
      @JsonKey(name: 'PaymentStatusId') required this.paymentStatusId,
      @JsonKey(name: 'TenderedAmount') this.tenderedAmount,
      @JsonKey(name: 'PaymentDate') this.paymentDate,
      @JsonKey(name: 'PaymentStatus') required this.paymentStatus,
      @JsonKey(name: 'Reference') this.reference,
      @JsonKey(name: 'IsChanged') required this.isChanged,
      @JsonKey(name: 'IsChangedRecursive') required this.isChangedRecursive});

  factory _$_CouponPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CouponPaymentRequestFromJson(json);

  @override
  @JsonKey(name: 'PaymentId')
  final int paymentId;
  @override
  @JsonKey(name: 'ApproverId')
  final int approverId;
  @override
  @JsonKey(name: 'TransactionId')
  final int transactionId;
  @override
  @JsonKey(name: 'PaymentModeId')
  final int paymentModeId;
  @override
  @JsonKey(name: 'Amount')
  final double amount;
  @override
  @JsonKey(name: 'CouponSetId')
  final int couponSetId;
  @override
  @JsonKey(name: 'CouponNumber')
  final String couponNumber;
  @override
  @JsonKey(name: 'CouponValue')
  final double couponValue;
  @override
  @JsonKey(name: 'CPConsumptionId')
  final int cpConsumptionId;
  @override
  @JsonKey(name: 'IsTaxable')
  final bool isTaxable;
  @override
  @JsonKey(name: 'PaymentStatusId')
  final int paymentStatusId;
  @override
  @JsonKey(name: 'TenderedAmount')
  final dynamic tenderedAmount;
  @override
  @JsonKey(name: 'PaymentDate')
  final dynamic paymentDate;
  @override
  @JsonKey(name: 'PaymentStatus')
  final String paymentStatus;
  @override
  @JsonKey(name: 'Reference')
  final dynamic reference;
  @override
  @JsonKey(name: 'IsChanged')
  final bool isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  final bool isChangedRecursive;

  @override
  String toString() {
    return 'CouponPaymentRequest(paymentId: $paymentId, approverId: $approverId, transactionId: $transactionId, paymentModeId: $paymentModeId, amount: $amount, couponSetId: $couponSetId, couponNumber: $couponNumber, couponValue: $couponValue, cpConsumptionId: $cpConsumptionId, isTaxable: $isTaxable, paymentStatusId: $paymentStatusId, tenderedAmount: $tenderedAmount, paymentDate: $paymentDate, paymentStatus: $paymentStatus, reference: $reference, isChanged: $isChanged, isChangedRecursive: $isChangedRecursive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouponPaymentRequest &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.approverId, approverId) ||
                other.approverId == approverId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.paymentModeId, paymentModeId) ||
                other.paymentModeId == paymentModeId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.couponSetId, couponSetId) ||
                other.couponSetId == couponSetId) &&
            (identical(other.couponNumber, couponNumber) ||
                other.couponNumber == couponNumber) &&
            (identical(other.couponValue, couponValue) ||
                other.couponValue == couponValue) &&
            (identical(other.cpConsumptionId, cpConsumptionId) ||
                other.cpConsumptionId == cpConsumptionId) &&
            (identical(other.isTaxable, isTaxable) ||
                other.isTaxable == isTaxable) &&
            (identical(other.paymentStatusId, paymentStatusId) ||
                other.paymentStatusId == paymentStatusId) &&
            const DeepCollectionEquality()
                .equals(other.tenderedAmount, tenderedAmount) &&
            const DeepCollectionEquality()
                .equals(other.paymentDate, paymentDate) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            const DeepCollectionEquality().equals(other.reference, reference) &&
            (identical(other.isChanged, isChanged) ||
                other.isChanged == isChanged) &&
            (identical(other.isChangedRecursive, isChangedRecursive) ||
                other.isChangedRecursive == isChangedRecursive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentId,
      approverId,
      transactionId,
      paymentModeId,
      amount,
      couponSetId,
      couponNumber,
      couponValue,
      cpConsumptionId,
      isTaxable,
      paymentStatusId,
      const DeepCollectionEquality().hash(tenderedAmount),
      const DeepCollectionEquality().hash(paymentDate),
      paymentStatus,
      const DeepCollectionEquality().hash(reference),
      isChanged,
      isChangedRecursive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CouponPaymentRequestCopyWith<_$_CouponPaymentRequest> get copyWith =>
      __$$_CouponPaymentRequestCopyWithImpl<_$_CouponPaymentRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponPaymentRequestToJson(
      this,
    );
  }
}

abstract class _CouponPaymentRequest implements CouponPaymentRequest {
  const factory _CouponPaymentRequest(
      {@JsonKey(name: 'PaymentId')
          required final int paymentId,
      @JsonKey(name: 'ApproverId')
          required final int approverId,
      @JsonKey(name: 'TransactionId')
          required final int transactionId,
      @JsonKey(name: 'PaymentModeId')
          required final int paymentModeId,
      @JsonKey(name: 'Amount')
          required final double amount,
      @JsonKey(name: 'CouponSetId')
          required final int couponSetId,
      @JsonKey(name: 'CouponNumber')
          required final String couponNumber,
      @JsonKey(name: 'CouponValue')
          required final double couponValue,
      @JsonKey(name: 'CPConsumptionId')
          required final int cpConsumptionId,
      @JsonKey(name: 'IsTaxable')
          required final bool isTaxable,
      @JsonKey(name: 'PaymentStatusId')
          required final int paymentStatusId,
      @JsonKey(name: 'TenderedAmount')
          final dynamic tenderedAmount,
      @JsonKey(name: 'PaymentDate')
          final dynamic paymentDate,
      @JsonKey(name: 'PaymentStatus')
          required final String paymentStatus,
      @JsonKey(name: 'Reference')
          final dynamic reference,
      @JsonKey(name: 'IsChanged')
          required final bool isChanged,
      @JsonKey(name: 'IsChangedRecursive')
          required final bool isChangedRecursive}) = _$_CouponPaymentRequest;

  factory _CouponPaymentRequest.fromJson(Map<String, dynamic> json) =
      _$_CouponPaymentRequest.fromJson;

  @override
  @JsonKey(name: 'PaymentId')
  int get paymentId;
  @override
  @JsonKey(name: 'ApproverId')
  int get approverId;
  @override
  @JsonKey(name: 'TransactionId')
  int get transactionId;
  @override
  @JsonKey(name: 'PaymentModeId')
  int get paymentModeId;
  @override
  @JsonKey(name: 'Amount')
  double get amount;
  @override
  @JsonKey(name: 'CouponSetId')
  int get couponSetId;
  @override
  @JsonKey(name: 'CouponNumber')
  String get couponNumber;
  @override
  @JsonKey(name: 'CouponValue')
  double get couponValue;
  @override
  @JsonKey(name: 'CPConsumptionId')
  int get cpConsumptionId;
  @override
  @JsonKey(name: 'IsTaxable')
  bool get isTaxable;
  @override
  @JsonKey(name: 'PaymentStatusId')
  int get paymentStatusId;
  @override
  @JsonKey(name: 'TenderedAmount')
  dynamic get tenderedAmount;
  @override
  @JsonKey(name: 'PaymentDate')
  dynamic get paymentDate;
  @override
  @JsonKey(name: 'PaymentStatus')
  String get paymentStatus;
  @override
  @JsonKey(name: 'Reference')
  dynamic get reference;
  @override
  @JsonKey(name: 'IsChanged')
  bool get isChanged;
  @override
  @JsonKey(name: 'IsChangedRecursive')
  bool get isChangedRecursive;
  @override
  @JsonKey(ignore: true)
  _$$_CouponPaymentRequestCopyWith<_$_CouponPaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
