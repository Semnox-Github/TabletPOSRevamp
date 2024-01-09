// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_line_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RemoveLineRequest _$$_RemoveLineRequestFromJson(Map<String, dynamic> json) =>
    _$_RemoveLineRequest(
      transactionLineId: json['TransactionLineId'] as int,
      reasonId: json['ReasonId'] as int,
      reason: json['Reason'] as String,
      lineRemarks: json['LineRemarks'] as String,
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RemoveLineRequestToJson(
        _$_RemoveLineRequest instance) =>
    <String, dynamic>{
      'TransactionLineId': instance.transactionLineId,
      'ReasonId': instance.reasonId,
      'Reason': instance.reason,
      'LineRemarks': instance.lineRemarks,
      'ApprovalDTO': instance.approvalDTO,
    };
