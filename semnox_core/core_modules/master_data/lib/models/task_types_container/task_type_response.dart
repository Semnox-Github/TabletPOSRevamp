import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/task_types_container/task_type_data.dart';

part 'task_type_response.freezed.dart';
part 'task_type_response.g.dart';

@freezed
class TaskTypeContainerResponse with _$TaskTypeContainerResponse {
  const factory TaskTypeContainerResponse({
    TaskTypeData? data,
    String? exception
  }) = _TaskTypeContainerResponse;

  factory TaskTypeContainerResponse.fromJson(Map<String, dynamic> json) => _$TaskTypeContainerResponseFromJson(json);
}