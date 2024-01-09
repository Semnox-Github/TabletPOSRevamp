// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_menu_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductMenuResponse _$ProductMenuResponseFromJson(Map<String, dynamic> json) {
  return _ProductMenuResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductMenuResponse {
  ProductMenuData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductMenuResponseCopyWith<ProductMenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMenuResponseCopyWith<$Res> {
  factory $ProductMenuResponseCopyWith(
          ProductMenuResponse value, $Res Function(ProductMenuResponse) then) =
      _$ProductMenuResponseCopyWithImpl<$Res, ProductMenuResponse>;
  @useResult
  $Res call({ProductMenuData? data, String? exception});

  $ProductMenuDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ProductMenuResponseCopyWithImpl<$Res, $Val extends ProductMenuResponse>
    implements $ProductMenuResponseCopyWith<$Res> {
  _$ProductMenuResponseCopyWithImpl(this._value, this._then);

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
              as ProductMenuData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductMenuDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ProductMenuDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductMenuResponseCopyWith<$Res>
    implements $ProductMenuResponseCopyWith<$Res> {
  factory _$$_ProductMenuResponseCopyWith(_$_ProductMenuResponse value,
          $Res Function(_$_ProductMenuResponse) then) =
      __$$_ProductMenuResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductMenuData? data, String? exception});

  @override
  $ProductMenuDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ProductMenuResponseCopyWithImpl<$Res>
    extends _$ProductMenuResponseCopyWithImpl<$Res, _$_ProductMenuResponse>
    implements _$$_ProductMenuResponseCopyWith<$Res> {
  __$$_ProductMenuResponseCopyWithImpl(_$_ProductMenuResponse _value,
      $Res Function(_$_ProductMenuResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_ProductMenuResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProductMenuData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductMenuResponse implements _ProductMenuResponse {
  const _$_ProductMenuResponse({this.data, this.exception});

  factory _$_ProductMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProductMenuResponseFromJson(json);

  @override
  final ProductMenuData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'ProductMenuResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductMenuResponse &&
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
  _$$_ProductMenuResponseCopyWith<_$_ProductMenuResponse> get copyWith =>
      __$$_ProductMenuResponseCopyWithImpl<_$_ProductMenuResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductMenuResponseToJson(
      this,
    );
  }
}

abstract class _ProductMenuResponse implements ProductMenuResponse {
  const factory _ProductMenuResponse(
      {final ProductMenuData? data,
      final String? exception}) = _$_ProductMenuResponse;

  factory _ProductMenuResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductMenuResponse.fromJson;

  @override
  ProductMenuData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ProductMenuResponseCopyWith<_$_ProductMenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
