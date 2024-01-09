// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management_from_access_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ManagementFormAccessContainerDto
    _$$_ManagementFormAccessContainerDtoFromJson(Map<String, dynamic> json) =>
        _$_ManagementFormAccessContainerDto(
          managementFormAccessId: json['ManagementFormAccessId'] as int?,
          roleId: json['RoleId'] as int?,
          mainMenu: json['MainMenu'] as String?,
          formName: json['FormName'] as String?,
          functionGroup: json['FunctionGroup'] as String?,
        );

Map<String, dynamic> _$$_ManagementFormAccessContainerDtoToJson(
        _$_ManagementFormAccessContainerDto instance) =>
    <String, dynamic>{
      'ManagementFormAccessId': instance.managementFormAccessId,
      'RoleId': instance.roleId,
      'MainMenu': instance.mainMenu,
      'FormName': instance.formName,
      'FunctionGroup': instance.functionGroup,
    };
