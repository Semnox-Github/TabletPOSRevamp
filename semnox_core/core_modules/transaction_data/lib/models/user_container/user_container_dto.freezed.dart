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

UserContainerDto _$UserContainerDtoFromJson(Map<String, dynamic> json) {
  return _UserContainerDto.fromJson(json);
}

/// @nodoc
mixin _$UserContainerDto {
  @JsonKey(name: 'UserId')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RoleId')
  int? get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DepartmentId')
  int? get departmentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserName')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmpLastName')
  String? get empLastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'LoginId')
  String? get loginId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ManagerId')
  int? get managerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SiteId')
  int? get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSTypeId')
  int? get posTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String? get guid => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserIdentificationTagContainerDTOList')
  List<UserIdentificationTagContainerDTO>
      get userIdentificationTagContainerDtoList =>
          throw _privateConstructorUsedError;
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'AttendanceRoleIdList')
  List<int> get attendanceRoleIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ShiftConfigurationId')
  int? get shiftConfigurationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'EmpNumber')
  String? get empNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
  List<UserToAttendanceRolesMapContainerDTO>
      get userToAttendanceRolesMapContainerDtoList =>
          throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserContainerDtoCopyWith<UserContainerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserContainerDtoCopyWith<$Res> {
  factory $UserContainerDtoCopyWith(
          UserContainerDto value, $Res Function(UserContainerDto) then) =
      _$UserContainerDtoCopyWithImpl<$Res, UserContainerDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId')
          int? userId,
      @JsonKey(name: 'RoleId')
          int? roleId,
      @JsonKey(name: 'DepartmentId')
          int? departmentId,
      @JsonKey(name: 'UserName')
          String? userName,
      @JsonKey(name: 'EmpLastName')
          String? empLastName,
      @JsonKey(name: 'LoginId')
          String? loginId,
      @JsonKey(name: 'ManagerId')
          int? managerId,
      @JsonKey(name: 'SiteId')
          int? siteId,
      @JsonKey(name: 'POSTypeId')
          int? posTypeId,
      @JsonKey(name: 'Guid')
          String? guid,
      @JsonKey(name: 'UserIdentificationTagContainerDTOList')
          List<UserIdentificationTagContainerDTO>
              userIdentificationTagContainerDtoList,
      @JsonKey(name: 'PhoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'AttendanceRoleIdList')
          List<int> attendanceRoleIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          int? shiftConfigurationId,
      @JsonKey(name: 'EmpNumber')
          String? empNumber,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          List<UserToAttendanceRolesMapContainerDTO>
              userToAttendanceRolesMapContainerDtoList});
}

/// @nodoc
class _$UserContainerDtoCopyWithImpl<$Res, $Val extends UserContainerDto>
    implements $UserContainerDtoCopyWith<$Res> {
  _$UserContainerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? roleId = freezed,
    Object? departmentId = freezed,
    Object? userName = freezed,
    Object? empLastName = freezed,
    Object? loginId = freezed,
    Object? managerId = freezed,
    Object? siteId = freezed,
    Object? posTypeId = freezed,
    Object? guid = freezed,
    Object? userIdentificationTagContainerDtoList = null,
    Object? phoneNumber = freezed,
    Object? attendanceRoleIdList = null,
    Object? shiftConfigurationId = freezed,
    Object? empNumber = freezed,
    Object? userToAttendanceRolesMapContainerDtoList = null,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      empLastName: freezed == empLastName
          ? _value.empLastName
          : empLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      loginId: freezed == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String?,
      managerId: freezed == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      posTypeId: freezed == posTypeId
          ? _value.posTypeId
          : posTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdentificationTagContainerDtoList: null ==
              userIdentificationTagContainerDtoList
          ? _value.userIdentificationTagContainerDtoList
          : userIdentificationTagContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<UserIdentificationTagContainerDTO>,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceRoleIdList: null == attendanceRoleIdList
          ? _value.attendanceRoleIdList
          : attendanceRoleIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      shiftConfigurationId: freezed == shiftConfigurationId
          ? _value.shiftConfigurationId
          : shiftConfigurationId // ignore: cast_nullable_to_non_nullable
              as int?,
      empNumber: freezed == empNumber
          ? _value.empNumber
          : empNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userToAttendanceRolesMapContainerDtoList: null ==
              userToAttendanceRolesMapContainerDtoList
          ? _value.userToAttendanceRolesMapContainerDtoList
          : userToAttendanceRolesMapContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<UserToAttendanceRolesMapContainerDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserContainerDtoCopyWith<$Res>
    implements $UserContainerDtoCopyWith<$Res> {
  factory _$$_UserContainerDtoCopyWith(
          _$_UserContainerDto value, $Res Function(_$_UserContainerDto) then) =
      __$$_UserContainerDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserId')
          int? userId,
      @JsonKey(name: 'RoleId')
          int? roleId,
      @JsonKey(name: 'DepartmentId')
          int? departmentId,
      @JsonKey(name: 'UserName')
          String? userName,
      @JsonKey(name: 'EmpLastName')
          String? empLastName,
      @JsonKey(name: 'LoginId')
          String? loginId,
      @JsonKey(name: 'ManagerId')
          int? managerId,
      @JsonKey(name: 'SiteId')
          int? siteId,
      @JsonKey(name: 'POSTypeId')
          int? posTypeId,
      @JsonKey(name: 'Guid')
          String? guid,
      @JsonKey(name: 'UserIdentificationTagContainerDTOList')
          List<UserIdentificationTagContainerDTO>
              userIdentificationTagContainerDtoList,
      @JsonKey(name: 'PhoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'AttendanceRoleIdList')
          List<int> attendanceRoleIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          int? shiftConfigurationId,
      @JsonKey(name: 'EmpNumber')
          String? empNumber,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          List<UserToAttendanceRolesMapContainerDTO>
              userToAttendanceRolesMapContainerDtoList});
}

