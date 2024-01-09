// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRoleContanierDTO _$$_UserRoleContanierDTOFromJson(
        Map<String, dynamic> json) =>
    _$_UserRoleContanierDTO(
      roleId: json['RoleId'] as int?,
      role: json['Role'] as String?,
      description: json['Description'] as String?,
      manager: json['Manager'] as bool?,
      allowPosAccess: json['AllowPosAccess'] as String?,
      dataAccessLevel: json['DataAccessLevel'] as String?,
      enablePosClockIn: json['EnablePOSClockIn'] as bool?,
      cashDrawerRequired: json['CashDrawerRequired'] as bool?,
      isManagerRole: json['IsManagerRole'] as bool?,
      assignedManagerRoleId: json['AssignedManagerRoleId'] as int?,
      priceListId: json['PriceListId'] as int?,
      isSystemRole: json['IsSystemRole'] as bool?,
      managementFormAccessContainerDtoList:
          (json['ManagementFormAccessContainerDTOList'] as List<dynamic>)
              .map((e) => ManagementFormAccessContainerDto.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      assignedManagerRoleIdList:
          json['AssignedManagerRoleIdList'] as List<dynamic>,
      excludedProductIdList: json['ExcludedProductIdList'] as List<dynamic>,
      excludedProductMenuPanelIdList:
          json['ExcludedProductMenuPanelIdList'] as List<dynamic>,
      shiftConfigurationId: json['ShiftConfigurationId'] as int,
      selfApprovalAllowed: json['SelfApprovalAllowed'] as bool,
      userToAttendanceRolesMapContainerDtoList:
          json['UserToAttendanceRolesMapContainerDTOList'] as List<dynamic>,
    );

Map<String, dynamic> _$$_UserRoleContanierDTOToJson(
        _$_UserRoleContanierDTO instance) =>
    <String, dynamic>{
      'RoleId': instance.roleId,
      'Role': instance.role,
      'Description': instance.description,
      'Manager': instance.manager,
      'AllowPosAccess': instance.allowPosAccess,
      'DataAccessLevel': instance.dataAccessLevel,
      'EnablePOSClockIn': instance.enablePosClockIn,
      'CashDrawerRequired': instance.cashDrawerRequired,
      'IsManagerRole': instance.isManagerRole,
      'AssignedManagerRoleId': instance.assignedManagerRoleId,
      'PriceListId': instance.priceListId,
      'IsSystemRole': instance.isSystemRole,
      'ManagementFormAccessContainerDTOList':
          instance.managementFormAccessContainerDtoList,
      'AssignedManagerRoleIdList': instance.assignedManagerRoleIdList,
      'ExcludedProductIdList': instance.excludedProductIdList,
      'ExcludedProductMenuPanelIdList': instance.excludedProductMenuPanelIdList,
      'ShiftConfigurationId': instance.shiftConfigurationId,
      'SelfApprovalAllowed': instance.selfApprovalAllowed,
      'UserToAttendanceRolesMapContainerDTOList':
          instance.userToAttendanceRolesMapContainerDtoList,
    };
