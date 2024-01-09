import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_container_dto.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:product_menu_data/product_menu_service.dart';

abstract class ProductMenuDataBLContract {

  Future<void> sync();

  ProductMenuResponse? getProductMenu();

  Future<ProductContainerDTO?> getProductDetails(int productId);

  Future<ProductContainerDTO?> initializeProducts();

  Future<ProductContainerDTO?> getProductContainerDetails(int productId);

  Future<List<ProductContainerDTO>> getAllProductContainerDTOs();

  Future<List<ProductContainerDTO?>> getListOfProductContainerDetails(List<int> productIds);

  Future<Map<int, ProductContainerDTO>?> getMapOfProductContainerDetails();

  Future<Map<int, ModifierSetContainerDTO>?> getMapOfModifierSetContainerDetails();

  Future<Map<int, ProductContainerDTO>?> getMapOfRedeemProductContainerDetails();

  Future<ProductContainerDTO?> getProductContainerDetailsByBarcode(String inventoryCode);

  Future<Map<int,ProductContainerDTO>> getInstantMapOfProductContainerDetails();

  Future<void> clear();
}

class ProductMenuDataBLImpl implements ProductMenuDataBLContract {
  final ProductMenuDataService _productMenuDataService;


  ProductMenuDataBLImpl(this._productMenuDataService);

  @override
  Future<void> sync() async{
    await _productMenuDataService.syncProductMenu();
  }

  @override
  ProductMenuResponse? getProductMenu() {
    return _productMenuDataService.getProductMenu();
  }

  @override
  Future<ProductContainerDTO?> getProductDetails(int productId) async {
    ProductContainerDTO? productPriceContainerData = await _productMenuDataService.getProductDetails(productId);
    return productPriceContainerData;
  }

  @override
  Future<ProductContainerDTO?> initializeProducts() async {
    ProductContainerDTO? productPriceContainerData = await _productMenuDataService.getProductDetails(0);
    return productPriceContainerData;
  }

  @override
  Future<ProductContainerDTO?> getProductContainerDetails(int productId) {
    return _productMenuDataService.getProductContainerDetails(productId);
  }

  @override
  Future<List<ProductContainerDTO>> getAllProductContainerDTOs() {
    return _productMenuDataService.getAllProductContainerDTOs();
  }

  @override
  Future<List<ProductContainerDTO?>> getListOfProductContainerDetails(List<int> productIds) {
    return _productMenuDataService.getListOfProductContainerDetails(productIds);
  }

  @override
  Future<Map<int, ProductContainerDTO>> getMapOfProductContainerDetails(){
    return _productMenuDataService.getMapOfProductContainerDetails();
  }

  @override
  Future<Map<int, ProductContainerDTO>> getMapOfRedeemProductContainerDetails(){
    return _productMenuDataService.getMapOfRedeemProductContainerDetails();
  }

  @override
  Future<Map<int, ModifierSetContainerDTO>?> getMapOfModifierSetContainerDetails() {
    return _productMenuDataService.getMapOfModifierSetContainerDetails();
  }

  @override
  Future<void> clear() async {
    await _productMenuDataService.clear();
  }

  @override
  Future<ProductContainerDTO?> getProductContainerDetailsByBarcode(String inventoryCode) {
    return _productMenuDataService.getProductContainerDetailsByBarcode(inventoryCode);
  }

  @override
  Future<Map<int,ProductContainerDTO>> getInstantMapOfProductContainerDetails(){
    return _productMenuDataService.getInstantMapOfProductContainerDetails();
  }

}
