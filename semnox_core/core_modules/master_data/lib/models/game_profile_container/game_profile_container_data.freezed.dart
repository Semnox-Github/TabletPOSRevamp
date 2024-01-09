// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_profile_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameProfileContainerData _$GameProfileContainerDataFromJson(
    Map<String, dynamic> json) {
  return _GameProfileContainerData.fromJson(json);
}

/// @nodoc
mixin _$GameProfileContainerData {
  @JsonKey(name: 'GameProfileContainerDTOList')
  List<GameProfileContainerDTO> get gameProfileContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameProfileContainerDataCopyWith<GameProfileContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameProfileContainerDataCopyWith<$Res> {
  factory $GameProfileContainerDataCopyWith(GameProfileContainerData value,
          $Res Function(GameProfileContainerData) then) =
      _$GameProfileContainerDataCopyWithImpl<$Res, GameProfileContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'GameProfileContainerDTOList')
          List<GameProfileContainerDTO> gameProfileContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$GameProfileContainerDataCopyWithImpl<$Res,
        $Val extends GameProfileContainerData>
    implements $GameProfileContainerDataCopyWith<$Res> {
  _$GameProfileContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameProfileContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      gameProfileContainerDTOList: null == gameProfileContainerDTOList
          ? _value.gameProfileContainerDTOList
          : gameProfileContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<GameProfileContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameProfileContainerDataCopyWith<$Res>
    implements $GameProfileContainerDataCopyWith<$Res> {
  factory _$$_GameProfileContainerDataCopyWith(
          _$_GameProfileContainerData value,
          $Res Function(_$_GameProfileContainerData) then) =
      __$$_GameProfileContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'GameProfileContainerDTOList')
          List<GameProfileContainerDTO> gameProfileContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_GameProfileContainerDataCopyWithImpl<$Res>
    extends _$GameProfileContainerDataCopyWithImpl<$Res,
        _$_GameProfileContainerData>
    implements _$$_GameProfileContainerDataCopyWith<$Res> {
  __$$_GameProfileContainerDataCopyWithImpl(_$_GameProfileContainerData _value,
      $Res Function(_$_GameProfileContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameProfileContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_GameProfileContainerData(
      gameProfileContainerDTOList: null == gameProfileContainerDTOList
          ? _value._gameProfileContainerDTOList
          : gameProfileContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<GameProfileContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameProfileContainerData implements _GameProfileContainerData {
  const _$_GameProfileContainerData(
      {@JsonKey(name: 'GameProfileContainerDTOList')
          required final List<GameProfileContainerDTO>
              gameProfileContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _gameProfileContainerDTOList = gameProfileContainerDTOList;

  factory _$_GameProfileContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_GameProfileContainerDataFromJson(json);

  final List<GameProfileContainerDTO> _gameProfileContainerDTOList;
  @override
  @JsonKey(name: 'GameProfileContainerDTOList')
  List<GameProfileContainerDTO> get gameProfileContainerDTOList {
    if (_gameProfileContainerDTOList is EqualUnmodifiableListView)
      return _gameProfileContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gameProfileContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'GameProfileContainerData(gameProfileContainerDTOList: $gameProfileContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameProfileContainerData &&
            const DeepCollectionEquality().equals(
                other._gameProfileContainerDTOList,
                _gameProfileContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_gameProfileContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameProfileContainerDataCopyWith<_$_GameProfileContainerData>
      get copyWith => __$$_GameProfileContainerDataCopyWithImpl<
          _$_GameProfileContainerData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameProfileContainerDataToJson(
      this,
    );
  }
}

abstract class _GameProfileContainerData implements GameProfileContainerData {
  const factory _GameProfileContainerData(
      {@JsonKey(name: 'GameProfileContainerDTOList')
          required final List<GameProfileContainerDTO>
              gameProfileContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_GameProfileContainerData;

  factory _GameProfileContainerData.fromJson(Map<String, dynamic> json) =
      _$_GameProfileContainerData.fromJson;

  @override
  @JsonKey(name: 'GameProfileContainerDTOList')
  List<GameProfileContainerDTO> get gameProfileContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_GameProfileContainerDataCopyWith<_$_GameProfileContainerData>
      get copyWith => throw _privateConstructorUsedError;
}
