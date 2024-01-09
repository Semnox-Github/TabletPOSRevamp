// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_transaction_lines_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderTransactionLinesRequest _$$_OrderTransactionLinesRequestFromJson(
        Map<String, dynamic> json) =>
    _$_OrderTransactionLinesRequest(
      transactionLineId: json['TransactionLineId'] as int,
      transactionAccountDtoList:
          (json['TransactionAccountDTOList'] as List<dynamic>)
              .map((e) =>
                  TransactionLineAccountDto.fromJson(e as Map<String, dynamic>))
              .toList(),
      approvalDto:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OrderTransactionLinesRequestToJson(
        _$_OrderTransactionLinesRequest instance) =>
    <String, dynamic>{
      'TransactionLineId': instance.transactionLineId,
      'TransactionAccountDTOList': instance.transactionAccountDtoList,
      'ApprovalDTO': instance.approvalDto,
    };
