// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/product_price_container/product_price_data.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';

part 'product_menu_panel_content_container_dto.freezed.dart';
part 'product_menu_panel_content_container_dto.g.dart';

@freezed
class ProductMenuPanelContentContainerDTO with _$ProductMenuPanelContentContainerDTO {

  const factory ProductMenuPanelContentContainerDTO({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'PanelId')
    required int panelId,
    @JsonKey(name: 'DisplayOrder')
    required int displayOrder,
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'ChildPanelId')
    required int childPanelId,
    @JsonKey(name: 'Name')
    required String name,
    @JsonKey(name: 'RowIndex')
    required int rowIndex,
    @JsonKey(name: 'ColumnIndex')
    required int columnIndex,
    @JsonKey(name: 'ImageURL')
    required String imageURL,
    @JsonKey(name: 'ButtonType')
    required String buttonType,
    @JsonKey(name: 'BackColor')
    required String backColor,
    @JsonKey(name: 'TextColor')
    required String textColor,
    @JsonKey(name: 'Font')
    required String font,
    @JsonKey(name: 'IsDiscounted')
    required bool isDiscounted,
    ProductContainerDTO? productContainerDTO,
  }) = _ProductMenuPanelContentContainerDTO;

  factory ProductMenuPanelContentContainerDTO.fromJson(Map<String, Object?> json) =>
      _$ProductMenuPanelContentContainerDTOFromJson(json);
}