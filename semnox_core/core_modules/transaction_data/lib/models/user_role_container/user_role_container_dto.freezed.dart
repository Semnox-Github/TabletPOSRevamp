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

UserRoleContanierDTO _$UserRoleContanierDTOFromJson(Map<String, dynamic> json) {
  return _UserRoleContanierDTO.fromJson(json);
}

/// @nodoc
mixin _$UserRoleContanierDTO {
  @JsonKey(name: 'RoleId')
  int? get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Role')
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'Manager')
  bool? get manager => throw _privateConstructorUsedError;
  @JsonKey(name: 'AllowPosAccess')
  String? get allowPosAccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'DataAccessLevel')
  String? get dataAccessLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'EnablePOSClockIn')
  bool? get enablePosClockIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'CashDrawerRequired')
  bool? get cashDrawerRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsManagerRole')
  bool? get isManagerRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'AssignedManagerRoleId')
  int? get assignedManagerRoleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriceListId')
  int? get priceListId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsSystemRole')
  bool? get isSystemRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'ManagementFormAccessContainerDTOList')
  List<ManagementFormAccessContainerDto>
      get managementFormAccessContainerDtoList =>
          throw _privateConstructorUsedError;
  @JsonKey(name: 'AssignedManagerRoleIdList')
  List<dynamic> get assignedManagerRoleIdList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ExcludedProductIdList')
  List<dynamic> get excludedProductIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExcludedProductMenuPanelIdList')
  List<dynamic> get excludedProductMenuPanelIdList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ShiftConfigurationId')
  int get shiftConfigurationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SelfApprovalAllowed')
  bool get selfApprovalAllowed => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
  List<dynamic> get userToAttendanceRolesMapContainerDtoList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRoleContanierDTOCopyWith<UserRoleContanierDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleContanierDTOCopyWith<$Res> {
  factory $UserRoleContanierDTOCopyWith(UserRoleContanierDTO value,
          $Res Function(UserRoleContanierDTO) then) =
      _$UserRoleContanierDTOCopyWithImpl<$Res, UserRoleContanierDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'RoleId')
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
          List<ManagementFormAccessContainerDto>
              managementFormAccessContainerDtoList,
      @JsonKey(name: 'AssignedManagerRoleIdList')
          List<dynamic> assignedManagerRoleIdList,
      @JsonKey(name: 'ExcludedProductIdList')
          List<dynamic> excludedProductIdList,
      @JsonKey(name: 'ExcludedProductMenuPanelIdList')
          List<dynamic> excludedProductMenuPanelIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          int shiftConfigurationId,
      @JsonKey(name: 'SelfApprovalAllowed')
          bool selfApprovalAllowed,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          List<dynamic> userToAttendanceRolesMapContainerDtoList});
}

