// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'end_of_day_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EndOfDayResponse _$EndOfDayResponseFromJson(Map<String, dynamic> json) {
  return _EndOfDayResponse.fromJson(json);
}

/// @nodoc
mixin _$EndOfDayResponse {
  @JsonKey(name: 'data')
  dynamic get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'exception')
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EndOfDayResponseCopyWith<EndOfDayResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EndOfDayResponseCopyWith<$Res> {
  factory $EndOfDayResponseCopyWith(
          EndOfDayResponse value, $Res Function(EndOfDayResponse) then) =
      _$EndOfDayResponseCopyWithImpl<$Res, EndOfDayResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') dynamic data,
      @JsonKey(name: 'Message') String? message,
      @JsonKey(name: 'exception') String? exception});
}

/// @nodoc
class _$EndOfDayResponseCopyWithImpl<$Res, $Val extends EndOfDayResponse>
    implements $EndOfDayResponseCopyWith<$Res> {
  _$EndOfDayResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EndOfDayResponseCopyWith<$Res>
    implements $EndOfDayResponseCopyWith<$Res> {
  factory _$$_EndOfDayResponseCopyWith(
          _$_EndOfDayResponse value, $Res Function(_$_EndOfDayResponse) then) =
      __$$_EndOfDayResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') dynamic data,
      @JsonKey(name: 'Message') String? message,
      @JsonKey(name: 'exception') String? exception});
}

/// @nodoc
class __$$_EndOfDayResponseCopyWithImpl<$Res>
    extends _$EndOfDayResponseCopyWithImpl<$Res, _$_EndOfDayResponse>
    implements _$$_EndOfDayResponseCopyWith<$Res> {
  __$$_EndOfDayResponseCopyWithImpl(
      _$_EndOfDayResponse _value, $Res Function(_$_EndOfDayResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_EndOfDayResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EndOfDayResponse implements _EndOfDayResponse {
  const _$_EndOfDayResponse(
      {@JsonKey(name: 'data') this.data,
      @JsonKey(name: 'Message') this.message,
      @JsonKey(name: 'exception') this.exception});

  factory _$_EndOfDayResponse.fromJson(Map<String, dynamic> json) =>
      _$$_EndOfDayResponseFromJson(json);

  @override
  @JsonKey(name: 'data')
  final dynamic data;
  @override
  @JsonKey(name: 'Message')
  final String? message;
  @override
  @JsonKey(name: 'exception')
  final String? exception;

  @override
  String toString() {
    return 'EndOfDayResponse(data: $data, message: $message, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EndOfDayResponse &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(data), message, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EndOfDayResponseCopyWith<_$_EndOfDayResponse> get copyWith =>
      __$$_EndOfDayResponseCopyWithImpl<_$_EndOfDayResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EndOfDayResponseToJson(
      this,
    );
  }
}

abstract class _EndOfDayResponse implements EndOfDayResponse {
  const factory _EndOfDayResponse(
          {@JsonKey(name: 'data') final dynamic data,
          @JsonKey(name: 'Message') final String? message,
          @JsonKey(name: 'exception') final String? exception}) =
      _$_EndOfDayResponse;

  factory _EndOfDayResponse.fromJson(Map<String, dynamic> json) =
      _$_EndOfDayResponse.fromJson;

  @override
  @JsonKey(name: 'data')
  dynamic get data;
  @override
  @JsonKey(name: 'Message')
  String? get message;
  @override
  @JsonKey(name: 'exception')
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_EndOfDayResponseCopyWith<_$_EndOfDayResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
