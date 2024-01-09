// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/user_role_container/user_to_attendance_map_dto.dart';
import 'management_form_access_container_dto.dart';

part 'user_role_container_dto.freezed.dart';
part 'user_role_container_dto.g.dart';

@freezed
class UserRoleContainerDTO with _$UserRoleContainerDTO {
  const factory UserRoleContainerDTO({
    @JsonKey(name: 'RoleId')
    required int roleId,
    @JsonKey(name: 'Role')
    required String role,
    @JsonKey(name: 'Description')
    required String description,
    @JsonKey(name: 'Manager')
    required bool manager,
    @JsonKey(name: 'AllowPosAccess')
    required String allowPosAccess,
    @JsonKey(name: 'DataAccessLevel')
    required String dataAccessLevel,
    @JsonKey(name: 'EnablePOSClockIn')
    required bool enablePosClockIn,
    @JsonKey(name: 'CashDrawerRequired')
    required bool cashDrawerRequired,
    @JsonKey(name: 'IsManagerRole')
    required bool isManagerRole,
    @JsonKey(name: 'AssignedManagerRoleId')
    required int assignedManagerRoleId,
    @JsonKey(name: 'PriceListId')
    required int priceListId,
    @JsonKey(name: 'IsSystemRole')
    required bool isSystemRole,
    @JsonKey(name: 'ManagementFormAccessContainerDTOList')
    required List<ManagementFormAccessContainerDTO> managementFormAccessContainerDTOList,
    @JsonKey(name: 'AssignedManagerRoleIdList')
    required List<dynamic> assignedManagerRoleIdList,
    @JsonKey(name: 'ExcludedProductIdList')
    required List<int> excludedProductIdList,
    @JsonKey(name: 'ExcludedProductMenuPanelIdList')
    required List<dynamic> excludedProductMenuPanelIdList,
    @JsonKey(name: 'ShiftConfigurationId')
    required int shiftConfigurationId,
    @JsonKey(name: 'SelfApprovalAllowed')
    required bool selfApprovalAllowed,
    @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
    required List<UserToAttendanceRolesMapContainerDTO> userToAttendanceRolesMapContainerDTOList,

  }) = _UserRoleContainerDTO;

  factory UserRoleContainerDTO.fromJson(Map<String, dynamic> json) => _$UserRoleContainerDTOFromJson(json);
}