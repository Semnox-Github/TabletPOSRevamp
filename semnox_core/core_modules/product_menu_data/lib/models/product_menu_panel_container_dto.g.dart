// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_menu_panel_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductMenuPanelContainerDTO _$$_ProductMenuPanelContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ProductMenuPanelContainerDTO(
      panelId: json['PanelId'] as int,
      isMainPanel: json['IsMainPanel'] as bool,
      displayOrder: json['DisplayOrder'] as int,
      name: json['Name'] as String,
      cellMarginLeft: (json['CellMarginLeft'] as num).toDouble(),
      cellMarginRight: (json['CellMarginRight'] as num).toDouble(),
      cellMarginTop: (json['CellMarginTop'] as num).toDouble(),
      cellMarginBottom: (json['CellMarginBottom'] as num).toDouble(),
      rowCount: json['RowCount'] as int,
      columnCount: json['ColumnCount'] as int,
      imageURL: json['ImageURL'] as String,
      backColor: json['BackColor'] as String?,
      textColor: json['TextColor'] as String?,
      font: json['Font'] as String?,
      guid: json['Guid'] as String,
      productMenuPanelContainerDTOList:
          (json['ProductMenuPanelContentContainerDTOList'] as List<dynamic>)
              .map((e) => ProductMenuPanelContentContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      referencedProductIdList:
          (json['ReferencedProductIdList'] as List<dynamic>)
              .map((e) => e as int)
              .toList(),
      isProductsRemovedDueToWaiverSetup:
          json['IsProductsRemovedDueToWaiverSetup'] as bool,
      productsRemovedDueToWaiverSetupList:
          (json['ProductsRemovedDueToWaiverSetupList'] as List<dynamic>)
              .map((e) => e as int)
              .toList(),
    );

Map<String, dynamic> _$$_ProductMenuPanelContainerDTOToJson(
        _$_ProductMenuPanelContainerDTO instance) =>
    <String, dynamic>{
      'PanelId': instance.panelId,
      'IsMainPanel': instance.isMainPanel,
      'DisplayOrder': instance.displayOrder,
      'Name': instance.name,
      'CellMarginLeft': instance.cellMarginLeft,
      'CellMarginRight': instance.cellMarginRight,
      'CellMarginTop': instance.cellMarginTop,
      'CellMarginBottom': instance.cellMarginBottom,
      'RowCount': instance.rowCount,
      'ColumnCount': instance.columnCount,
      'ImageURL': instance.imageURL,
      'BackColor': instance.backColor,
      'TextColor': instance.textColor,
      'Font': instance.font,
      'Guid': instance.guid,
      'ProductMenuPanelContentContainerDTOList':
          instance.productMenuPanelContainerDTOList,
      'ReferencedProductIdList': instance.referencedProductIdList,
      'IsProductsRemovedDueToWaiverSetup':
          instance.isProductsRemovedDueToWaiverSetup,
      'ProductsRemovedDueToWaiverSetupList':
          instance.productsRemovedDueToWaiverSetupList,
    };
