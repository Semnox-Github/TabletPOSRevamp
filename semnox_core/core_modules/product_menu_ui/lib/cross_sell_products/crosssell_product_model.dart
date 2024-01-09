import 'package:product_menu_data/models/product_price_container/product_price_data.dart';
import 'package:product_menu_data/models/products_container/cross_sell_product_dto.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';

class CrossSellProductModel{
  ProductContainerDTO productContainerDTO;
  CrossSellProductsContainerDTO crossSellProductsContainerDTO;
  bool isSelected = false;

  CrossSellProductModel(this.productContainerDTO, this.crossSellProductsContainerDTO, [this.isSelected = false]);
}