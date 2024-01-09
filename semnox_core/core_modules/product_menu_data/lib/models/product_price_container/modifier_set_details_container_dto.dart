// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/product_price_container/product_price_data.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';

part 'modifier_set_details_container_dto.freezed.dart';
part 'modifier_set_details_container_dto.g.dart';

@freezed
class ModifierSetDetailsContainerDTO with _$ModifierSetDetailsContainerDTO {
  const factory ModifierSetDetailsContainerDTO({
    @JsonKey(name: 'ModifierSetDetailId')
    required int modifierSetDetailId,
    @JsonKey(name: 'ModifierSetId')
    required int modifierSetId,
    @JsonKey(name: 'ModifierProductId')
    required int modifierProductId,
    @JsonKey(name: 'Price')
    required double price,
    @JsonKey(name: 'SortOrder')
    required int sortOrder,
    @JsonKey(name: 'ParentModifierContainerDTOList')
    required List<dynamic> parentModifierContainerDTOList,
  }) = _ModifierSetDetailsContainerDTO;

  factory ModifierSetDetailsContainerDTO.fromJson(Map<String, dynamic> json) => _$ModifierSetDetailsContainerDTOFromJson(json);
}