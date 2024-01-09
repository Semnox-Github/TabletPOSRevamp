// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_panels_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuPanelsDto _$$_MenuPanelsDtoFromJson(Map<String, dynamic> json) =>
    _$_MenuPanelsDto(
      cellMarginTop: json['CellMarginTop'] as int?,
      rowCount: json['RowCount'] as int?,
      panelId: json['PanelId'] as int?,
      columnCount: json['ColumnCount'] as int?,
      displayOrder: json['DisplayOrder'] as int?,
      cellMarginBottom: json['CellMarginBottom'] as int?,
      name: json['Name'] as String?,
      imageURL: json['ImageURL'] as String?,
      cellMarginLeft: json['CellMarginLeft'] as int?,
      cellMarginRight: json['CellMarginRight'] as int?,
      isActive: json['IsActive'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      siteId: json['SiteId'] as int?,
      masterEntityId: json['MasterEntityId'] as int?,
      synchStatus: json['SynchStatus'] as bool?,
      guid: json['Guid'] as String?,
      productMenuPanelContentDTOList: (json['ProductMenuPanelContentDTOList']
              as List<dynamic>?)
          ?.map((e) =>
              ProductMenuPanelContentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isChanged: json['IsChanged'] as bool?,
      isChangedRecursive: json['IsChangedRecursive'] as bool?,
    );

Map<String, dynamic> _$$_MenuPanelsDtoToJson(_$_MenuPanelsDto instance) =>
    <String, dynamic>{
      'CellMarginTop': instance.cellMarginTop,
      'RowCount': instance.rowCount,
      'PanelId': instance.panelId,
      'ColumnCount': instance.columnCount,
      'DisplayOrder': instance.displayOrder,
      'CellMarginBottom': instance.cellMarginBottom,
      'Name': instance.name,
      'ImageURL': instance.imageURL,
      'CellMarginLeft': instance.cellMarginLeft,
      'CellMarginRight': instance.cellMarginRight,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'ProductMenuPanelContentDTOList': instance.productMenuPanelContentDTOList,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
    };
