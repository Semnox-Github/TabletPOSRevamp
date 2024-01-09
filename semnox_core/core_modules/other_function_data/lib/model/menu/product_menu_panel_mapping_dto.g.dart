// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_menu_panel_mapping_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductMenuPanelMappingDto _$$_ProductMenuPanelMappingDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ProductMenuPanelMappingDto(
      id: json['Id'] as int?,
      panelId: json['PanelId'] as int?,
      menuId: json['MenuId'] as int?,
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

Map<String, dynamic> _$$_ProductMenuPanelMappingDtoToJson(
        _$_ProductMenuPanelMappingDto instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'PanelId': instance.panelId,
      'MenuId': instance.menuId,
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
