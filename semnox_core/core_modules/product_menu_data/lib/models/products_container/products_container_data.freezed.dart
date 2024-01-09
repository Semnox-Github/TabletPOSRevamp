// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductsContainerData _$ProductsContainerDataFromJson(
    Map<String, dynamic> json) {
  return _ProductsContainerData.fromJson(json);
}

/// @nodoc
mixin _$ProductsContainerData {
  @JsonKey(name: 'ProductContainerDTOList')
  List<ProductContainerDTO> get productContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsContainerDataCopyWith<ProductsContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsContainerDataCopyWith<$Res> {
  factory $ProductsContainerDataCopyWith(ProductsContainerData value,
          $Res Function(ProductsContainerData) then) =
      _$ProductsContainerDataCopyWithImpl<$Res, ProductsContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductContainerDTOList')
          List<ProductContainerDTO> productContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$ProductsContainerDataCopyWithImpl<$Res,
        $Val extends ProductsContainerData>
    implements $ProductsContainerDataCopyWith<$Res> {
  _$ProductsContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      productContainerDTOList: null == productContainerDTOList
          ? _value.productContainerDTOList
          : productContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ProductContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductsContainerDataCopyWith<$Res>
    implements $ProductsContainerDataCopyWith<$Res> {
  factory _$$_ProductsContainerDataCopyWith(_$_ProductsContainerData value,
          $Res Function(_$_ProductsContainerData) then) =
      __$$_ProductsContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductContainerDTOList')
          List<ProductContainerDTO> productContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_ProductsContainerDataCopyWithImpl<$Res>
    extends _$ProductsContainerDataCopyWithImpl<$Res, _$_ProductsContainerData>
    implements _$$_ProductsContainerDataCopyWith<$Res> {
  __$$_ProductsContainerDataCopyWithImpl(_$_ProductsContainerData _value,
      $Res Function(_$_ProductsContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_ProductsContainerData(
      productContainerDTOList: null == productContainerDTOList
          ? _value._productContainerDTOList
          : productContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ProductContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductsContainerData implements _ProductsContainerData {
  const _$_ProductsContainerData(
      {@JsonKey(name: 'ProductContainerDTOList')
          required final List<ProductContainerDTO> productContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _productContainerDTOList = productContainerDTOList;

  factory _$_ProductsContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_ProductsContainerDataFromJson(json);

  final List<ProductContainerDTO> _productContainerDTOList;
  @override
  @JsonKey(name: 'ProductContainerDTOList')
  List<ProductContainerDTO> get productContainerDTOList {
    if (_productContainerDTOList is EqualUnmodifiableListView)
      return _productContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'ProductsContainerData(productContainerDTOList: $productContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsContainerData &&
            const DeepCollectionEquality().equals(
                other._productContainerDTOList, _productContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_productContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductsContainerDataCopyWith<_$_ProductsContainerData> get copyWith =>
      __$$_ProductsContainerDataCopyWithImpl<_$_ProductsContainerData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductsContainerDataToJson(
      this,
    );
  }
}

abstract class _ProductsContainerData implements ProductsContainerData {
  const factory _ProductsContainerData(
      {@JsonKey(name: 'ProductContainerDTOList')
          required final List<ProductContainerDTO> productContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_ProductsContainerData;

  factory _ProductsContainerData.fromJson(Map<String, dynamic> json) =
      _$_ProductsContainerData.fromJson;

  @override
  @JsonKey(name: 'ProductContainerDTOList')
  List<ProductContainerDTO> get productContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsContainerDataCopyWith<_$_ProductsContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}
