// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_role_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRoleContainerDTO _$UserRoleContainerDTOFromJson(Map<String, dynamic> json) {
  return _UserRoleContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$UserRoleContainerDTO {
  @JsonKey(name: 'RoleId')
  int get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Role')
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Manager')
  bool get manager => throw _privateConstructorUsedError;
  @JsonKey(name: 'AllowPosAccess')
  String get allowPosAccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataAccessLevel')
  String get dataAccessLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'EnablePOSClockIn')
  bool get enablePosClockIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'CashDrawerRequired')
  bool get cashDrawerRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsManagerRole')
  bool get isManagerRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssignedManagerRoleId')
  int get assignedManagerRoleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriceListId')
  int get priceListId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsSystemRole')
  bool get isSystemRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'ManagementFormAccessContainerDTOList')
  List<ManagementFormAccessContainerDTO>
      get managementFormAccessContainerDTOList =>
          throw _privateConstructorUsedError;
  @JsonKey(name: 'AssignedManagerRoleIdList')
  List<dynamic> get assignedManagerRoleIdList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ExcludedProductIdList')
  List<int> get excludedProductIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExcludedProductMenuPanelIdList')
  List<dynamic> get excludedProductMenuPanelIdList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ShiftConfigurationId')
  int get shiftConfigurationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SelfApprovalAllowed')
  bool get selfApprovalAllowed => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
  List<UserToAttendanceRolesMapContainerDTO>
      get userToAttendanceRolesMapContainerDTOList =>
          throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRoleContainerDTOCopyWith<UserRoleContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleContainerDTOCopyWith<$Res> {
  factory $UserRoleContainerDTOCopyWith(UserRoleContainerDTO value,
          $Res Function(UserRoleContainerDTO) then) =
      _$UserRoleContainerDTOCopyWithImpl<$Res, UserRoleContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'RoleId')
          int roleId,
      @JsonKey(name: 'Role')
          String role,
      @JsonKey(name: 'Description')
          String description,
      @JsonKey(name: 'Manager')
          bool manager,
      @JsonKey(name: 'AllowPosAccess')
          String allowPosAccess,
      @JsonKey(name: 'DataAccessLevel')
          String dataAccessLevel,
      @JsonKey(name: 'EnablePOSClockIn')
          bool enablePosClockIn,
      @JsonKey(name: 'CashDrawerRequired')
          bool cashDrawerRequired,
      @JsonKey(name: 'IsManagerRole')
          bool isManagerRole,
      @JsonKey(name: 'AssignedManagerRoleId')
          int assignedManagerRoleId,
      @JsonKey(name: 'PriceListId')
          int priceListId,
      @JsonKey(name: 'IsSystemRole')
          bool isSystemRole,
      @JsonKey(name: 'ManagementFormAccessContainerDTOList')
          List<ManagementFormAccessContainerDTO>
              managementFormAccessContainerDTOList,
      @JsonKey(name: 'AssignedManagerRoleIdList')
          List<dynamic> assignedManagerRoleIdList,
      @JsonKey(name: 'ExcludedProductIdList')
          List<int> excludedProductIdList,
      @JsonKey(name: 'ExcludedProductMenuPanelIdList')
          List<dynamic> excludedProductMenuPanelIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          int shiftConfigurationId,
      @JsonKey(name: 'SelfApprovalAllowed')
          bool selfApprovalAllowed,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          List<UserToAttendanceRolesMapContainerDTO>
              userToAttendanceRolesMapContainerDTOList});
}

