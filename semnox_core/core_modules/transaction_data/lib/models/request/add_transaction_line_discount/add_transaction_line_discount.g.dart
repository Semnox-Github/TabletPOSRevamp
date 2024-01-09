// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_transaction_line_discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddTransactionLineDiscountRequest
    _$$_AddTransactionLineDiscountRequestFromJson(Map<String, dynamic> json) =>
        _$_AddTransactionLineDiscountRequest(
          transactionLineId: json['TransactionLineId'] as int,
          discountId: json['DiscountId'] as int,
          remarks: json['Remarks'] as String,
          discountAmount: (json['DiscountAmount'] as num).toDouble(),
          couponNumber: json['CouponNumber'] as String,
          approvalDTO:
              ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_AddTransactionLineDiscountRequestToJson(
        _$_AddTransactionLineDiscountRequest instance) =>
    <String, dynamic>{
      'TransactionLineId': instance.transactionLineId,
      'DiscountId': instance.discountId,
      'Remarks': instance.remarks,
      'DiscountAmount': instance.discountAmount,
      'CouponNumber': instance.couponNumber,
      'ApprovalDTO': instance.approvalDTO,
    };
