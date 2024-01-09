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

UserRoleContanierData _$UserRoleContanierDataFromJson(
    Map<String, dynamic> json) {
  return _UserRoleContanierData.fromJson(json);
}

/// @nodoc
mixin _$UserRoleContanierData {
  @JsonKey(name: 'UserRoleContainerDTOList')
  List<UserRoleContanierDTO> get userRoleContainerDtoList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRoleContanierDataCopyWith<UserRoleContanierData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRoleContanierDataCopyWith<$Res> {
  factory $UserRoleContanierDataCopyWith(UserRoleContanierData value,
          $Res Function(UserRoleContanierData) then) =
      _$UserRoleContanierDataCopyWithImpl<$Res, UserRoleContanierData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserRoleContainerDTOList')
          List<UserRoleContanierDTO> userRoleContainerDtoList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$UserRoleContanierDataCopyWithImpl<$Res,
        $Val extends UserRoleContanierData>
    implements $UserRoleContanierDataCopyWith<$Res> {
  _$UserRoleContanierDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRoleContainerDtoList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      userRoleContainerDtoList: null == userRoleContainerDtoList
          ? _value.userRoleContainerDtoList
          : userRoleContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<UserRoleContanierDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRoleContanierDataCopyWith<$Res>
    implements $UserRoleContanierDataCopyWith<$Res> {
  factory _$$_UserRoleContanierDataCopyWith(_$_UserRoleContanierData value,
          $Res Function(_$_UserRoleContanierData) then) =
      __$$_UserRoleContanierDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserRoleContainerDTOList')
          List<UserRoleContanierDTO> userRoleContainerDtoList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_UserRoleContanierDataCopyWithImpl<$Res>
    extends _$UserRoleContanierDataCopyWithImpl<$Res, _$_UserRoleContanierData>
    implements _$$_UserRoleContanierDataCopyWith<$Res> {
  __$$_UserRoleContanierDataCopyWithImpl(_$_UserRoleContanierData _value,
      $Res Function(_$_UserRoleContanierData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRoleContainerDtoList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_UserRoleContanierData(
      userRoleContainerDtoList: null == userRoleContainerDtoList
          ? _value._userRoleContainerDtoList
          : userRoleContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<UserRoleContanierDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserRoleContanierData implements _UserRoleContanierData {
  const _$_UserRoleContanierData(
      {@JsonKey(name: 'UserRoleContainerDTOList')
          required final List<UserRoleContanierDTO> userRoleContainerDtoList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _userRoleContainerDtoList = userRoleContainerDtoList;

  factory _$_UserRoleContanierData.fromJson(Map<String, dynamic> json) =>
      _$$_UserRoleContanierDataFromJson(json);

  final List<UserRoleContanierDTO> _userRoleContainerDtoList;
  @override
  @JsonKey(name: 'UserRoleContainerDTOList')
  List<UserRoleContanierDTO> get userRoleContainerDtoList {
    if (_userRoleContainerDtoList is EqualUnmodifiableListView)
      return _userRoleContainerDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userRoleContainerDtoList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'UserRoleContanierData(userRoleContainerDtoList: $userRoleContainerDtoList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRoleContanierData &&
            const DeepCollectionEquality().equals(
                other._userRoleContainerDtoList, _userRoleContainerDtoList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_userRoleContainerDtoList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRoleContanierDataCopyWith<_$_UserRoleContanierData> get copyWith =>
      __$$_UserRoleContanierDataCopyWithImpl<_$_UserRoleContanierData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRoleContanierDataToJson(
      this,
    );
  }
}

abstract class _UserRoleContanierData implements UserRoleContanierData {
  const factory _UserRoleContanierData(
      {@JsonKey(name: 'UserRoleContainerDTOList')
          required final List<UserRoleContanierDTO> userRoleContainerDtoList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_UserRoleContanierData;

  factory _UserRoleContanierData.fromJson(Map<String, dynamic> json) =
      _$_UserRoleContanierData.fromJson;

  @override
  @JsonKey(name: 'UserRoleContainerDTOList')
  List<UserRoleContanierDTO> get userRoleContainerDtoList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_UserRoleContanierDataCopyWith<_$_UserRoleContanierData> get copyWith =>
      throw _privateConstructorUsedError;
}
