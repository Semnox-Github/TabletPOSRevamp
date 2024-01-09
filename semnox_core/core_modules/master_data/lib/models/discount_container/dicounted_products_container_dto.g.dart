// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dicounted_products_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiscountedProductsContainerDto _$$_DiscountedProductsContainerDtoFromJson(
        Map<String, dynamic> json) =>
    _$_DiscountedProductsContainerDto(
      criteriaId: json['Id'] as int?,
      discountId: json['DiscountId'] as int?,
      productId: json['ProductId'] as int?,
      categoryId: json['CategoryId'] as int?,
      quantity: json['Quantity'] as int?,
      discountPercentage: json['DiscountPercentage'],
      discountAmount: json['DiscountAmount'],
      discountedPrice: json['DiscountedPrice'],
      discounted: json['Discounted'] as String?,
    );

Map<String, dynamic> _$$_DiscountedProductsContainerDtoToJson(
        _$_DiscountedProductsContainerDto instance) =>
    <String, dynamic>{
      'Id': instance.criteriaId,
      'DiscountId': instance.discountId,
      'ProductId': instance.productId,
      'CategoryId': instance.categoryId,
      'Quantity': instance.quantity,
      'DiscountPercentage': instance.discountPercentage,
      'DiscountAmount': instance.discountAmount,
      'DiscountedPrice': instance.discountedPrice,
      'Discounted': instance.discounted,
    };
