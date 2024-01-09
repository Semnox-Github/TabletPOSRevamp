// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/product_type_container/product_type_container_dto.dart';

part 'product_type_container_data.freezed.dart';
part 'product_type_container_data.g.dart';

@freezed
class ProductContainerData with _$ProductContainerData{
  const factory ProductContainerData({
    @JsonKey(name: 'ProductTypeContainerDTOList')
    List<ProductTypeContainerDto>? productTypeContainerDtoList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _ProductContainerData;

  factory ProductContainerData.fromJson(Map<String, dynamic> json) => _$ProductContainerDataFromJson(json);
}