/// @nodoc
class _$UserRoleContanierDTOCopyWithImpl<$Res,
        $Val extends UserRoleContanierDTO>
    implements $UserRoleContanierDTOCopyWith<$Res> {
  _$UserRoleContanierDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = freezed,
    Object? role = freezed,
    Object? description = freezed,
    Object? manager = freezed,
    Object? allowPosAccess = freezed,
    Object? dataAccessLevel = freezed,
    Object? enablePosClockIn = freezed,
    Object? cashDrawerRequired = freezed,
    Object? isManagerRole = freezed,
    Object? assignedManagerRoleId = freezed,
    Object? priceListId = freezed,
    Object? isSystemRole = freezed,
    Object? managementFormAccessContainerDtoList = null,
    Object? assignedManagerRoleIdList = null,
    Object? excludedProductIdList = null,
    Object? excludedProductMenuPanelIdList = null,
    Object? shiftConfigurationId = null,
    Object? selfApprovalAllowed = null,
    Object? userToAttendanceRolesMapContainerDtoList = null,
  }) {
    return _then(_value.copyWith(
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      manager: freezed == manager
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowPosAccess: freezed == allowPosAccess
          ? _value.allowPosAccess
          : allowPosAccess // ignore: cast_nullable_to_non_nullable
              as String?,
      dataAccessLevel: freezed == dataAccessLevel
          ? _value.dataAccessLevel
          : dataAccessLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      enablePosClockIn: freezed == enablePosClockIn
          ? _value.enablePosClockIn
          : enablePosClockIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      cashDrawerRequired: freezed == cashDrawerRequired
          ? _value.cashDrawerRequired
          : cashDrawerRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      isManagerRole: freezed == isManagerRole
          ? _value.isManagerRole
          : isManagerRole // ignore: cast_nullable_to_non_nullable
              as bool?,
      assignedManagerRoleId: freezed == assignedManagerRoleId
          ? _value.assignedManagerRoleId
          : assignedManagerRoleId // ignore: cast_nullable_to_non_nullable
              as int?,
      priceListId: freezed == priceListId
          ? _value.priceListId
          : priceListId // ignore: cast_nullable_to_non_nullable
              as int?,
      isSystemRole: freezed == isSystemRole
          ? _value.isSystemRole
          : isSystemRole // ignore: cast_nullable_to_non_nullable
              as bool?,
      managementFormAccessContainerDtoList: null ==
              managementFormAccessContainerDtoList
          ? _value.managementFormAccessContainerDtoList
          : managementFormAccessContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<ManagementFormAccessContainerDto>,
      assignedManagerRoleIdList: null == assignedManagerRoleIdList
          ? _value.assignedManagerRoleIdList
          : assignedManagerRoleIdList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      excludedProductIdList: null == excludedProductIdList
          ? _value.excludedProductIdList
          : excludedProductIdList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
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
      userToAttendanceRolesMapContainerDtoList: null ==
              userToAttendanceRolesMapContainerDtoList
          ? _value.userToAttendanceRolesMapContainerDtoList
          : userToAttendanceRolesMapContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRoleContanierDTOCopyWith<$Res>
    implements $UserRoleContanierDTOCopyWith<$Res> {
  factory _$$_UserRoleContanierDTOCopyWith(_$_UserRoleContanierDTO value,
          $Res Function(_$_UserRoleContanierDTO) then) =
      __$$_UserRoleContanierDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'RoleId')
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
          List<ManagementFormAccessContainerDto>
              managementFormAccessContainerDtoList,
      @JsonKey(name: 'AssignedManagerRoleIdList')
          List<dynamic> assignedManagerRoleIdList,
      @JsonKey(name: 'ExcludedProductIdList')
          List<dynamic> excludedProductIdList,
      @JsonKey(name: 'ExcludedProductMenuPanelIdList')
          List<dynamic> excludedProductMenuPanelIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          int shiftConfigurationId,
      @JsonKey(name: 'SelfApprovalAllowed')
          bool selfApprovalAllowed,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          List<dynamic> userToAttendanceRolesMapContainerDtoList});
}

