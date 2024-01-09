// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_menu_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContextMenuResponse _$$_ContextMenuResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ContextMenuResponse(
      taskTypesContainerDtoList: (json['TaskTypesContainerDTOList']
              as List<dynamic>)
          .map((e) => TaskTypesContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_ContextMenuResponseToJson(
        _$_ContextMenuResponse instance) =>
    <String, dynamic>{
      'TaskTypesContainerDTOList': instance.taskTypesContainerDtoList,
      'Hash': instance.hash,
    };
