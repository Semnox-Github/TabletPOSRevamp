// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:product_menu_data/models/product_price_container/modifier_set_details_container_dto.dart';

part 'combo_product_container_dto.freezed.dart';
part 'combo_product_container_dto.g.dart';

@freezed
class ComboProductContainerDTO with _$ComboProductContainerDTO {
  const factory ComboProductContainerDTO({
    @JsonKey(name: 'ComboProductId')
    required int comboProductId,
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'ChildProductId')
    required int childProductId,
    @JsonKey(name: 'ChildProductName')
    required String childProductName,
    @JsonKey(name: 'CategoryName')
    required String categoryName,
    @JsonKey(name: 'ChildProductType')
    required String childProductType,
    @JsonKey(name: 'ChildProductAutoGenerateCardNumber')
    required String childProductAutoGenerateCardNumber,
    @JsonKey(name: 'Quantity')
    required double quantity,
    @JsonKey(name: 'CategoryId')
    required int categoryId,
    @JsonKey(name: 'DisplayGroupId')
    required int displayGroupId,
    @JsonKey(name: 'DisplayGroup')
    required String displayGroup,
    @JsonKey(name: 'PriceInclusive')
    required bool priceInclusive,
    @JsonKey(name: 'AdditionalProduct')
    required bool additionalProduct,
    @JsonKey(name: 'SortOrder')
    dynamic sortOrder,
    @JsonKey(name: 'Price')
    double? price,
    @JsonKey(name: 'MaximumQuantity')
    dynamic maximumQuantity,
  }) = _ComboProductContainerDTO;

  factory ComboProductContainerDTO.fromJson(Map<String, dynamic> json) => _$ComboProductContainerDTOFromJson(json);
}
