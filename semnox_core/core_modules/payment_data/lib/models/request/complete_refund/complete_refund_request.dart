// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'complete_refund_request.freezed.dart';
part 'complete_refund_request.g.dart';

@freezed
class CompleteRefundRequest with _$CompleteRefundRequest {
  const factory CompleteRefundRequest({
    @JsonKey(name: 'ResponseID')
    required int responseId,
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'InvoiceNo')
    required String invoiceNo,
    @JsonKey(name: 'TokenID')
    required String tokenId,
    @JsonKey(name: 'RecordNo')
    required String recordNo,
    @JsonKey(name: 'DSIXReturnCode')
    required String dsixReturnCode,
    @JsonKey(name: 'StatusID')
    required int statusId,
    @JsonKey(name: 'TextResponse')
    required String textResponse,
    @JsonKey(name: 'AcctNo')
    required String acctNo,
    @JsonKey(name: 'CardType')
    required String cardType,
    @JsonKey(name: 'TranCode')
    required String tranCode,
    @JsonKey(name: 'RefNo')
    required String refNo,
    @JsonKey(name: 'Purchase')
    required String purchase,
    @JsonKey(name: 'Authorize')
    required String authorize,
    @JsonKey(name: 'TransactionDatetime')
    String? transactionDatetime,
    @JsonKey(name: 'AuthCode')
    required String authCode,
    @JsonKey(name: 'ProcessData')
    required String processData,
    @JsonKey(name: 'ResponseOrigin')
    required String responseOrigin,
    @JsonKey(name: 'UserTraceData')
    required String userTraceData,
    @JsonKey(name: 'CaptureStatus')
    required String captureStatus,
    @JsonKey(name: 'AcqRefData')
    required String acqRefData,
    @JsonKey(name: 'TransactionPaymentGuid')
    required String transactionPaymentGuid,
    @JsonKey(name: 'CreditCardName')
    required String creditCardName,
    @JsonKey(name: 'NameOnCreditCard')
    required String nameOnCreditCard,
    @JsonKey(name: 'CreditCardExpiry')
    required String creditCardExpiry,
    @JsonKey(name: 'Amount')
    required double amount,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'Guid')
    dynamic guid,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'TipAmount')
    required String tipAmount,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'CreatedBy')
    dynamic createdBy,
    @JsonKey(name: 'CreationDate')
    dynamic creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    dynamic lastUpdatedBy,
    @JsonKey(name: 'LastUpdateDate')
    dynamic lastUpdateDate,
    @JsonKey(name: 'CustomerCopy')
    dynamic customerCopy,
    @JsonKey(name: 'MerchantCopy')
    dynamic merchantCopy,
    @JsonKey(name: 'CustomerCardProfileId')
    dynamic customerCardProfileId,
    @JsonKey(name: 'Status')
    required String status,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
  }) = _CompleteRefundRequest;


  factory CompleteRefundRequest.fromJson(Map<String, dynamic> json) =>
      _$CompleteRefundRequestFromJson(json);
}