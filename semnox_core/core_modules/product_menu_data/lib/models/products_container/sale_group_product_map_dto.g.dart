// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_group_product_map_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SaleGroupProductMapDTO _$$_SaleGroupProductMapDTOFromJson(
        Map<String, dynamic> json) =>
    _$_SaleGroupProductMapDTO(
      typeMapId: json['TypeMapId'] as int,
      saleGroupId: json['SaleGroupId'] as int,
      productId: json['ProductId'] as int,
      displayOrder: json['DisplayOrder'] as int,
      guid: json['Guid'] as String,
    );

Map<String, dynamic> _$$_SaleGroupProductMapDTOToJson(
        _$_SaleGroupProductMapDTO instance) =>
    <String, dynamic>{
      'TypeMapId': instance.typeMapId,
      'SaleGroupId': instance.saleGroupId,
      'ProductId': instance.productId,
      'DisplayOrder': instance.displayOrder,
      'Guid': instance.guid,
    };
