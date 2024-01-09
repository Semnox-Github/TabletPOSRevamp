// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_operation_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TableOperationDetails _$$_TableOperationDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_TableOperationDetails(
      reason: json['Reason'] as String,
      additionalComments: json['AdditionalComments'] as String,
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TableOperationDetailsToJson(
        _$_TableOperationDetails instance) =>
    <String, dynamic>{
      'Reason': instance.reason,
      'AdditionalComments': instance.additionalComments,
      'ApprovalDTO': instance.approvalDTO,
    };
