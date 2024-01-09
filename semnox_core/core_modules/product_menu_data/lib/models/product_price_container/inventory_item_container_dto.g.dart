// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_item_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InventoryItemContainerDTO _$$_InventoryItemContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_InventoryItemContainerDTO(
      productId: json['ProductId'] as int,
      code: json['Code'] as String,
      description: json['Description'] as String,
      categoryId: json['CategoryId'] as int,
      defaultLocationId: json['DefaultLocationId'] as int,
      outBoundLocationId: json['OutBoundLocationId'] as int,
      isRedeemable: json['IsRedeemable'] as String,
      isSellable: json['IsSellable'] as String,
      priceInTickets: (json['PriceInTickets'] as num).toDouble(),
      imageFileName: json['ImageFileName'] as String,
      turnInPriceInTickets: json['TurnInPriceInTickets'] as int,
      lotControlled: json['LotControlled'] as bool,
      lastPurchasePrice: (json['LastPurchasePrice'] as num).toDouble(),
      taxInclusiveCost: json['TaxInclusiveCost'] as String,
      expiryType: json['ExpiryType'] as String,
      expiryInDays: json['ExpiryInDays'] as int,
      marketListItem: json['MarketListItem'] as bool,
      recipeDescription: json['RecipeDescription'],
      productBarcodeContainerDtoList: (json['ProductBarcodeContainerDTOList']
              as List<dynamic>?)
          ?.map((e) =>
              ProductBarcodeContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InventoryItemContainerDTOToJson(
        _$_InventoryItemContainerDTO instance) =>
    <String, dynamic>{
      'ProductId': instance.productId,
      'Code': instance.code,
      'Description': instance.description,
      'CategoryId': instance.categoryId,
      'DefaultLocationId': instance.defaultLocationId,
      'OutBoundLocationId': instance.outBoundLocationId,
      'IsRedeemable': instance.isRedeemable,
      'IsSellable': instance.isSellable,
      'PriceInTickets': instance.priceInTickets,
      'ImageFileName': instance.imageFileName,
      'TurnInPriceInTickets': instance.turnInPriceInTickets,
      'LotControlled': instance.lotControlled,
      'LastPurchasePrice': instance.lastPurchasePrice,
      'TaxInclusiveCost': instance.taxInclusiveCost,
      'ExpiryType': instance.expiryType,
      'ExpiryInDays': instance.expiryInDays,
      'MarketListItem': instance.marketListItem,
      'RecipeDescription': instance.recipeDescription,
      'ProductBarcodeContainerDTOList': instance.productBarcodeContainerDtoList,
    };
