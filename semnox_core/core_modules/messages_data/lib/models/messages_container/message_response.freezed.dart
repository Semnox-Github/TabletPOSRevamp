// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessagesResponse _$MessagesResponseFromJson(Map<String, dynamic> json) {
  return _MessagesResponse.fromJson(json);
}

/// @nodoc
mixin _$MessagesResponse {
  MessageData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessagesResponseCopyWith<MessagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesResponseCopyWith<$Res> {
  factory $MessagesResponseCopyWith(
          MessagesResponse value, $Res Function(MessagesResponse) then) =
      _$MessagesResponseCopyWithImpl<$Res, MessagesResponse>;
  @useResult
  $Res call({MessageData? data, String? exception});

  $MessageDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$MessagesResponseCopyWithImpl<$Res, $Val extends MessagesResponse>
    implements $MessagesResponseCopyWith<$Res> {
  _$MessagesResponseCopyWithImpl(this._value, this._then);

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
              as MessageData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $MessageDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MessagesResponseCopyWith<$Res>
    implements $MessagesResponseCopyWith<$Res> {
  factory _$$_MessagesResponseCopyWith(
          _$_MessagesResponse value, $Res Function(_$_MessagesResponse) then) =
      __$$_MessagesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MessageData? data, String? exception});

  @override
  $MessageDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_MessagesResponseCopyWithImpl<$Res>
    extends _$MessagesResponseCopyWithImpl<$Res, _$_MessagesResponse>
    implements _$$_MessagesResponseCopyWith<$Res> {
  __$$_MessagesResponseCopyWithImpl(
      _$_MessagesResponse _value, $Res Function(_$_MessagesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_MessagesResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MessageData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessagesResponse implements _MessagesResponse {
  const _$_MessagesResponse({this.data, this.exception});

  factory _$_MessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MessagesResponseFromJson(json);

  @override
  final MessageData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'MessagesResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessagesResponse &&
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
  _$$_MessagesResponseCopyWith<_$_MessagesResponse> get copyWith =>
      __$$_MessagesResponseCopyWithImpl<_$_MessagesResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessagesResponseToJson(
      this,
    );
  }
}

abstract class _MessagesResponse implements MessagesResponse {
  const factory _MessagesResponse(
      {final MessageData? data, final String? exception}) = _$_MessagesResponse;

  factory _MessagesResponse.fromJson(Map<String, dynamic> json) =
      _$_MessagesResponse.fromJson;

  @override
  MessageData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_MessagesResponseCopyWith<_$_MessagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
