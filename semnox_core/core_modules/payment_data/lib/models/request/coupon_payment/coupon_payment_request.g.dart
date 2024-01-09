// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CouponPaymentRequest _$$_CouponPaymentRequestFromJson(
        Map<String, dynamic> json) =>
    _$_CouponPaymentRequest(
      paymentId: json['PaymentId'] as int,
      approverId: json['ApproverId'] as int,
      transactionId: json['TransactionId'] as int,
      paymentModeId: json['PaymentModeId'] as int,
      amount: (json['Amount'] as num).toDouble(),
      couponSetId: json['CouponSetId'] as int,
      couponNumber: json['CouponNumber'] as String,
      couponValue: (json['CouponValue'] as num).toDouble(),
      cpConsumptionId: json['CPConsumptionId'] as int,
      isTaxable: json['IsTaxable'] as bool,
      paymentStatusId: json['PaymentStatusId'] as int,
      tenderedAmount: json['TenderedAmount'],
      paymentDate: json['PaymentDate'],
      paymentStatus: json['PaymentStatus'] as String,
      reference: json['Reference'],
      isChanged: json['IsChanged'] as bool,
      isChangedRecursive: json['IsChangedRecursive'] as bool,
    );

Map<String, dynamic> _$$_CouponPaymentRequestToJson(
        _$_CouponPaymentRequest instance) =>
    <String, dynamic>{
      'PaymentId': instance.paymentId,
      'ApproverId': instance.approverId,
      'TransactionId': instance.transactionId,
      'PaymentModeId': instance.paymentModeId,
      'Amount': instance.amount,
      'CouponSetId': instance.couponSetId,
      'CouponNumber': instance.couponNumber,
      'CouponValue': instance.couponValue,
      'CPConsumptionId': instance.cpConsumptionId,
      'IsTaxable': instance.isTaxable,
      'PaymentStatusId': instance.paymentStatusId,
      'TenderedAmount': instance.tenderedAmount,
      'PaymentDate': instance.paymentDate,
      'PaymentStatus': instance.paymentStatus,
      'Reference': instance.reference,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
    };
