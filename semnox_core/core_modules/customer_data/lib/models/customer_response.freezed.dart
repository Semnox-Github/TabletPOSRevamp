// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) {
  return _CustomerResponse.fromJson(json);
}

/// @nodoc
mixin _$CustomerResponse {
  CustomerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerResponseCopyWith<CustomerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerResponseCopyWith<$Res> {
  factory $CustomerResponseCopyWith(
          CustomerResponse value, $Res Function(CustomerResponse) then) =
      _$CustomerResponseCopyWithImpl<$Res, CustomerResponse>;
  @useResult
  $Res call({CustomerData? data, String? exception});

  $CustomerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CustomerResponseCopyWithImpl<$Res, $Val extends CustomerResponse>
    implements $CustomerResponseCopyWith<$Res> {
  _$CustomerResponseCopyWithImpl(this._value, this._then);

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
              as CustomerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CustomerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CustomerResponseCopyWith<$Res>
    implements $CustomerResponseCopyWith<$Res> {
  factory _$$_CustomerResponseCopyWith(
          _$_CustomerResponse value, $Res Function(_$_CustomerResponse) then) =
      __$$_CustomerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CustomerData? data, String? exception});

  @override
  $CustomerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_CustomerResponseCopyWithImpl<$Res>
    extends _$CustomerResponseCopyWithImpl<$Res, _$_CustomerResponse>
    implements _$$_CustomerResponseCopyWith<$Res> {
  __$$_CustomerResponseCopyWithImpl(
      _$_CustomerResponse _value, $Res Function(_$_CustomerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_CustomerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CustomerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerResponse implements _CustomerResponse {
  const _$_CustomerResponse({this.data, this.exception});

  factory _$_CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerResponseFromJson(json);

  @override
  final CustomerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'CustomerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerResponse &&
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
  _$$_CustomerResponseCopyWith<_$_CustomerResponse> get copyWith =>
      __$$_CustomerResponseCopyWithImpl<_$_CustomerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerResponseToJson(
      this,
    );
  }
}

abstract class _CustomerResponse implements CustomerResponse {
  const factory _CustomerResponse(
      {final CustomerData? data,
      final String? exception}) = _$_CustomerResponse;

  factory _CustomerResponse.fromJson(Map<String, dynamic> json) =
      _$_CustomerResponse.fromJson;

  @override
  CustomerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerResponseCopyWith<_$_CustomerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
