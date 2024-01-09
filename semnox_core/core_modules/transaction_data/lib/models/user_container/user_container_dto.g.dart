// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserContainerDto _$$_UserContainerDtoFromJson(Map<String, dynamic> json) =>
    _$_UserContainerDto(
      userId: json['UserId'] as int?,
      roleId: json['RoleId'] as int?,
      departmentId: json['DepartmentId'] as int?,
      userName: json['UserName'] as String?,
      empLastName: json['EmpLastName'] as String?,
      loginId: json['LoginId'] as String?,
      managerId: json['ManagerId'] as int?,
      siteId: json['SiteId'] as int?,
      posTypeId: json['POSTypeId'] as int?,
      guid: json['Guid'] as String?,
      userIdentificationTagContainerDtoList:
          (json['UserIdentificationTagContainerDTOList'] as List<dynamic>)
              .map((e) => UserIdentificationTagContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      phoneNumber: json['PhoneNumber'] as String?,
      attendanceRoleIdList: (json['AttendanceRoleIdList'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      shiftConfigurationId: json['ShiftConfigurationId'] as int?,
      empNumber: json['EmpNumber'] as String?,
      userToAttendanceRolesMapContainerDtoList:
          (json['UserToAttendanceRolesMapContainerDTOList'] as List<dynamic>)
              .map((e) => UserToAttendanceRolesMapContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_UserContainerDtoToJson(_$_UserContainerDto instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'RoleId': instance.roleId,
      'DepartmentId': instance.departmentId,
      'UserName': instance.userName,
      'EmpLastName': instance.empLastName,
      'LoginId': instance.loginId,
      'ManagerId': instance.managerId,
      'SiteId': instance.siteId,
      'POSTypeId': instance.posTypeId,
      'Guid': instance.guid,
      'UserIdentificationTagContainerDTOList':
          instance.userIdentificationTagContainerDtoList,
      'PhoneNumber': instance.phoneNumber,
      'AttendanceRoleIdList': instance.attendanceRoleIdList,
      'ShiftConfigurationId': instance.shiftConfigurationId,
      'EmpNumber': instance.empNumber,
      'UserToAttendanceRolesMapContainerDTOList':
          instance.userToAttendanceRolesMapContainerDtoList,
    };
