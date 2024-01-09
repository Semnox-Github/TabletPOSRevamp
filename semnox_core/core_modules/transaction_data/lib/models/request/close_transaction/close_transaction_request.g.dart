// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'close_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CloseTransactionRequest _$$_CloseTransactionRequestFromJson(
        Map<String, dynamic> json) =>
    _$_CloseTransactionRequest(
      transactionId: json['TransactionId'] as int,
      reason: json['Reason'] as String,
      remarks: json['Remarks'] as String,
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CloseTransactionRequestToJson(
        _$_CloseTransactionRequest instance) =>
    <String, dynamic>{
      'TransactionId': instance.transactionId,
      'Reason': instance.reason,
      'Remarks': instance.remarks,
      'ApprovalDTO': instance.approvalDTO,
    };
