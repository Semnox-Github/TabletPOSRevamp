// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameContainerResponse _$GameContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _GameContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$GameContainerResponse {
  GameContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameContainerResponseCopyWith<GameContainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameContainerResponseCopyWith<$Res> {
  factory $GameContainerResponseCopyWith(GameContainerResponse value,
          $Res Function(GameContainerResponse) then) =
      _$GameContainerResponseCopyWithImpl<$Res, GameContainerResponse>;
  @useResult
  $Res call({GameContainerData? data, String? exception});

  $GameContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GameContainerResponseCopyWithImpl<$Res,
        $Val extends GameContainerResponse>
    implements $GameContainerResponseCopyWith<$Res> {
  _$GameContainerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GameContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $GameContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GameContainerResponseCopyWith<$Res>
    implements $GameContainerResponseCopyWith<$Res> {
  factory _$$_GameContainerResponseCopyWith(_$_GameContainerResponse value,
          $Res Function(_$_GameContainerResponse) then) =
      __$$_GameContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GameContainerData? data, String? exception});

  @override
  $GameContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_GameContainerResponseCopyWithImpl<$Res>
    extends _$GameContainerResponseCopyWithImpl<$Res, _$_GameContainerResponse>
    implements _$$_GameContainerResponseCopyWith<$Res> {
  __$$_GameContainerResponseCopyWithImpl(_$_GameContainerResponse _value,
      $Res Function(_$_GameContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_GameContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GameContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameContainerResponse implements _GameContainerResponse {
  const _$_GameContainerResponse({this.data, this.exception});

  factory _$_GameContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GameContainerResponseFromJson(json);

  @override
  final GameContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'GameContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameContainerResponse &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameContainerResponseCopyWith<_$_GameContainerResponse> get copyWith =>
      __$$_GameContainerResponseCopyWithImpl<_$_GameContainerResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameContainerResponseToJson(
      this,
    );
  }
}

abstract class _GameContainerResponse implements GameContainerResponse {
  const factory _GameContainerResponse(
      {final GameContainerData? data,
      final String? exception}) = _$_GameContainerResponse;

  factory _GameContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_GameContainerResponse.fromJson;

  @override
  GameContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_GameContainerResponseCopyWith<_$_GameContainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