/// @nodoc
class __$$_UserContainerDtoCopyWithImpl<$Res>
    extends _$UserContainerDtoCopyWithImpl<$Res, _$_UserContainerDto>
    implements _$$_UserContainerDtoCopyWith<$Res> {
  __$$_UserContainerDtoCopyWithImpl(
      _$_UserContainerDto _value, $Res Function(_$_UserContainerDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? roleId = freezed,
    Object? departmentId = freezed,
    Object? userName = freezed,
    Object? empLastName = freezed,
    Object? loginId = freezed,
    Object? managerId = freezed,
    Object? siteId = freezed,
    Object? posTypeId = freezed,
    Object? guid = freezed,
    Object? userIdentificationTagContainerDtoList = null,
    Object? phoneNumber = freezed,
    Object? attendanceRoleIdList = null,
    Object? shiftConfigurationId = freezed,
    Object? empNumber = freezed,
    Object? userToAttendanceRolesMapContainerDtoList = null,
  }) {
    return _then(_$_UserContainerDto(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      departmentId: freezed == departmentId
          ? _value.departmentId
          : departmentId // ignore: cast_nullable_to_non_nullable
              as int?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      empLastName: freezed == empLastName
          ? _value.empLastName
          : empLastName // ignore: cast_nullable_to_non_nullable
              as String?,
      loginId: freezed == loginId
          ? _value.loginId
          : loginId // ignore: cast_nullable_to_non_nullable
              as String?,
      managerId: freezed == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      siteId: freezed == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int?,
      posTypeId: freezed == posTypeId
          ? _value.posTypeId
          : posTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String?,
      userIdentificationTagContainerDtoList: null ==
              userIdentificationTagContainerDtoList
          ? _value._userIdentificationTagContainerDtoList
          : userIdentificationTagContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<UserIdentificationTagContainerDTO>,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      attendanceRoleIdList: null == attendanceRoleIdList
          ? _value._attendanceRoleIdList
          : attendanceRoleIdList // ignore: cast_nullable_to_non_nullable
              as List<int>,
      shiftConfigurationId: freezed == shiftConfigurationId
          ? _value.shiftConfigurationId
          : shiftConfigurationId // ignore: cast_nullable_to_non_nullable
              as int?,
      empNumber: freezed == empNumber
          ? _value.empNumber
          : empNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      userToAttendanceRolesMapContainerDtoList: null ==
              userToAttendanceRolesMapContainerDtoList
          ? _value._userToAttendanceRolesMapContainerDtoList
          : userToAttendanceRolesMapContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<UserToAttendanceRolesMapContainerDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserContainerDto implements _UserContainerDto {
  const _$_UserContainerDto(
      {@JsonKey(name: 'UserId')
          this.userId,
      @JsonKey(name: 'RoleId')
          this.roleId,
      @JsonKey(name: 'DepartmentId')
          this.departmentId,
      @JsonKey(name: 'UserName')
          this.userName,
      @JsonKey(name: 'EmpLastName')
          this.empLastName,
      @JsonKey(name: 'LoginId')
          this.loginId,
      @JsonKey(name: 'ManagerId')
          this.managerId,
      @JsonKey(name: 'SiteId')
          this.siteId,
      @JsonKey(name: 'POSTypeId')
          this.posTypeId,
      @JsonKey(name: 'Guid')
          this.guid,
      @JsonKey(name: 'UserIdentificationTagContainerDTOList')
          required final List<UserIdentificationTagContainerDTO>
              userIdentificationTagContainerDtoList,
      @JsonKey(name: 'PhoneNumber')
          this.phoneNumber,
      @JsonKey(name: 'AttendanceRoleIdList')
          required final List<int> attendanceRoleIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          this.shiftConfigurationId,
      @JsonKey(name: 'EmpNumber')
          this.empNumber,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          required final List<UserToAttendanceRolesMapContainerDTO>
              userToAttendanceRolesMapContainerDtoList})
      : _userIdentificationTagContainerDtoList =
            userIdentificationTagContainerDtoList,
        _attendanceRoleIdList = attendanceRoleIdList,
        _userToAttendanceRolesMapContainerDtoList =
            userToAttendanceRolesMapContainerDtoList;

  factory _$_UserContainerDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserContainerDtoFromJson(json);

  @override
  @JsonKey(name: 'UserId')
  final int? userId;
  @override
  @JsonKey(name: 'RoleId')
  final int? roleId;
  @override
  @JsonKey(name: 'DepartmentId')
  final int? departmentId;
  @override
  @JsonKey(name: 'UserName')
  final String? userName;
  @override
  @JsonKey(name: 'EmpLastName')
  final String? empLastName;
  @override
  @JsonKey(name: 'LoginId')
  final String? loginId;
  @override
  @JsonKey(name: 'ManagerId')
  final int? managerId;
  @override
  @JsonKey(name: 'SiteId')
  final int? siteId;
  @override
  @JsonKey(name: 'POSTypeId')
  final int? posTypeId;
  @override
  @JsonKey(name: 'Guid')
  final String? guid;
  final List<UserIdentificationTagContainerDTO>
      _userIdentificationTagContainerDtoList;
  @override
  @JsonKey(name: 'UserIdentificationTagContainerDTOList')
  List<UserIdentificationTagContainerDTO>
      get userIdentificationTagContainerDtoList {
    if (_userIdentificationTagContainerDtoList is EqualUnmodifiableListView)
      return _userIdentificationTagContainerDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userIdentificationTagContainerDtoList);
  }

  @override
  @JsonKey(name: 'PhoneNumber')
  final String? phoneNumber;
  final List<int> _attendanceRoleIdList;
  @override
  @JsonKey(name: 'AttendanceRoleIdList')
  List<int> get attendanceRoleIdList {
    if (_attendanceRoleIdList is EqualUnmodifiableListView)
      return _attendanceRoleIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendanceRoleIdList);
  }

  @override
  @JsonKey(name: 'ShiftConfigurationId')
  final int? shiftConfigurationId;
  @override
  @JsonKey(name: 'EmpNumber')
  final String? empNumber;
  final List<UserToAttendanceRolesMapContainerDTO>
      _userToAttendanceRolesMapContainerDtoList;
  @override
  @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
  List<UserToAttendanceRolesMapContainerDTO>
      get userToAttendanceRolesMapContainerDtoList {
    if (_userToAttendanceRolesMapContainerDtoList is EqualUnmodifiableListView)
      return _userToAttendanceRolesMapContainerDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userToAttendanceRolesMapContainerDtoList);
  }

  @override
  String toString() {
    return 'UserContainerDto(userId: $userId, roleId: $roleId, departmentId: $departmentId, userName: $userName, empLastName: $empLastName, loginId: $loginId, managerId: $managerId, siteId: $siteId, posTypeId: $posTypeId, guid: $guid, userIdentificationTagContainerDtoList: $userIdentificationTagContainerDtoList, phoneNumber: $phoneNumber, attendanceRoleIdList: $attendanceRoleIdList, shiftConfigurationId: $shiftConfigurationId, empNumber: $empNumber, userToAttendanceRolesMapContainerDtoList: $userToAttendanceRolesMapContainerDtoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserContainerDto &&
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
            (identical(other.guid, guid) || other.guid == guid) &&
            const DeepCollectionEquality().equals(
                other._userIdentificationTagContainerDtoList,
                _userIdentificationTagContainerDtoList) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other._attendanceRoleIdList, _attendanceRoleIdList) &&
            (identical(other.shiftConfigurationId, shiftConfigurationId) ||
                other.shiftConfigurationId == shiftConfigurationId) &&
            (identical(other.empNumber, empNumber) ||
                other.empNumber == empNumber) &&
            const DeepCollectionEquality().equals(
                other._userToAttendanceRolesMapContainerDtoList,
                _userToAttendanceRolesMapContainerDtoList));
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
      guid,
      const DeepCollectionEquality()
          .hash(_userIdentificationTagContainerDtoList),
      phoneNumber,
      const DeepCollectionEquality().hash(_attendanceRoleIdList),
      shiftConfigurationId,
      empNumber,
      const DeepCollectionEquality()
          .hash(_userToAttendanceRolesMapContainerDtoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserContainerDtoCopyWith<_$_UserContainerDto> get copyWith =>
      __$$_UserContainerDtoCopyWithImpl<_$_UserContainerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserContainerDtoToJson(
      this,
    );
  }
}

