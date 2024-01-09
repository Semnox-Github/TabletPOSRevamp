import 'package:product_menu_data/models/product_menu_panel_container_dto.dart';
import 'package:product_menu_data/models/product_menu_panel_content_container_dto.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';

abstract class GridItem {
  int id;
  String title;
  dynamic dataObject;
  double cellMarginLeft;
  double cellMarginRight;
  double cellMarginTop;
  double cellMarginBottom;

  GridItem(this.id, this.title, this.dataObject,
      {this.cellMarginLeft = 2, this.cellMarginRight = 2, this.cellMarginTop = 2, this.cellMarginBottom = 2});
}

class PanelItem extends GridItem {
  PanelItem(super.id, super.title, super.dataObject);
}

class ProductItem extends GridItem {
  ProductItem(super.id, super.title, super.dataObject,
      {super.cellMarginLeft = 2, super.cellMarginRight = 2, super.cellMarginTop = 2, super.cellMarginBottom = 2});
}

PanelItem toPanelItem(ProductMenuPanelContainerDTO dto) {
  return PanelItem(dto.panelId, dto.name, dto);
}

List<PanelItem> toPanelItems(List<ProductMenuPanelContainerDTO> list) {
  print("-------- toPanelItems ${list.length}");
  List<PanelItem> panelItems = [];
  List<ProductMenuPanelContainerDTO> mainlist =[];
  mainlist = list.where((e) => e.isMainPanel == true).toList();
  panelItems = mainlist.map((e) => PanelItem(e.panelId, e.name, e)).toList();
  print("-------- toPanelItems panelItems ${panelItems.length}");
  print("-------- toPanelItems panelItems ${panelItems}");
  return panelItems;
}

ProductItem toProductItem(ProductMenuPanelContentContainerDTO dto) {
  return ProductItem(dto.productId, dto.name, dto);
}

ProductItem productContainerDTOToProductItem(ProductContainerDTO dto) {
  return ProductItem(dto.productId, dto.productName, dto);
}

List<ProductItem> toProductItems(List<ProductMenuPanelContentContainerDTO> list) {
  print("-------- toProductItems ${list.length}");
  List<ProductItem> productItems = [];
  productItems = list.map((e) => ProductItem(e.productId, e.name, e)).toList();
  print("-------- toProductItems productItems ${productItems.length}");
  return productItems;
}
