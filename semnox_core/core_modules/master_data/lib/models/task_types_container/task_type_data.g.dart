// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskTypeData _$$_TaskTypeDataFromJson(Map<String, dynamic> json) =>
    _$_TaskTypeData(
      taskTypesContainerDTOList: (json['TaskTypesContainerDTOList']
              as List<dynamic>?)
          ?.map((e) => TaskTypeContainerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_TaskTypeDataToJson(_$_TaskTypeData instance) =>
    <String, dynamic>{
      'TaskTypesContainerDTOList': instance.taskTypesContainerDTOList,
      'Hash': instance.hash,
    };
