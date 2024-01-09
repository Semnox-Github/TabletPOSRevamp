import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/user_container/user_identification_tag_container_dto.dart';
import 'package:transaction_data/models/user_container/user_to_attendance_roles_map_container_dto.dart';

part 'user_container_dto.freezed.dart';
part 'user_container_dto.g.dart';

@freezed
class UserContainerDto with _$UserContainerDto {
  const factory UserContainerDto({
    @JsonKey(name: 'UserId')
    int? userId,
    @JsonKey(name: 'RoleId')
    int? roleId,
    @JsonKey(name: 'DepartmentId')
    int? departmentId,
    @JsonKey(name: 'UserName')
    String? userName,
    @JsonKey(name: 'EmpLastName')
    String? empLastName,
    @JsonKey(name: 'LoginId')
    String? loginId,
    @JsonKey(name: 'ManagerId')
    int? managerId,
    @JsonKey(name: 'SiteId')
    int? siteId,
    @JsonKey(name: 'POSTypeId')
    int? posTypeId,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'UserIdentificationTagContainerDTOList')
    required List<UserIdentificationTagContainerDTO> userIdentificationTagContainerDtoList,
    @JsonKey(name: 'PhoneNumber')
    String? phoneNumber,
    @JsonKey(name: 'AttendanceRoleIdList')
    required List<int> attendanceRoleIdList,
    @JsonKey(name: 'ShiftConfigurationId')
    int? shiftConfigurationId,
    @JsonKey(name: 'EmpNumber')
    String? empNumber,
    @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
    required List<UserToAttendanceRolesMapContainerDTO> userToAttendanceRolesMapContainerDtoList

  }) = _UserContainerDto;

  factory UserContainerDto.fromJson(Map<String, dynamic> json) => _$UserContainerDtoFromJson(json);
}