// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_entitlement_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExchangeEntitlementResponse _$ExchangeEntitlementResponseFromJson(
    Map<String, dynamic> json) {
  return _ExchangeEntitlementResponse.fromJson(json);
}

/// @nodoc
mixin _$ExchangeEntitlementResponse {
  ExchangeEntitlementData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExchangeEntitlementResponseCopyWith<ExchangeEntitlementResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeEntitlementResponseCopyWith<$Res> {
  factory $ExchangeEntitlementResponseCopyWith(
          ExchangeEntitlementResponse value,
          $Res Function(ExchangeEntitlementResponse) then) =
      _$ExchangeEntitlementResponseCopyWithImpl<$Res,
          ExchangeEntitlementResponse>;
  @useResult
  $Res call({ExchangeEntitlementData? data, String? exception});

  $ExchangeEntitlementDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ExchangeEntitlementResponseCopyWithImpl<$Res,
        $Val extends ExchangeEntitlementResponse>
    implements $ExchangeEntitlementResponseCopyWith<$Res> {
  _$ExchangeEntitlementResponseCopyWithImpl(this._value, this._then);

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
              as ExchangeEntitlementData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExchangeEntitlementDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ExchangeEntitlementDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ExchangeEntitlementResponseCopyWith<$Res>
    implements $ExchangeEntitlementResponseCopyWith<$Res> {
  factory _$$_ExchangeEntitlementResponseCopyWith(
          _$_ExchangeEntitlementResponse value,
          $Res Function(_$_ExchangeEntitlementResponse) then) =
      __$$_ExchangeEntitlementResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExchangeEntitlementData? data, String? exception});

  @override
  $ExchangeEntitlementDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ExchangeEntitlementResponseCopyWithImpl<$Res>
    extends _$ExchangeEntitlementResponseCopyWithImpl<$Res,
        _$_ExchangeEntitlementResponse>
    implements _$$_ExchangeEntitlementResponseCopyWith<$Res> {
  __$$_ExchangeEntitlementResponseCopyWithImpl(
      _$_ExchangeEntitlementResponse _value,
      $Res Function(_$_ExchangeEntitlementResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_ExchangeEntitlementResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ExchangeEntitlementData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExchangeEntitlementResponse implements _ExchangeEntitlementResponse {
  const _$_ExchangeEntitlementResponse({this.data, this.exception});

  factory _$_ExchangeEntitlementResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ExchangeEntitlementResponseFromJson(json);

  @override
  final ExchangeEntitlementData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'ExchangeEntitlementResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExchangeEntitlementResponse &&
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
  _$$_ExchangeEntitlementResponseCopyWith<_$_ExchangeEntitlementResponse>
      get copyWith => __$$_ExchangeEntitlementResponseCopyWithImpl<
          _$_ExchangeEntitlementResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExchangeEntitlementResponseToJson(
      this,
    );
  }
}

abstract class _ExchangeEntitlementResponse
    implements ExchangeEntitlementResponse {
  const factory _ExchangeEntitlementResponse(
      {final ExchangeEntitlementData? data,
      final String? exception}) = _$_ExchangeEntitlementResponse;

  factory _ExchangeEntitlementResponse.fromJson(Map<String, dynamic> json) =
      _$_ExchangeEntitlementResponse.fromJson;

  @override
  ExchangeEntitlementData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ExchangeEntitlementResponseCopyWith<_$_ExchangeEntitlementResponse>
      get copyWith => throw _privateConstructorUsedError;
}
