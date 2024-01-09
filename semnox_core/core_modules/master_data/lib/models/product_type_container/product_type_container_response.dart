import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/product_type_container/product_type_container_data.dart';

part 'product_type_container_response.freezed.dart';
part 'product_type_container_response.g.dart';

@freezed
class ProductTypeContainerResponse with _$ProductTypeContainerResponse{
  const factory ProductTypeContainerResponse({
    ProductContainerData? data,
    String? exception
  }) = _ProductTypeContainerResponse;

  factory ProductTypeContainerResponse.fromJson(Map<String, dynamic> json) => _$ProductTypeContainerResponseFromJson(json);
}