/// @nodoc
class _$UserRoleContainerDTOCopyWithImpl<$Res,
        $Val extends UserRoleContainerDTO>
    implements $UserRoleContainerDTOCopyWith<$Res> {
  _$UserRoleContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = null,
    Object? role = null,
    Object? description = null,
    Object? manager = null,
    Object? allowPosAccess = null,
    Object? dataAccessLevel = null,
    Object? enablePosClockIn = null,
    Object? cashDrawerRequired = null,
    Object? isManagerRole = null,
    Object? assignedManagerRoleId = null,
    Object? priceListId = null,
    Object? isSystemRole = null,
    Object? managementFormAccessContainerDTOList = null,
    Object? assignedManagerRoleIdList = null,
    Object? excludedProductIdList = null,
    Object? excludedProductMenuPanelIdList = null,
    Object? shiftConfigurationId = null,
    Object? selfApprovalAllowed = null,
    Object? userToAttendanceRolesMapContainerDTOList = null,
  }) {
    return _then(_value.copyWith(
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      manager: null == manager
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as bool,
      allowPosAccess: null == allowPosAccess
          ? _value.allowPosAccess
          : allowPosAccess // ignore: cast_nullable_to_non_nullable
              as String,
      dataAccessLevel: null == dataAccessLevel
          ? _value.dataAccessLevel
          : dataAccessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      enablePosClockIn: null == enablePosClockIn
          ? _value.enablePosClockIn
          : enablePosClockIn // ignore: cast_nullable_to_non_nullable
              as bool,
      cashDrawerRequired: null == cashDrawerRequired
          ? _value.cashDrawerRequired
          : cashDrawerRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      isManagerRole: null == isManagerRole
          ? _value.isManagerRole
          : isManagerRole // ignore: cast_nullable_to_non_nullable
              as bool,
      assignedManagerRoleId: null == assignedManagerRoleId
          ? _value.assignedManagerRoleId
          : assignedManagerRoleId // ignore: cast_nullable_to_non_nullable
              as int,
      priceListId: null == priceListId
          ? _value.priceListId
          : priceListId // ignore: cast_nullable_to_non_nullable
              as int,
      isSystemRole: null == isSystemRole
          ? _value.isSystemRole
          : isSystemRole // ignore: cast_nullable_to_non_nullable
              as bool,
      managementFormAccessContainerDTOList: null ==
              managementFormAccessContainerDTOList
          ? _value.managementFormAccessContainerDTOList
          : managementFormAccessContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ManagementFormAccessContainerDTO>,
      assignedManagerRoleIdList: null == assignedManagerRoleIdList
          ? _value.assignedManagerRoleIdList
          : assignedManagerRoleIdList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      excludedProductIdList: null == excludedProductIdList
          ? _value.excludedProductIdList
          : excludedProductIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      excludedProductMenuPanelIdList: null == excludedProductMenuPanelIdList
          ? _value.excludedProductMenuPanelIdList
          : excludedProductMenuPanelIdList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      shiftConfigurationId: null == shiftConfigurationId
          ? _value.shiftConfigurationId
          : shiftConfigurationId // ignore: cast_nullable_to_non_nullable
              as int,
      selfApprovalAllowed: null == selfApprovalAllowed
          ? _value.selfApprovalAllowed
          : selfApprovalAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      userToAttendanceRolesMapContainerDTOList: null ==
              userToAttendanceRolesMapContainerDTOList
          ? _value.userToAttendanceRolesMapContainerDTOList
          : userToAttendanceRolesMapContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<UserToAttendanceRolesMapContainerDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRoleContainerDTOCopyWith<$Res>
    implements $UserRoleContainerDTOCopyWith<$Res> {
  factory _$$_UserRoleContainerDTOCopyWith(_$_UserRoleContainerDTO value,
          $Res Function(_$_UserRoleContainerDTO) then) =
      __$$_UserRoleContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'RoleId')
          int roleId,
      @JsonKey(name: 'Role')
          String role,
      @JsonKey(name: 'Description')
          String description,
      @JsonKey(name: 'Manager')
          bool manager,
      @JsonKey(name: 'AllowPosAccess')
          String allowPosAccess,
      @JsonKey(name: 'DataAccessLevel')
          String dataAccessLevel,
      @JsonKey(name: 'EnablePOSClockIn')
          bool enablePosClockIn,
      @JsonKey(name: 'CashDrawerRequired')
          bool cashDrawerRequired,
      @JsonKey(name: 'IsManagerRole')
          bool isManagerRole,
      @JsonKey(name: 'AssignedManagerRoleId')
          int assignedManagerRoleId,
      @JsonKey(name: 'PriceListId')
          int priceListId,
      @JsonKey(name: 'IsSystemRole')
          bool isSystemRole,
      @JsonKey(name: 'ManagementFormAccessContainerDTOList')
          List<ManagementFormAccessContainerDTO>
              managementFormAccessContainerDTOList,
      @JsonKey(name: 'AssignedManagerRoleIdList')
          List<dynamic> assignedManagerRoleIdList,
      @JsonKey(name: 'ExcludedProductIdList')
          List<int> excludedProductIdList,
      @JsonKey(name: 'ExcludedProductMenuPanelIdList')
          List<dynamic> excludedProductMenuPanelIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          int shiftConfigurationId,
      @JsonKey(name: 'SelfApprovalAllowed')
          bool selfApprovalAllowed,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          List<UserToAttendanceRolesMapContainerDTO>
              userToAttendanceRolesMapContainerDTOList});
}

