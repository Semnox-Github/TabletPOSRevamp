// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_type_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderTypeContainerResponse _$OrderTypeContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _OrderTypeContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$OrderTypeContainerResponse {
  OrderTypeContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTypeContainerResponseCopyWith<OrderTypeContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTypeContainerResponseCopyWith<$Res> {
  factory $OrderTypeContainerResponseCopyWith(OrderTypeContainerResponse value,
          $Res Function(OrderTypeContainerResponse) then) =
      _$OrderTypeContainerResponseCopyWithImpl<$Res,
          OrderTypeContainerResponse>;
  @useResult
  $Res call({OrderTypeContainerData? data, String? exception});

  $OrderTypeContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$OrderTypeContainerResponseCopyWithImpl<$Res,
        $Val extends OrderTypeContainerResponse>
    implements $OrderTypeContainerResponseCopyWith<$Res> {
  _$OrderTypeContainerResponseCopyWithImpl(this._value, this._then);

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
              as OrderTypeContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderTypeContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $OrderTypeContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderTypeContainerResponseCopyWith<$Res>
    implements $OrderTypeContainerResponseCopyWith<$Res> {
  factory _$$_OrderTypeContainerResponseCopyWith(
          _$_OrderTypeContainerResponse value,
          $Res Function(_$_OrderTypeContainerResponse) then) =
      __$$_OrderTypeContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderTypeContainerData? data, String? exception});

  @override
  $OrderTypeContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_OrderTypeContainerResponseCopyWithImpl<$Res>
    extends _$OrderTypeContainerResponseCopyWithImpl<$Res,
        _$_OrderTypeContainerResponse>
    implements _$$_OrderTypeContainerResponseCopyWith<$Res> {
  __$$_OrderTypeContainerResponseCopyWithImpl(
      _$_OrderTypeContainerResponse _value,
      $Res Function(_$_OrderTypeContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_OrderTypeContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OrderTypeContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderTypeContainerResponse implements _OrderTypeContainerResponse {
  const _$_OrderTypeContainerResponse({this.data, this.exception});

  factory _$_OrderTypeContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_OrderTypeContainerResponseFromJson(json);

  @override
  final OrderTypeContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'OrderTypeContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderTypeContainerResponse &&
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
  _$$_OrderTypeContainerResponseCopyWith<_$_OrderTypeContainerResponse>
      get copyWith => __$$_OrderTypeContainerResponseCopyWithImpl<
          _$_OrderTypeContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderTypeContainerResponseToJson(
      this,
    );
  }
}

abstract class _OrderTypeContainerResponse
    implements OrderTypeContainerResponse {
  const factory _OrderTypeContainerResponse(
      {final OrderTypeContainerData? data,
      final String? exception}) = _$_OrderTypeContainerResponse;

  factory _OrderTypeContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_OrderTypeContainerResponse.fromJson;

  @override
  OrderTypeContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_OrderTypeContainerResponseCopyWith<_$_OrderTypeContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
