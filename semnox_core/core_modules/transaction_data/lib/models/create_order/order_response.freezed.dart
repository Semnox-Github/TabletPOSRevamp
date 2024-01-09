// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return _COrderResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderResponse {
  OrderData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderResponseCopyWith<OrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderResponseCopyWith<$Res> {
  factory $OrderResponseCopyWith(
          OrderResponse value, $Res Function(OrderResponse) then) =
      _$OrderResponseCopyWithImpl<$Res, OrderResponse>;
  @useResult
  $Res call({OrderData? data, String? exception});

  $OrderDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$OrderResponseCopyWithImpl<$Res, $Val extends OrderResponse>
    implements $OrderResponseCopyWith<$Res> {
  _$OrderResponseCopyWithImpl(this._value, this._then);

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
              as OrderData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $OrderDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_COrderResponseCopyWith<$Res>
    implements $OrderResponseCopyWith<$Res> {
  factory _$$_COrderResponseCopyWith(
          _$_COrderResponse value, $Res Function(_$_COrderResponse) then) =
      __$$_COrderResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderData? data, String? exception});

  @override
  $OrderDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_COrderResponseCopyWithImpl<$Res>
    extends _$OrderResponseCopyWithImpl<$Res, _$_COrderResponse>
    implements _$$_COrderResponseCopyWith<$Res> {
  __$$_COrderResponseCopyWithImpl(
      _$_COrderResponse _value, $Res Function(_$_COrderResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_COrderResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OrderData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_COrderResponse implements _COrderResponse {
  const _$_COrderResponse({this.data, this.exception});

  factory _$_COrderResponse.fromJson(Map<String, dynamic> json) =>
      _$$_COrderResponseFromJson(json);

  @override
  final OrderData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'OrderResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_COrderResponse &&
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
  _$$_COrderResponseCopyWith<_$_COrderResponse> get copyWith =>
      __$$_COrderResponseCopyWithImpl<_$_COrderResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_COrderResponseToJson(
      this,
    );
  }
}

abstract class _COrderResponse implements OrderResponse {
  const factory _COrderResponse(
      {final OrderData? data, final String? exception}) = _$_COrderResponse;

  factory _COrderResponse.fromJson(Map<String, dynamic> json) =
      _$_COrderResponse.fromJson;

  @override
  OrderData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_COrderResponseCopyWith<_$_COrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
