// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserContainerData _$UserContainerDataFromJson(Map<String, dynamic> json) {
  return _UserContainerData.fromJson(json);
}

/// @nodoc
mixin _$UserContainerData {
  @JsonKey(name: 'UserContainerDTOList')
  List<UserContainerDto> get userContainerDtoList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserContainerDataCopyWith<UserContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserContainerDataCopyWith<$Res> {
  factory $UserContainerDataCopyWith(
          UserContainerData value, $Res Function(UserContainerData) then) =
      _$UserContainerDataCopyWithImpl<$Res, UserContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'UserContainerDTOList')
          List<UserContainerDto> userContainerDtoList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$UserContainerDataCopyWithImpl<$Res, $Val extends UserContainerData>
    implements $UserContainerDataCopyWith<$Res> {
  _$UserContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userContainerDtoList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      userContainerDtoList: null == userContainerDtoList
          ? _value.userContainerDtoList
          : userContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<UserContainerDto>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserContainerDataCopyWith<$Res>
    implements $UserContainerDataCopyWith<$Res> {
  factory _$$_UserContainerDataCopyWith(_$_UserContainerData value,
          $Res Function(_$_UserContainerData) then) =
      __$$_UserContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'UserContainerDTOList')
          List<UserContainerDto> userContainerDtoList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_UserContainerDataCopyWithImpl<$Res>
    extends _$UserContainerDataCopyWithImpl<$Res, _$_UserContainerData>
    implements _$$_UserContainerDataCopyWith<$Res> {
  __$$_UserContainerDataCopyWithImpl(
      _$_UserContainerData _value, $Res Function(_$_UserContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userContainerDtoList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_UserContainerData(
      userContainerDtoList: null == userContainerDtoList
          ? _value._userContainerDtoList
          : userContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<UserContainerDto>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserContainerData implements _UserContainerData {
  const _$_UserContainerData(
      {@JsonKey(name: 'UserContainerDTOList')
          required final List<UserContainerDto> userContainerDtoList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _userContainerDtoList = userContainerDtoList;

  factory _$_UserContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_UserContainerDataFromJson(json);

  final List<UserContainerDto> _userContainerDtoList;
  @override
  @JsonKey(name: 'UserContainerDTOList')
  List<UserContainerDto> get userContainerDtoList {
    if (_userContainerDtoList is EqualUnmodifiableListView)
      return _userContainerDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userContainerDtoList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'UserContainerData(userContainerDtoList: $userContainerDtoList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserContainerData &&
            const DeepCollectionEquality()
                .equals(other._userContainerDtoList, _userContainerDtoList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_userContainerDtoList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserContainerDataCopyWith<_$_UserContainerData> get copyWith =>
      __$$_UserContainerDataCopyWithImpl<_$_UserContainerData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserContainerDataToJson(
      this,
    );
  }
}

abstract class _UserContainerData implements UserContainerData {
  const factory _UserContainerData(
      {@JsonKey(name: 'UserContainerDTOList')
          required final List<UserContainerDto> userContainerDtoList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_UserContainerData;

  factory _UserContainerData.fromJson(Map<String, dynamic> json) =
      _$_UserContainerData.fromJson;

  @override
  @JsonKey(name: 'UserContainerDTOList')
  List<UserContainerDto> get userContainerDtoList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_UserContainerDataCopyWith<_$_UserContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}
