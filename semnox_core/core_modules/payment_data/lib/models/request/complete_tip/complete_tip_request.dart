// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'complete_tip_request.freezed.dart';
part 'complete_tip_request.g.dart';

@freezed
class CompleteTipRequest with _$CompleteTipRequest {
  const factory CompleteTipRequest({
    @JsonKey(name: 'ResponseID')
    required int responseId,
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'InvoiceNo')
    dynamic invoiceNo,
    @JsonKey(name: 'TokenID')
    dynamic tokenId,
    @JsonKey(name: 'RecordNo')
    dynamic recordNo,
    @JsonKey(name: 'DSIXReturnCode')
    dynamic dsixReturnCode,
    @JsonKey(name: 'StatusID')
    required int statusId,
    @JsonKey(name: 'TextResponse')
    dynamic textResponse,
    @JsonKey(name: 'AcctNo')
    dynamic acctNo,
    @JsonKey(name: 'CardType')
    dynamic cardType,
    @JsonKey(name: 'TranCode')
    dynamic tranCode,
    @JsonKey(name: 'RefNo')
    dynamic refNo,
    @JsonKey(name: 'Purchase')
    dynamic purchase,
    @JsonKey(name: 'Authorize')
    dynamic authorize,
    @JsonKey(name: 'AuthCode')
    dynamic authCode,
    @JsonKey(name: 'ProcessData')
    dynamic processData,
    @JsonKey(name: 'ResponseOrigin')
    dynamic responseOrigin,
    @JsonKey(name: 'UserTraceData')
    dynamic userTraceData,
    @JsonKey(name: 'CaptureStatus')
    dynamic captureStatus,
    @JsonKey(name: 'AcqRefData')
    dynamic acqRefData,
    @JsonKey(name: 'TransactionPaymentGuid')
    dynamic transactionPaymentGuid,
    @JsonKey(name: 'CreditCardName')
    dynamic creditCardName,
    @JsonKey(name: 'NameOnCreditCard')
    dynamic nameOnCreditCard,
    @JsonKey(name: 'CreditCardExpiry')
    dynamic creditCardExpiry,
    @JsonKey(name: 'Amount')
    required double amount,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'Guid')
    dynamic guid,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'TipAmount')
    required String tipAmount,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'CustomerCopy')
    dynamic customerCopy,
    @JsonKey(name: 'MerchantCopy')
    dynamic merchantCopy,
    @JsonKey(name: 'CustomerCardProfileId')
    dynamic customerCardProfileId,
    @JsonKey(name: 'Status')
    String? status,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'TransactionDatetime')
    String? transactionDatetime,
  }) = _CompleteTipRequest;


  factory CompleteTipRequest.fromJson(Map<String, dynamic> json) =>
      _$CompleteTipRequestFromJson(json);
}