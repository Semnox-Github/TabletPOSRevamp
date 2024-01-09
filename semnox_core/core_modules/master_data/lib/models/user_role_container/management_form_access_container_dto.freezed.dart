// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'management_form_access_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ManagementFormAccessContainerDTO _$ManagementFormAccessContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _ManagementFormAccessContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$ManagementFormAccessContainerDTO {
  @JsonKey(name: 'ManagementFormAccessId')
  int get managementFormAccessId => throw _privateConstructorUsedError;
  @JsonKey(name: 'RoleId')
  int get roleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MainMenu')
  String get mainMenu => throw _privateConstructorUsedError;
  @JsonKey(name: 'FormName')
  String get formName => throw _privateConstructorUsedError;
  @JsonKey(name: 'FunctionGroup')
  String get functionGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManagementFormAccessContainerDTOCopyWith<ManagementFormAccessContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagementFormAccessContainerDTOCopyWith<$Res> {
  factory $ManagementFormAccessContainerDTOCopyWith(
          ManagementFormAccessContainerDTO value,
          $Res Function(ManagementFormAccessContainerDTO) then) =
      _$ManagementFormAccessContainerDTOCopyWithImpl<$Res,
          ManagementFormAccessContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ManagementFormAccessId') int managementFormAccessId,
      @JsonKey(name: 'RoleId') int roleId,
      @JsonKey(name: 'MainMenu') String mainMenu,
      @JsonKey(name: 'FormName') String formName,
      @JsonKey(name: 'FunctionGroup') String functionGroup});
}

/// @nodoc
class _$ManagementFormAccessContainerDTOCopyWithImpl<$Res,
        $Val extends ManagementFormAccessContainerDTO>
    implements $ManagementFormAccessContainerDTOCopyWith<$Res> {
  _$ManagementFormAccessContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? managementFormAccessId = null,
    Object? roleId = null,
    Object? mainMenu = null,
    Object? formName = null,
    Object? functionGroup = null,
  }) {
    return _then(_value.copyWith(
      managementFormAccessId: null == managementFormAccessId
          ? _value.managementFormAccessId
          : managementFormAccessId // ignore: cast_nullable_to_non_nullable
              as int,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      mainMenu: null == mainMenu
          ? _value.mainMenu
          : mainMenu // ignore: cast_nullable_to_non_nullable
              as String,
      formName: null == formName
          ? _value.formName
          : formName // ignore: cast_nullable_to_non_nullable
              as String,
      functionGroup: null == functionGroup
          ? _value.functionGroup
          : functionGroup // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ManagementFormAccessContainerDTOCopyWith<$Res>
    implements $ManagementFormAccessContainerDTOCopyWith<$Res> {
  factory _$$_ManagementFormAccessContainerDTOCopyWith(
          _$_ManagementFormAccessContainerDTO value,
          $Res Function(_$_ManagementFormAccessContainerDTO) then) =
      __$$_ManagementFormAccessContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ManagementFormAccessId') int managementFormAccessId,
      @JsonKey(name: 'RoleId') int roleId,
      @JsonKey(name: 'MainMenu') String mainMenu,
      @JsonKey(name: 'FormName') String formName,
      @JsonKey(name: 'FunctionGroup') String functionGroup});
}

/// @nodoc
class __$$_ManagementFormAccessContainerDTOCopyWithImpl<$Res>
    extends _$ManagementFormAccessContainerDTOCopyWithImpl<$Res,
        _$_ManagementFormAccessContainerDTO>
    implements _$$_ManagementFormAccessContainerDTOCopyWith<$Res> {
  __$$_ManagementFormAccessContainerDTOCopyWithImpl(
      _$_ManagementFormAccessContainerDTO _value,
      $Res Function(_$_ManagementFormAccessContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? managementFormAccessId = null,
    Object? roleId = null,
    Object? mainMenu = null,
    Object? formName = null,
    Object? functionGroup = null,
  }) {
    return _then(_$_ManagementFormAccessContainerDTO(
      managementFormAccessId: null == managementFormAccessId
          ? _value.managementFormAccessId
          : managementFormAccessId // ignore: cast_nullable_to_non_nullable
              as int,
      roleId: null == roleId
          ? _value.roleId
          : roleId // ignore: cast_nullable_to_non_nullable
              as int,
      mainMenu: null == mainMenu
          ? _value.mainMenu
          : mainMenu // ignore: cast_nullable_to_non_nullable
              as String,
      formName: null == formName
          ? _value.formName
          : formName // ignore: cast_nullable_to_non_nullable
              as String,
      functionGroup: null == functionGroup
          ? _value.functionGroup
          : functionGroup // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ManagementFormAccessContainerDTO
    implements _ManagementFormAccessContainerDTO {
  const _$_ManagementFormAccessContainerDTO(
      {@JsonKey(name: 'ManagementFormAccessId')
          required this.managementFormAccessId,
      @JsonKey(name: 'RoleId')
          required this.roleId,
      @JsonKey(name: 'MainMenu')
          required this.mainMenu,
      @JsonKey(name: 'FormName')
          required this.formName,
      @JsonKey(name: 'FunctionGroup')
          required this.functionGroup});

  factory _$_ManagementFormAccessContainerDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_ManagementFormAccessContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'ManagementFormAccessId')
  final int managementFormAccessId;
  @override
  @JsonKey(name: 'RoleId')
  final int roleId;
  @override
  @JsonKey(name: 'MainMenu')
  final String mainMenu;
  @override
  @JsonKey(name: 'FormName')
  final String formName;
  @override
  @JsonKey(name: 'FunctionGroup')
  final String functionGroup;

  @override
  String toString() {
    return 'ManagementFormAccessContainerDTO(managementFormAccessId: $managementFormAccessId, roleId: $roleId, mainMenu: $mainMenu, formName: $formName, functionGroup: $functionGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManagementFormAccessContainerDTO &&
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
  _$$_ManagementFormAccessContainerDTOCopyWith<
          _$_ManagementFormAccessContainerDTO>
      get copyWith => __$$_ManagementFormAccessContainerDTOCopyWithImpl<
          _$_ManagementFormAccessContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ManagementFormAccessContainerDTOToJson(
      this,
    );
  }
}

abstract class _ManagementFormAccessContainerDTO
    implements ManagementFormAccessContainerDTO {
  const factory _ManagementFormAccessContainerDTO(
          {@JsonKey(name: 'ManagementFormAccessId')
              required final int managementFormAccessId,
          @JsonKey(name: 'RoleId')
              required final int roleId,
          @JsonKey(name: 'MainMenu')
              required final String mainMenu,
          @JsonKey(name: 'FormName')
              required final String formName,
          @JsonKey(name: 'FunctionGroup')
              required final String functionGroup}) =
      _$_ManagementFormAccessContainerDTO;

  factory _ManagementFormAccessContainerDTO.fromJson(
      Map<String, dynamic> json) = _$_ManagementFormAccessContainerDTO.fromJson;

  @override
  @JsonKey(name: 'ManagementFormAccessId')
  int get managementFormAccessId;
  @override
  @JsonKey(name: 'RoleId')
  int get roleId;
  @override
  @JsonKey(name: 'MainMenu')
  String get mainMenu;
  @override
  @JsonKey(name: 'FormName')
  String get formName;
  @override
  @JsonKey(name: 'FunctionGroup')
  String get functionGroup;
  @override
  @JsonKey(ignore: true)
  _$$_ManagementFormAccessContainerDTOCopyWith<
          _$_ManagementFormAccessContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
