
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/user_container/user_roles_map_container_dto.dart';

part 'user_container_dto.freezed.dart';
part 'user_container_dto.g.dart';

@freezed
class UserContainerDTO with _$UserContainerDTO{
  const factory UserContainerDTO({
    @JsonKey(name: 'UserId')
    required  int userId,
    @JsonKey(name: 'RoleId')
    required  int roleId,
    @JsonKey(name: 'DepartmentId')
    required  int departmentId,
    @JsonKey(name: 'UserName')
    required  String userName,
    @JsonKey(name: 'EmpLastName')
    required  String? empLastName,
    @JsonKey(name: 'LoginId')
    required  String? loginId,
    @JsonKey(name: 'ManagerId')
    required  int managerId,
    @JsonKey(name: 'SiteId')
    required  int siteId,
    @JsonKey(name: 'POSTypeId')
    required  int posTypeId,
    @JsonKey(name: 'Guid')
    required  String Guid,
    @JsonKey(name: 'UserIdentificationTagContainerDTOList')
    required  List<dynamic> userIdentificationTagContainerDTOList,
    @JsonKey(name: 'PhoneNumber')
    required  String? phoneNumber,
    @JsonKey(name: 'AttendanceRoleIdList')
    required  List<dynamic> attendanceRoleIdList,
    @JsonKey(name: 'ShiftConfigurationId')
    required  int shiftConfigurationId,
    @JsonKey(name: 'EmpNumber')
    required  String? empNumber,
    @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
    required  List<UserRolesMapContainerDTO> userToAttendanceRolesMapContainerDTOList,
  }) =_UserContainerDTO;

  factory UserContainerDTO.fromJson(Map<String, dynamic> json) => _$UserContainerDTOFromJson(json);

}