/// @nodoc
class __$$_UserRoleContainerDTOCopyWithImpl<$Res>
    extends _$UserRoleContainerDTOCopyWithImpl<$Res, _$_UserRoleContainerDTO>
    implements _$$_UserRoleContainerDTOCopyWith<$Res> {
  __$$_UserRoleContainerDTOCopyWithImpl(_$_UserRoleContainerDTO _value,
      $Res Function(_$_UserRoleContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = null,
    Object? role = null,
    Object? description = null,
    Object? manager = null,
    Object? allowPosAccess = null,
    Object? dataAccessLevel = null,
    Object? enablePosClockIn = null,
    Object? cashDrawerRequired = null,
    Object? isManagerRole = null,
    Object? assignedManagerRoleId = null,
    Object? priceListId = null,
    Object? isSystemRole = null,
    Object? managementFormAccessContainerDTOList = null,
    Object? assignedManagerRoleIdList = null,
    Object? excludedProductIdList = null,
    Object? excludedProductMenuPanelIdList = null,
    Object? shiftConfigurationId = null,
    Object? selfApprovalAllowed = null,
    Object? userToAttendanceRolesMapContainerDTOList = null,
  }) {
    return _then(_$_UserRoleContainerDTO(
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      manager: null == manager
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as bool,
      allowPosAccess: null == allowPosAccess
          ? _value.allowPosAccess
          : allowPosAccess // ignore: cast_nullable_to_non_nullable
              as String,
      dataAccessLevel: null == dataAccessLevel
          ? _value.dataAccessLevel
          : dataAccessLevel // ignore: cast_nullable_to_non_nullable
              as String,
      enablePosClockIn: null == enablePosClockIn
          ? _value.enablePosClockIn
          : enablePosClockIn // ignore: cast_nullable_to_non_nullable
              as bool,
      cashDrawerRequired: null == cashDrawerRequired
          ? _value.cashDrawerRequired
          : cashDrawerRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      isManagerRole: null == isManagerRole
          ? _value.isManagerRole
          : isManagerRole // ignore: cast_nullable_to_non_nullable
              as bool,
      assignedManagerRoleId: null == assignedManagerRoleId
          ? _value.assignedManagerRoleId
          : assignedManagerRoleId // ignore: cast_nullable_to_non_nullable
              as int,
      priceListId: null == priceListId
          ? _value.priceListId
          : priceListId // ignore: cast_nullable_to_non_nullable
              as int,
      isSystemRole: null == isSystemRole
          ? _value.isSystemRole
          : isSystemRole // ignore: cast_nullable_to_non_nullable
              as bool,
      managementFormAccessContainerDTOList: null ==
              managementFormAccessContainerDTOList
          ? _value._managementFormAccessContainerDTOList
          : managementFormAccessContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ManagementFormAccessContainerDTO>,
      assignedManagerRoleIdList: null == assignedManagerRoleIdList
          ? _value._assignedManagerRoleIdList
          : assignedManagerRoleIdList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      excludedProductIdList: null == excludedProductIdList
          ? _value._excludedProductIdList
          : excludedProductIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      excludedProductMenuPanelIdList: null == excludedProductMenuPanelIdList
          ? _value._excludedProductMenuPanelIdList
          : excludedProductMenuPanelIdList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      shiftConfigurationId: null == shiftConfigurationId
          ? _value.shiftConfigurationId
          : shiftConfigurationId // ignore: cast_nullable_to_non_nullable
              as int,
      selfApprovalAllowed: null == selfApprovalAllowed
          ? _value.selfApprovalAllowed
          : selfApprovalAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      userToAttendanceRolesMapContainerDTOList: null ==
              userToAttendanceRolesMapContainerDTOList
          ? _value._userToAttendanceRolesMapContainerDTOList
          : userToAttendanceRolesMapContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<UserToAttendanceRolesMapContainerDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRoleContainerDTO implements _UserRoleContainerDTO {
  const _$_UserRoleContainerDTO(
      {@JsonKey(name: 'RoleId')
          required this.roleId,
      @JsonKey(name: 'Role')
          required this.role,
      @JsonKey(name: 'Description')
          required this.description,
      @JsonKey(name: 'Manager')
          required this.manager,
      @JsonKey(name: 'AllowPosAccess')
          required this.allowPosAccess,
      @JsonKey(name: 'DataAccessLevel')
          required this.dataAccessLevel,
      @JsonKey(name: 'EnablePOSClockIn')
          required this.enablePosClockIn,
      @JsonKey(name: 'CashDrawerRequired')
          required this.cashDrawerRequired,
      @JsonKey(name: 'IsManagerRole')
          required this.isManagerRole,
      @JsonKey(name: 'AssignedManagerRoleId')
          required this.assignedManagerRoleId,
      @JsonKey(name: 'PriceListId')
          required this.priceListId,
      @JsonKey(name: 'IsSystemRole')
          required this.isSystemRole,
      @JsonKey(name: 'ManagementFormAccessContainerDTOList')
          required final List<ManagementFormAccessContainerDTO>
              managementFormAccessContainerDTOList,
      @JsonKey(name: 'AssignedManagerRoleIdList')
          required final List<dynamic> assignedManagerRoleIdList,
      @JsonKey(name: 'ExcludedProductIdList')
          required final List<int> excludedProductIdList,
      @JsonKey(name: 'ExcludedProductMenuPanelIdList')
          required final List<dynamic> excludedProductMenuPanelIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          required this.shiftConfigurationId,
      @JsonKey(name: 'SelfApprovalAllowed')
          required this.selfApprovalAllowed,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          required final List<UserToAttendanceRolesMapContainerDTO>
              userToAttendanceRolesMapContainerDTOList})
      : _managementFormAccessContainerDTOList =
            managementFormAccessContainerDTOList,
        _assignedManagerRoleIdList = assignedManagerRoleIdList,
        _excludedProductIdList = excludedProductIdList,
        _excludedProductMenuPanelIdList = excludedProductMenuPanelIdList,
        _userToAttendanceRolesMapContainerDTOList =
            userToAttendanceRolesMapContainerDTOList;

  factory _$_UserRoleContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserRoleContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'RoleId')
  final int roleId;
  @override
  @JsonKey(name: 'Role')
  final String role;
  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'Manager')
  final bool manager;
  @override
  @JsonKey(name: 'AllowPosAccess')
  final String allowPosAccess;
  @override
  @JsonKey(name: 'DataAccessLevel')
  final String dataAccessLevel;
  @override
  @JsonKey(name: 'EnablePOSClockIn')
  final bool enablePosClockIn;
  @override
  @JsonKey(name: 'CashDrawerRequired')
  final bool cashDrawerRequired;
  @override
  @JsonKey(name: 'IsManagerRole')
  final bool isManagerRole;
  @override
  @JsonKey(name: 'AssignedManagerRoleId')
  final int assignedManagerRoleId;
  @override
  @JsonKey(name: 'PriceListId')
  final int priceListId;
  @override
  @JsonKey(name: 'IsSystemRole')
  final bool isSystemRole;
  final List<ManagementFormAccessContainerDTO>
      _managementFormAccessContainerDTOList;
  @override
  @JsonKey(name: 'ManagementFormAccessContainerDTOList')
  List<ManagementFormAccessContainerDTO>
      get managementFormAccessContainerDTOList {
    if (_managementFormAccessContainerDTOList is EqualUnmodifiableListView)
      return _managementFormAccessContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_managementFormAccessContainerDTOList);
  }

  final List<dynamic> _assignedManagerRoleIdList;
  @override
  @JsonKey(name: 'AssignedManagerRoleIdList')
  List<dynamic> get assignedManagerRoleIdList {
    if (_assignedManagerRoleIdList is EqualUnmodifiableListView)
      return _assignedManagerRoleIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignedManagerRoleIdList);
  }

  final List<int> _excludedProductIdList;
  @override
  @JsonKey(name: 'ExcludedProductIdList')
  List<int> get excludedProductIdList {
    if (_excludedProductIdList is EqualUnmodifiableListView)
      return _excludedProductIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedProductIdList);
  }

  final List<dynamic> _excludedProductMenuPanelIdList;
  @override
  @JsonKey(name: 'ExcludedProductMenuPanelIdList')
  List<dynamic> get excludedProductMenuPanelIdList {
    if (_excludedProductMenuPanelIdList is EqualUnmodifiableListView)
      return _excludedProductMenuPanelIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excludedProductMenuPanelIdList);
  }

  @override
  @JsonKey(name: 'ShiftConfigurationId')
  final int shiftConfigurationId;
  @override
  @JsonKey(name: 'SelfApprovalAllowed')
  final bool selfApprovalAllowed;
  final List<UserToAttendanceRolesMapContainerDTO>
      _userToAttendanceRolesMapContainerDTOList;
  @override
  @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
  List<UserToAttendanceRolesMapContainerDTO>
      get userToAttendanceRolesMapContainerDTOList {
    if (_userToAttendanceRolesMapContainerDTOList is EqualUnmodifiableListView)
      return _userToAttendanceRolesMapContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userToAttendanceRolesMapContainerDTOList);
  }

  @override
  String toString() {
    return 'UserRoleContainerDTO(roleId: $roleId, role: $role, description: $description, manager: $manager, allowPosAccess: $allowPosAccess, dataAccessLevel: $dataAccessLevel, enablePosClockIn: $enablePosClockIn, cashDrawerRequired: $cashDrawerRequired, isManagerRole: $isManagerRole, assignedManagerRoleId: $assignedManagerRoleId, priceListId: $priceListId, isSystemRole: $isSystemRole, managementFormAccessContainerDTOList: $managementFormAccessContainerDTOList, assignedManagerRoleIdList: $assignedManagerRoleIdList, excludedProductIdList: $excludedProductIdList, excludedProductMenuPanelIdList: $excludedProductMenuPanelIdList, shiftConfigurationId: $shiftConfigurationId, selfApprovalAllowed: $selfApprovalAllowed, userToAttendanceRolesMapContainerDTOList: $userToAttendanceRolesMapContainerDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRoleContainerDTO &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.manager, manager) || other.manager == manager) &&
            (identical(other.allowPosAccess, allowPosAccess) ||
                other.allowPosAccess == allowPosAccess) &&
            (identical(other.dataAccessLevel, dataAccessLevel) ||
                other.dataAccessLevel == dataAccessLevel) &&
            (identical(other.enablePosClockIn, enablePosClockIn) ||
                other.enablePosClockIn == enablePosClockIn) &&
            (identical(other.cashDrawerRequired, cashDrawerRequired) ||
                other.cashDrawerRequired == cashDrawerRequired) &&
            (identical(other.isManagerRole, isManagerRole) ||
                other.isManagerRole == isManagerRole) &&
            (identical(other.assignedManagerRoleId, assignedManagerRoleId) ||
                other.assignedManagerRoleId == assignedManagerRoleId) &&
            (identical(other.priceListId, priceListId) ||
                other.priceListId == priceListId) &&
            (identical(other.isSystemRole, isSystemRole) ||
                other.isSystemRole == isSystemRole) &&
            const DeepCollectionEquality().equals(
                other._managementFormAccessContainerDTOList,
                _managementFormAccessContainerDTOList) &&
            const DeepCollectionEquality().equals(
                other._assignedManagerRoleIdList, _assignedManagerRoleIdList) &&
            const DeepCollectionEquality()
                .equals(other._excludedProductIdList, _excludedProductIdList) &&
            const DeepCollectionEquality().equals(
                other._excludedProductMenuPanelIdList,
                _excludedProductMenuPanelIdList) &&
            (identical(other.shiftConfigurationId, shiftConfigurationId) ||
                other.shiftConfigurationId == shiftConfigurationId) &&
            (identical(other.selfApprovalAllowed, selfApprovalAllowed) ||
                other.selfApprovalAllowed == selfApprovalAllowed) &&
            const DeepCollectionEquality().equals(
                other._userToAttendanceRolesMapContainerDTOList,
                _userToAttendanceRolesMapContainerDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        roleId,
        role,
        description,
        manager,
        allowPosAccess,
        dataAccessLevel,
        enablePosClockIn,
        cashDrawerRequired,
        isManagerRole,
        assignedManagerRoleId,
        priceListId,
        isSystemRole,
        const DeepCollectionEquality()
            .hash(_managementFormAccessContainerDTOList),
        const DeepCollectionEquality().hash(_assignedManagerRoleIdList),
        const DeepCollectionEquality().hash(_excludedProductIdList),
        const DeepCollectionEquality().hash(_excludedProductMenuPanelIdList),
        shiftConfigurationId,
        selfApprovalAllowed,
        const DeepCollectionEquality()
            .hash(_userToAttendanceRolesMapContainerDTOList)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRoleContainerDTOCopyWith<_$_UserRoleContainerDTO> get copyWith =>
      __$$_UserRoleContainerDTOCopyWithImpl<_$_UserRoleContainerDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRoleContainerDTOToJson(
      this,
    );
  }
}

