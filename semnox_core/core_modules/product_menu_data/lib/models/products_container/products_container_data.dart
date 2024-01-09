// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';

part 'products_container_data.freezed.dart';
part 'products_container_data.g.dart';


@freezed
class ProductsContainerData with _$ProductsContainerData {
  const factory ProductsContainerData({
    @JsonKey(name: 'ProductContainerDTOList')
    required List<ProductContainerDTO> productContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _ProductsContainerData;

  factory ProductsContainerData.fromJson(Map<String, dynamic> json) => _$ProductsContainerDataFromJson(json);
}
