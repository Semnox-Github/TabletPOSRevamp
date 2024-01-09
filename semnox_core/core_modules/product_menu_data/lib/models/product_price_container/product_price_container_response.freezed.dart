// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_price_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductPriceContainerResponse _$ProductPriceContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _ProductPriceContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductPriceContainerResponse {
  List<ProductPriceContainerData>? get data =>
      throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductPriceContainerResponseCopyWith<ProductPriceContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPriceContainerResponseCopyWith<$Res> {
  factory $ProductPriceContainerResponseCopyWith(
          ProductPriceContainerResponse value,
          $Res Function(ProductPriceContainerResponse) then) =
      _$ProductPriceContainerResponseCopyWithImpl<$Res,
          ProductPriceContainerResponse>;
  @useResult
  $Res call({List<ProductPriceContainerData>? data, String? exception});
}

/// @nodoc
class _$ProductPriceContainerResponseCopyWithImpl<$Res,
        $Val extends ProductPriceContainerResponse>
    implements $ProductPriceContainerResponseCopyWith<$Res> {
  _$ProductPriceContainerResponseCopyWithImpl(this._value, this._then);

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
              as List<ProductPriceContainerData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductPriceContainerResponseCopyWith<$Res>
    implements $ProductPriceContainerResponseCopyWith<$Res> {
  factory _$$_ProductPriceContainerResponseCopyWith(
          _$_ProductPriceContainerResponse value,
          $Res Function(_$_ProductPriceContainerResponse) then) =
      __$$_ProductPriceContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductPriceContainerData>? data, String? exception});
}

/// @nodoc
class __$$_ProductPriceContainerResponseCopyWithImpl<$Res>
    extends _$ProductPriceContainerResponseCopyWithImpl<$Res,
        _$_ProductPriceContainerResponse>
    implements _$$_ProductPriceContainerResponseCopyWith<$Res> {
  __$$_ProductPriceContainerResponseCopyWithImpl(
      _$_ProductPriceContainerResponse _value,
      $Res Function(_$_ProductPriceContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_ProductPriceContainerResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProductPriceContainerData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductPriceContainerResponse
    implements _ProductPriceContainerResponse {
  const _$_ProductPriceContainerResponse(
      {final List<ProductPriceContainerData>? data, this.exception})
      : _data = data;

  factory _$_ProductPriceContainerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_ProductPriceContainerResponseFromJson(json);

  final List<ProductPriceContainerData>? _data;
  @override
  List<ProductPriceContainerData>? get data {
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
    return 'ProductPriceContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductPriceContainerResponse &&
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
  _$$_ProductPriceContainerResponseCopyWith<_$_ProductPriceContainerResponse>
      get copyWith => __$$_ProductPriceContainerResponseCopyWithImpl<
          _$_ProductPriceContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductPriceContainerResponseToJson(
      this,
    );
  }
}

abstract class _ProductPriceContainerResponse
    implements ProductPriceContainerResponse {
  const factory _ProductPriceContainerResponse(
      {final List<ProductPriceContainerData>? data,
      final String? exception}) = _$_ProductPriceContainerResponse;

  factory _ProductPriceContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductPriceContainerResponse.fromJson;

  @override
  List<ProductPriceContainerData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ProductPriceContainerResponseCopyWith<_$_ProductPriceContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
