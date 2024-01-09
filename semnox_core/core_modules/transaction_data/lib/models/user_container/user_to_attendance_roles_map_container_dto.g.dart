// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_to_attendance_roles_map_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserToAttendanceRolesMapContainerDTO
    _$$_UserToAttendanceRolesMapContainerDTOFromJson(
            Map<String, dynamic> json) =>
        _$_UserToAttendanceRolesMapContainerDTO(
          userToAttendanceRolesMapId:
              json['UserToAttendanceRolesMapId'] as int?,
          userId: json['UserId'] as int?,
          attendanceRoleId: json['AttendanceRoleId'] as int?,
          approvalRequired: json['ApprovalRequired'] as bool?,
          effectiveDate: json['EffectiveDate'] as String?,
          endDate: json['EndDate'],
          isActive: json['IsActive'] as bool?,
          roleId: json['RoleId'] as int?,
          isDefault: json['IsDefault'] as bool?,
        );

Map<String, dynamic> _$$_UserToAttendanceRolesMapContainerDTOToJson(
        _$_UserToAttendanceRolesMapContainerDTO instance) =>
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
