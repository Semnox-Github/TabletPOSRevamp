// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_to_attendance_map_dto.freezed.dart';
part 'user_to_attendance_map_dto.g.dart';

@freezed
class UserToAttendanceRolesMapContainerDTO with _$UserToAttendanceRolesMapContainerDTO {
  const factory UserToAttendanceRolesMapContainerDTO({
    @JsonKey(name: 'UserToAttendanceRolesMapId')
    required int userToAttendanceRolesMapId,
    @JsonKey(name: 'UserId')
    required int userId,
    @JsonKey(name: 'AttendanceRoleId')
    required int attendanceRoleId,
    @JsonKey(name: 'ApprovalRequired')
    required bool approvalRequired,
    @JsonKey(name: 'EffectiveDate')
    required String effectiveDate,
    @JsonKey(name: 'EndDate')
    required dynamic endDate,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'RoleId')
    required int roleId,
    @JsonKey(name: 'IsDefault')
    required bool isDefault,

  }) = _UserToAttendanceRolesMapContainerDTO;

  factory UserToAttendanceRolesMapContainerDTO.fromJson(Map<String, dynamic> json) => _$UserToAttendanceRolesMapContainerDTOFromJson(json);
}