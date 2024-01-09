// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_menu_panel_content_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductMenuPanelContentContainerDTO
    _$$_ProductMenuPanelContentContainerDTOFromJson(
            Map<String, dynamic> json) =>
        _$_ProductMenuPanelContentContainerDTO(
          id: json['Id'] as int,
          panelId: json['PanelId'] as int,
          displayOrder: json['DisplayOrder'] as int,
          productId: json['ProductId'] as int,
          childPanelId: json['ChildPanelId'] as int,
          name: json['Name'] as String,
          rowIndex: json['RowIndex'] as int,
          columnIndex: json['ColumnIndex'] as int,
          imageURL: json['ImageURL'] as String,
          buttonType: json['ButtonType'] as String,
          backColor: json['BackColor'] as String,
          textColor: json['TextColor'] as String,
          font: json['Font'] as String,
          isDiscounted: json['IsDiscounted'] as bool,
          productContainerDTO: json['productContainerDTO'] == null
              ? null
              : ProductContainerDTO.fromJson(
                  json['productContainerDTO'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$_ProductMenuPanelContentContainerDTOToJson(
        _$_ProductMenuPanelContentContainerDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'PanelId': instance.panelId,
      'DisplayOrder': instance.displayOrder,
      'ProductId': instance.productId,
      'ChildPanelId': instance.childPanelId,
      'Name': instance.name,
      'RowIndex': instance.rowIndex,
      'ColumnIndex': instance.columnIndex,
      'ImageURL': instance.imageURL,
      'ButtonType': instance.buttonType,
      'BackColor': instance.backColor,
      'TextColor': instance.textColor,
      'Font': instance.font,
      'IsDiscounted': instance.isDiscounted,
      'productContainerDTO': instance.productContainerDTO,
    };
