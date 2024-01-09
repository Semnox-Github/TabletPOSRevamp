// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_menu_pos_machine_map_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductMenuPosMachineMapDto _$$_ProductMenuPosMachineMapDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ProductMenuPosMachineMapDto(
      id: json['Id'] as int?,
      menuId: json['MenuId'] as int?,
      pOSMachineId: json['POSMachineId'] as int?,
      isActive: json['IsActive'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] as String?,
      siteId: json['SiteId'] as int?,
      masterEntityId: json['MasterEntityId'] as int?,
      synchStatus: json['SynchStatus'] as bool?,
      guid: json['Guid'] as String?,
      isChanged: json['IsChanged'] as bool?,
    );

Map<String, dynamic> _$$_ProductMenuPosMachineMapDtoToJson(
        _$_ProductMenuPosMachineMapDto instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'MenuId': instance.menuId,
      'POSMachineId': instance.pOSMachineId,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'IsChanged': instance.isChanged,
    };
