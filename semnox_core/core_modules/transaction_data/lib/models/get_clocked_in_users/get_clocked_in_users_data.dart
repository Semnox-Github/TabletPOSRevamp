import 'package:freezed_annotation/freezed_annotation.dart';
import 'data_access_rule_dto.dart';

part 'get_clocked_in_users_data.freezed.dart';
part 'get_clocked_in_users_data.g.dart';

@freezed
class GetClockedInUsersData with _$GetClockedInUsersData {
  const factory GetClockedInUsersData({
    @JsonKey(name: 'UserId') required int userId,
    @JsonKey(name: 'UserName') required String userName,
    @JsonKey(name: 'LoginId') required String loginId,
    @JsonKey(name: 'RoleId') required int roleId,
    @JsonKey(name: 'CardNumber') required String cardNumber,
    @JsonKey(name: 'LastLoginTime') required String lastLoginTime,
    @JsonKey(name: 'LogoutTime') required String logoutTime,
    @JsonKey(name: 'OverrideFingerPrint') required String overrideFingerPrint,
    @JsonKey(name: 'PasswordHash') required dynamic? passwordHash,
    @JsonKey(name: 'PasswordSalt') required String passwordSalt,
    @JsonKey(name: 'Password') required String password,
    @JsonKey(name: 'MasterEntityId') required int masterEntityId,
    @JsonKey(name: 'PosTypeId') required int posTypeId,
    @JsonKey(name: 'DepartmentId') required int departmentId,
    @JsonKey(name: 'DepartmentName') required String departmentName,
    @JsonKey(name: 'EmpStartDate') required DateTime empStartDate,
    @JsonKey(name: 'EmpEndDate') required DateTime empEndDate,
    @JsonKey(name: 'EmpEndReason') required String empEndReason,
    @JsonKey(name: 'ManagerId') required int managerId,
    @JsonKey(name: 'EmpLastName') required String empLastName,
    @JsonKey(name: 'EmpNumber') required String empNumber,
    @JsonKey(name: 'CompanyAdministrator') required String companyAdministrator,
    @JsonKey(name: 'FingerNumber') required int fingerNumber,
    @JsonKey(name: 'UserStatus') required String userStatus,
    @JsonKey(name: 'PasswordChangeDate') required String passwordChangeDate,
    @JsonKey(name: 'InvalidAccessAttempts') required int invalidAccessAttempts,
    @JsonKey(name: 'LockedOutTime') required String lockedOutTime,
    @JsonKey(name: 'PasswordChangeOnNextLogin') required bool passwordChangeOnNextLogin,
    @JsonKey(name: 'Email') required String email,
    @JsonKey(name: 'IsActive') required bool isActive,
    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'CreationDate') required String creationDate,
    @JsonKey(name: 'LastUpdatedBy') required String lastUpdatedBy,
    @JsonKey(name: 'LastUpdatedDate') required String lastUpdatedDate,
    @JsonKey(name: 'Guid') required String guid,
    @JsonKey(name: 'SiteId') required int siteId,
    @JsonKey(name: 'SynchStatus') required bool synchStatus,
    @JsonKey(name: 'DateOfBirth') required String? dateOfBirth,
    @JsonKey(name: 'PhoneNumber') required String phoneNumber,
    @JsonKey(name: 'ShiftConfigurationId') required int shiftConfigurationId,
    @JsonKey(name: 'UserIdentificationTagsDTOList') required List<dynamic> userIdentificationTagsDtoList,
    @JsonKey(name: 'UserPasswordHistoryDTOList') required List<dynamic> userPasswordHistoryDtoList,
    @JsonKey(name: 'IsChangedRecursive') required bool isChangedRecursive,
    @JsonKey(name: 'IsChanged') required bool isChanged,
    @JsonKey(name: 'DataAccessRuleDTO') required DataAccessRuleDto dataAccessRuleDto,
  }) = _GetClockedInUsersData;

  factory GetClockedInUsersData.fromJson(Map<String, dynamic> json) =>
      _$GetClockedInUsersDataFromJson(json);
}