abstract class _UserContainerDto implements UserContainerDto {
  const factory _UserContainerDto(
      {@JsonKey(name: 'UserId')
          final int? userId,
      @JsonKey(name: 'RoleId')
          final int? roleId,
      @JsonKey(name: 'DepartmentId')
          final int? departmentId,
      @JsonKey(name: 'UserName')
          final String? userName,
      @JsonKey(name: 'EmpLastName')
          final String? empLastName,
      @JsonKey(name: 'LoginId')
          final String? loginId,
      @JsonKey(name: 'ManagerId')
          final int? managerId,
      @JsonKey(name: 'SiteId')
          final int? siteId,
      @JsonKey(name: 'POSTypeId')
          final int? posTypeId,
      @JsonKey(name: 'Guid')
          final String? guid,
      @JsonKey(name: 'UserIdentificationTagContainerDTOList')
          required final List<UserIdentificationTagContainerDTO>
              userIdentificationTagContainerDtoList,
      @JsonKey(name: 'PhoneNumber')
          final String? phoneNumber,
      @JsonKey(name: 'AttendanceRoleIdList')
          required final List<int> attendanceRoleIdList,
      @JsonKey(name: 'ShiftConfigurationId')
          final int? shiftConfigurationId,
      @JsonKey(name: 'EmpNumber')
          final String? empNumber,
      @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
          required final List<UserToAttendanceRolesMapContainerDTO>
              userToAttendanceRolesMapContainerDtoList}) = _$_UserContainerDto;

