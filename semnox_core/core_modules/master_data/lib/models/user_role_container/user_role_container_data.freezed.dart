// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_role_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRoleContainerData _$UserRoleContainerDataFromJson(
    Map<String, dynamic> json) {
  return _UserRoleContainerData.fromJson(json);
}

/// @nodoc
mixin _$UserRoleContainerData {
  @JsonKey(name: 'UserRoleContainerDTOList')
  List<UserRoleContainerDTO> get userRoleContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRoleContainerDataCopyWith<UserRoleContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleContainerDataCopyWith<$Res> {
  factory $UserRoleContainerDataCopyWith(UserRoleContainerData value,
          $Res Function(UserRoleContainerData) then) =
      _$UserRoleContainerDataCopyWithImpl<$Res, UserRoleContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserRoleContainerDTOList')
          List<UserRoleContainerDTO> userRoleContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$UserRoleContainerDataCopyWithImpl<$Res,
        $Val extends UserRoleContainerData>
    implements $UserRoleContainerDataCopyWith<$Res> {
  _$UserRoleContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRoleContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      userRoleContainerDTOList: null == userRoleContainerDTOList
          ? _value.userRoleContainerDTOList
          : userRoleContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<UserRoleContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRoleContainerDataCopyWith<$Res>
    implements $UserRoleContainerDataCopyWith<$Res> {
  factory _$$_UserRoleContainerDataCopyWith(_$_UserRoleContainerData value,
          $Res Function(_$_UserRoleContainerData) then) =
      __$$_UserRoleContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserRoleContainerDTOList')
          List<UserRoleContainerDTO> userRoleContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_UserRoleContainerDataCopyWithImpl<$Res>
    extends _$UserRoleContainerDataCopyWithImpl<$Res, _$_UserRoleContainerData>
    implements _$$_UserRoleContainerDataCopyWith<$Res> {
  __$$_UserRoleContainerDataCopyWithImpl(_$_UserRoleContainerData _value,
      $Res Function(_$_UserRoleContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRoleContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_UserRoleContainerData(
      userRoleContainerDTOList: null == userRoleContainerDTOList
          ? _value._userRoleContainerDTOList
          : userRoleContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<UserRoleContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRoleContainerData implements _UserRoleContainerData {
  const _$_UserRoleContainerData(
      {@JsonKey(name: 'UserRoleContainerDTOList')
          required final List<UserRoleContainerDTO> userRoleContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _userRoleContainerDTOList = userRoleContainerDTOList;

  factory _$_UserRoleContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_UserRoleContainerDataFromJson(json);

  final List<UserRoleContainerDTO> _userRoleContainerDTOList;
  @override
  @JsonKey(name: 'UserRoleContainerDTOList')
  List<UserRoleContainerDTO> get userRoleContainerDTOList {
    if (_userRoleContainerDTOList is EqualUnmodifiableListView)
      return _userRoleContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userRoleContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'UserRoleContainerData(userRoleContainerDTOList: $userRoleContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRoleContainerData &&
            const DeepCollectionEquality().equals(
                other._userRoleContainerDTOList, _userRoleContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_userRoleContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRoleContainerDataCopyWith<_$_UserRoleContainerData> get copyWith =>
      __$$_UserRoleContainerDataCopyWithImpl<_$_UserRoleContainerData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRoleContainerDataToJson(
      this,
    );
  }
}

abstract class _UserRoleContainerData implements UserRoleContainerData {
  const factory _UserRoleContainerData(
      {@JsonKey(name: 'UserRoleContainerDTOList')
          required final List<UserRoleContainerDTO> userRoleContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_UserRoleContainerData;

  factory _UserRoleContainerData.fromJson(Map<String, dynamic> json) =
      _$_UserRoleContainerData.fromJson;

  @override
  @JsonKey(name: 'UserRoleContainerDTOList')
  List<UserRoleContainerDTO> get userRoleContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_UserRoleContainerDataCopyWith<_$_UserRoleContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}
