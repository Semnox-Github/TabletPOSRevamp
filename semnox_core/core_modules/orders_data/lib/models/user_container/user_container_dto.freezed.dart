// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserContainerDTO _$UserContainerDTOFromJson(Map<String, dynamic> json) {
  return _UserContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$UserContainerDTO {
  @JsonKey(name: 'UserId')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RoleId')
  int get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentId')
  int get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserName')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmpLastName')
  String? get empLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'LoginId')
  String? get loginId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ManagerId')
  int get managerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSTypeId')
  int get posTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String get Guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserIdentificationTagContainerDTOList')
  List<dynamic> get userIdentificationTagContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'AttendanceRoleIdList')
  List<dynamic> get attendanceRoleIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShiftConfigurationId')
  int get shiftConfigurationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmpNumber')
  String? get empNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
  List<UserRolesMapContainerDTO> get userToAttendanceRolesMapContainerDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserContainerDTOCopyWith<UserContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserContainerDTOCopyWith<$Res> {
  factory $UserContainerDTOCopyWith(
          UserContainerDTO value, $Res Function(UserContainerDTO) then) =
      _$UserContainerDTOCopyWithImpl<$Res, UserContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId')
          int userId,
      @JsonKey(name: 'RoleId')
          int roleId,
      @JsonKey(name: 'DepartmentId')
          int departmentId,
      @JsonKey(name: 'UserName')
          String userName,
      @JsonKey(name: 'EmpLastName')
          String? empLastName,
      @JsonKey(name: 'LoginId')
          String? loginId,
      @JsonKey(name: 'ManagerId')
          int managerId,
      @JsonKey(name: 'SiteId')
          int siteId,
      @JsonKey(name: 'POSTypeId')
          int posTypeId,
      @JsonKey(name: 'Guid')
          String Guid,
      @JsonKey(name: 'UserIdentificationTagContainerDTOList')
          List<dynamic> userIdentificationTagContainerDTOList,
      @JsonKey(name: 'PhoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'AttendanceRoleIdList')
          List<dynamic> attendanceRoleIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          int shiftConfigurationId,
      @JsonKey(name: 'EmpNumber')
          String? empNumber,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          List<UserRolesMapContainerDTO>
              userToAttendanceRolesMapContainerDTOList});
}

/// @nodoc
class _$UserContainerDTOCopyWithImpl<$Res, $Val extends UserContainerDTO>
    implements $UserContainerDTOCopyWith<$Res> {
  _$UserContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? roleId = null,
    Object? departmentId = null,
    Object? userName = null,
    Object? empLastName = freezed,
    Object? loginId = freezed,
    Object? managerId = null,
    Object? siteId = null,
    Object? posTypeId = null,
    Object? Guid = null,
    Object? userIdentificationTagContainerDTOList = null,
    Object? phoneNumber = freezed,
    Object? attendanceRoleIdList = null,
    Object? shiftConfigurationId = null,
    Object? empNumber = freezed,
    Object? userToAttendanceRolesMapContainerDTOList = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      empLastName: freezed == empLastName
          ? _value.empLastName
          : empLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      loginId: freezed == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String?,
      managerId: null == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      posTypeId: null == posTypeId
          ? _value.posTypeId
          : posTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      Guid: null == Guid
          ? _value.Guid
          : Guid // ignore: cast_nullable_to_non_nullable
              as String,
      userIdentificationTagContainerDTOList: null ==
              userIdentificationTagContainerDTOList
          ? _value.userIdentificationTagContainerDTOList
          : userIdentificationTagContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceRoleIdList: null == attendanceRoleIdList
          ? _value.attendanceRoleIdList
          : attendanceRoleIdList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      shiftConfigurationId: null == shiftConfigurationId
          ? _value.shiftConfigurationId
          : shiftConfigurationId // ignore: cast_nullable_to_non_nullable
              as int,
      empNumber: freezed == empNumber
          ? _value.empNumber
          : empNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userToAttendanceRolesMapContainerDTOList: null ==
              userToAttendanceRolesMapContainerDTOList
          ? _value.userToAttendanceRolesMapContainerDTOList
          : userToAttendanceRolesMapContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<UserRolesMapContainerDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserContainerDTOCopyWith<$Res>
    implements $UserContainerDTOCopyWith<$Res> {
  factory _$$_UserContainerDTOCopyWith(
          _$_UserContainerDTO value, $Res Function(_$_UserContainerDTO) then) =
      __$$_UserContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId')
          int userId,
      @JsonKey(name: 'RoleId')
          int roleId,
      @JsonKey(name: 'DepartmentId')
          int departmentId,
      @JsonKey(name: 'UserName')
          String userName,
      @JsonKey(name: 'EmpLastName')
          String? empLastName,
      @JsonKey(name: 'LoginId')
          String? loginId,
      @JsonKey(name: 'ManagerId')
          int managerId,
      @JsonKey(name: 'SiteId')
          int siteId,
      @JsonKey(name: 'POSTypeId')
          int posTypeId,
      @JsonKey(name: 'Guid')
          String Guid,
      @JsonKey(name: 'UserIdentificationTagContainerDTOList')
          List<dynamic> userIdentificationTagContainerDTOList,
      @JsonKey(name: 'PhoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'AttendanceRoleIdList')
          List<dynamic> attendanceRoleIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          int shiftConfigurationId,
      @JsonKey(name: 'EmpNumber')
          String? empNumber,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          List<UserRolesMapContainerDTO>
              userToAttendanceRolesMapContainerDTOList});
}