  factory _UserContainerDto.fromJson(Map<String, dynamic> json) =
      _$_UserContainerDto.fromJson;

  @override
  @JsonKey(name: 'UserId')
  int? get userId;
  @override
  @JsonKey(name: 'RoleId')
  int? get roleId;
  @override
  @JsonKey(name: 'DepartmentId')
  int? get departmentId;
  @override
  @JsonKey(name: 'UserName')
  String? get userName;
  @override
  @JsonKey(name: 'EmpLastName')
  String? get empLastName;
  @override
  @JsonKey(name: 'LoginId')
  String? get loginId;
  @override
  @JsonKey(name: 'ManagerId')
  int? get managerId;
  @override
  @JsonKey(name: 'SiteId')
  int? get siteId;
  @override
  @JsonKey(name: 'POSTypeId')
  int? get posTypeId;
  @override
  @JsonKey(name: 'Guid')
  String? get guid;
  @override
  @JsonKey(name: 'UserIdentificationTagContainerDTOList')
  List<UserIdentificationTagContainerDTO>
      get userIdentificationTagContainerDtoList;
  @override
  @JsonKey(name: 'PhoneNumber')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'AttendanceRoleIdList')
  List<int> get attendanceRoleIdList;
  @override
  @JsonKey(name: 'ShiftConfigurationId')
  int? get shiftConfigurationId;
  @override
  @JsonKey(name: 'EmpNumber')
  String? get empNumber;
  @override
  @JsonKey(name: 'UserToAttendanceRolesMapContainerDTOList')
  List<UserToAttendanceRolesMapContainerDTO>
      get userToAttendanceRolesMapContainerDtoList;
  @override
  @JsonKey(ignore: true)
  _$$_UserContainerDtoCopyWith<_$_UserContainerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
