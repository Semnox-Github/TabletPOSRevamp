// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_game_extended_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountGameExtendedDTO _$AccountGameExtendedDTOFromJson(
    Map<String, dynamic> json) {
  return _AccountGameExtendedDTO.fromJson(json);
}

/// @nodoc
mixin _$AccountGameExtendedDTO {
  @JsonKey(name: 'GameProfileId')
  int get gameProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'GameId')
  int get gameId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Exclude')
  dynamic? get exclude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountGameExtendedDTOCopyWith<AccountGameExtendedDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountGameExtendedDTOCopyWith<$Res> {
  factory $AccountGameExtendedDTOCopyWith(AccountGameExtendedDTO value,
          $Res Function(AccountGameExtendedDTO) then) =
      _$AccountGameExtendedDTOCopyWithImpl<$Res, AccountGameExtendedDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'GameProfileId') int gameProfileId,
      @JsonKey(name: 'GameId') int gameId,
      @JsonKey(name: 'Exclude') dynamic? exclude});
}

/// @nodoc
class _$AccountGameExtendedDTOCopyWithImpl<$Res,
        $Val extends AccountGameExtendedDTO>
    implements $AccountGameExtendedDTOCopyWith<$Res> {
  _$AccountGameExtendedDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameProfileId = null,
    Object? gameId = null,
    Object? exclude = freezed,
  }) {
    return _then(_value.copyWith(
      gameProfileId: null == gameProfileId
          ? _value.gameProfileId
          : gameProfileId // ignore: cast_nullable_to_non_nullable
              as int,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      exclude: freezed == exclude
          ? _value.exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountGameExtendedDTOCopyWith<$Res>
    implements $AccountGameExtendedDTOCopyWith<$Res> {
  factory _$$_AccountGameExtendedDTOCopyWith(_$_AccountGameExtendedDTO value,
          $Res Function(_$_AccountGameExtendedDTO) then) =
      __$$_AccountGameExtendedDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'GameProfileId') int gameProfileId,
      @JsonKey(name: 'GameId') int gameId,
      @JsonKey(name: 'Exclude') dynamic? exclude});
}

/// @nodoc
class __$$_AccountGameExtendedDTOCopyWithImpl<$Res>
    extends _$AccountGameExtendedDTOCopyWithImpl<$Res,
        _$_AccountGameExtendedDTO>
    implements _$$_AccountGameExtendedDTOCopyWith<$Res> {
  __$$_AccountGameExtendedDTOCopyWithImpl(_$_AccountGameExtendedDTO _value,
      $Res Function(_$_AccountGameExtendedDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameProfileId = null,
    Object? gameId = null,
    Object? exclude = freezed,
  }) {
    return _then(_$_AccountGameExtendedDTO(
      gameProfileId: null == gameProfileId
          ? _value.gameProfileId
          : gameProfileId // ignore: cast_nullable_to_non_nullable
              as int,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as int,
      exclude: freezed == exclude
          ? _value.exclude
          : exclude // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountGameExtendedDTO implements _AccountGameExtendedDTO {
  const _$_AccountGameExtendedDTO(
      {@JsonKey(name: 'GameProfileId') required this.gameProfileId,
      @JsonKey(name: 'GameId') required this.gameId,
      @JsonKey(name: 'Exclude') this.exclude});

  factory _$_AccountGameExtendedDTO.fromJson(Map<String, dynamic> json) =>
      _$$_AccountGameExtendedDTOFromJson(json);

  @override
  @JsonKey(name: 'GameProfileId')
  final int gameProfileId;
  @override
  @JsonKey(name: 'GameId')
  final int gameId;
  @override
  @JsonKey(name: 'Exclude')
  final dynamic? exclude;

  @override
  String toString() {
    return 'AccountGameExtendedDTO(gameProfileId: $gameProfileId, gameId: $gameId, exclude: $exclude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountGameExtendedDTO &&
            (identical(other.gameProfileId, gameProfileId) ||
                other.gameProfileId == gameProfileId) &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            const DeepCollectionEquality().equals(other.exclude, exclude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gameProfileId, gameId,
      const DeepCollectionEquality().hash(exclude));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountGameExtendedDTOCopyWith<_$_AccountGameExtendedDTO> get copyWith =>
      __$$_AccountGameExtendedDTOCopyWithImpl<_$_AccountGameExtendedDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountGameExtendedDTOToJson(
      this,
    );
  }
}

abstract class _AccountGameExtendedDTO implements AccountGameExtendedDTO {
  const factory _AccountGameExtendedDTO(
          {@JsonKey(name: 'GameProfileId') required final int gameProfileId,
          @JsonKey(name: 'GameId') required final int gameId,
          @JsonKey(name: 'Exclude') final dynamic? exclude}) =
      _$_AccountGameExtendedDTO;

  factory _AccountGameExtendedDTO.fromJson(Map<String, dynamic> json) =
      _$_AccountGameExtendedDTO.fromJson;

  @override
  @JsonKey(name: 'GameProfileId')
  int get gameProfileId;
  @override
  @JsonKey(name: 'GameId')
  int get gameId;
  @override
  @JsonKey(name: 'Exclude')
  dynamic? get exclude;
  @override
  @JsonKey(ignore: true)
  _$$_AccountGameExtendedDTOCopyWith<_$_AccountGameExtendedDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
