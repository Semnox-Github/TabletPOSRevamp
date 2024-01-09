// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_transaction_profile_id_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SetTransactionProfileIdRequest _$$_SetTransactionProfileIdRequestFromJson(
        Map<String, dynamic> json) =>
    _$_SetTransactionProfileIdRequest(
      transactionProfileId: json['TransactionProfileId'] as int,
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SetTransactionProfileIdRequestToJson(
        _$_SetTransactionProfileIdRequest instance) =>
    <String, dynamic>{
      'TransactionProfileId': instance.transactionProfileId,
      'ApprovalDTO': instance.approvalDTO,
    };
