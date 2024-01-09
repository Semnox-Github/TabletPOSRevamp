
import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_roles_map_container_dto.freezed.dart';
part 'user_roles_map_container_dto.g.dart';

@freezed
class UserRolesMapContainerDTO with _$UserRolesMapContainerDTO{
  const factory UserRolesMapContainerDTO({
    @JsonKey(name: 'UserToAttendanceRolesMapId')
    required  int userToAttendanceRolesMapId,
    @JsonKey(name: 'UserId')
    required  int userId,
    @JsonKey(name: 'AttendanceRoleId')
    required  int attendanceRoleId,
    @JsonKey(name: 'ApprovalRequired')
    required  bool approvalRequired,
    @JsonKey(name: 'EffectiveDate')
    required  String effectiveDate,
    @JsonKey(name: 'EndDate')
    dynamic? endDate,
    @JsonKey(name: 'IsActive')
    required  bool isActive,
    @JsonKey(name: 'RoleId')
    required  int roleId,
    @JsonKey(name: 'IsDefault')
    required  bool isDefault,
  }) =_UserRolesMapContainerDTO;

  factory UserRolesMapContainerDTO.fromJson(Map<String, dynamic> json) => _$UserRolesMapContainerDTOFromJson(json);

}