abstract class _UserRoleContainerDTO implements UserRoleContainerDTO {
  const factory _UserRoleContainerDTO(
          {@JsonKey(name: 'RoleId')
              required final int roleId,
          @JsonKey(name: 'Role')
              required final String role,
          @JsonKey(name: 'Description')
              required final String description,
          @JsonKey(name: 'Manager')
              required final bool manager,
          @JsonKey(name: 'AllowPosAccess')
              required final String allowPosAccess,
          @JsonKey(name: 'DataAccessLevel')
              required final String dataAccessLevel,
          @JsonKey(name: 'EnablePOSClockIn')
              required final bool enablePosClockIn,
          @JsonKey(name: 'CashDrawerRequired')
              required final bool cashDrawerRequired,
          @JsonKey(name: 'IsManagerRole')
              required final bool isManagerRole,
          @JsonKey(name: 'AssignedManagerRoleId')
              required final int assignedManagerRoleId,
          @JsonKey(name: 'PriceListId')
              required final int priceListId,
          @JsonKey(name: 'IsSystemRole')
              required final bool isSystemRole,
          @JsonKey(name: 'ManagementFormAccessContainerDTOList')
              required final List<ManagementFormAccessContainerDTO>
                  managementFormAccessContainerDTOList,
          @JsonKey(name: 'AssignedManagerRoleIdList')
              required final List<dynamic> assignedManagerRoleIdList,
          @JsonKey(name: 'ExcludedProductIdList')
              required final List<int> excludedProductIdList,
          @JsonKey(name: 'ExcludedProductMenuPanelIdList')
              required final List<dynamic> excludedProductMenuPanelIdList,
          @JsonKey(name: 'ShiftConfigurationId')
              required final int shiftConfigurationId,
          @JsonKey(name: 'SelfApprovalAllowed')
              required final bool selfApprovalAllowed,
          @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
              required final List<UserToAttendanceRolesMapContainerDTO>
                  userToAttendanceRolesMapContainerDTOList}) =
      _$_UserRoleContainerDTO;

