// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardPaymentRequest _$$_CardPaymentRequestFromJson(
        Map<String, dynamic> json) =>
    _$_CardPaymentRequest(
      paymentId: json['PaymentId'] as int,
      approverId: json['ApproverId'] as int,
      transactionId: json['TransactionId'] as int,
      paymentModeId: json['PaymentModeId'] as int,
      amount: (json['Amount'] as num).toDouble(),
      creditCardNumber: json['CreditCardNumber'],
      nameOnCreditCard: json['NameOnCreditCard'],
      creditCardName: json['CreditCardName'],
      creditCardExpiry: json['CreditCardExpiry'],
      creditCardAuthorization: json['CreditCardAuthorization'],
      cardId: json['CardId'] as int,
      ccResponseId: json['CCResponseId'] as int,
      cashDrawerId: json['CashDrawerId'] as int,
      paymentStatusId: json['PaymentStatusId'] as int,
      paymentStatus: json['PaymentStatus'] as String,
      isKeyedMode: json['IsKeyedMode'] as bool,
      reference: json['Reference'],
      tipAmount: (json['TipAmount'] as num).toDouble(),
      tenderedAmount: json['TenderedAmount'],
      isChanged: json['IsChanged'] as bool,
      isChangedRecursive: json['IsChangedRecursive'] as bool,
      attribute1: json['Attribute1'] as String?,
      attribute2: json['Attribute2'] as String?,
      attribute3: json['Attribute3'] as String?,
      attribute4: json['Attribute4'] as String?,
    );

Map<String, dynamic> _$$_CardPaymentRequestToJson(
        _$_CardPaymentRequest instance) =>
    <String, dynamic>{
      'PaymentId': instance.paymentId,
      'ApproverId': instance.approverId,
      'TransactionId': instance.transactionId,
      'PaymentModeId': instance.paymentModeId,
      'Amount': instance.amount,
      'CreditCardNumber': instance.creditCardNumber,
      'NameOnCreditCard': instance.nameOnCreditCard,
      'CreditCardName': instance.creditCardName,
      'CreditCardExpiry': instance.creditCardExpiry,
      'CreditCardAuthorization': instance.creditCardAuthorization,
      'CardId': instance.cardId,
      'CCResponseId': instance.ccResponseId,
      'CashDrawerId': instance.cashDrawerId,
      'PaymentStatusId': instance.paymentStatusId,
      'PaymentStatus': instance.paymentStatus,
      'IsKeyedMode': instance.isKeyedMode,
      'Reference': instance.reference,
      'TipAmount': instance.tipAmount,
      'TenderedAmount': instance.tenderedAmount,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
      'Attribute1': instance.attribute1,
      'Attribute2': instance.attribute2,
      'Attribute3': instance.attribute3,
      'Attribute4': instance.attribute4,
    };
