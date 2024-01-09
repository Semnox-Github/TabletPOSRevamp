// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'end_of_day_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EndOfDayStatus _$EndOfDayStatusFromJson(Map<String, dynamic> json) {
  return _EndOfDayStatus.fromJson(json);
}

/// @nodoc
mixin _$EndOfDayStatus {
  @JsonKey(name: 'data')
  dynamic get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message')
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'exception')
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EndOfDayStatusCopyWith<EndOfDayStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EndOfDayStatusCopyWith<$Res> {
  factory $EndOfDayStatusCopyWith(
          EndOfDayStatus value, $Res Function(EndOfDayStatus) then) =
      _$EndOfDayStatusCopyWithImpl<$Res, EndOfDayStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') dynamic data,
      @JsonKey(name: 'Message') String? message,
      @JsonKey(name: 'exception') String? exception});
}

/// @nodoc
class _$EndOfDayStatusCopyWithImpl<$Res, $Val extends EndOfDayStatus>
    implements $EndOfDayStatusCopyWith<$Res> {
  _$EndOfDayStatusCopyWithImpl(this._value, this._then);

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
abstract class _$$_EndOfDayStatusCopyWith<$Res>
    implements $EndOfDayStatusCopyWith<$Res> {
  factory _$$_EndOfDayStatusCopyWith(
          _$_EndOfDayStatus value, $Res Function(_$_EndOfDayStatus) then) =
      __$$_EndOfDayStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') dynamic data,
      @JsonKey(name: 'Message') String? message,
      @JsonKey(name: 'exception') String? exception});
}

/// @nodoc
class __$$_EndOfDayStatusCopyWithImpl<$Res>
    extends _$EndOfDayStatusCopyWithImpl<$Res, _$_EndOfDayStatus>
    implements _$$_EndOfDayStatusCopyWith<$Res> {
  __$$_EndOfDayStatusCopyWithImpl(
      _$_EndOfDayStatus _value, $Res Function(_$_EndOfDayStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_EndOfDayStatus(
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
class _$_EndOfDayStatus implements _EndOfDayStatus {
  const _$_EndOfDayStatus(
      {@JsonKey(name: 'data') this.data,
      @JsonKey(name: 'Message') this.message,
      @JsonKey(name: 'exception') this.exception});

  factory _$_EndOfDayStatus.fromJson(Map<String, dynamic> json) =>
      _$$_EndOfDayStatusFromJson(json);

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
    return 'EndOfDayStatus(data: $data, message: $message, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EndOfDayStatus &&
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
  _$$_EndOfDayStatusCopyWith<_$_EndOfDayStatus> get copyWith =>
      __$$_EndOfDayStatusCopyWithImpl<_$_EndOfDayStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EndOfDayStatusToJson(
      this,
    );
  }
}

abstract class _EndOfDayStatus implements EndOfDayStatus {
  const factory _EndOfDayStatus(
      {@JsonKey(name: 'data') final dynamic data,
      @JsonKey(name: 'Message') final String? message,
      @JsonKey(name: 'exception') final String? exception}) = _$_EndOfDayStatus;

  factory _EndOfDayStatus.fromJson(Map<String, dynamic> json) =
      _$_EndOfDayStatus.fromJson;

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
  _$$_EndOfDayStatusCopyWith<_$_EndOfDayStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
