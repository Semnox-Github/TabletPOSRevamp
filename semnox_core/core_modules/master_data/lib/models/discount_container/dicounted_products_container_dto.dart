
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dicounted_products_container_dto.freezed.dart';
part 'dicounted_products_container_dto.g.dart';

@freezed
class DiscountedProductsContainerDto with _$DiscountedProductsContainerDto {
  const factory DiscountedProductsContainerDto({
    @JsonKey(name: 'Id')
     int? criteriaId,
    @JsonKey(name: 'DiscountId')
     int? discountId,
    @JsonKey(name: 'ProductId')
     int? productId,
    @JsonKey(name: 'CategoryId')
     int? categoryId,
    @JsonKey(name: 'Quantity')
     int? quantity,
    @JsonKey(name: 'DiscountPercentage')
     dynamic discountPercentage,
    @JsonKey(name: 'DiscountAmount')
     dynamic discountAmount,
    @JsonKey(name: 'DiscountedPrice')
     dynamic discountedPrice,
    @JsonKey(name: 'Discounted')
     String? discounted
  }) = _DiscountedProductsContainerDto;

  factory DiscountedProductsContainerDto.fromJson(Map<String, dynamic> json) => _$DiscountedProductsContainerDtoFromJson(json);
}