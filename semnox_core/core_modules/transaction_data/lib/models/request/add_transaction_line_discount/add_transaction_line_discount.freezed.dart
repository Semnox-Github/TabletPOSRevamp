// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_transaction_line_discount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddTransactionLineDiscountRequest _$AddTransactionLineDiscountRequestFromJson(
    Map<String, dynamic> json) {
  return _AddTransactionLineDiscountRequest.fromJson(json);
}

/// @nodoc
mixin _$AddTransactionLineDiscountRequest {
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountId')
  int get discountId => throw _privateConstructorUsedError;
  @JsonKey(name: "Remarks")
  String get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountAmount')
  double get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'CouponNumber')
  String get couponNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddTransactionLineDiscountRequestCopyWith<AddTransactionLineDiscountRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTransactionLineDiscountRequestCopyWith<$Res> {
  factory $AddTransactionLineDiscountRequestCopyWith(
          AddTransactionLineDiscountRequest value,
          $Res Function(AddTransactionLineDiscountRequest) then) =
      _$AddTransactionLineDiscountRequestCopyWithImpl<$Res,
          AddTransactionLineDiscountRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'DiscountId') int discountId,
      @JsonKey(name: "Remarks") String remarks,
      @JsonKey(name: 'DiscountAmount') double discountAmount,
      @JsonKey(name: 'CouponNumber') String couponNumber,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class _$AddTransactionLineDiscountRequestCopyWithImpl<$Res,
        $Val extends AddTransactionLineDiscountRequest>
    implements $AddTransactionLineDiscountRequestCopyWith<$Res> {
  _$AddTransactionLineDiscountRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? discountId = null,
    Object? remarks = null,
    Object? discountAmount = null,
    Object? couponNumber = null,
    Object? approvalDTO = null,
  }) {
    return _then(_value.copyWith(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      discountId: null == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      couponNumber: null == couponNumber
          ? _value.couponNumber
          : couponNumber // ignore: cast_nullable_to_non_nullable
              as String,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApprovalDTOCopyWith<$Res> get approvalDTO {
    return $ApprovalDTOCopyWith<$Res>(_value.approvalDTO, (value) {
      return _then(_value.copyWith(approvalDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddTransactionLineDiscountRequestCopyWith<$Res>
    implements $AddTransactionLineDiscountRequestCopyWith<$Res> {
  factory _$$_AddTransactionLineDiscountRequestCopyWith(
          _$_AddTransactionLineDiscountRequest value,
          $Res Function(_$_AddTransactionLineDiscountRequest) then) =
      __$$_AddTransactionLineDiscountRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionLineId') int transactionLineId,
      @JsonKey(name: 'DiscountId') int discountId,
      @JsonKey(name: "Remarks") String remarks,
      @JsonKey(name: 'DiscountAmount') double discountAmount,
      @JsonKey(name: 'CouponNumber') String couponNumber,
      @JsonKey(name: 'ApprovalDTO') ApprovalDTO approvalDTO});

  @override
  $ApprovalDTOCopyWith<$Res> get approvalDTO;
}

/// @nodoc
class __$$_AddTransactionLineDiscountRequestCopyWithImpl<$Res>
    extends _$AddTransactionLineDiscountRequestCopyWithImpl<$Res,
        _$_AddTransactionLineDiscountRequest>
    implements _$$_AddTransactionLineDiscountRequestCopyWith<$Res> {
  __$$_AddTransactionLineDiscountRequestCopyWithImpl(
      _$_AddTransactionLineDiscountRequest _value,
      $Res Function(_$_AddTransactionLineDiscountRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionLineId = null,
    Object? discountId = null,
    Object? remarks = null,
    Object? discountAmount = null,
    Object? couponNumber = null,
    Object? approvalDTO = null,
  }) {
    return _then(_$_AddTransactionLineDiscountRequest(
      transactionLineId: null == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int,
      discountId: null == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as int,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      couponNumber: null == couponNumber
          ? _value.couponNumber
          : couponNumber // ignore: cast_nullable_to_non_nullable
              as String,
      approvalDTO: null == approvalDTO
          ? _value.approvalDTO
          : approvalDTO // ignore: cast_nullable_to_non_nullable
              as ApprovalDTO,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddTransactionLineDiscountRequest
    implements _AddTransactionLineDiscountRequest {
  const _$_AddTransactionLineDiscountRequest(
      {@JsonKey(name: 'TransactionLineId') required this.transactionLineId,
      @JsonKey(name: 'DiscountId') required this.discountId,
      @JsonKey(name: "Remarks") required this.remarks,
      @JsonKey(name: 'DiscountAmount') required this.discountAmount,
      @JsonKey(name: 'CouponNumber') required this.couponNumber,
      @JsonKey(name: 'ApprovalDTO') required this.approvalDTO});

  factory _$_AddTransactionLineDiscountRequest.fromJson(
          Map<String, dynamic> json) =>
      _$$_AddTransactionLineDiscountRequestFromJson(json);

  @override
  @JsonKey(name: 'TransactionLineId')
  final int transactionLineId;
  @override
  @JsonKey(name: 'DiscountId')
  final int discountId;
  @override
  @JsonKey(name: "Remarks")
  final String remarks;
  @override
  @JsonKey(name: 'DiscountAmount')
  final double discountAmount;
  @override
  @JsonKey(name: 'CouponNumber')
  final String couponNumber;
  @override
  @JsonKey(name: 'ApprovalDTO')
  final ApprovalDTO approvalDTO;

  @override
  String toString() {
    return 'AddTransactionLineDiscountRequest(transactionLineId: $transactionLineId, discountId: $discountId, remarks: $remarks, discountAmount: $discountAmount, couponNumber: $couponNumber, approvalDTO: $approvalDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddTransactionLineDiscountRequest &&
            (identical(other.transactionLineId, transactionLineId) ||
                other.transactionLineId == transactionLineId) &&
            (identical(other.discountId, discountId) ||
                other.discountId == discountId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.couponNumber, couponNumber) ||
                other.couponNumber == couponNumber) &&
            (identical(other.approvalDTO, approvalDTO) ||
                other.approvalDTO == approvalDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionLineId, discountId,
      remarks, discountAmount, couponNumber, approvalDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddTransactionLineDiscountRequestCopyWith<
          _$_AddTransactionLineDiscountRequest>
      get copyWith => __$$_AddTransactionLineDiscountRequestCopyWithImpl<
          _$_AddTransactionLineDiscountRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddTransactionLineDiscountRequestToJson(
      this,
    );
  }
}

abstract class _AddTransactionLineDiscountRequest
    implements AddTransactionLineDiscountRequest {
  const factory _AddTransactionLineDiscountRequest(
          {@JsonKey(name: 'TransactionLineId')
              required final int transactionLineId,
          @JsonKey(name: 'DiscountId')
              required final int discountId,
          @JsonKey(name: "Remarks")
              required final String remarks,
          @JsonKey(name: 'DiscountAmount')
              required final double discountAmount,
          @JsonKey(name: 'CouponNumber')
              required final String couponNumber,
          @JsonKey(name: 'ApprovalDTO')
              required final ApprovalDTO approvalDTO}) =
      _$_AddTransactionLineDiscountRequest;

  factory _AddTransactionLineDiscountRequest.fromJson(
          Map<String, dynamic> json) =
      _$_AddTransactionLineDiscountRequest.fromJson;

  @override
  @JsonKey(name: 'TransactionLineId')
  int get transactionLineId;
  @override
  @JsonKey(name: 'DiscountId')
  int get discountId;
  @override
  @JsonKey(name: "Remarks")
  String get remarks;
  @override
  @JsonKey(name: 'DiscountAmount')
  double get discountAmount;
  @override
  @JsonKey(name: 'CouponNumber')
  String get couponNumber;
  @override
  @JsonKey(name: 'ApprovalDTO')
  ApprovalDTO get approvalDTO;
  @override
  @JsonKey(ignore: true)
  _$$_AddTransactionLineDiscountRequestCopyWith<
          _$_AddTransactionLineDiscountRequest>
      get copyWith => throw _privateConstructorUsedError;
}
