// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericPaymentRequest _$GenericPaymentRequestFromJson(
    Map<String, dynamic> json) {
  return _GenericPaymentRequest.fromJson(json);
}

/// @nodoc
mixin _$GenericPaymentRequest {
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
  @JsonKey(name: 'CashDrawerId')
  int get cashDrawerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentPaymentId')
  int get parentPaymentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TenderedAmount')
  dynamic get tenderedAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Reference')
  dynamic get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'TipAmount')
  double get tipAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericPaymentRequestCopyWith<GenericPaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericPaymentRequestCopyWith<$Res> {
  factory $GenericPaymentRequestCopyWith(GenericPaymentRequest value,
          $Res Function(GenericPaymentRequest) then) =
      _$GenericPaymentRequestCopyWithImpl<$Res, GenericPaymentRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentId') int paymentId,
      @JsonKey(name: 'ApproverId') int approverId,
      @JsonKey(name: 'TransactionId') int transactionId,
      @JsonKey(name: 'PaymentModeId') int paymentModeId,
      @JsonKey(name: 'Amount') double amount,
      @JsonKey(name: 'CashDrawerId') int cashDrawerId,
      @JsonKey(name: 'ParentPaymentId') int parentPaymentId,
      @JsonKey(name: 'TenderedAmount') dynamic tenderedAmount,
      @JsonKey(name: 'Reference') dynamic reference,
      @JsonKey(name: 'TipAmount') double tipAmount});
}

/// @nodoc
class _$GenericPaymentRequestCopyWithImpl<$Res,
        $Val extends GenericPaymentRequest>
    implements $GenericPaymentRequestCopyWith<$Res> {
  _$GenericPaymentRequestCopyWithImpl(this._value, this._then);

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
    Object? cashDrawerId = null,
    Object? parentPaymentId = null,
    Object? tenderedAmount = freezed,
    Object? reference = freezed,
    Object? tipAmount = null,
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
      cashDrawerId: null == cashDrawerId
          ? _value.cashDrawerId
          : cashDrawerId // ignore: cast_nullable_to_non_nullable
              as int,
      parentPaymentId: null == parentPaymentId
          ? _value.parentPaymentId
          : parentPaymentId // ignore: cast_nullable_to_non_nullable
              as int,
      tenderedAmount: freezed == tenderedAmount
          ? _value.tenderedAmount
          : tenderedAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenericPaymentRequestCopyWith<$Res>
    implements $GenericPaymentRequestCopyWith<$Res> {
  factory _$$_GenericPaymentRequestCopyWith(_$_GenericPaymentRequest value,
          $Res Function(_$_GenericPaymentRequest) then) =
      __$$_GenericPaymentRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PaymentId') int paymentId,
      @JsonKey(name: 'ApproverId') int approverId,
      @JsonKey(name: 'TransactionId') int transactionId,
      @JsonKey(name: 'PaymentModeId') int paymentModeId,
      @JsonKey(name: 'Amount') double amount,
      @JsonKey(name: 'CashDrawerId') int cashDrawerId,
      @JsonKey(name: 'ParentPaymentId') int parentPaymentId,
      @JsonKey(name: 'TenderedAmount') dynamic tenderedAmount,
      @JsonKey(name: 'Reference') dynamic reference,
      @JsonKey(name: 'TipAmount') double tipAmount});
}

