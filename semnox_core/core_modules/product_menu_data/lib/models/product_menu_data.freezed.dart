// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_menu_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductMenuData _$ProductMenuDataFromJson(Map<String, dynamic> json) {
  return _ProductMenuData.fromJson(json);
}

/// @nodoc
mixin _$ProductMenuData {
  @JsonKey(name: 'ProductMenuContainerSnapshotDTOList')
  List<ProductMenuContainerSnapshotDTO>
      get productMenuContainerSnapshotDTOList =>
          throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductMenuDataCopyWith<ProductMenuData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMenuDataCopyWith<$Res> {
  factory $ProductMenuDataCopyWith(
          ProductMenuData value, $Res Function(ProductMenuData) then) =
      _$ProductMenuDataCopyWithImpl<$Res, ProductMenuData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductMenuContainerSnapshotDTOList')
          List<ProductMenuContainerSnapshotDTO>
              productMenuContainerSnapshotDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$ProductMenuDataCopyWithImpl<$Res, $Val extends ProductMenuData>
    implements $ProductMenuDataCopyWith<$Res> {
  _$ProductMenuDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productMenuContainerSnapshotDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      productMenuContainerSnapshotDTOList: null ==
              productMenuContainerSnapshotDTOList
          ? _value.productMenuContainerSnapshotDTOList
          : productMenuContainerSnapshotDTOList // ignore: cast_nullable_to_non_nullable
              as List<ProductMenuContainerSnapshotDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductMenuDataCopyWith<$Res>
    implements $ProductMenuDataCopyWith<$Res> {
  factory _$$_ProductMenuDataCopyWith(
          _$_ProductMenuData value, $Res Function(_$_ProductMenuData) then) =
      __$$_ProductMenuDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductMenuContainerSnapshotDTOList')
          List<ProductMenuContainerSnapshotDTO>
              productMenuContainerSnapshotDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_ProductMenuDataCopyWithImpl<$Res>
    extends _$ProductMenuDataCopyWithImpl<$Res, _$_ProductMenuData>
    implements _$$_ProductMenuDataCopyWith<$Res> {
  __$$_ProductMenuDataCopyWithImpl(
      _$_ProductMenuData _value, $Res Function(_$_ProductMenuData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productMenuContainerSnapshotDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_ProductMenuData(
      productMenuContainerSnapshotDTOList: null ==
              productMenuContainerSnapshotDTOList
          ? _value._productMenuContainerSnapshotDTOList
          : productMenuContainerSnapshotDTOList // ignore: cast_nullable_to_non_nullable
              as List<ProductMenuContainerSnapshotDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductMenuData implements _ProductMenuData {
  const _$_ProductMenuData(
      {@JsonKey(name: 'ProductMenuContainerSnapshotDTOList')
          required final List<ProductMenuContainerSnapshotDTO>
              productMenuContainerSnapshotDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _productMenuContainerSnapshotDTOList =
            productMenuContainerSnapshotDTOList;

  factory _$_ProductMenuData.fromJson(Map<String, dynamic> json) =>
      _$$_ProductMenuDataFromJson(json);

  final List<ProductMenuContainerSnapshotDTO>
      _productMenuContainerSnapshotDTOList;
  @override
  @JsonKey(name: 'ProductMenuContainerSnapshotDTOList')
  List<ProductMenuContainerSnapshotDTO>
      get productMenuContainerSnapshotDTOList {
    if (_productMenuContainerSnapshotDTOList is EqualUnmodifiableListView)
      return _productMenuContainerSnapshotDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productMenuContainerSnapshotDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'ProductMenuData(productMenuContainerSnapshotDTOList: $productMenuContainerSnapshotDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductMenuData &&
            const DeepCollectionEquality().equals(
                other._productMenuContainerSnapshotDTOList,
                _productMenuContainerSnapshotDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productMenuContainerSnapshotDTOList),
      hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductMenuDataCopyWith<_$_ProductMenuData> get copyWith =>
      __$$_ProductMenuDataCopyWithImpl<_$_ProductMenuData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductMenuDataToJson(
      this,
    );
  }
}

abstract class _ProductMenuData implements ProductMenuData {
  const factory _ProductMenuData(
      {@JsonKey(name: 'ProductMenuContainerSnapshotDTOList')
          required final List<ProductMenuContainerSnapshotDTO>
              productMenuContainerSnapshotDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_ProductMenuData;

  factory _ProductMenuData.fromJson(Map<String, dynamic> json) =
      _$_ProductMenuData.fromJson;

  @override
  @JsonKey(name: 'ProductMenuContainerSnapshotDTOList')
  List<ProductMenuContainerSnapshotDTO> get productMenuContainerSnapshotDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_ProductMenuDataCopyWith<_$_ProductMenuData> get copyWith =>
      throw _privateConstructorUsedError;
}