/// @nodoc
class __$$_UserContainerDTOCopyWithImpl<$Res>
    extends _$UserContainerDTOCopyWithImpl<$Res, _$_UserContainerDTO>
    implements _$$_UserContainerDTOCopyWith<$Res> {
  __$$_UserContainerDTOCopyWithImpl(
      _$_UserContainerDTO _value, $Res Function(_$_UserContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? roleId = null,
    Object? departmentId = null,
    Object? userName = null,
    Object? empLastName = freezed,
    Object? loginId = freezed,
    Object? managerId = null,
    Object? siteId = null,
    Object? posTypeId = null,
    Object? Guid = null,
    Object? userIdentificationTagContainerDTOList = null,
    Object? phoneNumber = freezed,
    Object? attendanceRoleIdList = null,
    Object? shiftConfigurationId = null,
    Object? empNumber = freezed,
    Object? userToAttendanceRolesMapContainerDTOList = null,
  }) {
    return _then(_$_UserContainerDTO(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      departmentId: null == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      empLastName: freezed == empLastName
          ? _value.empLastName
          : empLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      loginId: freezed == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String?,
      managerId: null == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      posTypeId: null == posTypeId
          ? _value.posTypeId
          : posTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      Guid: null == Guid
          ? _value.Guid
          : Guid // ignore: cast_nullable_to_non_nullable
              as String,
      userIdentificationTagContainerDTOList: null ==
              userIdentificationTagContainerDTOList
          ? _value._userIdentificationTagContainerDTOList
          : userIdentificationTagContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceRoleIdList: null == attendanceRoleIdList
          ? _value._attendanceRoleIdList
          : attendanceRoleIdList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      shiftConfigurationId: null == shiftConfigurationId
          ? _value.shiftConfigurationId
          : shiftConfigurationId // ignore: cast_nullable_to_non_nullable
              as int,
      empNumber: freezed == empNumber
          ? _value.empNumber
          : empNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userToAttendanceRolesMapContainerDTOList: null ==
              userToAttendanceRolesMapContainerDTOList
          ? _value._userToAttendanceRolesMapContainerDTOList
          : userToAttendanceRolesMapContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<UserRolesMapContainerDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserContainerDTO implements _UserContainerDTO {
  const _$_UserContainerDTO(
      {@JsonKey(name: 'UserId')
          required this.userId,
      @JsonKey(name: 'RoleId')
          required this.roleId,
      @JsonKey(name: 'DepartmentId')
          required this.departmentId,
      @JsonKey(name: 'UserName')
          required this.userName,
      @JsonKey(name: 'EmpLastName')
          required this.empLastName,
      @JsonKey(name: 'LoginId')
          required this.loginId,
      @JsonKey(name: 'ManagerId')
          required this.managerId,
      @JsonKey(name: 'SiteId')
          required this.siteId,
      @JsonKey(name: 'POSTypeId')
          required this.posTypeId,
      @JsonKey(name: 'Guid')
          required this.Guid,
      @JsonKey(name: 'UserIdentificationTagContainerDTOList')
          required final List<dynamic> userIdentificationTagContainerDTOList,
      @JsonKey(name: 'PhoneNumber')
          required this.phoneNumber,
      @JsonKey(name: 'AttendanceRoleIdList')
          required final List<dynamic> attendanceRoleIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          required this.shiftConfigurationId,
      @JsonKey(name: 'EmpNumber')
          required this.empNumber,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          required final List<UserRolesMapContainerDTO>
              userToAttendanceRolesMapContainerDTOList})
      : _userIdentificationTagContainerDTOList =
            userIdentificationTagContainerDTOList,
        _attendanceRoleIdList = attendanceRoleIdList,
        _userToAttendanceRolesMapContainerDTOList =
            userToAttendanceRolesMapContainerDTOList;

  factory _$_UserContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'UserId')
  final int userId;
  @override
  @JsonKey(name: 'RoleId')
  final int roleId;
  @override
  @JsonKey(name: 'DepartmentId')
  final int departmentId;
  @override
  @JsonKey(name: 'UserName')
  final String userName;
  @override
  @JsonKey(name: 'EmpLastName')
  final String? empLastName;
  @override
  @JsonKey(name: 'LoginId')
  final String? loginId;
  @override
  @JsonKey(name: 'ManagerId')
  final int managerId;
  @override
  @JsonKey(name: 'SiteId')
  final int siteId;
  @override
  @JsonKey(name: 'POSTypeId')
  final int posTypeId;
  @override
  @JsonKey(name: 'Guid')
  final String Guid;
  final List<dynamic> _userIdentificationTagContainerDTOList;
  @override
  @JsonKey(name: 'UserIdentificationTagContainerDTOList')
  List<dynamic> get userIdentificationTagContainerDTOList {
    if (_userIdentificationTagContainerDTOList is EqualUnmodifiableListView)
      return _userIdentificationTagContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIdentificationTagContainerDTOList);
  }

  @override
  @JsonKey(name: 'PhoneNumber')
  final String? phoneNumber;
  final List<dynamic> _attendanceRoleIdList;
  @override
  @JsonKey(name: 'AttendanceRoleIdList')
  List<dynamic> get attendanceRoleIdList {
    if (_attendanceRoleIdList is EqualUnmodifiableListView)
      return _attendanceRoleIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendanceRoleIdList);
  }

  @override
  @JsonKey(name: 'ShiftConfigurationId')
  final int shiftConfigurationId;
  @override
  @JsonKey(name: 'EmpNumber')
  final String? empNumber;
  final List<UserRolesMapContainerDTO>
      _userToAttendanceRolesMapContainerDTOList;
  @override
  @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
  List<UserRolesMapContainerDTO> get userToAttendanceRolesMapContainerDTOList {
    if (_userToAttendanceRolesMapContainerDTOList is EqualUnmodifiableListView)
      return _userToAttendanceRolesMapContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userToAttendanceRolesMapContainerDTOList);
  }

  @override
  String toString() {
    return 'UserContainerDTO(userId: $userId, roleId: $roleId, departmentId: $departmentId, userName: $userName, empLastName: $empLastName, loginId: $loginId, managerId: $managerId, siteId: $siteId, posTypeId: $posTypeId, Guid: $Guid, userIdentificationTagContainerDTOList: $userIdentificationTagContainerDTOList, phoneNumber: $phoneNumber, attendanceRoleIdList: $attendanceRoleIdList, shiftConfigurationId: $shiftConfigurationId, empNumber: $empNumber, userToAttendanceRolesMapContainerDTOList: $userToAttendanceRolesMapContainerDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserContainerDTO &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.departmentId, departmentId) ||
                other.departmentId == departmentId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.empLastName, empLastName) ||
                other.empLastName == empLastName) &&
            (identical(other.loginId, loginId) || other.loginId == loginId) &&
            (identical(other.managerId, managerId) ||
                other.managerId == managerId) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.posTypeId, posTypeId) ||
                other.posTypeId == posTypeId) &&
            (identical(other.Guid, Guid) || other.Guid == Guid) &&
            const DeepCollectionEquality().equals(
                other._userIdentificationTagContainerDTOList,
                _userIdentificationTagContainerDTOList) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other._attendanceRoleIdList, _attendanceRoleIdList) &&
            (identical(other.shiftConfigurationId, shiftConfigurationId) ||
                other.shiftConfigurationId == shiftConfigurationId) &&
            (identical(other.empNumber, empNumber) ||
                other.empNumber == empNumber) &&
            const DeepCollectionEquality().equals(
                other._userToAttendanceRolesMapContainerDTOList,
                _userToAttendanceRolesMapContainerDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      roleId,
      departmentId,
      userName,
      empLastName,
      loginId,
      managerId,
      siteId,
      posTypeId,
      Guid,
      const DeepCollectionEquality()
          .hash(_userIdentificationTagContainerDTOList),
      phoneNumber,
      const DeepCollectionEquality().hash(_attendanceRoleIdList),
      shiftConfigurationId,
      empNumber,
      const DeepCollectionEquality()
          .hash(_userToAttendanceRolesMapContainerDTOList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserContainerDTOCopyWith<_$_UserContainerDTO> get copyWith =>
      __$$_UserContainerDTOCopyWithImpl<_$_UserContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserContainerDTOToJson(
      this,
    );
  }
}

