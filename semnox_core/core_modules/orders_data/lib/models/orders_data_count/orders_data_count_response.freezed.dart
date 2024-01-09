// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_data_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrdersDataCountResponse _$OrdersDataCountResponseFromJson(
    Map<String, dynamic> json) {
  return _OrdersDataCountResponse.fromJson(json);
}

/// @nodoc
mixin _$OrdersDataCountResponse {
  int? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersDataCountResponseCopyWith<OrdersDataCountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersDataCountResponseCopyWith<$Res> {
  factory $OrdersDataCountResponseCopyWith(OrdersDataCountResponse value,
          $Res Function(OrdersDataCountResponse) then) =
      _$OrdersDataCountResponseCopyWithImpl<$Res, OrdersDataCountResponse>;
  @useResult
  $Res call({int? data, String? exception});
}

/// @nodoc
class _$OrdersDataCountResponseCopyWithImpl<$Res,
        $Val extends OrdersDataCountResponse>
    implements $OrdersDataCountResponseCopyWith<$Res> {
  _$OrdersDataCountResponseCopyWithImpl(this._value, this._then);

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
              as int?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrdersDataCountResponseCopyWith<$Res>
    implements $OrdersDataCountResponseCopyWith<$Res> {
  factory _$$_OrdersDataCountResponseCopyWith(_$_OrdersDataCountResponse value,
          $Res Function(_$_OrdersDataCountResponse) then) =
      __$$_OrdersDataCountResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? data, String? exception});
}

/// @nodoc
class __$$_OrdersDataCountResponseCopyWithImpl<$Res>
    extends _$OrdersDataCountResponseCopyWithImpl<$Res,
        _$_OrdersDataCountResponse>
    implements _$$_OrdersDataCountResponseCopyWith<$Res> {
  __$$_OrdersDataCountResponseCopyWithImpl(_$_OrdersDataCountResponse _value,
      $Res Function(_$_OrdersDataCountResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_OrdersDataCountResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrdersDataCountResponse implements _OrdersDataCountResponse {
  const _$_OrdersDataCountResponse({this.data, this.exception});

  factory _$_OrdersDataCountResponse.fromJson(Map<String, dynamic> json) =>
      _$$_OrdersDataCountResponseFromJson(json);

  @override
  final int? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'OrdersDataCountResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrdersDataCountResponse &&
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
  _$$_OrdersDataCountResponseCopyWith<_$_OrdersDataCountResponse>
      get copyWith =>
          __$$_OrdersDataCountResponseCopyWithImpl<_$_OrdersDataCountResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrdersDataCountResponseToJson(
      this,
    );
  }
}

abstract class _OrdersDataCountResponse implements OrdersDataCountResponse {
  const factory _OrdersDataCountResponse(
      {final int? data, final String? exception}) = _$_OrdersDataCountResponse;

  factory _OrdersDataCountResponse.fromJson(Map<String, dynamic> json) =
      _$_OrdersDataCountResponse.fromJson;

  @override
  int? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_OrdersDataCountResponseCopyWith<_$_OrdersDataCountResponse>
      get copyWith => throw _privateConstructorUsedError;
}
