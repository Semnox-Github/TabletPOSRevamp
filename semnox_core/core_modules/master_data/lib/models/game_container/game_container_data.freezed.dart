// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameContainerData _$GameContainerDataFromJson(Map<String, dynamic> json) {
  return _GameContainerData.fromJson(json);
}

/// @nodoc
mixin _$GameContainerData {
  @JsonKey(name: 'GameContainerDTOList')
  List<GameContainerDTO> get gameContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameContainerDataCopyWith<GameContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameContainerDataCopyWith<$Res> {
  factory $GameContainerDataCopyWith(
          GameContainerData value, $Res Function(GameContainerData) then) =
      _$GameContainerDataCopyWithImpl<$Res, GameContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'GameContainerDTOList')
          List<GameContainerDTO> gameContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$GameContainerDataCopyWithImpl<$Res, $Val extends GameContainerData>
    implements $GameContainerDataCopyWith<$Res> {
  _$GameContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      gameContainerDTOList: null == gameContainerDTOList
          ? _value.gameContainerDTOList
          : gameContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<GameContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameContainerDataCopyWith<$Res>
    implements $GameContainerDataCopyWith<$Res> {
  factory _$$_GameContainerDataCopyWith(_$_GameContainerData value,
          $Res Function(_$_GameContainerData) then) =
      __$$_GameContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'GameContainerDTOList')
          List<GameContainerDTO> gameContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_GameContainerDataCopyWithImpl<$Res>
    extends _$GameContainerDataCopyWithImpl<$Res, _$_GameContainerData>
    implements _$$_GameContainerDataCopyWith<$Res> {
  __$$_GameContainerDataCopyWithImpl(
      _$_GameContainerData _value, $Res Function(_$_GameContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_GameContainerData(
      gameContainerDTOList: null == gameContainerDTOList
          ? _value._gameContainerDTOList
          : gameContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<GameContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameContainerData implements _GameContainerData {
  const _$_GameContainerData(
      {@JsonKey(name: 'GameContainerDTOList')
          required final List<GameContainerDTO> gameContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _gameContainerDTOList = gameContainerDTOList;

  factory _$_GameContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_GameContainerDataFromJson(json);

  final List<GameContainerDTO> _gameContainerDTOList;
  @override
  @JsonKey(name: 'GameContainerDTOList')
  List<GameContainerDTO> get gameContainerDTOList {
    if (_gameContainerDTOList is EqualUnmodifiableListView)
      return _gameContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gameContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'GameContainerData(gameContainerDTOList: $gameContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameContainerData &&
            const DeepCollectionEquality()
                .equals(other._gameContainerDTOList, _gameContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_gameContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameContainerDataCopyWith<_$_GameContainerData> get copyWith =>
      __$$_GameContainerDataCopyWithImpl<_$_GameContainerData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameContainerDataToJson(
      this,
    );
  }
}

abstract class _GameContainerData implements GameContainerData {
  const factory _GameContainerData(
      {@JsonKey(name: 'GameContainerDTOList')
          required final List<GameContainerDTO> gameContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_GameContainerData;

  factory _GameContainerData.fromJson(Map<String, dynamic> json) =
      _$_GameContainerData.fromJson;

  @override
  @JsonKey(name: 'GameContainerDTOList')
  List<GameContainerDTO> get gameContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_GameContainerDataCopyWith<_$_GameContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}
