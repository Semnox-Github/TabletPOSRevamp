// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'management_form_access_container_dto.freezed.dart';
part 'management_form_access_container_dto.g.dart';

@freezed
class ManagementFormAccessContainerDTO with _$ManagementFormAccessContainerDTO {
  const factory ManagementFormAccessContainerDTO({
    @JsonKey(name: 'ManagementFormAccessId')
    required int managementFormAccessId,
    @JsonKey(name: 'RoleId')
    required int roleId,
    @JsonKey(name: 'MainMenu')
    required String mainMenu,
    @JsonKey(name: 'FormName')
    required String formName,
    @JsonKey(name: 'FunctionGroup')
    required String functionGroup

  }) = _ManagementFormAccessContainerDTO;

  factory ManagementFormAccessContainerDTO.fromJson(Map<String, dynamic> json) => _$ManagementFormAccessContainerDTOFromJson(json);
}