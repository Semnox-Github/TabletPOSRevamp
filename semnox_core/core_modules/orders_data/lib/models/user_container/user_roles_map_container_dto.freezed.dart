// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_roles_map_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRolesMapContainerDTO _$UserRolesMapContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _UserRolesMapContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$UserRolesMapContainerDTO {
  @JsonKey(name: 'UserToAttendanceRolesMapId')
  int get userToAttendanceRolesMapId => throw _privateConstructorUsedError;
  @JsonKey(name: 'UserId')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AttendanceRoleId')
  int get attendanceRoleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApprovalRequired')
  bool get approvalRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'EffectiveDate')
  String get effectiveDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndDate')
  dynamic? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'RoleId')
  int get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsDefault')
  bool get isDefault => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRolesMapContainerDTOCopyWith<UserRolesMapContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRolesMapContainerDTOCopyWith<$Res> {
  factory $UserRolesMapContainerDTOCopyWith(UserRolesMapContainerDTO value,
          $Res Function(UserRolesMapContainerDTO) then) =
      _$UserRolesMapContainerDTOCopyWithImpl<$Res, UserRolesMapContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserToAttendanceRolesMapId')
          int userToAttendanceRolesMapId,
      @JsonKey(name: 'UserId')
          int userId,
      @JsonKey(name: 'AttendanceRoleId')
          int attendanceRoleId,
      @JsonKey(name: 'ApprovalRequired')
          bool approvalRequired,
      @JsonKey(name: 'EffectiveDate')
          String effectiveDate,
      @JsonKey(name: 'EndDate')
          dynamic? endDate,
      @JsonKey(name: 'IsActive')
          bool isActive,
      @JsonKey(name: 'RoleId')
          int roleId,
      @JsonKey(name: 'IsDefault')
          bool isDefault});
}

