import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_to_attendance_roles_map_container_dto.freezed.dart';
part 'user_to_attendance_roles_map_container_dto.g.dart';

@freezed
class UserToAttendanceRolesMapContainerDTO with _$UserToAttendanceRolesMapContainerDTO {
  const factory UserToAttendanceRolesMapContainerDTO({
    @JsonKey(name: 'UserToAttendanceRolesMapId')
    int? userToAttendanceRolesMapId,
    @JsonKey(name: 'UserId')
    int? userId,
    @JsonKey(name: 'AttendanceRoleId')
    int? attendanceRoleId,
    @JsonKey(name: 'ApprovalRequired')
    bool? approvalRequired,
    @JsonKey(name: 'EffectiveDate')
    String? effectiveDate,
    @JsonKey(name: 'EndDate')
    dynamic endDate,
    @JsonKey(name: 'IsActive')
    bool? isActive,
    @JsonKey(name: 'RoleId')
    int? roleId,
    @JsonKey(name: 'IsDefault')
    bool? isDefault


  }) = _UserToAttendanceRolesMapContainerDTO;

  factory UserToAttendanceRolesMapContainerDTO.fromJson(Map<String, dynamic> json) => _$UserToAttendanceRolesMapContainerDTOFromJson(json);
}