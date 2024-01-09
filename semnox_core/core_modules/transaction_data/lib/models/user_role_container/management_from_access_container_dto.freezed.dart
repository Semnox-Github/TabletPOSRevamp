// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'management_from_access_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ManagementFormAccessContainerDto _$ManagementFormAccessContainerDtoFromJson(
    Map<String, dynamic> json) {
  return _ManagementFormAccessContainerDto.fromJson(json);
}

/// @nodoc
mixin _$ManagementFormAccessContainerDto {
  @JsonKey(name: 'ManagementFormAccessId')
  int? get managementFormAccessId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RoleId')
  int? get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainMenu')
  String? get mainMenu => throw _privateConstructorUsedError;
  @JsonKey(name: 'FormName')
  String? get formName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FunctionGroup')
  String? get functionGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManagementFormAccessContainerDtoCopyWith<ManagementFormAccessContainerDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagementFormAccessContainerDtoCopyWith<$Res> {
  factory $ManagementFormAccessContainerDtoCopyWith(
          ManagementFormAccessContainerDto value,
          $Res Function(ManagementFormAccessContainerDto) then) =
      _$ManagementFormAccessContainerDtoCopyWithImpl<$Res,
          ManagementFormAccessContainerDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ManagementFormAccessId') int? managementFormAccessId,
      @JsonKey(name: 'RoleId') int? roleId,
      @JsonKey(name: 'MainMenu') String? mainMenu,
      @JsonKey(name: 'FormName') String? formName,
      @JsonKey(name: 'FunctionGroup') String? functionGroup});
}

