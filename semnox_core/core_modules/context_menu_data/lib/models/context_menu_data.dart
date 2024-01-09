// ignore_for_file: invalid_annotation_target

import 'package:context_menu_data/models/task_type_container_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'context_menu_data.freezed.dart';
part 'context_menu_data.g.dart';

@freezed
class ContextMenuData with _$ContextMenuData {
  const factory ContextMenuData({
    @JsonKey(name: 'TaskTypesContainerDTOList')
    required List<TaskTypesContainerDTO> taskTypesContainerDtoList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _ContextMenuResponse;

  factory ContextMenuData.fromJson(Map<String, dynamic> json) => _$ContextMenuDataFromJson(json);
}