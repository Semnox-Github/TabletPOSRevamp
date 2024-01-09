// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'management_form_access_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ManagementFormAccessContainerDTO
    _$$_ManagementFormAccessContainerDTOFromJson(Map<String, dynamic> json) =>
        _$_ManagementFormAccessContainerDTO(
          managementFormAccessId: json['ManagementFormAccessId'] as int,
          roleId: json['RoleId'] as int,
          mainMenu: json['MainMenu'] as String,
          formName: json['FormName'] as String,
          functionGroup: json['FunctionGroup'] as String,
        );

Map<String, dynamic> _$$_ManagementFormAccessContainerDTOToJson(
        _$_ManagementFormAccessContainerDTO instance) =>
    <String, dynamic>{
      'ManagementFormAccessId': instance.managementFormAccessId,
      'RoleId': instance.roleId,
      'MainMenu': instance.mainMenu,
      'FormName': instance.formName,
      'FunctionGroup': instance.functionGroup,
    };
