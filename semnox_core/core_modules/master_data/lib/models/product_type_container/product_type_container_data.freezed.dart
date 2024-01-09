// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_type_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductContainerData _$ProductContainerDataFromJson(Map<String, dynamic> json) {
  return _ProductContainerData.fromJson(json);
}

/// @nodoc
mixin _$ProductContainerData {
  @JsonKey(name: 'ProductTypeContainerDTOList')
  List<ProductTypeContainerDto>? get productTypeContainerDtoList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductContainerDataCopyWith<ProductContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductContainerDataCopyWith<$Res> {
  factory $ProductContainerDataCopyWith(ProductContainerData value,
          $Res Function(ProductContainerData) then) =
      _$ProductContainerDataCopyWithImpl<$Res, ProductContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductTypeContainerDTOList')
          List<ProductTypeContainerDto>? productTypeContainerDtoList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$ProductContainerDataCopyWithImpl<$Res,
        $Val extends ProductContainerData>
    implements $ProductContainerDataCopyWith<$Res> {
  _$ProductContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productTypeContainerDtoList = freezed,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      productTypeContainerDtoList: freezed == productTypeContainerDtoList
          ? _value.productTypeContainerDtoList
          : productTypeContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<ProductTypeContainerDto>?,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductContainerDataCopyWith<$Res>
    implements $ProductContainerDataCopyWith<$Res> {
  factory _$$_ProductContainerDataCopyWith(_$_ProductContainerData value,
          $Res Function(_$_ProductContainerData) then) =
      __$$_ProductContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductTypeContainerDTOList')
          List<ProductTypeContainerDto>? productTypeContainerDtoList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_ProductContainerDataCopyWithImpl<$Res>
    extends _$ProductContainerDataCopyWithImpl<$Res, _$_ProductContainerData>
    implements _$$_ProductContainerDataCopyWith<$Res> {
  __$$_ProductContainerDataCopyWithImpl(_$_ProductContainerData _value,
      $Res Function(_$_ProductContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productTypeContainerDtoList = freezed,
    Object? hash = freezed,
  }) {
    return _then(_$_ProductContainerData(
      productTypeContainerDtoList: freezed == productTypeContainerDtoList
          ? _value._productTypeContainerDtoList
          : productTypeContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<ProductTypeContainerDto>?,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductContainerData implements _ProductContainerData {
  const _$_ProductContainerData(
      {@JsonKey(name: 'ProductTypeContainerDTOList')
          final List<ProductTypeContainerDto>? productTypeContainerDtoList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _productTypeContainerDtoList = productTypeContainerDtoList;

  factory _$_ProductContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_ProductContainerDataFromJson(json);

  final List<ProductTypeContainerDto>? _productTypeContainerDtoList;
  @override
  @JsonKey(name: 'ProductTypeContainerDTOList')
  List<ProductTypeContainerDto>? get productTypeContainerDtoList {
    final value = _productTypeContainerDtoList;
    if (value == null) return null;
    if (_productTypeContainerDtoList is EqualUnmodifiableListView)
      return _productTypeContainerDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'ProductContainerData(productTypeContainerDtoList: $productTypeContainerDtoList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductContainerData &&
            const DeepCollectionEquality().equals(
                other._productTypeContainerDtoList,
                _productTypeContainerDtoList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_productTypeContainerDtoList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductContainerDataCopyWith<_$_ProductContainerData> get copyWith =>
      __$$_ProductContainerDataCopyWithImpl<_$_ProductContainerData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductContainerDataToJson(
      this,
    );
  }
}

abstract class _ProductContainerData implements ProductContainerData {
  const factory _ProductContainerData(
      {@JsonKey(name: 'ProductTypeContainerDTOList')
          final List<ProductTypeContainerDto>? productTypeContainerDtoList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_ProductContainerData;

  factory _ProductContainerData.fromJson(Map<String, dynamic> json) =
      _$_ProductContainerData.fromJson;

  @override
  @JsonKey(name: 'ProductTypeContainerDTOList')
  List<ProductTypeContainerDto>? get productTypeContainerDtoList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_ProductContainerDataCopyWith<_$_ProductContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}
