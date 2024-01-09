// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:product_menu_data/models/product_price_container/modifier_set_details_container_dto.dart';

part 'modifier_set_container_dto.freezed.dart';
part 'modifier_set_container_dto.g.dart';

@freezed
class ModifierSetContainerDTO with _$ModifierSetContainerDTO {
  const factory ModifierSetContainerDTO({
    @JsonKey(name: 'ModifierSetId')
    required int modifierSetId,
    @JsonKey(name: 'SetName')
    required String setName,
    @JsonKey(name: 'MinQuantity')
    required int minQuantity,
    @JsonKey(name: 'ParentModifierSetDTO')
    ModifierSetContainerDTO? parentModifierSetDTO,
    @JsonKey(name: 'MaxQuantity')
    required int maxQuantity,
    @JsonKey(name: 'FreeQuantity')
    required int freeQuantity,
    @JsonKey(name: 'ModifierSetDetailsContainerDTOList')
    required List<ModifierSetDetailsContainerDTO> modifierSetDetailsContainerDTOList,
  }) = _ModifierSetContainerDTO;

  factory ModifierSetContainerDTO.fromJson(Map<String, dynamic> json) => _$ModifierSetContainerDTOFromJson(json);
}