// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderRequest _$$_OrderRequestFromJson(Map<String, dynamic> json) =>
    _$_OrderRequest(
      tableId: json['TableId'] as int,
      tableOperationDetails: TableOperationDetails.fromJson(
          json['TableOperationDetails'] as Map<String, dynamic>),
      approvalDTO:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OrderRequestToJson(_$_OrderRequest instance) =>
    <String, dynamic>{
      'TableId': instance.tableId,
      'TableOperationDetails': instance.tableOperationDetails,
      'ApprovalDTO': instance.approvalDTO,
    };
