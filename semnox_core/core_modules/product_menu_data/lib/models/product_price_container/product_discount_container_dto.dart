// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';



part 'product_discount_container_dto.freezed.dart';
part 'product_discount_container_dto.g.dart';

@freezed
class ProductDiscountContainerDTO with _$ProductDiscountContainerDTO {
  const factory ProductDiscountContainerDTO({
    @JsonKey(name: 'ProductDiscountId')
    required int productDiscountId,
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'DiscountId')
    required int discountId,
    @JsonKey(name: 'ValidFor')
    dynamic validFor,
    @JsonKey(name: 'ValidForDaysMonths')
    required String validForDaysMonths,
    @JsonKey(name: 'ExpiryDate')
    dynamic expiryDate,
  }) = _ProductDiscountContainerDTO;

  factory ProductDiscountContainerDTO.fromJson(Map<String, dynamic> json) => _$ProductDiscountContainerDTOFromJson(json);
}
