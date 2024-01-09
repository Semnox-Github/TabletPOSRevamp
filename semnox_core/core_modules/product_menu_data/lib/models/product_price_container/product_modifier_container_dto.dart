// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_container_dto.dart';

part 'product_modifier_container_dto.freezed.dart';
part 'product_modifier_container_dto.g.dart';

@freezed
class ProductModifierContainerDTO with _$ProductModifierContainerDTO {
  const factory ProductModifierContainerDTO({
    @JsonKey(name: 'ProductModifierId') required int productModifierId,
    @JsonKey(name: 'CategoryId') required int categoryId,
    @JsonKey(name: 'ProductId') required int productId,
    @JsonKey(name: 'ModifierSetId') required int modifierSetId,
    @JsonKey(name: 'AutoShoInPOS') String? autoShoInPos,
    @JsonKey(name: 'SortOrder') required int sortOrder,
    @JsonKey(name: 'ModifierSetContainerDTO') ModifierSetContainerDTO? modifierSetContainerDTO,
  }) = _ProductModifierContainerDTO;

  factory ProductModifierContainerDTO.fromJson(Map<String, dynamic> json) => _$ProductModifierContainerDTOFromJson(json);
}