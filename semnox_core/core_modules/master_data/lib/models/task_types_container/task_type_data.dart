// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/task_types_container/task_type_container_dto.dart';

part 'task_type_data.freezed.dart';
part 'task_type_data.g.dart';

@freezed
class TaskTypeData with _$TaskTypeData {
  const factory TaskTypeData({
    @JsonKey(name: 'TaskTypesContainerDTOList')
    List<TaskTypeContainerDto>? taskTypesContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _TaskTypeData;

  factory TaskTypeData.fromJson(Map<String, dynamic> json) => _$TaskTypeDataFromJson(json);
}