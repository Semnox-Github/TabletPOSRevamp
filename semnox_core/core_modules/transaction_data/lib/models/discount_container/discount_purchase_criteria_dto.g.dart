// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_purchase_criteria_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiscountPurchaseCriteriaDto _$$_DiscountPurchaseCriteriaDtoFromJson(
        Map<String, dynamic> json) =>
    _$_DiscountPurchaseCriteriaDto(
      criteriaId: json['CriteriaId'] as int?,
      discountId: json['DiscountId'] as int?,
      productId: json['ProductId'] as int?,
      categoryId: json['CategoryId'] as int?,
      minQuantity: json['MinQuantity'] as int?,
    );

Map<String, dynamic> _$$_DiscountPurchaseCriteriaDtoToJson(
        _$_DiscountPurchaseCriteriaDto instance) =>
    <String, dynamic>{
      'CriteriaId': instance.criteriaId,
      'DiscountId': instance.discountId,
      'ProductId': instance.productId,
      'CategoryId': instance.categoryId,
      'MinQuantity': instance.minQuantity,
    };
