import 'package:product_menu_data/models/product_price_container/product_price_data.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:product_menu_data/models/products_container/upsell_offer_dto.dart';

class UpsellProductModel{
  ProductContainerDTO productContainerDTO;
  UpsellOffersContainerDTO upsellOffersContainerDTO;
  bool isSelected = false;
  bool isDisabled = false;

  UpsellProductModel(this.productContainerDTO, this.upsellOffersContainerDTO, [this.isSelected = false]);
}