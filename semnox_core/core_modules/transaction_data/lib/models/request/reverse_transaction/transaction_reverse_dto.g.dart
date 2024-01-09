// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_reverse_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionReverseDto _$$_TransactionReverseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionReverseDto(
      transactionId: json['TransactionId'] as int,
      reasonId: json['ReasonId'] as int,
      remarks: json['Remarks'] as String,
      reverseObligations: json['ReverseObligations'] as bool,
      forceReverseUsedObligations: json['ForceReverseUsedObligations'] as bool,
      transactionLineIdList: (json['TransactionLineIdList'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TransactionReverseDtoToJson(
        _$_TransactionReverseDto instance) =>
    <String, dynamic>{
      'TransactionId': instance.transactionId,
      'ReasonId': instance.reasonId,
      'Remarks': instance.remarks,
      'ReverseObligations': instance.reverseObligations,
      'ForceReverseUsedObligations': instance.forceReverseUsedObligations,
      'TransactionLineIdList': instance.transactionLineIdList,
      'ApprovalDTO': instance.approvalDTO,
    };
