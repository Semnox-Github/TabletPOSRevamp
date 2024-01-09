// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modifier_set_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ModifierSetContainerDTO _$$_ModifierSetContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ModifierSetContainerDTO(
      modifierSetId: json['ModifierSetId'] as int,
      setName: json['SetName'] as String,
      minQuantity: json['MinQuantity'] as int,
      parentModifierSetDTO: json['ParentModifierSetDTO'] == null
          ? null
          : ModifierSetContainerDTO.fromJson(
              json['ParentModifierSetDTO'] as Map<String, dynamic>),
      maxQuantity: json['MaxQuantity'] as int,
      freeQuantity: json['FreeQuantity'] as int,
      modifierSetDetailsContainerDTOList:
          (json['ModifierSetDetailsContainerDTOList'] as List<dynamic>)
              .map((e) => ModifierSetDetailsContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_ModifierSetContainerDTOToJson(
        _$_ModifierSetContainerDTO instance) =>
    <String, dynamic>{
      'ModifierSetId': instance.modifierSetId,
      'SetName': instance.setName,
      'MinQuantity': instance.minQuantity,
      'ParentModifierSetDTO': instance.parentModifierSetDTO,
      'MaxQuantity': instance.maxQuantity,
      'FreeQuantity': instance.freeQuantity,
      'ModifierSetDetailsContainerDTOList':
          instance.modifierSetDetailsContainerDTOList,
    };
