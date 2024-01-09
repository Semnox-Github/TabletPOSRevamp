// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_remark_line_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionRemarkLineRequest _$$_TransactionRemarkLineRequestFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionRemarkLineRequest(
      transactionLineId: json['TransactionLineId'] as int,
      lineRemarks: json['LineRemarks'] as String?,
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TransactionRemarkLineRequestToJson(
        _$_TransactionRemarkLineRequest instance) =>
    <String, dynamic>{
      'TransactionLineId': instance.transactionLineId,
      'LineRemarks': instance.lineRemarks,
      'ApprovalDTO': instance.approvalDTO,
    };
