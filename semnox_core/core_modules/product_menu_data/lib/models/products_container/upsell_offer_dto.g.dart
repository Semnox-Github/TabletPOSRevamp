// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsell_offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpsellOffersContainerDTO _$$_UpsellOffersContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_UpsellOffersContainerDTO(
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

Map<String, dynamic> _$$_UpsellOffersContainerDTOToJson(
        _$_UpsellOffersContainerDTO instance) =>
    <String, dynamic>{
      'OfferId': instance.offerId,
      'ProductId': instance.productId,
      'OfferProductId': instance.offerProductId,
      'SaleGroupId': instance.saleGroupId,
      'OfferMessage': instance.offerMessage,
      'EffectiveDate': instance.effectiveDate,
      'SalesOfferGroupContainerDTO': instance.salesOfferGroupContainerDTO,
    };
