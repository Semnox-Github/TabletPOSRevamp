// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionProfileRequest _$$_TransactionProfileRequestFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionProfileRequest(
      transactionLineIdList: (json['TransactionLineIdList'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      remarks: json['remarks'] as String,
      profileId: json['ProfileId'] as int,
      name: json['Name'] as String,
      identification: json['Identification'] as String,
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TransactionProfileRequestToJson(
        _$_TransactionProfileRequest instance) =>
    <String, dynamic>{
      'TransactionLineIdList': instance.transactionLineIdList,
      'remarks': instance.remarks,
      'ProfileId': instance.profileId,
      'Name': instance.name,
      'Identification': instance.identification,
      'ApprovalDTO': instance.approvalDTO,
    };
