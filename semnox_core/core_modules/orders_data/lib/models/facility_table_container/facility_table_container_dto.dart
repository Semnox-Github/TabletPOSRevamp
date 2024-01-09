// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_dto.dart';
part 'facility_table_container_dto.freezed.dart';
part 'facility_table_container_dto.g.dart';

@freezed
class FacilityTableContainerDTO with _$FacilityTableContainerDTO{
  const factory FacilityTableContainerDTO({
    @JsonKey(name: 'TableId')
    required int tableId,
    @JsonKey(name: 'TableName')
    required String tableName,
    @JsonKey(name: 'RowIndex')
    required int rowIndex,
    @JsonKey(name: 'ColumnIndex')
    required int columnIndex,
    @JsonKey(name: 'FacilityId')
    required int facilityId,
    @JsonKey(name: 'TableType')
    required String tableType,
    @JsonKey(name: 'InterfaceInfo1')
    required String interfaceInfo1,
    @JsonKey(name: 'InterfaceInfo2')
    required String interfaceInfo2,
    @JsonKey(name: 'InterfaceInfo3')
    required String interfaceInfo3,
    @JsonKey(name: 'Remarks')
    required String remarks,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'MaxCheckIns')
    required int maxCheckIns,
    @JsonKey(name: 'UserId')
    required int userId,
    @JsonKey(name: 'TableStatus')
    String? tableStatus,
    @JsonKey(name: 'TrxId')
    required int trxId,
    @JsonKey(name: 'OrderId')
    required int urderId,
    @JsonKey(name: 'CustomerName')
    String? customerName,
    @JsonKey(name: 'ImageFileName')
    required String imageFileName,
    @JsonKey(name: 'PositionX')
    dynamic? positionX,
    @JsonKey(name: 'PositionY')
    dynamic? positionY,
    @JsonKey(name: 'AllowMultipleOrders')
    required bool allowMultipleOrders,
    FacilityTableCurrentStatusDTO? facilityTableCurrentStatusDTO
   }) = _FacilityTablesContainerDTO;

  factory FacilityTableContainerDTO.fromJson(Map<String, dynamic> json) => _$FacilityTableContainerDTOFromJson(json);
}