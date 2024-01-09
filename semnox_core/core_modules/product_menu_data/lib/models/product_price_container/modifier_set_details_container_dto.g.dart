// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modifier_set_details_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModifierSetDetailsContainerDTO _$$_ModifierSetDetailsContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ModifierSetDetailsContainerDTO(
      modifierSetDetailId: json['ModifierSetDetailId'] as int,
      modifierSetId: json['ModifierSetId'] as int,
      modifierProductId: json['ModifierProductId'] as int,
      price: (json['Price'] as num).toDouble(),
      sortOrder: json['SortOrder'] as int,
      parentModifierContainerDTOList:
          json['ParentModifierContainerDTOList'] as List<dynamic>,
    );

Map<String, dynamic> _$$_ModifierSetDetailsContainerDTOToJson(
        _$_ModifierSetDetailsContainerDTO instance) =>
    <String, dynamic>{
      'ModifierSetDetailId': instance.modifierSetDetailId,
      'ModifierSetId': instance.modifierSetId,
      'ModifierProductId': instance.modifierProductId,
      'Price': instance.price,
      'SortOrder': instance.sortOrder,
      'ParentModifierContainerDTOList': instance.parentModifierContainerDTOList,
    };