/// @nodoc
class __$$_UserRoleContanierDTOCopyWithImpl<$Res>
    extends _$UserRoleContanierDTOCopyWithImpl<$Res, _$_UserRoleContanierDTO>
    implements _$$_UserRoleContanierDTOCopyWith<$Res> {
  __$$_UserRoleContanierDTOCopyWithImpl(_$_UserRoleContanierDTO _value,
      $Res Function(_$_UserRoleContanierDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleId = freezed,
    Object? role = freezed,
    Object? description = freezed,
    Object? manager = freezed,
    Object? allowPosAccess = freezed,
    Object? dataAccessLevel = freezed,
    Object? enablePosClockIn = freezed,
    Object? cashDrawerRequired = freezed,
    Object? isManagerRole = freezed,
    Object? assignedManagerRoleId = freezed,
    Object? priceListId = freezed,
    Object? isSystemRole = freezed,
    Object? managementFormAccessContainerDtoList = null,
    Object? assignedManagerRoleIdList = null,
    Object? excludedProductIdList = null,
    Object? excludedProductMenuPanelIdList = null,
    Object? shiftConfigurationId = null,
    Object? selfApprovalAllowed = null,
    Object? userToAttendanceRolesMapContainerDtoList = null,
  }) {
    return _then(_$_UserRoleContanierDTO(
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      manager: freezed == manager
          ? _value.manager
          : manager // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowPosAccess: freezed == allowPosAccess
          ? _value.allowPosAccess
          : allowPosAccess // ignore: cast_nullable_to_non_nullable
              as String?,
      dataAccessLevel: freezed == dataAccessLevel
          ? _value.dataAccessLevel
          : dataAccessLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      enablePosClockIn: freezed == enablePosClockIn
          ? _value.enablePosClockIn
          : enablePosClockIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      cashDrawerRequired: freezed == cashDrawerRequired
          ? _value.cashDrawerRequired
          : cashDrawerRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      isManagerRole: freezed == isManagerRole
          ? _value.isManagerRole
          : isManagerRole // ignore: cast_nullable_to_non_nullable
              as bool?,
      assignedManagerRoleId: freezed == assignedManagerRoleId
          ? _value.assignedManagerRoleId
          : assignedManagerRoleId // ignore: cast_nullable_to_non_nullable
              as int?,
      priceListId: freezed == priceListId
          ? _value.priceListId
          : priceListId // ignore: cast_nullable_to_non_nullable
              as int?,
      isSystemRole: freezed == isSystemRole
          ? _value.isSystemRole
          : isSystemRole // ignore: cast_nullable_to_non_nullable
              as bool?,
      managementFormAccessContainerDtoList: null ==
              managementFormAccessContainerDtoList
          ? _value._managementFormAccessContainerDtoList
          : managementFormAccessContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<ManagementFormAccessContainerDto>,
      assignedManagerRoleIdList: null == assignedManagerRoleIdList
          ? _value._assignedManagerRoleIdList
          : assignedManagerRoleIdList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      excludedProductIdList: null == excludedProductIdList
          ? _value._excludedProductIdList
          : excludedProductIdList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
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
      userToAttendanceRolesMapContainerDtoList: null ==
              userToAttendanceRolesMapContainerDtoList
          ? _value._userToAttendanceRolesMapContainerDtoList
          : userToAttendanceRolesMapContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRoleContanierDTO implements _UserRoleContanierDTO {
  const _$_UserRoleContanierDTO(
      {@JsonKey(name: 'RoleId')
          this.roleId,
      @JsonKey(name: 'Role')
          this.role,
      @JsonKey(name: 'Description')
          this.description,
      @JsonKey(name: 'Manager')
          this.manager,
      @JsonKey(name: 'AllowPosAccess')
          this.allowPosAccess,
      @JsonKey(name: 'DataAccessLevel')
          this.dataAccessLevel,
      @JsonKey(name: 'EnablePOSClockIn')
          this.enablePosClockIn,
      @JsonKey(name: 'CashDrawerRequired')
          this.cashDrawerRequired,
      @JsonKey(name: 'IsManagerRole')
          this.isManagerRole,
      @JsonKey(name: 'AssignedManagerRoleId')
          this.assignedManagerRoleId,
      @JsonKey(name: 'PriceListId')
          this.priceListId,
      @JsonKey(name: 'IsSystemRole')
          this.isSystemRole,
      @JsonKey(name: 'ManagementFormAccessContainerDTOList')
          required final List<ManagementFormAccessContainerDto>
              managementFormAccessContainerDtoList,
      @JsonKey(name: 'AssignedManagerRoleIdList')
          required final List<dynamic> assignedManagerRoleIdList,
      @JsonKey(name: 'ExcludedProductIdList')
          required final List<dynamic> excludedProductIdList,
      @JsonKey(name: 'ExcludedProductMenuPanelIdList')
          required final List<dynamic> excludedProductMenuPanelIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          required this.shiftConfigurationId,
      @JsonKey(name: 'SelfApprovalAllowed')
          required this.selfApprovalAllowed,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          required final List<dynamic>
              userToAttendanceRolesMapContainerDtoList})
      : _managementFormAccessContainerDtoList =
            managementFormAccessContainerDtoList,
        _assignedManagerRoleIdList = assignedManagerRoleIdList,
        _excludedProductIdList = excludedProductIdList,
        _excludedProductMenuPanelIdList = excludedProductMenuPanelIdList,
        _userToAttendanceRolesMapContainerDtoList =
            userToAttendanceRolesMapContainerDtoList;

  factory _$_UserRoleContanierDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserRoleContanierDTOFromJson(json);

  @override
  @JsonKey(name: 'RoleId')
  final int? roleId;
  @override
  @JsonKey(name: 'Role')
  final String? role;
  @override
  @JsonKey(name: 'Description')
  final String? description;
  @override
  @JsonKey(name: 'Manager')
  final bool? manager;
  @override
  @JsonKey(name: 'AllowPosAccess')
  final String? allowPosAccess;
  @override
  @JsonKey(name: 'DataAccessLevel')
  final String? dataAccessLevel;
  @override
  @JsonKey(name: 'EnablePOSClockIn')
  final bool? enablePosClockIn;
  @override
  @JsonKey(name: 'CashDrawerRequired')
  final bool? cashDrawerRequired;
  @override
  @JsonKey(name: 'IsManagerRole')
  final bool? isManagerRole;
  @override
  @JsonKey(name: 'AssignedManagerRoleId')
  final int? assignedManagerRoleId;
  @override
  @JsonKey(name: 'PriceListId')
  final int? priceListId;
  @override
  @JsonKey(name: 'IsSystemRole')
  final bool? isSystemRole;
  final List<ManagementFormAccessContainerDto>
      _managementFormAccessContainerDtoList;
  @override
  @JsonKey(name: 'ManagementFormAccessContainerDTOList')
  List<ManagementFormAccessContainerDto>
      get managementFormAccessContainerDtoList {
    if (_managementFormAccessContainerDtoList is EqualUnmodifiableListView)
      return _managementFormAccessContainerDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_managementFormAccessContainerDtoList);
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

  final List<dynamic> _excludedProductIdList;
  @override
  @JsonKey(name: 'ExcludedProductIdList')
  List<dynamic> get excludedProductIdList {
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
  final List<dynamic> _userToAttendanceRolesMapContainerDtoList;
  @override
  @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
  List<dynamic> get userToAttendanceRolesMapContainerDtoList {
    if (_userToAttendanceRolesMapContainerDtoList is EqualUnmodifiableListView)
      return _userToAttendanceRolesMapContainerDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userToAttendanceRolesMapContainerDtoList);
  }

  @override
  String toString() {
    return 'UserRoleContanierDTO(roleId: $roleId, role: $role, description: $description, manager: $manager, allowPosAccess: $allowPosAccess, dataAccessLevel: $dataAccessLevel, enablePosClockIn: $enablePosClockIn, cashDrawerRequired: $cashDrawerRequired, isManagerRole: $isManagerRole, assignedManagerRoleId: $assignedManagerRoleId, priceListId: $priceListId, isSystemRole: $isSystemRole, managementFormAccessContainerDtoList: $managementFormAccessContainerDtoList, assignedManagerRoleIdList: $assignedManagerRoleIdList, excludedProductIdList: $excludedProductIdList, excludedProductMenuPanelIdList: $excludedProductMenuPanelIdList, shiftConfigurationId: $shiftConfigurationId, selfApprovalAllowed: $selfApprovalAllowed, userToAttendanceRolesMapContainerDtoList: $userToAttendanceRolesMapContainerDtoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRoleContanierDTO &&
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
                other._managementFormAccessContainerDtoList,
                _managementFormAccessContainerDtoList) &&
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
                other._userToAttendanceRolesMapContainerDtoList,
                _userToAttendanceRolesMapContainerDtoList));
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
            .hash(_managementFormAccessContainerDtoList),
        const DeepCollectionEquality().hash(_assignedManagerRoleIdList),
        const DeepCollectionEquality().hash(_excludedProductIdList),
        const DeepCollectionEquality().hash(_excludedProductMenuPanelIdList),
        shiftConfigurationId,
        selfApprovalAllowed,
        const DeepCollectionEquality()
            .hash(_userToAttendanceRolesMapContainerDtoList)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRoleContanierDTOCopyWith<_$_UserRoleContanierDTO> get copyWith =>
      __$$_UserRoleContanierDTOCopyWithImpl<_$_UserRoleContanierDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRoleContanierDTOToJson(
      this,
    );
  }
}

abstract class _UserRoleContanierDTO implements UserRoleContanierDTO {
  const factory _UserRoleContanierDTO(
          {@JsonKey(name: 'RoleId')
              final int? roleId,
          @JsonKey(name: 'Role')
              final String? role,
          @JsonKey(name: 'Description')
              final String? description,
          @JsonKey(name: 'Manager')
              final bool? manager,
          @JsonKey(name: 'AllowPosAccess')
              final String? allowPosAccess,
          @JsonKey(name: 'DataAccessLevel')
              final String? dataAccessLevel,
          @JsonKey(name: 'EnablePOSClockIn')
              final bool? enablePosClockIn,
          @JsonKey(name: 'CashDrawerRequired')
              final bool? cashDrawerRequired,
          @JsonKey(name: 'IsManagerRole')
              final bool? isManagerRole,
          @JsonKey(name: 'AssignedManagerRoleId')
              final int? assignedManagerRoleId,
          @JsonKey(name: 'PriceListId')
              final int? priceListId,
          @JsonKey(name: 'IsSystemRole')
              final bool? isSystemRole,
          @JsonKey(name: 'ManagementFormAccessContainerDTOList')
              required final List<ManagementFormAccessContainerDto>
                  managementFormAccessContainerDtoList,
          @JsonKey(name: 'AssignedManagerRoleIdList')
              required final List<dynamic> assignedManagerRoleIdList,
          @JsonKey(name: 'ExcludedProductIdList')
              required final List<dynamic> excludedProductIdList,
          @JsonKey(name: 'ExcludedProductMenuPanelIdList')
              required final List<dynamic> excludedProductMenuPanelIdList,
          @JsonKey(name: 'ShiftConfigurationId')
              required final int shiftConfigurationId,
          @JsonKey(name: 'SelfApprovalAllowed')
              required final bool selfApprovalAllowed,
          @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
              required final List<dynamic>
                  userToAttendanceRolesMapContainerDtoList}) =
      _$_UserRoleContanierDTO;

  factory _UserRoleContanierDTO.fromJson(Map<String, dynamic> json) =
      _$_UserRoleContanierDTO.fromJson;

  @override
  @JsonKey(name: 'RoleId')
  int? get roleId;
  @override
  @JsonKey(name: 'Role')
  String? get role;
  @override
  @JsonKey(name: 'Description')
  String? get description;
  @override
  @JsonKey(name: 'Manager')
  bool? get manager;
  @override
  @JsonKey(name: 'AllowPosAccess')
  String? get allowPosAccess;
  @override
  @JsonKey(name: 'DataAccessLevel')
  String? get dataAccessLevel;
  @override
  @JsonKey(name: 'EnablePOSClockIn')
  bool? get enablePosClockIn;
  @override
  @JsonKey(name: 'CashDrawerRequired')
  bool? get cashDrawerRequired;
  @override
  @JsonKey(name: 'IsManagerRole')
  bool? get isManagerRole;
  @override
  @JsonKey(name: 'AssignedManagerRoleId')
  int? get assignedManagerRoleId;
  @override
  @JsonKey(name: 'PriceListId')
  int? get priceListId;
  @override
  @JsonKey(name: 'IsSystemRole')
  bool? get isSystemRole;
  @override
  @JsonKey(name: 'ManagementFormAccessContainerDTOList')
  List<ManagementFormAccessContainerDto>
      get managementFormAccessContainerDtoList;
  @override
  @JsonKey(name: 'AssignedManagerRoleIdList')
  List<dynamic> get assignedManagerRoleIdList;
  @override
  @JsonKey(name: 'ExcludedProductIdList')
  List<dynamic> get excludedProductIdList;
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
  List<dynamic> get userToAttendanceRolesMapContainerDtoList;
  @override
  @JsonKey(ignore: true)
  _$$_UserRoleContanierDTOCopyWith<_$_UserRoleContanierDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
