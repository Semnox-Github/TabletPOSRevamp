// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pause_time_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PauseTimeResponse _$PauseTimeResponseFromJson(Map<String, dynamic> json) {
  return _PauseTimeResponse.fromJson(json);
}

/// @nodoc
mixin _$PauseTimeResponse {
  dynamic get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PauseTimeResponseCopyWith<PauseTimeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PauseTimeResponseCopyWith<$Res> {
  factory $PauseTimeResponseCopyWith(
          PauseTimeResponse value, $Res Function(PauseTimeResponse) then) =
      _$PauseTimeResponseCopyWithImpl<$Res, PauseTimeResponse>;
  @useResult
  $Res call({dynamic data, String? exception});
}

/// @nodoc
class _$PauseTimeResponseCopyWithImpl<$Res, $Val extends PauseTimeResponse>
    implements $PauseTimeResponseCopyWith<$Res> {
  _$PauseTimeResponseCopyWithImpl(this._value, this._then);

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
              as dynamic,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PauseTimeResponseCopyWith<$Res>
    implements $PauseTimeResponseCopyWith<$Res> {
  factory _$$_PauseTimeResponseCopyWith(_$_PauseTimeResponse value,
          $Res Function(_$_PauseTimeResponse) then) =
      __$$_PauseTimeResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic data, String? exception});
}

/// @nodoc
class __$$_PauseTimeResponseCopyWithImpl<$Res>
    extends _$PauseTimeResponseCopyWithImpl<$Res, _$_PauseTimeResponse>
    implements _$$_PauseTimeResponseCopyWith<$Res> {
  __$$_PauseTimeResponseCopyWithImpl(
      _$_PauseTimeResponse _value, $Res Function(_$_PauseTimeResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_PauseTimeResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PauseTimeResponse implements _PauseTimeResponse {
  const _$_PauseTimeResponse({this.data, this.exception});

  factory _$_PauseTimeResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PauseTimeResponseFromJson(json);

  @override
  final dynamic data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'PauseTimeResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PauseTimeResponse &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PauseTimeResponseCopyWith<_$_PauseTimeResponse> get copyWith =>
      __$$_PauseTimeResponseCopyWithImpl<_$_PauseTimeResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PauseTimeResponseToJson(
      this,
    );
  }
}

abstract class _PauseTimeResponse implements PauseTimeResponse {
  const factory _PauseTimeResponse(
      {final dynamic data, final String? exception}) = _$_PauseTimeResponse;

  factory _PauseTimeResponse.fromJson(Map<String, dynamic> json) =
      _$_PauseTimeResponse.fromJson;

  @override
  dynamic get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_PauseTimeResponseCopyWith<_$_PauseTimeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
