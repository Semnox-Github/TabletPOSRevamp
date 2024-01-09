import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/products_container/products_container_data.dart';

part 'products_container_response.freezed.dart';
part 'products_container_response.g.dart';

@freezed
class ProductsContainerResponse with _$ProductsContainerResponse {
  const factory ProductsContainerResponse({
    ProductsContainerData? data,
    String? exception
  }) = _ProductsContainerResponse;

  factory ProductsContainerResponse.fromJson(Map<String, dynamic> json) => _$ProductsContainerResponseFromJson(json);
}
