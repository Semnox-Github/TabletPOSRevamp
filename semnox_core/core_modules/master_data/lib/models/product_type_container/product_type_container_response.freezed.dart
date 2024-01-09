// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_type_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductTypeContainerResponse _$ProductTypeContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _ProductTypeContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductTypeContainerResponse {
  ProductContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductTypeContainerResponseCopyWith<ProductTypeContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductTypeContainerResponseCopyWith<$Res> {
  factory $ProductTypeContainerResponseCopyWith(
          ProductTypeContainerResponse value,
          $Res Function(ProductTypeContainerResponse) then) =
      _$ProductTypeContainerResponseCopyWithImpl<$Res,
          ProductTypeContainerResponse>;
  @useResult
  $Res call({ProductContainerData? data, String? exception});

  $ProductContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ProductTypeContainerResponseCopyWithImpl<$Res,
        $Val extends ProductTypeContainerResponse>
    implements $ProductTypeContainerResponseCopyWith<$Res> {
  _$ProductTypeContainerResponseCopyWithImpl(this._value, this._then);

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
              as ProductContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ProductContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductTypeContainerResponseCopyWith<$Res>
    implements $ProductTypeContainerResponseCopyWith<$Res> {
  factory _$$_ProductTypeContainerResponseCopyWith(
          _$_ProductTypeContainerResponse value,
          $Res Function(_$_ProductTypeContainerResponse) then) =
      __$$_ProductTypeContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductContainerData? data, String? exception});

  @override
  $ProductContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ProductTypeContainerResponseCopyWithImpl<$Res>
    extends _$ProductTypeContainerResponseCopyWithImpl<$Res,
        _$_ProductTypeContainerResponse>
    implements _$$_ProductTypeContainerResponseCopyWith<$Res> {
  __$$_ProductTypeContainerResponseCopyWithImpl(
      _$_ProductTypeContainerResponse _value,
      $Res Function(_$_ProductTypeContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_ProductTypeContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProductContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductTypeContainerResponse implements _ProductTypeContainerResponse {
  const _$_ProductTypeContainerResponse({this.data, this.exception});

  factory _$_ProductTypeContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProductTypeContainerResponseFromJson(json);

  @override
  final ProductContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'ProductTypeContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductTypeContainerResponse &&
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
  _$$_ProductTypeContainerResponseCopyWith<_$_ProductTypeContainerResponse>
      get copyWith => __$$_ProductTypeContainerResponseCopyWithImpl<
          _$_ProductTypeContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductTypeContainerResponseToJson(
      this,
    );
  }
}

abstract class _ProductTypeContainerResponse
    implements ProductTypeContainerResponse {
  const factory _ProductTypeContainerResponse(
      {final ProductContainerData? data,
      final String? exception}) = _$_ProductTypeContainerResponse;

  factory _ProductTypeContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductTypeContainerResponse.fromJson;

  @override
  ProductContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ProductTypeContainerResponseCopyWith<_$_ProductTypeContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
