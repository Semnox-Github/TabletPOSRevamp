

import 'package:freezed_annotation/freezed_annotation.dart';

part 'management_from_access_container_dto.freezed.dart';
part 'management_from_access_container_dto.g.dart';

@freezed
class ManagementFormAccessContainerDto with _$ManagementFormAccessContainerDto {
  const factory ManagementFormAccessContainerDto({
    @JsonKey(name: 'ManagementFormAccessId')
    int? managementFormAccessId,
    @JsonKey(name: 'RoleId')
    int? roleId,
    @JsonKey(name: 'MainMenu')
    String? mainMenu,
    @JsonKey(name: 'FormName')
    String? formName,
    @JsonKey(name: 'FunctionGroup')
    String? functionGroup



  }) = _ManagementFormAccessContainerDto;

  factory ManagementFormAccessContainerDto.fromJson(Map<String, dynamic> json) => _$ManagementFormAccessContainerDtoFromJson(json);
}