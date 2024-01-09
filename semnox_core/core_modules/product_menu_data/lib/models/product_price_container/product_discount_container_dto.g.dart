// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_discount_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDiscountContainerDTO _$$_ProductDiscountContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ProductDiscountContainerDTO(
      productDiscountId: json['ProductDiscountId'] as int,
      productId: json['ProductId'] as int,
      discountId: json['DiscountId'] as int,
      validFor: json['ValidFor'],
      validForDaysMonths: json['ValidForDaysMonths'] as String,
      expiryDate: json['ExpiryDate'],
    );

Map<String, dynamic> _$$_ProductDiscountContainerDTOToJson(
        _$_ProductDiscountContainerDTO instance) =>
    <String, dynamic>{
      'ProductDiscountId': instance.productDiscountId,
      'ProductId': instance.productId,
      'DiscountId': instance.discountId,
      'ValidFor': instance.validFor,
      'ValidForDaysMonths': instance.validForDaysMonths,
      'ExpiryDate': instance.expiryDate,
    };
