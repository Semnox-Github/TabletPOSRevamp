// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryContainerResponse _$CountryContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _CountryContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$CountryContainerResponse {
  CountryContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryContainerResponseCopyWith<CountryContainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryContainerResponseCopyWith<$Res> {
  factory $CountryContainerResponseCopyWith(CountryContainerResponse value,
          $Res Function(CountryContainerResponse) then) =
      _$CountryContainerResponseCopyWithImpl<$Res, CountryContainerResponse>;
  @useResult
  $Res call({CountryContainerData? data, String? exception});

  $CountryContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CountryContainerResponseCopyWithImpl<$Res,
        $Val extends CountryContainerResponse>
    implements $CountryContainerResponseCopyWith<$Res> {
  _$CountryContainerResponseCopyWithImpl(this._value, this._then);

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
              as CountryContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CountryContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CountryContainerResponseCopyWith<$Res>
    implements $CountryContainerResponseCopyWith<$Res> {
  factory _$$_CountryContainerResponseCopyWith(
          _$_CountryContainerResponse value,
          $Res Function(_$_CountryContainerResponse) then) =
      __$$_CountryContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CountryContainerData? data, String? exception});

  @override
  $CountryContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_CountryContainerResponseCopyWithImpl<$Res>
    extends _$CountryContainerResponseCopyWithImpl<$Res,
        _$_CountryContainerResponse>
    implements _$$_CountryContainerResponseCopyWith<$Res> {
  __$$_CountryContainerResponseCopyWithImpl(_$_CountryContainerResponse _value,
      $Res Function(_$_CountryContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_CountryContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CountryContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryContainerResponse implements _CountryContainerResponse {
  const _$_CountryContainerResponse({this.data, this.exception});

  factory _$_CountryContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CountryContainerResponseFromJson(json);

  @override
  final CountryContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'CountryContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryContainerResponse &&
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
  _$$_CountryContainerResponseCopyWith<_$_CountryContainerResponse>
      get copyWith => __$$_CountryContainerResponseCopyWithImpl<
          _$_CountryContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryContainerResponseToJson(
      this,
    );
  }
}

abstract class _CountryContainerResponse implements CountryContainerResponse {
  const factory _CountryContainerResponse(
      {final CountryContainerData? data,
      final String? exception}) = _$_CountryContainerResponse;

  factory _CountryContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_CountryContainerResponse.fromJson;

  @override
  CountryContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_CountryContainerResponseCopyWith<_$_CountryContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
