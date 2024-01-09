// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_roles_map_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRolesMapContainerDTO _$$_UserRolesMapContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_UserRolesMapContainerDTO(
      userToAttendanceRolesMapId: json['UserToAttendanceRolesMapId'] as int,
      userId: json['UserId'] as int,
      attendanceRoleId: json['AttendanceRoleId'] as int,
      approvalRequired: json['ApprovalRequired'] as bool,
      effectiveDate: json['EffectiveDate'] as String,
      endDate: json['EndDate'],
      isActive: json['IsActive'] as bool,
      roleId: json['RoleId'] as int,
      isDefault: json['IsDefault'] as bool,
    );

Map<String, dynamic> _$$_UserRolesMapContainerDTOToJson(
        _$_UserRolesMapContainerDTO instance) =>
    <String, dynamic>{
      'UserToAttendanceRolesMapId': instance.userToAttendanceRolesMapId,
      'UserId': instance.userId,
      'AttendanceRoleId': instance.attendanceRoleId,
      'ApprovalRequired': instance.approvalRequired,
      'EffectiveDate': instance.effectiveDate,
      'EndDate': instance.endDate,
      'IsActive': instance.isActive,
      'RoleId': instance.roleId,
      'IsDefault': instance.isDefault,
    };
