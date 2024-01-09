
import 'package:freezed_annotation/freezed_annotation.dart';

part 'discount_purchase_criteria_dto.freezed.dart';
part 'discount_purchase_criteria_dto.g.dart';

@freezed
class DiscountPurchaseCriteriaDto with _$DiscountPurchaseCriteriaDto {
  const factory DiscountPurchaseCriteriaDto({
    @JsonKey(name: 'CriteriaId')
    int? criteriaId,
    @JsonKey(name: 'DiscountId')
    int? discountId,
    @JsonKey(name: 'ProductId')
    int? productId,
    @JsonKey(name: 'CategoryId')
    int? categoryId,
    @JsonKey(name: 'MinQuantity')
    int? minQuantity
  }) = _DiscountPurchaseCriteriaDto;

  factory DiscountPurchaseCriteriaDto.fromJson(Map<String, dynamic> json) => _$DiscountPurchaseCriteriaDtoFromJson(json);
}