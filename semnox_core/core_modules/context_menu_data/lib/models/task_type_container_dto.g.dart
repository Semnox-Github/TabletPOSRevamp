// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskTypesContainerDTO _$$_TaskTypesContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_TaskTypesContainerDTO(
      taskTypeId: json['TaskTypeId'] as int,
      taskType: json['TaskType'] as String,
      requiresManagerApproval: json['RequiresManagerApproval'] as String,
      displayInPos: json['DisplayInPos'] as String,
      taskTypeName: json['TaskTypeName'] as String,
      category: json['Category'] as String,
      sortOrder: json['SortOrder'] as int,
    );

Map<String, dynamic> _$$_TaskTypesContainerDTOToJson(
        _$_TaskTypesContainerDTO instance) =>
    <String, dynamic>{
      'TaskTypeId': instance.taskTypeId,
      'TaskType': instance.taskType,
      'RequiresManagerApproval': instance.requiresManagerApproval,
      'DisplayInPos': instance.displayInPos,
      'TaskTypeName': instance.taskTypeName,
      'Category': instance.category,
      'SortOrder': instance.sortOrder,
    };
