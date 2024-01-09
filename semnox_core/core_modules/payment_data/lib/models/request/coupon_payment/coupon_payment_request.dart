// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'coupon_payment_request.freezed.dart';
part 'coupon_payment_request.g.dart';

@freezed
class CouponPaymentRequest with _$CouponPaymentRequest {
  const factory CouponPaymentRequest({
    @JsonKey(name: 'PaymentId')
    required int paymentId,
    @JsonKey(name: 'ApproverId')
    required int approverId,
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'PaymentModeId')
    required int paymentModeId,
    @JsonKey(name: 'Amount')
    required double amount,
    @JsonKey(name: 'CouponSetId')
    required int couponSetId,
    @JsonKey(name: 'CouponNumber')
    required String couponNumber,
    @JsonKey(name: 'CouponValue')
    required double couponValue,
    @JsonKey(name: 'CPConsumptionId')
    required int cpConsumptionId,
    @JsonKey(name: 'IsTaxable')
    required bool isTaxable,
    @JsonKey(name: 'PaymentStatusId')
    required int paymentStatusId,
    @JsonKey(name: 'TenderedAmount')
    dynamic tenderedAmount,
    @JsonKey(name: 'PaymentDate')
    dynamic paymentDate,
    @JsonKey(name: 'PaymentStatus')
    required String paymentStatus,
    @JsonKey(name: 'Reference')
    dynamic reference,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    required bool isChangedRecursive,
  }) = _CouponPaymentRequest;


  factory CouponPaymentRequest.fromJson(Map<String, dynamic> json) => _$CouponPaymentRequestFromJson(json);
}