/// @nodoc
class __$$_GenericPaymentRequestCopyWithImpl<$Res>
    extends _$GenericPaymentRequestCopyWithImpl<$Res, _$_GenericPaymentRequest>
    implements _$$_GenericPaymentRequestCopyWith<$Res> {
  __$$_GenericPaymentRequestCopyWithImpl(_$_GenericPaymentRequest _value,
      $Res Function(_$_GenericPaymentRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
    Object? approverId = null,
    Object? transactionId = null,
    Object? paymentModeId = null,
    Object? amount = null,
    Object? cashDrawerId = null,
    Object? parentPaymentId = null,
    Object? tenderedAmount = freezed,
    Object? reference = freezed,
    Object? tipAmount = null,
  }) {
    return _then(_$_GenericPaymentRequest(
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
      cashDrawerId: null == cashDrawerId
          ? _value.cashDrawerId
          : cashDrawerId // ignore: cast_nullable_to_non_nullable
              as int,
      parentPaymentId: null == parentPaymentId
          ? _value.parentPaymentId
          : parentPaymentId // ignore: cast_nullable_to_non_nullable
              as int,
      tenderedAmount: freezed == tenderedAmount
          ? _value.tenderedAmount
          : tenderedAmount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tipAmount: null == tipAmount
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenericPaymentRequest implements _GenericPaymentRequest {
  const _$_GenericPaymentRequest(
      {@JsonKey(name: 'PaymentId') required this.paymentId,
      @JsonKey(name: 'ApproverId') required this.approverId,
      @JsonKey(name: 'TransactionId') required this.transactionId,
      @JsonKey(name: 'PaymentModeId') required this.paymentModeId,
      @JsonKey(name: 'Amount') required this.amount,
      @JsonKey(name: 'CashDrawerId') required this.cashDrawerId,
      @JsonKey(name: 'ParentPaymentId') required this.parentPaymentId,
      @JsonKey(name: 'TenderedAmount') this.tenderedAmount,
      @JsonKey(name: 'Reference') this.reference,
      @JsonKey(name: 'TipAmount') required this.tipAmount});

  factory _$_GenericPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$$_GenericPaymentRequestFromJson(json);

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
  @JsonKey(name: 'CashDrawerId')
  final int cashDrawerId;
  @override
  @JsonKey(name: 'ParentPaymentId')
  final int parentPaymentId;
  @override
  @JsonKey(name: 'TenderedAmount')
  final dynamic tenderedAmount;
  @override
  @JsonKey(name: 'Reference')
  final dynamic reference;
  @override
  @JsonKey(name: 'TipAmount')
  final double tipAmount;

  @override
  String toString() {
    return 'GenericPaymentRequest(paymentId: $paymentId, approverId: $approverId, transactionId: $transactionId, paymentModeId: $paymentModeId, amount: $amount, cashDrawerId: $cashDrawerId, parentPaymentId: $parentPaymentId, tenderedAmount: $tenderedAmount, reference: $reference, tipAmount: $tipAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericPaymentRequest &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.approverId, approverId) ||
                other.approverId == approverId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.paymentModeId, paymentModeId) ||
                other.paymentModeId == paymentModeId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.cashDrawerId, cashDrawerId) ||
                other.cashDrawerId == cashDrawerId) &&
            (identical(other.parentPaymentId, parentPaymentId) ||
                other.parentPaymentId == parentPaymentId) &&
            const DeepCollectionEquality()
                .equals(other.tenderedAmount, tenderedAmount) &&
            const DeepCollectionEquality().equals(other.reference, reference) &&
            (identical(other.tipAmount, tipAmount) ||
                other.tipAmount == tipAmount));
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
      cashDrawerId,
      parentPaymentId,
      const DeepCollectionEquality().hash(tenderedAmount),
      const DeepCollectionEquality().hash(reference),
      tipAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenericPaymentRequestCopyWith<_$_GenericPaymentRequest> get copyWith =>
      __$$_GenericPaymentRequestCopyWithImpl<_$_GenericPaymentRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenericPaymentRequestToJson(
      this,
    );
  }
}

abstract class _GenericPaymentRequest implements GenericPaymentRequest {
  const factory _GenericPaymentRequest(
          {@JsonKey(name: 'PaymentId') required final int paymentId,
          @JsonKey(name: 'ApproverId') required final int approverId,
          @JsonKey(name: 'TransactionId') required final int transactionId,
          @JsonKey(name: 'PaymentModeId') required final int paymentModeId,
          @JsonKey(name: 'Amount') required final double amount,
          @JsonKey(name: 'CashDrawerId') required final int cashDrawerId,
          @JsonKey(name: 'ParentPaymentId') required final int parentPaymentId,
          @JsonKey(name: 'TenderedAmount') final dynamic tenderedAmount,
          @JsonKey(name: 'Reference') final dynamic reference,
          @JsonKey(name: 'TipAmount') required final double tipAmount}) =
      _$_GenericPaymentRequest;

  factory _GenericPaymentRequest.fromJson(Map<String, dynamic> json) =
      _$_GenericPaymentRequest.fromJson;

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
  @JsonKey(name: 'CashDrawerId')
  int get cashDrawerId;
  @override
  @JsonKey(name: 'ParentPaymentId')
  int get parentPaymentId;
  @override
  @JsonKey(name: 'TenderedAmount')
  dynamic get tenderedAmount;
  @override
  @JsonKey(name: 'Reference')
  dynamic get reference;
  @override
  @JsonKey(name: 'TipAmount')
  double get tipAmount;
  @override
  @JsonKey(ignore: true)
  _$$_GenericPaymentRequestCopyWith<_$_GenericPaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
