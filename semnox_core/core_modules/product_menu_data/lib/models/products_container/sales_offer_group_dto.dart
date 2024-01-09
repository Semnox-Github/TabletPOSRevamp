// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/products_container/sale_group_product_map_dto.dart';

part 'sales_offer_group_dto.freezed.dart';
part 'sales_offer_group_dto.g.dart';


@freezed
class SalesOfferGroupContainerDTO with _$SalesOfferGroupContainerDTO {
  const factory SalesOfferGroupContainerDTO({
    @JsonKey(name: 'SaleGroupId')
    required int saleGroupId,
    @JsonKey(name: 'Name')
    required String name,
    @JsonKey(name: 'IsUpsell')
    required bool isUpsell,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'SaleGroupProductMapDTOContainerList')
    List<SaleGroupProductMapDTO>? saleGroupProductMapDTOContainerList,
  }) = _SalesOfferGroupContainerDTO;

  factory SalesOfferGroupContainerDTO.fromJson(Map<String, dynamic> json) => _$SalesOfferGroupContainerDTOFromJson(json);
}