/// @nodoc
class _$ManagementFormAccessContainerDtoCopyWithImpl<$Res,
        $Val extends ManagementFormAccessContainerDto>
    implements $ManagementFormAccessContainerDtoCopyWith<$Res> {
  _$ManagementFormAccessContainerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? managementFormAccessId = freezed,
    Object? roleId = freezed,
    Object? mainMenu = freezed,
    Object? formName = freezed,
    Object? functionGroup = freezed,
  }) {
    return _then(_value.copyWith(
      managementFormAccessId: freezed == managementFormAccessId
          ? _value.managementFormAccessId
          : managementFormAccessId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      mainMenu: freezed == mainMenu
          ? _value.mainMenu
          : mainMenu // ignore: cast_nullable_to_non_nullable
              as String?,
      formName: freezed == formName
          ? _value.formName
          : formName // ignore: cast_nullable_to_non_nullable
              as String?,
      functionGroup: freezed == functionGroup
          ? _value.functionGroup
          : functionGroup // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ManagementFormAccessContainerDtoCopyWith<$Res>
    implements $ManagementFormAccessContainerDtoCopyWith<$Res> {
  factory _$$_ManagementFormAccessContainerDtoCopyWith(
          _$_ManagementFormAccessContainerDto value,
          $Res Function(_$_ManagementFormAccessContainerDto) then) =
      __$$_ManagementFormAccessContainerDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ManagementFormAccessId') int? managementFormAccessId,
      @JsonKey(name: 'RoleId') int? roleId,
      @JsonKey(name: 'MainMenu') String? mainMenu,
      @JsonKey(name: 'FormName') String? formName,
      @JsonKey(name: 'FunctionGroup') String? functionGroup});
}

/// @nodoc
class __$$_ManagementFormAccessContainerDtoCopyWithImpl<$Res>
    extends _$ManagementFormAccessContainerDtoCopyWithImpl<$Res,
        _$_ManagementFormAccessContainerDto>
    implements _$$_ManagementFormAccessContainerDtoCopyWith<$Res> {
  __$$_ManagementFormAccessContainerDtoCopyWithImpl(
      _$_ManagementFormAccessContainerDto _value,
      $Res Function(_$_ManagementFormAccessContainerDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? managementFormAccessId = freezed,
    Object? roleId = freezed,
    Object? mainMenu = freezed,
    Object? formName = freezed,
    Object? functionGroup = freezed,
  }) {
    return _then(_$_ManagementFormAccessContainerDto(
      managementFormAccessId: freezed == managementFormAccessId
          ? _value.managementFormAccessId
          : managementFormAccessId // ignore: cast_nullable_to_non_nullable
              as int?,
      roleId: freezed == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int?,
      mainMenu: freezed == mainMenu
          ? _value.mainMenu
          : mainMenu // ignore: cast_nullable_to_non_nullable
              as String?,
      formName: freezed == formName
          ? _value.formName
          : formName // ignore: cast_nullable_to_non_nullable
              as String?,
      functionGroup: freezed == functionGroup
          ? _value.functionGroup
          : functionGroup // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ManagementFormAccessContainerDto
    implements _ManagementFormAccessContainerDto {
  const _$_ManagementFormAccessContainerDto(
      {@JsonKey(name: 'ManagementFormAccessId') this.managementFormAccessId,
      @JsonKey(name: 'RoleId') this.roleId,
      @JsonKey(name: 'MainMenu') this.mainMenu,
      @JsonKey(name: 'FormName') this.formName,
      @JsonKey(name: 'FunctionGroup') this.functionGroup});

  factory _$_ManagementFormAccessContainerDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_ManagementFormAccessContainerDtoFromJson(json);

  @override
  @JsonKey(name: 'ManagementFormAccessId')
  final int? managementFormAccessId;
  @override
  @JsonKey(name: 'RoleId')
  final int? roleId;
  @override
  @JsonKey(name: 'MainMenu')
  final String? mainMenu;
  @override
  @JsonKey(name: 'FormName')
  final String? formName;
  @override
  @JsonKey(name: 'FunctionGroup')
  final String? functionGroup;

  @override
  String toString() {
    return 'ManagementFormAccessContainerDto(managementFormAccessId: $managementFormAccessId, roleId: $roleId, mainMenu: $mainMenu, formName: $formName, functionGroup: $functionGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManagementFormAccessContainerDto &&
            (identical(other.managementFormAccessId, managementFormAccessId) ||
                other.managementFormAccessId == managementFormAccessId) &&
            (identical(other.roleId, roleId) || other.roleId == roleId) &&
            (identical(other.mainMenu, mainMenu) ||
                other.mainMenu == mainMenu) &&
            (identical(other.formName, formName) ||
                other.formName == formName) &&
            (identical(other.functionGroup, functionGroup) ||
                other.functionGroup == functionGroup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, managementFormAccessId, roleId,
      mainMenu, formName, functionGroup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ManagementFormAccessContainerDtoCopyWith<
          _$_ManagementFormAccessContainerDto>
      get copyWith => __$$_ManagementFormAccessContainerDtoCopyWithImpl<
          _$_ManagementFormAccessContainerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ManagementFormAccessContainerDtoToJson(
      this,
    );
  }
}

abstract class _ManagementFormAccessContainerDto
    implements ManagementFormAccessContainerDto {
  const factory _ManagementFormAccessContainerDto(
      {@JsonKey(name: 'ManagementFormAccessId')
          final int? managementFormAccessId,
      @JsonKey(name: 'RoleId')
          final int? roleId,
      @JsonKey(name: 'MainMenu')
          final String? mainMenu,
      @JsonKey(name: 'FormName')
          final String? formName,
      @JsonKey(name: 'FunctionGroup')
          final String? functionGroup}) = _$_ManagementFormAccessContainerDto;

  factory _ManagementFormAccessContainerDto.fromJson(
      Map<String, dynamic> json) = _$_ManagementFormAccessContainerDto.fromJson;

  @override
  @JsonKey(name: 'ManagementFormAccessId')
  int? get managementFormAccessId;
  @override
  @JsonKey(name: 'RoleId')
  int? get roleId;
  @override
  @JsonKey(name: 'MainMenu')
  String? get mainMenu;
  @override
  @JsonKey(name: 'FormName')
  String? get formName;
  @override
  @JsonKey(name: 'FunctionGroup')
  String? get functionGroup;
  @override
  @JsonKey(ignore: true)
  _$$_ManagementFormAccessContainerDtoCopyWith<
          _$_ManagementFormAccessContainerDto>
      get copyWith => throw _privateConstructorUsedError;
}
