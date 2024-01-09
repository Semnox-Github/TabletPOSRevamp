// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_type_container_dto.freezed.dart';
part 'task_type_container_dto.g.dart';

@freezed
class TaskTypesContainerDTO with _$TaskTypesContainerDTO {
  const factory TaskTypesContainerDTO({
    @JsonKey(name: 'TaskTypeId')
    required int taskTypeId,
    @JsonKey(name: 'TaskType')
    required String taskType,
    @JsonKey(name: 'RequiresManagerApproval')
    required String requiresManagerApproval,
    @JsonKey(name: 'DisplayInPos')
    required String displayInPos,
    @JsonKey(name: 'TaskTypeName')
    required String taskTypeName,
    @JsonKey(name: 'Category')
    required String category,
    @JsonKey(name: 'SortOrder')
    required int sortOrder,
  }) = _TaskTypesContainerDTO;

  factory TaskTypesContainerDTO.fromJson(Map<String, dynamic> json) => _$TaskTypesContainerDTOFromJson(json);
}