abstract class _UserContainerDTO implements UserContainerDTO {
  const factory _UserContainerDTO(
      {@JsonKey(name: 'UserId')
          required final int userId,
      @JsonKey(name: 'RoleId')
          required final int roleId,
      @JsonKey(name: 'DepartmentId')
          required final int departmentId,
      @JsonKey(name: 'UserName')
          required final String userName,
      @JsonKey(name: 'EmpLastName')
          required final String? empLastName,
      @JsonKey(name: 'LoginId')
          required final String? loginId,
      @JsonKey(name: 'ManagerId')
          required final int managerId,
      @JsonKey(name: 'SiteId')
          required final int siteId,
      @JsonKey(name: 'POSTypeId')
          required final int posTypeId,
      @JsonKey(name: 'Guid')
          required final String Guid,
      @JsonKey(name: 'UserIdentificationTagContainerDTOList')
          required final List<dynamic> userIdentificationTagContainerDTOList,
      @JsonKey(name: 'PhoneNumber')
          required final String? phoneNumber,
      @JsonKey(name: 'AttendanceRoleIdList')
          required final List<dynamic> attendanceRoleIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          required final int shiftConfigurationId,
      @JsonKey(name: 'EmpNumber')
          required final String? empNumber,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          required final List<UserRolesMapContainerDTO>
              userToAttendanceRolesMapContainerDTOList}) = _$_UserContainerDTO;

