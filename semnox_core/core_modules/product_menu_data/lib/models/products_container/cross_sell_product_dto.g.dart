// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cross_sell_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CrossSellProductsContainerDTO _$$_CrossSellProductsContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_CrossSellProductsContainerDTO(
      offerId: json['OfferId'] as int,
      productId: json['ProductId'] as int,
      offerProductId: json['OfferProductId'] as int,
      saleGroupId: json['SaleGroupId'] as int,
      offerMessage: json['OfferMessage'] as String,
      effectiveDate: json['EffectiveDate'] as String,
      salesOfferGroupContainerDTO: json['SalesOfferGroupContainerDTO'] == null
          ? null
          : SalesOfferGroupContainerDTO.fromJson(
              json['SalesOfferGroupContainerDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CrossSellProductsContainerDTOToJson(
        _$_CrossSellProductsContainerDTO instance) =>
    <String, dynamic>{
      'OfferId': instance.offerId,
      'ProductId': instance.productId,
      'OfferProductId': instance.offerProductId,
      'SaleGroupId': instance.saleGroupId,
      'OfferMessage': instance.offerMessage,
      'EffectiveDate': instance.effectiveDate,
      'SalesOfferGroupContainerDTO': instance.salesOfferGroupContainerDTO,
    };
