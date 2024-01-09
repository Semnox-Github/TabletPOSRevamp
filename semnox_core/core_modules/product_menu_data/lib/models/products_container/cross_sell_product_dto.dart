// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/products_container/sales_offer_group_dto.dart';

part 'cross_sell_product_dto.freezed.dart';
part 'cross_sell_product_dto.g.dart';


@freezed
class CrossSellProductsContainerDTO with _$CrossSellProductsContainerDTO {
  const factory CrossSellProductsContainerDTO({
    @JsonKey(name: 'OfferId')
    required int offerId,
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'OfferProductId')
    required int offerProductId,
    @JsonKey(name: 'SaleGroupId')
    required int saleGroupId,
    @JsonKey(name: 'OfferMessage')
    required String offerMessage,
    @JsonKey(name: 'EffectiveDate')
    required String effectiveDate,
    @JsonKey(name: 'SalesOfferGroupContainerDTO')
    SalesOfferGroupContainerDTO? salesOfferGroupContainerDTO,
  }) = _CrossSellProductsContainerDTO;

  factory CrossSellProductsContainerDTO.fromJson(Map<String, dynamic> json) => _$CrossSellProductsContainerDTOFromJson(json);
}
