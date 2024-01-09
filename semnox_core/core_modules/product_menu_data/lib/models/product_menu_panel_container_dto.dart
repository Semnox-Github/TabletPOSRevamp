// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/product_menu_panel_content_container_dto.dart';

part 'product_menu_panel_container_dto.freezed.dart';
part 'product_menu_panel_container_dto.g.dart';

@freezed
class ProductMenuPanelContainerDTO with _$ProductMenuPanelContainerDTO {

  const factory ProductMenuPanelContainerDTO({
    @JsonKey(name: 'PanelId')
    required int panelId,
    @JsonKey(name: 'IsMainPanel')
    required bool isMainPanel,
    @JsonKey(name: 'DisplayOrder')
    required int displayOrder,
    @JsonKey(name: 'Name')
    required String name,
    @JsonKey(name: 'CellMarginLeft')
    required double cellMarginLeft,
    @JsonKey(name: 'CellMarginRight')
    required double cellMarginRight,
    @JsonKey(name: 'CellMarginTop')
    required double cellMarginTop,
    @JsonKey(name: 'CellMarginBottom')
    required double cellMarginBottom,
    @JsonKey(name: 'RowCount')
    required int rowCount,
    @JsonKey(name: 'ColumnCount')
    required int columnCount,
    @JsonKey(name: 'ImageURL')
    required String imageURL,
    @JsonKey(name: 'BackColor')
    String? backColor,
    @JsonKey(name: 'TextColor')
    String? textColor,
    @JsonKey(name: 'Font')
    String? font,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'ProductMenuPanelContentContainerDTOList')
    required List<ProductMenuPanelContentContainerDTO> productMenuPanelContainerDTOList,
    @JsonKey(name: 'ReferencedProductIdList')
    required List<int> referencedProductIdList,
    @JsonKey(name: 'IsProductsRemovedDueToWaiverSetup')
    required bool isProductsRemovedDueToWaiverSetup,
    @JsonKey(name: 'ProductsRemovedDueToWaiverSetupList')
    required List<int> productsRemovedDueToWaiverSetupList,
  }) = _ProductMenuPanelContainerDTO;

  factory ProductMenuPanelContainerDTO.fromJson(Map<String, Object?> json) =>
      _$ProductMenuPanelContainerDTOFromJson(json);
}