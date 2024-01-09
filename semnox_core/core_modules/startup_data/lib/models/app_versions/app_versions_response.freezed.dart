// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_versions_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppVersionsResponse _$AppVersionsResponseFromJson(Map<String, dynamic> json) {
  return _AppVersionsResponse.fromJson(json);
}

/// @nodoc
mixin _$AppVersionsResponse {
  List<AppVersionsData>? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'Message')
  String? get message => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppVersionsResponseCopyWith<AppVersionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVersionsResponseCopyWith<$Res> {
  factory $AppVersionsResponseCopyWith(
          AppVersionsResponse value, $Res Function(AppVersionsResponse) then) =
      _$AppVersionsResponseCopyWithImpl<$Res, AppVersionsResponse>;
  @useResult
  $Res call(
      {List<AppVersionsData>? data,
      @JsonKey(name: 'Message') String? message,
      String? exception});
}

/// @nodoc
class _$AppVersionsResponseCopyWithImpl<$Res, $Val extends AppVersionsResponse>
    implements $AppVersionsResponseCopyWith<$Res> {
  _$AppVersionsResponseCopyWithImpl(this._value, this._then);

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
              as List<AppVersionsData>?,
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
abstract class _$$_AppVersionsResponseCopyWith<$Res>
    implements $AppVersionsResponseCopyWith<$Res> {
  factory _$$_AppVersionsResponseCopyWith(_$_AppVersionsResponse value,
          $Res Function(_$_AppVersionsResponse) then) =
      __$$_AppVersionsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AppVersionsData>? data,
      @JsonKey(name: 'Message') String? message,
      String? exception});
}

/// @nodoc
class __$$_AppVersionsResponseCopyWithImpl<$Res>
    extends _$AppVersionsResponseCopyWithImpl<$Res, _$_AppVersionsResponse>
    implements _$$_AppVersionsResponseCopyWith<$Res> {
  __$$_AppVersionsResponseCopyWithImpl(_$_AppVersionsResponse _value,
      $Res Function(_$_AppVersionsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_AppVersionsResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AppVersionsData>?,
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
class _$_AppVersionsResponse implements _AppVersionsResponse {
  const _$_AppVersionsResponse(
      {final List<AppVersionsData>? data,
      @JsonKey(name: 'Message') this.message,
      this.exception})
      : _data = data;

  factory _$_AppVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AppVersionsResponseFromJson(json);

  final List<AppVersionsData>? _data;
  @override
  List<AppVersionsData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Message')
  final String? message;
  @override
  final String? exception;

  @override
  String toString() {
    return 'AppVersionsResponse(data: $data, message: $message, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppVersionsResponse &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), message, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppVersionsResponseCopyWith<_$_AppVersionsResponse> get copyWith =>
      __$$_AppVersionsResponseCopyWithImpl<_$_AppVersionsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppVersionsResponseToJson(
      this,
    );
  }
}

abstract class _AppVersionsResponse implements AppVersionsResponse {
  const factory _AppVersionsResponse(
      {final List<AppVersionsData>? data,
      @JsonKey(name: 'Message') final String? message,
      final String? exception}) = _$_AppVersionsResponse;

  factory _AppVersionsResponse.fromJson(Map<String, dynamic> json) =
      _$_AppVersionsResponse.fromJson;

  @override
  List<AppVersionsData>? get data;
  @override
  @JsonKey(name: 'Message')
  String? get message;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_AppVersionsResponseCopyWith<_$_AppVersionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
