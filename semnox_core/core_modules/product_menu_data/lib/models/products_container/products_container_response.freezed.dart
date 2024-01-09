// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductsContainerResponse _$ProductsContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _ProductsContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductsContainerResponse {
  ProductsContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsContainerResponseCopyWith<ProductsContainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsContainerResponseCopyWith<$Res> {
  factory $ProductsContainerResponseCopyWith(ProductsContainerResponse value,
          $Res Function(ProductsContainerResponse) then) =
      _$ProductsContainerResponseCopyWithImpl<$Res, ProductsContainerResponse>;
  @useResult
  $Res call({ProductsContainerData? data, String? exception});

  $ProductsContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ProductsContainerResponseCopyWithImpl<$Res,
        $Val extends ProductsContainerResponse>
    implements $ProductsContainerResponseCopyWith<$Res> {
  _$ProductsContainerResponseCopyWithImpl(this._value, this._then);

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
              as ProductsContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductsContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ProductsContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductsContainerResponseCopyWith<$Res>
    implements $ProductsContainerResponseCopyWith<$Res> {
  factory _$$_ProductsContainerResponseCopyWith(
          _$_ProductsContainerResponse value,
          $Res Function(_$_ProductsContainerResponse) then) =
      __$$_ProductsContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductsContainerData? data, String? exception});

  @override
  $ProductsContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ProductsContainerResponseCopyWithImpl<$Res>
    extends _$ProductsContainerResponseCopyWithImpl<$Res,
        _$_ProductsContainerResponse>
    implements _$$_ProductsContainerResponseCopyWith<$Res> {
  __$$_ProductsContainerResponseCopyWithImpl(
      _$_ProductsContainerResponse _value,
      $Res Function(_$_ProductsContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_ProductsContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProductsContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductsContainerResponse implements _ProductsContainerResponse {
  const _$_ProductsContainerResponse({this.data, this.exception});

  factory _$_ProductsContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProductsContainerResponseFromJson(json);

  @override
  final ProductsContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'ProductsContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsContainerResponse &&
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
  _$$_ProductsContainerResponseCopyWith<_$_ProductsContainerResponse>
      get copyWith => __$$_ProductsContainerResponseCopyWithImpl<
          _$_ProductsContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductsContainerResponseToJson(
      this,
    );
  }
}

abstract class _ProductsContainerResponse implements ProductsContainerResponse {
  const factory _ProductsContainerResponse(
      {final ProductsContainerData? data,
      final String? exception}) = _$_ProductsContainerResponse;

  factory _ProductsContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductsContainerResponse.fromJson;

  @override
  ProductsContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsContainerResponseCopyWith<_$_ProductsContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
