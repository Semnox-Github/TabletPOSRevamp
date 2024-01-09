// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CashPaymentRequest _$$_CashPaymentRequestFromJson(
        Map<String, dynamic> json) =>
    _$_CashPaymentRequest(
      paymentId: json['PaymentId'] as int,
      approverId: json['ApproverId'] as int,
      transactionId: json['TransactionId'] as int,
      paymentModeId: json['PaymentModeId'] as int,
      amount: (json['Amount'] as num).toDouble(),
      cashDrawerId: json['CashDrawerId'] as int,
      parentPaymentId: json['ParentPaymentId'] as int,
      tenderedAmount: json['TenderedAmount'],
      reference: json['Reference'],
      tipAmount: (json['TipAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$$_CashPaymentRequestToJson(
        _$_CashPaymentRequest instance) =>
    <String, dynamic>{
      'PaymentId': instance.paymentId,
      'ApproverId': instance.approverId,
      'TransactionId': instance.transactionId,
      'PaymentModeId': instance.paymentModeId,
      'Amount': instance.amount,
      'CashDrawerId': instance.cashDrawerId,
      'ParentPaymentId': instance.parentPaymentId,
      'TenderedAmount': instance.tenderedAmount,
      'Reference': instance.reference,
      'TipAmount': instance.tipAmount,
    };
