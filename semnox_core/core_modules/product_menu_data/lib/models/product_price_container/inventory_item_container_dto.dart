// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/product_price_container/product_barcode_container_dto.dart';


part 'inventory_item_container_dto.freezed.dart';
part 'inventory_item_container_dto.g.dart';

@freezed
class InventoryItemContainerDTO with _$InventoryItemContainerDTO {
  const factory InventoryItemContainerDTO({
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'Code')
    required String code,
    @JsonKey(name: 'Description')
    required String description,
    @JsonKey(name: 'CategoryId')
    required int categoryId,
    @JsonKey(name: 'DefaultLocationId')
    required int defaultLocationId,
    @JsonKey(name: 'OutBoundLocationId')
    required int outBoundLocationId,
    @JsonKey(name: 'IsRedeemable')
    required String isRedeemable,
    @JsonKey(name: 'IsSellable')
    required String isSellable,
    @JsonKey(name: 'PriceInTickets')
    required double priceInTickets,
    @JsonKey(name: 'ImageFileName')
    required String imageFileName,
    @JsonKey(name: 'TurnInPriceInTickets')
    required int turnInPriceInTickets,
    @JsonKey(name: 'LotControlled')
    required bool lotControlled,
    @JsonKey(name: 'LastPurchasePrice')
    required double lastPurchasePrice,
    @JsonKey(name: 'TaxInclusiveCost')
    required String taxInclusiveCost,
    @JsonKey(name: 'ExpiryType')
    required String expiryType,
    @JsonKey(name: 'ExpiryInDays')
    required int expiryInDays,
    @JsonKey(name: 'MarketListItem')
    required bool marketListItem,
    @JsonKey(name: 'RecipeDescription')
    dynamic recipeDescription,
    @JsonKey(name: 'ProductBarcodeContainerDTOList')
    List<ProductBarcodeContainerDTO>? productBarcodeContainerDtoList,
  }) = _InventoryItemContainerDTO;

  factory InventoryItemContainerDTO.fromJson(Map<String, dynamic> json) => _$InventoryItemContainerDTOFromJson(json);
}
