// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_menu_panel_content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductMenuPanelContentDto _$$_ProductMenuPanelContentDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ProductMenuPanelContentDto(
      id: json['Id'] as int?,
      panelId: json['PanelId'] as int?,
      objectType: json['ObjectType'] as String?,
      objectGuid: json['ObjectGuid'] as String?,
      rowIndex: json['RowIndex'] as int?,
      columnIndex: json['ColumnIndex'] as int?,
      imageURL: json['ImageURL'] as String?,
      buttonType: json['ButtonType'] as String?,
      backColor: json['BackColor'] as String?,
      textColor: json['TextColor'] as String?,
      font: json['Font'] as String?,
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
      isMerged: json['IsMerged'] ?? false,
    );

Map<String, dynamic> _$$_ProductMenuPanelContentDtoToJson(
        _$_ProductMenuPanelContentDto instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'PanelId': instance.panelId,
      'ObjectType': instance.objectType,
      'ObjectGuid': instance.objectGuid,
      'RowIndex': instance.rowIndex,
      'ColumnIndex': instance.columnIndex,
      'ImageURL': instance.imageURL,
      'ButtonType': instance.buttonType,
      'BackColor': instance.backColor,
      'TextColor': instance.textColor,
      'Font': instance.font,
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
      'IsMerged': instance.isMerged,
    };
