// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_type_container_dto.freezed.dart';
part 'task_type_container_dto.g.dart';

@freezed
class TaskTypeContainerDto with _$TaskTypeContainerDto {
  const factory TaskTypeContainerDto({
    @JsonKey(name: 'TaskTypeId')
    int? taskTypeId,
    @JsonKey(name: 'TaskType')
    String? taskType,
    @JsonKey(name: 'RequiresManagerApproval')
    String? requiresManagerApproval,
    @JsonKey(name: 'DisplayInPos')
    String? displayInPos,
    @JsonKey(name: 'TaskTypeName')
    String? taskTypeName,
    @JsonKey(name: 'Category')
    String? category,
    @JsonKey(name: 'SortOrder')
    int? sortOrder,
  }) = _TaskTypeContainerDto;

  factory TaskTypeContainerDto.fromJson(Map<String, dynamic> json) => _$TaskTypeContainerDtoFromJson(json);
}