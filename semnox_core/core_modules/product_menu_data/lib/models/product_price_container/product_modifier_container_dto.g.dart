// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_modifier_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModifierContainerDTO _$$_ProductModifierContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ProductModifierContainerDTO(
      productModifierId: json['ProductModifierId'] as int,
      categoryId: json['CategoryId'] as int,
      productId: json['ProductId'] as int,
      modifierSetId: json['ModifierSetId'] as int,
      autoShoInPos: json['AutoShoInPOS'] as String?,
      sortOrder: json['SortOrder'] as int,
      modifierSetContainerDTO: json['ModifierSetContainerDTO'] == null
          ? null
          : ModifierSetContainerDTO.fromJson(
              json['ModifierSetContainerDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductModifierContainerDTOToJson(
        _$_ProductModifierContainerDTO instance) =>
    <String, dynamic>{
      'ProductModifierId': instance.productModifierId,
      'CategoryId': instance.categoryId,
      'ProductId': instance.productId,
      'ModifierSetId': instance.modifierSetId,
      'AutoShoInPOS': instance.autoShoInPos,
      'SortOrder': instance.sortOrder,
      'ModifierSetContainerDTO': instance.modifierSetContainerDTO,
    };