  factory _UserContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_UserContainerDTO.fromJson;

  @override
  @JsonKey(name: 'UserId')
  int get userId;
  @override
  @JsonKey(name: 'RoleId')
  int get roleId;
  @override
  @JsonKey(name: 'DepartmentId')
  int get departmentId;
  @override
  @JsonKey(name: 'UserName')
  String get userName;
  @override
  @JsonKey(name: 'EmpLastName')
  String? get empLastName;
  @override
  @JsonKey(name: 'LoginId')
  String? get loginId;
  @override
  @JsonKey(name: 'ManagerId')
  int get managerId;
  @override
  @JsonKey(name: 'SiteId')
  int get siteId;
  @override
  @JsonKey(name: 'POSTypeId')
  int get posTypeId;
  @override
  @JsonKey(name: 'Guid')
  String get Guid;
  @override
  @JsonKey(name: 'UserIdentificationTagContainerDTOList')
  List<dynamic> get userIdentificationTagContainerDTOList;
  @override
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'AttendanceRoleIdList')
  List<dynamic> get attendanceRoleIdList;
  @override
  @JsonKey(name: 'ShiftConfigurationId')
  int get shiftConfigurationId;
  @override
  @JsonKey(name: 'EmpNumber')
  String? get empNumber;
  @override
  @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
  List<UserRolesMapContainerDTO> get userToAttendanceRolesMapContainerDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_UserContainerDTOCopyWith<_$_UserContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
