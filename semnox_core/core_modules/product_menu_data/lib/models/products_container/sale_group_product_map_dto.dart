// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_group_product_map_dto.freezed.dart';
part 'sale_group_product_map_dto.g.dart';


@freezed
class SaleGroupProductMapDTO with _$SaleGroupProductMapDTO {
  const factory SaleGroupProductMapDTO({
    @JsonKey(name: 'TypeMapId')
    required int typeMapId,
    @JsonKey(name: 'SaleGroupId')
    required int saleGroupId,
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'DisplayOrder')
    required int displayOrder,
    @JsonKey(name: 'Guid')
    required String guid,
  }) = _SaleGroupProductMapDTO;

  factory SaleGroupProductMapDTO.fromJson(Map<String, dynamic> json) => _$SaleGroupProductMapDTOFromJson(json);
}
