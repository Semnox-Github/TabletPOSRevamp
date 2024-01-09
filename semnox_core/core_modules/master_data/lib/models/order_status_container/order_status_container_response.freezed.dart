// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_status_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderStatusContainerResponse _$OrderStatusContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _OrderStatusContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusContainerResponse {
  OrderStatusContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatusContainerResponseCopyWith<OrderStatusContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusContainerResponseCopyWith<$Res> {
  factory $OrderStatusContainerResponseCopyWith(
          OrderStatusContainerResponse value,
          $Res Function(OrderStatusContainerResponse) then) =
      _$OrderStatusContainerResponseCopyWithImpl<$Res,
          OrderStatusContainerResponse>;
  @useResult
  $Res call({OrderStatusContainerData? data, String? exception});

  $OrderStatusContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$OrderStatusContainerResponseCopyWithImpl<$Res,
        $Val extends OrderStatusContainerResponse>
    implements $OrderStatusContainerResponseCopyWith<$Res> {
  _$OrderStatusContainerResponseCopyWithImpl(this._value, this._then);

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
              as OrderStatusContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderStatusContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $OrderStatusContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderStatusContainerResponseCopyWith<$Res>
    implements $OrderStatusContainerResponseCopyWith<$Res> {
  factory _$$_OrderStatusContainerResponseCopyWith(
          _$_OrderStatusContainerResponse value,
          $Res Function(_$_OrderStatusContainerResponse) then) =
      __$$_OrderStatusContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderStatusContainerData? data, String? exception});

  @override
  $OrderStatusContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_OrderStatusContainerResponseCopyWithImpl<$Res>
    extends _$OrderStatusContainerResponseCopyWithImpl<$Res,
        _$_OrderStatusContainerResponse>
    implements _$$_OrderStatusContainerResponseCopyWith<$Res> {
  __$$_OrderStatusContainerResponseCopyWithImpl(
      _$_OrderStatusContainerResponse _value,
      $Res Function(_$_OrderStatusContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_OrderStatusContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OrderStatusContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderStatusContainerResponse implements _OrderStatusContainerResponse {
  const _$_OrderStatusContainerResponse({this.data, this.exception});

  factory _$_OrderStatusContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_OrderStatusContainerResponseFromJson(json);

  @override
  final OrderStatusContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'OrderStatusContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderStatusContainerResponse &&
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
  _$$_OrderStatusContainerResponseCopyWith<_$_OrderStatusContainerResponse>
      get copyWith => __$$_OrderStatusContainerResponseCopyWithImpl<
          _$_OrderStatusContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderStatusContainerResponseToJson(
      this,
    );
  }
}

abstract class _OrderStatusContainerResponse
    implements OrderStatusContainerResponse {
  const factory _OrderStatusContainerResponse(
      {final OrderStatusContainerData? data,
      final String? exception}) = _$_OrderStatusContainerResponse;

  factory _OrderStatusContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_OrderStatusContainerResponse.fromJson;

  @override
  OrderStatusContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_OrderStatusContainerResponseCopyWith<_$_OrderStatusContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
