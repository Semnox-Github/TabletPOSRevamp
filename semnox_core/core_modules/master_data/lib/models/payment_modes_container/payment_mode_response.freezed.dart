// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_mode_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentModesResponse _$PaymentModesResponseFromJson(Map<String, dynamic> json) {
  return _PaymentModesResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentModesResponse {
  PaymentModesData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentModesResponseCopyWith<PaymentModesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModesResponseCopyWith<$Res> {
  factory $PaymentModesResponseCopyWith(PaymentModesResponse value,
          $Res Function(PaymentModesResponse) then) =
      _$PaymentModesResponseCopyWithImpl<$Res, PaymentModesResponse>;
  @useResult
  $Res call({PaymentModesData? data, String? exception});

  $PaymentModesDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$PaymentModesResponseCopyWithImpl<$Res,
        $Val extends PaymentModesResponse>
    implements $PaymentModesResponseCopyWith<$Res> {
  _$PaymentModesResponseCopyWithImpl(this._value, this._then);

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
              as PaymentModesData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentModesDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PaymentModesDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaymentModesResponseCopyWith<$Res>
    implements $PaymentModesResponseCopyWith<$Res> {
  factory _$$_PaymentModesResponseCopyWith(_$_PaymentModesResponse value,
          $Res Function(_$_PaymentModesResponse) then) =
      __$$_PaymentModesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaymentModesData? data, String? exception});

  @override
  $PaymentModesDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_PaymentModesResponseCopyWithImpl<$Res>
    extends _$PaymentModesResponseCopyWithImpl<$Res, _$_PaymentModesResponse>
    implements _$$_PaymentModesResponseCopyWith<$Res> {
  __$$_PaymentModesResponseCopyWithImpl(_$_PaymentModesResponse _value,
      $Res Function(_$_PaymentModesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_PaymentModesResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PaymentModesData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentModesResponse implements _PaymentModesResponse {
  const _$_PaymentModesResponse({this.data, this.exception});

  factory _$_PaymentModesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentModesResponseFromJson(json);

  @override
  final PaymentModesData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'PaymentModesResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentModesResponse &&
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
  _$$_PaymentModesResponseCopyWith<_$_PaymentModesResponse> get copyWith =>
      __$$_PaymentModesResponseCopyWithImpl<_$_PaymentModesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentModesResponseToJson(
      this,
    );
  }
}

abstract class _PaymentModesResponse implements PaymentModesResponse {
  const factory _PaymentModesResponse(
      {final PaymentModesData? data,
      final String? exception}) = _$_PaymentModesResponse;

  factory _PaymentModesResponse.fromJson(Map<String, dynamic> json) =
      _$_PaymentModesResponse.fromJson;

  @override
  PaymentModesData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentModesResponseCopyWith<_$_PaymentModesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