  factory _UserRoleContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_UserRoleContainerDTO.fromJson;

  @override
  @JsonKey(name: 'RoleId')
  int get roleId;
  @override
  @JsonKey(name: 'Role')
  String get role;
  @override
  @JsonKey(name: 'Description')
  String get description;
  @override
  @JsonKey(name: 'Manager')
  bool get manager;
  @override
  @JsonKey(name: 'AllowPosAccess')
  String get allowPosAccess;
  @override
  @JsonKey(name: 'DataAccessLevel')
  String get dataAccessLevel;
  @override
  @JsonKey(name: 'EnablePOSClockIn')
  bool get enablePosClockIn;
  @override
  @JsonKey(name: 'CashDrawerRequired')
  bool get cashDrawerRequired;
  @override
  @JsonKey(name: 'IsManagerRole')
  bool get isManagerRole;
  @override
  @JsonKey(name: 'AssignedManagerRoleId')
  int get assignedManagerRoleId;
  @override
  @JsonKey(name: 'PriceListId')
  int get priceListId;
  @override
  @JsonKey(name: 'IsSystemRole')
  bool get isSystemRole;
  @override
  @JsonKey(name: 'ManagementFormAccessContainerDTOList')
  List<ManagementFormAccessContainerDTO>
      get managementFormAccessContainerDTOList;
  @override
  @JsonKey(name: 'AssignedManagerRoleIdList')
  List<dynamic> get assignedManagerRoleIdList;
  @override
  @JsonKey(name: 'ExcludedProductIdList')
  List<int> get excludedProductIdList;
  @override
  @JsonKey(name: 'ExcludedProductMenuPanelIdList')
  List<dynamic> get excludedProductMenuPanelIdList;
  @override
  @JsonKey(name: 'ShiftConfigurationId')
  int get shiftConfigurationId;
  @override
  @JsonKey(name: 'SelfApprovalAllowed')
  bool get selfApprovalAllowed;
  @override
  @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
  List<UserToAttendanceRolesMapContainerDTO>
      get userToAttendanceRolesMapContainerDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_UserRoleContainerDTOCopyWith<_$_UserRoleContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
