// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_connection_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RemoteConnectionResponse _$RemoteConnectionResponseFromJson(
    Map<String, dynamic> json) {
  return _RemoteConnectionResponse.fromJson(json);
}

/// @nodoc
mixin _$RemoteConnectionResponse {
  String? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message')
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteConnectionResponseCopyWith<RemoteConnectionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteConnectionResponseCopyWith<$Res> {
  factory $RemoteConnectionResponseCopyWith(RemoteConnectionResponse value,
          $Res Function(RemoteConnectionResponse) then) =
      _$RemoteConnectionResponseCopyWithImpl<$Res, RemoteConnectionResponse>;
  @useResult
  $Res call({String? data, @JsonKey(name: 'Message') String? message});
}

/// @nodoc
class _$RemoteConnectionResponseCopyWithImpl<$Res,
        $Val extends RemoteConnectionResponse>
    implements $RemoteConnectionResponseCopyWith<$Res> {
  _$RemoteConnectionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RemoteConnectionResponseCopyWith<$Res>
    implements $RemoteConnectionResponseCopyWith<$Res> {
  factory _$$_RemoteConnectionResponseCopyWith(
          _$_RemoteConnectionResponse value,
          $Res Function(_$_RemoteConnectionResponse) then) =
      __$$_RemoteConnectionResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? data, @JsonKey(name: 'Message') String? message});
}

/// @nodoc
class __$$_RemoteConnectionResponseCopyWithImpl<$Res>
    extends _$RemoteConnectionResponseCopyWithImpl<$Res,
        _$_RemoteConnectionResponse>
    implements _$$_RemoteConnectionResponseCopyWith<$Res> {
  __$$_RemoteConnectionResponseCopyWithImpl(_$_RemoteConnectionResponse _value,
      $Res Function(_$_RemoteConnectionResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_RemoteConnectionResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
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
class _$_RemoteConnectionResponse implements _RemoteConnectionResponse {
  const _$_RemoteConnectionResponse(
      {this.data, @JsonKey(name: 'Message') this.message});

  factory _$_RemoteConnectionResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RemoteConnectionResponseFromJson(json);

  @override
  final String? data;
  @override
  @JsonKey(name: 'Message')
  final String? message;

  @override
  String toString() {
    return 'RemoteConnectionResponse(data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoteConnectionResponse &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoteConnectionResponseCopyWith<_$_RemoteConnectionResponse>
      get copyWith => __$$_RemoteConnectionResponseCopyWithImpl<
          _$_RemoteConnectionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemoteConnectionResponseToJson(
      this,
    );
  }
}

abstract class _RemoteConnectionResponse implements RemoteConnectionResponse {
  const factory _RemoteConnectionResponse(
          {final String? data,
          @JsonKey(name: 'Message') final String? message}) =
      _$_RemoteConnectionResponse;

  factory _RemoteConnectionResponse.fromJson(Map<String, dynamic> json) =
      _$_RemoteConnectionResponse.fromJson;

  @override
  String? get data;
  @override
  @JsonKey(name: 'Message')
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_RemoteConnectionResponseCopyWith<_$_RemoteConnectionResponse>
      get copyWith => throw _privateConstructorUsedError;
}
