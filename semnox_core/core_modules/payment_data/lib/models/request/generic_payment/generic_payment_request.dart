// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_payment_request.freezed.dart';
part 'generic_payment_request.g.dart';

@freezed
class GenericPaymentRequest with _$GenericPaymentRequest {
  const factory GenericPaymentRequest({
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
    @JsonKey(name: 'CashDrawerId')
    required int cashDrawerId,
    @JsonKey(name: 'ParentPaymentId')
    required int parentPaymentId,
    @JsonKey(name: 'TenderedAmount')
    dynamic tenderedAmount,
    @JsonKey(name: 'Reference')
    dynamic reference,
    @JsonKey(name: 'TipAmount')
    required double tipAmount,
  }) = _GenericPaymentRequest;


  factory GenericPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$GenericPaymentRequestFromJson(json);
}