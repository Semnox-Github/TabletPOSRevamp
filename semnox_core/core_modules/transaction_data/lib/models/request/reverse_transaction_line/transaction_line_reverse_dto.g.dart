// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_line_reverse_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionLineReverseDto _$$_TransactionLineReverseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionLineReverseDto(
      transactionLineId: json['TransactionLineId'] as int,
      reasonId: json['ReasonId'] as int,
      remarks: json['Remarks'] as String,
      reverseObligations: json['ReverseObligations'] as bool,
      forceReverseUsedObligations: json['ForceReverseUsedObligations'] as bool,
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TransactionLineReverseDtoToJson(
        _$_TransactionLineReverseDto instance) =>
    <String, dynamic>{
      'TransactionLineId': instance.transactionLineId,
      'ReasonId': instance.reasonId,
      'Remarks': instance.remarks,
      'ReverseObligations': instance.reverseObligations,
      'ForceReverseUsedObligations': instance.forceReverseUsedObligations,
      'ApprovalDTO': instance.approvalDTO,
    };
