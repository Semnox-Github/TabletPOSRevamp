// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_profile_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GameProfileContainerResponse _$GameProfileContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _GameProfileContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$GameProfileContainerResponse {
  GameProfileContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameProfileContainerResponseCopyWith<GameProfileContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameProfileContainerResponseCopyWith<$Res> {
  factory $GameProfileContainerResponseCopyWith(
          GameProfileContainerResponse value,
          $Res Function(GameProfileContainerResponse) then) =
      _$GameProfileContainerResponseCopyWithImpl<$Res,
          GameProfileContainerResponse>;
  @useResult
  $Res call({GameProfileContainerData? data, String? exception});

  $GameProfileContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GameProfileContainerResponseCopyWithImpl<$Res,
        $Val extends GameProfileContainerResponse>
    implements $GameProfileContainerResponseCopyWith<$Res> {
  _$GameProfileContainerResponseCopyWithImpl(this._value, this._then);

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
              as GameProfileContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameProfileContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $GameProfileContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GameProfileContainerResponseCopyWith<$Res>
    implements $GameProfileContainerResponseCopyWith<$Res> {
  factory _$$_GameProfileContainerResponseCopyWith(
          _$_GameProfileContainerResponse value,
          $Res Function(_$_GameProfileContainerResponse) then) =
      __$$_GameProfileContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GameProfileContainerData? data, String? exception});

  @override
  $GameProfileContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_GameProfileContainerResponseCopyWithImpl<$Res>
    extends _$GameProfileContainerResponseCopyWithImpl<$Res,
        _$_GameProfileContainerResponse>
    implements _$$_GameProfileContainerResponseCopyWith<$Res> {
  __$$_GameProfileContainerResponseCopyWithImpl(
      _$_GameProfileContainerResponse _value,
      $Res Function(_$_GameProfileContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_GameProfileContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GameProfileContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GameProfileContainerResponse implements _GameProfileContainerResponse {
  const _$_GameProfileContainerResponse({this.data, this.exception});

  factory _$_GameProfileContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GameProfileContainerResponseFromJson(json);

  @override
  final GameProfileContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'GameProfileContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameProfileContainerResponse &&
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
  _$$_GameProfileContainerResponseCopyWith<_$_GameProfileContainerResponse>
      get copyWith => __$$_GameProfileContainerResponseCopyWithImpl<
          _$_GameProfileContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GameProfileContainerResponseToJson(
      this,
    );
  }
}

abstract class _GameProfileContainerResponse
    implements GameProfileContainerResponse {
  const factory _GameProfileContainerResponse(
      {final GameProfileContainerData? data,
      final String? exception}) = _$_GameProfileContainerResponse;

  factory _GameProfileContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_GameProfileContainerResponse.fromJson;

  @override
  GameProfileContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_GameProfileContainerResponseCopyWith<_$_GameProfileContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
