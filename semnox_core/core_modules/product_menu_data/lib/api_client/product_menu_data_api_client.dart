import 'package:dio/dio.dart';
import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/product_price_container/product_price_container_response.dart';
import 'package:product_menu_data/models/products_container/products_container_response.dart';

import 'package:retrofit/retrofit.dart';

part 'product_menu_data_api_client.g.dart';

@RestApi()
abstract class ProductMenuDataApiClient {

  factory ProductMenuDataApiClient(Dio dio, {String baseUrl}) = _ProductMenuDataApiClient;

  static const _menuContainerEndPoint = "api/Product/MenuContainer";
  static const _productPriceEndPoint = "api/Product/ProductPrice";
  static const _productsContainerEndPoint = "api/Product/ProductsContainer";


  @GET(_menuContainerEndPoint)
  Future<ProductMenuResponse> getProductMenu(@Queries() Map<String, dynamic> queries);

  @GET(_productPriceEndPoint)
  Future<ProductPriceContainerResponse> getProductPriceContainer(@Queries() Map<String, dynamic> queries);

  @GET(_productsContainerEndPoint)
  Future<ProductsContainerResponse> getProductsContainer(@Queries() Map<String, dynamic> queries);
}
