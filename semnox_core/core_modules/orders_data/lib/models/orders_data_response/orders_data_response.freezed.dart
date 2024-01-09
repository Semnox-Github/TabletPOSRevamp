// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrdersDataResponse _$OrdersDataResponseFromJson(Map<String, dynamic> json) {
  return _OrdersDataResponse.fromJson(json);
}

/// @nodoc
mixin _$OrdersDataResponse {
  List<OrdersData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrdersDataResponseCopyWith<OrdersDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersDataResponseCopyWith<$Res> {
  factory $OrdersDataResponseCopyWith(
          OrdersDataResponse value, $Res Function(OrdersDataResponse) then) =
      _$OrdersDataResponseCopyWithImpl<$Res, OrdersDataResponse>;
  @useResult
  $Res call({List<OrdersData>? data, String? exception});
}

/// @nodoc
class _$OrdersDataResponseCopyWithImpl<$Res, $Val extends OrdersDataResponse>
    implements $OrdersDataResponseCopyWith<$Res> {
  _$OrdersDataResponseCopyWithImpl(this._value, this._then);

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
              as List<OrdersData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrdersDataResponseCopyWith<$Res>
    implements $OrdersDataResponseCopyWith<$Res> {
  factory _$$_OrdersDataResponseCopyWith(_$_OrdersDataResponse value,
          $Res Function(_$_OrdersDataResponse) then) =
      __$$_OrdersDataResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OrdersData>? data, String? exception});
}

/// @nodoc
class __$$_OrdersDataResponseCopyWithImpl<$Res>
    extends _$OrdersDataResponseCopyWithImpl<$Res, _$_OrdersDataResponse>
    implements _$$_OrdersDataResponseCopyWith<$Res> {
  __$$_OrdersDataResponseCopyWithImpl(
      _$_OrdersDataResponse _value, $Res Function(_$_OrdersDataResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_OrdersDataResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<OrdersData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrdersDataResponse implements _OrdersDataResponse {
  const _$_OrdersDataResponse({final List<OrdersData>? data, this.exception})
      : _data = data;

  factory _$_OrdersDataResponse.fromJson(Map<String, dynamic> json) =>
      _$$_OrdersDataResponseFromJson(json);

  final List<OrdersData>? _data;
  @override
  List<OrdersData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? exception;

  @override
  String toString() {
    return 'OrdersDataResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrdersDataResponse &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrdersDataResponseCopyWith<_$_OrdersDataResponse> get copyWith =>
      __$$_OrdersDataResponseCopyWithImpl<_$_OrdersDataResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrdersDataResponseToJson(
      this,
    );
  }
}

abstract class _OrdersDataResponse implements OrdersDataResponse {
  const factory _OrdersDataResponse(
      {final List<OrdersData>? data,
      final String? exception}) = _$_OrdersDataResponse;

  factory _OrdersDataResponse.fromJson(Map<String, dynamic> json) =
      _$_OrdersDataResponse.fromJson;

  @override
  List<OrdersData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_OrdersDataResponseCopyWith<_$_OrdersDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
