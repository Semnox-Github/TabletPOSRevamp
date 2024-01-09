// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_payment_request.freezed.dart';
part 'card_payment_request.g.dart';

@freezed
class CardPaymentRequest with _$CardPaymentRequest {
  const factory CardPaymentRequest({
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
    @JsonKey(name: 'CreditCardNumber')
    dynamic creditCardNumber,
    @JsonKey(name: 'NameOnCreditCard')
    dynamic nameOnCreditCard,
    @JsonKey(name: 'CreditCardName')
    dynamic creditCardName,
    @JsonKey(name: 'CreditCardExpiry')
    dynamic creditCardExpiry,
    @JsonKey(name: 'CreditCardAuthorization')
    dynamic creditCardAuthorization,
    @JsonKey(name: 'CardId')
    required int cardId,
    @JsonKey(name: 'CCResponseId')
    required int ccResponseId,
    @JsonKey(name: 'CashDrawerId')
    required int cashDrawerId,
    @JsonKey(name: 'PaymentStatusId')
    required int paymentStatusId,
    @JsonKey(name: 'PaymentStatus')
    required String paymentStatus,
    @JsonKey(name: 'IsKeyedMode')
    required bool isKeyedMode,
    @JsonKey(name: 'Reference')
    dynamic reference,
    @JsonKey(name: 'TipAmount')
    required double tipAmount,
    @JsonKey(name: 'TenderedAmount')
    dynamic tenderedAmount,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    required bool isChangedRecursive,
    @JsonKey(name: 'Attribute1')
    String? attribute1,
    @JsonKey(name: 'Attribute2')
    String? attribute2,
    @JsonKey(name: 'Attribute3')
    String? attribute3,
    @JsonKey(name: 'Attribute4')
    String? attribute4,
  }) = _CardPaymentRequest;


  factory CardPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$CardPaymentRequestFromJson(json);
}