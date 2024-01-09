// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_table_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FacilityTablesContainerDTO _$$_FacilityTablesContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_FacilityTablesContainerDTO(
      tableId: json['TableId'] as int,
      tableName: json['TableName'] as String,
      rowIndex: json['RowIndex'] as int,
      columnIndex: json['ColumnIndex'] as int,
      facilityId: json['FacilityId'] as int,
      tableType: json['TableType'] as String,
      interfaceInfo1: json['InterfaceInfo1'] as String,
      interfaceInfo2: json['InterfaceInfo2'] as String,
      interfaceInfo3: json['InterfaceInfo3'] as String,
      remarks: json['Remarks'] as String,
      guid: json['Guid'] as String,
      maxCheckIns: json['MaxCheckIns'] as int,
      userId: json['UserId'] as int,
      tableStatus: json['TableStatus'] as String?,
      trxId: json['TrxId'] as int,
      urderId: json['OrderId'] as int,
      customerName: json['CustomerName'] as String?,
      imageFileName: json['ImageFileName'] as String,
      positionX: json['PositionX'],
      positionY: json['PositionY'],
      allowMultipleOrders: json['AllowMultipleOrders'] as bool,
      facilityTableCurrentStatusDTO: json['facilityTableCurrentStatusDTO'] ==
              null
          ? null
          : FacilityTableCurrentStatusDTO.fromJson(
              json['facilityTableCurrentStatusDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_FacilityTablesContainerDTOToJson(
        _$_FacilityTablesContainerDTO instance) =>
    <String, dynamic>{
      'TableId': instance.tableId,
      'TableName': instance.tableName,
      'RowIndex': instance.rowIndex,
      'ColumnIndex': instance.columnIndex,
      'FacilityId': instance.facilityId,
      'TableType': instance.tableType,
      'InterfaceInfo1': instance.interfaceInfo1,
      'InterfaceInfo2': instance.interfaceInfo2,
      'InterfaceInfo3': instance.interfaceInfo3,
      'Remarks': instance.remarks,
      'Guid': instance.guid,
      'MaxCheckIns': instance.maxCheckIns,
      'UserId': instance.userId,
      'TableStatus': instance.tableStatus,
      'TrxId': instance.trxId,
      'OrderId': instance.urderId,
      'CustomerName': instance.customerName,
      'ImageFileName': instance.imageFileName,
      'PositionX': instance.positionX,
      'PositionY': instance.positionY,
      'AllowMultipleOrders': instance.allowMultipleOrders,
      'facilityTableCurrentStatusDTO': instance.facilityTableCurrentStatusDTO,
    };
