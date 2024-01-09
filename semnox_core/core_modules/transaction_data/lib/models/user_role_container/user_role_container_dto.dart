import 'package:freezed_annotation/freezed_annotation.dart';

import 'management_from_access_container_dto.dart';
part 'user_role_container_dto.freezed.dart';
part 'user_role_container_dto.g.dart';

@freezed
class UserRoleContanierDTO with _$UserRoleContanierDTO {
  const factory UserRoleContanierDTO({
    @JsonKey(name: 'RoleId')
    int? roleId,
    @JsonKey(name: 'Role')
    String? role,
    @JsonKey(name: 'Description')
    String? description,
    @JsonKey(name: 'Manager')
    bool? manager,
    @JsonKey(name: 'AllowPosAccess')
    String? allowPosAccess,
    @JsonKey(name: 'DataAccessLevel')
    String? dataAccessLevel,
    @JsonKey(name: 'EnablePOSClockIn')
    bool? enablePosClockIn,
    @JsonKey(name: 'CashDrawerRequired')
    bool? cashDrawerRequired,
    @JsonKey(name: 'IsManagerRole')
    bool? isManagerRole,
    @JsonKey(name: 'AssignedManagerRoleId')
    int? assignedManagerRoleId,
    @JsonKey(name: 'PriceListId')
    int? priceListId,
    @JsonKey(name: 'IsSystemRole')
    bool? isSystemRole,
    @JsonKey(name: 'ManagementFormAccessContainerDTOList')
    required List<ManagementFormAccessContainerDto> managementFormAccessContainerDtoList,
    @JsonKey(name: 'AssignedManagerRoleIdList')
    required List<dynamic> assignedManagerRoleIdList,
    @JsonKey(name: 'ExcludedProductIdList')
    required List<dynamic> excludedProductIdList,
    @JsonKey(name: 'ExcludedProductMenuPanelIdList')
    required List<dynamic> excludedProductMenuPanelIdList,
    @JsonKey(name: 'ShiftConfigurationId')
    required int shiftConfigurationId,
    @JsonKey(name: 'SelfApprovalAllowed')
    required bool selfApprovalAllowed,
    @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
    required List<dynamic> userToAttendanceRolesMapContainerDtoList,

  }) = _UserRoleContanierDTO;

  factory UserRoleContanierDTO.fromJson(Map<String, dynamic> json) => _$UserRoleContanierDTOFromJson(json);
}