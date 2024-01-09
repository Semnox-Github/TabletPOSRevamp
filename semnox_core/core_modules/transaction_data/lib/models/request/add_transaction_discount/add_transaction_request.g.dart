// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddTransactionDiscountRequest _$$_AddTransactionDiscountRequestFromJson(
        Map<String, dynamic> json) =>
    _$_AddTransactionDiscountRequest(
      transactionDiscountId: json['TransactionDiscountId'] as int,
      discountId: json['DiscountId'] as int,
      discountAmount: (json['DiscountAmount'] as num).toDouble(),
      couponNumber: json['CouponNumber'] as String,
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AddTransactionDiscountRequestToJson(
        _$_AddTransactionDiscountRequest instance) =>
    <String, dynamic>{
      'TransactionDiscountId': instance.transactionDiscountId,
      'DiscountId': instance.discountId,
      'DiscountAmount': instance.discountAmount,
      'CouponNumber': instance.couponNumber,
      'ApprovalDTO': instance.approvalDTO,
    };