/// @nodoc
class _$UserRolesMapContainerDTOCopyWithImpl<$Res,
        $Val extends UserRolesMapContainerDTO>
    implements $UserRolesMapContainerDTOCopyWith<$Res> {
  _$UserRolesMapContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userToAttendanceRolesMapId = null,
    Object? userId = null,
    Object? attendanceRoleId = null,
    Object? approvalRequired = null,
    Object? effectiveDate = null,
    Object? endDate = freezed,
    Object? isActive = null,
    Object? roleId = null,
    Object? isDefault = null,
  }) {
    return _then(_value.copyWith(
      userToAttendanceRolesMapId: null == userToAttendanceRolesMapId
          ? _value.userToAttendanceRolesMapId
          : userToAttendanceRolesMapId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      attendanceRoleId: null == attendanceRoleId
          ? _value.attendanceRoleId
          : attendanceRoleId // ignore: cast_nullable_to_non_nullable
              as int,
      approvalRequired: null == approvalRequired
          ? _value.approvalRequired
          : approvalRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      effectiveDate: null == effectiveDate
          ? _value.effectiveDate
          : effectiveDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRolesMapContainerDTOCopyWith<$Res>
    implements $UserRolesMapContainerDTOCopyWith<$Res> {
  factory _$$_UserRolesMapContainerDTOCopyWith(
          _$_UserRolesMapContainerDTO value,
          $Res Function(_$_UserRolesMapContainerDTO) then) =
      __$$_UserRolesMapContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserToAttendanceRolesMapId')
          int userToAttendanceRolesMapId,
      @JsonKey(name: 'UserId')
          int userId,
      @JsonKey(name: 'AttendanceRoleId')
          int attendanceRoleId,
      @JsonKey(name: 'ApprovalRequired')
          bool approvalRequired,
      @JsonKey(name: 'EffectiveDate')
          String effectiveDate,
      @JsonKey(name: 'EndDate')
          dynamic? endDate,
      @JsonKey(name: 'IsActive')
          bool isActive,
      @JsonKey(name: 'RoleId')
          int roleId,
      @JsonKey(name: 'IsDefault')
          bool isDefault});
}

/// @nodoc
class __$$_UserRolesMapContainerDTOCopyWithImpl<$Res>
    extends _$UserRolesMapContainerDTOCopyWithImpl<$Res,
        _$_UserRolesMapContainerDTO>
    implements _$$_UserRolesMapContainerDTOCopyWith<$Res> {
  __$$_UserRolesMapContainerDTOCopyWithImpl(_$_UserRolesMapContainerDTO _value,
      $Res Function(_$_UserRolesMapContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userToAttendanceRolesMapId = null,
    Object? userId = null,
    Object? attendanceRoleId = null,
    Object? approvalRequired = null,
    Object? effectiveDate = null,
    Object? endDate = freezed,
    Object? isActive = null,
    Object? roleId = null,
    Object? isDefault = null,
  }) {
    return _then(_$_UserRolesMapContainerDTO(
      userToAttendanceRolesMapId: null == userToAttendanceRolesMapId
          ? _value.userToAttendanceRolesMapId
          : userToAttendanceRolesMapId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      attendanceRoleId: null == attendanceRoleId
          ? _value.attendanceRoleId
          : attendanceRoleId // ignore: cast_nullable_to_non_nullable
              as int,
      approvalRequired: null == approvalRequired
          ? _value.approvalRequired
          : approvalRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      effectiveDate: null == effectiveDate
          ? _value.effectiveDate
          : effectiveDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRolesMapContainerDTO implements _UserRolesMapContainerDTO {
  const _$_UserRolesMapContainerDTO(
      {@JsonKey(name: 'UserToAttendanceRolesMapId')
          required this.userToAttendanceRolesMapId,
      @JsonKey(name: 'UserId')
          required this.userId,
      @JsonKey(name: 'AttendanceRoleId')
          required this.attendanceRoleId,
      @JsonKey(name: 'ApprovalRequired')
          required this.approvalRequired,
      @JsonKey(name: 'EffectiveDate')
          required this.effectiveDate,
      @JsonKey(name: 'EndDate')
          this.endDate,
      @JsonKey(name: 'IsActive')
          required this.isActive,
      @JsonKey(name: 'RoleId')
          required this.roleId,
      @JsonKey(name: 'IsDefault')
          required this.isDefault});

  factory _$_UserRolesMapContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UserRolesMapContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'UserToAttendanceRolesMapId')
  final int userToAttendanceRolesMapId;
  @override
  @JsonKey(name: 'UserId')
  final int userId;
  @override
  @JsonKey(name: 'AttendanceRoleId')
  final int attendanceRoleId;
  @override
  @JsonKey(name: 'ApprovalRequired')
  final bool approvalRequired;
  @override
  @JsonKey(name: 'EffectiveDate')
  final String effectiveDate;
  @override
  @JsonKey(name: 'EndDate')
  final dynamic? endDate;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;
  @override
  @JsonKey(name: 'RoleId')
  final int roleId;
  @override
  @JsonKey(name: 'IsDefault')
  final bool isDefault;

  @override
  String toString() {
    return 'UserRolesMapContainerDTO(userToAttendanceRolesMapId: $userToAttendanceRolesMapId, userId: $userId, attendanceRoleId: $attendanceRoleId, approvalRequired: $approvalRequired, effectiveDate: $effectiveDate, endDate: $endDate, isActive: $isActive, roleId: $roleId, isDefault: $isDefault)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRolesMapContainerDTO &&
            (identical(other.userToAttendanceRolesMapId,
                    userToAttendanceRolesMapId) ||
                other.userToAttendanceRolesMapId ==
                    userToAttendanceRolesMapId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.attendanceRoleId, attendanceRoleId) ||
                other.attendanceRoleId == attendanceRoleId) &&
            (identical(other.approvalRequired, approvalRequired) ||
                other.approvalRequired == approvalRequired) &&
            (identical(other.effectiveDate, effectiveDate) ||
                other.effectiveDate == effectiveDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userToAttendanceRolesMapId,
      userId,
      attendanceRoleId,
      approvalRequired,
      effectiveDate,
      const DeepCollectionEquality().hash(endDate),
      isActive,
      roleId,
      isDefault);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRolesMapContainerDTOCopyWith<_$_UserRolesMapContainerDTO>
      get copyWith => __$$_UserRolesMapContainerDTOCopyWithImpl<
          _$_UserRolesMapContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRolesMapContainerDTOToJson(
      this,
    );
  }
}

abstract class _UserRolesMapContainerDTO implements UserRolesMapContainerDTO {
  const factory _UserRolesMapContainerDTO(
      {@JsonKey(name: 'UserToAttendanceRolesMapId')
          required final int userToAttendanceRolesMapId,
      @JsonKey(name: 'UserId')
          required final int userId,
      @JsonKey(name: 'AttendanceRoleId')
          required final int attendanceRoleId,
      @JsonKey(name: 'ApprovalRequired')
          required final bool approvalRequired,
      @JsonKey(name: 'EffectiveDate')
          required final String effectiveDate,
      @JsonKey(name: 'EndDate')
          final dynamic? endDate,
      @JsonKey(name: 'IsActive')
          required final bool isActive,
      @JsonKey(name: 'RoleId')
          required final int roleId,
      @JsonKey(name: 'IsDefault')
          required final bool isDefault}) = _$_UserRolesMapContainerDTO;

  factory _UserRolesMapContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_UserRolesMapContainerDTO.fromJson;

  @override
  @JsonKey(name: 'UserToAttendanceRolesMapId')
  int get userToAttendanceRolesMapId;
  @override
  @JsonKey(name: 'UserId')
  int get userId;
  @override
  @JsonKey(name: 'AttendanceRoleId')
  int get attendanceRoleId;
  @override
  @JsonKey(name: 'ApprovalRequired')
  bool get approvalRequired;
  @override
  @JsonKey(name: 'EffectiveDate')
  String get effectiveDate;
  @override
  @JsonKey(name: 'EndDate')
  dynamic? get endDate;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(name: 'RoleId')
  int get roleId;
  @override
  @JsonKey(name: 'IsDefault')
  bool get isDefault;
  @override
  @JsonKey(ignore: true)
  _$$_UserRolesMapContainerDTOCopyWith<_$_UserRolesMapContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
