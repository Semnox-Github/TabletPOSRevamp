// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericResponse<T> _$GenericResponseFromJson<T>(Map<String, dynamic> json) {
  return _GenericResponse<T>.fromJson(json);
}

/// @nodoc
mixin _$GenericResponse<T> {
  dynamic get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericResponseCopyWith<T, GenericResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericResponseCopyWith<T, $Res> {
  factory $GenericResponseCopyWith(
          GenericResponse<T> value, $Res Function(GenericResponse<T>) then) =
      _$GenericResponseCopyWithImpl<T, $Res, GenericResponse<T>>;
  @useResult
  $Res call({dynamic data, String? exception, String? message});
}

/// @nodoc
class _$GenericResponseCopyWithImpl<T, $Res, $Val extends GenericResponse<T>>
    implements $GenericResponseCopyWith<T, $Res> {
  _$GenericResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
    Object? message = freezed,
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
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenericResponseCopyWith<T, $Res>
    implements $GenericResponseCopyWith<T, $Res> {
  factory _$$_GenericResponseCopyWith(_$_GenericResponse<T> value,
          $Res Function(_$_GenericResponse<T>) then) =
      __$$_GenericResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({dynamic data, String? exception, String? message});
}

/// @nodoc
class __$$_GenericResponseCopyWithImpl<T, $Res>
    extends _$GenericResponseCopyWithImpl<T, $Res, _$_GenericResponse<T>>
    implements _$$_GenericResponseCopyWith<T, $Res> {
  __$$_GenericResponseCopyWithImpl(
      _$_GenericResponse<T> _value, $Res Function(_$_GenericResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_GenericResponse<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenericResponse<T> implements _GenericResponse<T> {
  const _$_GenericResponse({this.data, this.exception, this.message});

  factory _$_GenericResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GenericResponseFromJson(json);

  @override
  final dynamic data;
  @override
  final String? exception;
  @override
  final String? message;

  @override
  String toString() {
    return 'GenericResponse<$T>(data: $data, exception: $exception, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericResponse<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(data), exception, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenericResponseCopyWith<T, _$_GenericResponse<T>> get copyWith =>
      __$$_GenericResponseCopyWithImpl<T, _$_GenericResponse<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenericResponseToJson<T>(
      this,
    );
  }
}

abstract class _GenericResponse<T> implements GenericResponse<T> {
  const factory _GenericResponse(
      {final dynamic data,
      final String? exception,
      final String? message}) = _$_GenericResponse<T>;

  factory _GenericResponse.fromJson(Map<String, dynamic> json) =
      _$_GenericResponse<T>.fromJson;

  @override
  dynamic get data;
  @override
  String? get exception;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_GenericResponseCopyWith<T, _$_GenericResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
