// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/products_container/sales_offer_group_dto.dart';

part 'upsell_offer_dto.freezed.dart';
part 'upsell_offer_dto.g.dart';


@freezed
class UpsellOffersContainerDTO with _$UpsellOffersContainerDTO {
  const factory UpsellOffersContainerDTO({
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
  }) = _UpsellOffersContainerDTO;

  factory UpsellOffersContainerDTO.fromJson(Map<String, dynamic> json) => _$UpsellOffersContainerDTOFromJson(json);
}
