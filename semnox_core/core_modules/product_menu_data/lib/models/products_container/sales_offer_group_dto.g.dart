// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_offer_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesOfferGroupContainerDTO _$$_SalesOfferGroupContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_SalesOfferGroupContainerDTO(
      saleGroupId: json['SaleGroupId'] as int,
      name: json['Name'] as String,
      isUpsell: json['IsUpsell'] as bool,
      guid: json['Guid'] as String,
      saleGroupProductMapDTOContainerList:
          (json['SaleGroupProductMapDTOContainerList'] as List<dynamic>?)
              ?.map((e) =>
                  SaleGroupProductMapDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_SalesOfferGroupContainerDTOToJson(
        _$_SalesOfferGroupContainerDTO instance) =>
    <String, dynamic>{
      'SaleGroupId': instance.saleGroupId,
      'Name': instance.name,
      'IsUpsell': instance.isUpsell,
      'Guid': instance.guid,
      'SaleGroupProductMapDTOContainerList':
          instance.saleGroupProductMapDTOContainerList,
    };
