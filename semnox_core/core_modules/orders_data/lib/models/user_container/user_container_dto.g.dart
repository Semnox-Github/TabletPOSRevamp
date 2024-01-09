// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserContainerDTO _$$_UserContainerDTOFromJson(Map<String, dynamic> json) =>
    _$_UserContainerDTO(
      userId: json['UserId'] as int,
      roleId: json['RoleId'] as int,
      departmentId: json['DepartmentId'] as int,
      userName: json['UserName'] as String,
      empLastName: json['EmpLastName'] as String?,
      loginId: json['LoginId'] as String?,
      managerId: json['ManagerId'] as int,
      siteId: json['SiteId'] as int,
      posTypeId: json['POSTypeId'] as int,
      Guid: json['Guid'] as String,
      userIdentificationTagContainerDTOList:
          json['UserIdentificationTagContainerDTOList'] as List<dynamic>,
      phoneNumber: json['PhoneNumber'] as String?,
      attendanceRoleIdList: json['AttendanceRoleIdList'] as List<dynamic>,
      shiftConfigurationId: json['ShiftConfigurationId'] as int,
      empNumber: json['EmpNumber'] as String?,
      userToAttendanceRolesMapContainerDTOList:
          (json['UserToAttendanceRolesMapContainerDTOList'] as List<dynamic>)
              .map((e) =>
                  UserRolesMapContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_UserContainerDTOToJson(_$_UserContainerDTO instance) =>
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
      'Guid': instance.Guid,
      'UserIdentificationTagContainerDTOList':
          instance.userIdentificationTagContainerDTOList,
      'PhoneNumber': instance.phoneNumber,
      'AttendanceRoleIdList': instance.attendanceRoleIdList,
      'ShiftConfigurationId': instance.shiftConfigurationId,
      'EmpNumber': instance.empNumber,
      'UserToAttendanceRolesMapContainerDTOList':
          instance.userToAttendanceRolesMapContainerDTOList,
    };
