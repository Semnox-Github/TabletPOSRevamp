import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:product_menu_data/models/product_price_container/product_price_data.dart';

part 'product_price_container_response.freezed.dart';
part 'product_price_container_response.g.dart';

@freezed
class ProductPriceContainerResponse with _$ProductPriceContainerResponse {
  const factory ProductPriceContainerResponse({
    List<ProductPriceContainerData>? data,
    String? exception
  }) = _ProductPriceContainerResponse;

  factory ProductPriceContainerResponse.fromJson(Map<String, dynamic> json) => _$ProductPriceContainerResponseFromJson(json);
}
