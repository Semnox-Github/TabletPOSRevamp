// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_barcode_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductBarcodeContainerDTO _$ProductBarcodeContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _ProductBarcodeContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$ProductBarcodeContainerDTO {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'BarCode')
  String get barCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductBarcodeContainerDTOCopyWith<ProductBarcodeContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductBarcodeContainerDTOCopyWith<$Res> {
  factory $ProductBarcodeContainerDTOCopyWith(ProductBarcodeContainerDTO value,
          $Res Function(ProductBarcodeContainerDTO) then) =
      _$ProductBarcodeContainerDTOCopyWithImpl<$Res,
          ProductBarcodeContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id, @JsonKey(name: 'BarCode') String barCode});
}

/// @nodoc
class _$ProductBarcodeContainerDTOCopyWithImpl<$Res,
        $Val extends ProductBarcodeContainerDTO>
    implements $ProductBarcodeContainerDTOCopyWith<$Res> {
  _$ProductBarcodeContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? barCode = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      barCode: null == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductBarcodeContainerDTOCopyWith<$Res>
    implements $ProductBarcodeContainerDTOCopyWith<$Res> {
  factory _$$_ProductBarcodeContainerDTOCopyWith(
          _$_ProductBarcodeContainerDTO value,
          $Res Function(_$_ProductBarcodeContainerDTO) then) =
      __$$_ProductBarcodeContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id, @JsonKey(name: 'BarCode') String barCode});
}

/// @nodoc
class __$$_ProductBarcodeContainerDTOCopyWithImpl<$Res>
    extends _$ProductBarcodeContainerDTOCopyWithImpl<$Res,
        _$_ProductBarcodeContainerDTO>
    implements _$$_ProductBarcodeContainerDTOCopyWith<$Res> {
  __$$_ProductBarcodeContainerDTOCopyWithImpl(
      _$_ProductBarcodeContainerDTO _value,
      $Res Function(_$_ProductBarcodeContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? barCode = null,
  }) {
    return _then(_$_ProductBarcodeContainerDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      barCode: null == barCode
          ? _value.barCode
          : barCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductBarcodeContainerDTO implements _ProductBarcodeContainerDTO {
  const _$_ProductBarcodeContainerDTO(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'BarCode') required this.barCode});

  factory _$_ProductBarcodeContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ProductBarcodeContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'BarCode')
  final String barCode;

  @override
  String toString() {
    return 'ProductBarcodeContainerDTO(id: $id, barCode: $barCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductBarcodeContainerDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.barCode, barCode) || other.barCode == barCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, barCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductBarcodeContainerDTOCopyWith<_$_ProductBarcodeContainerDTO>
      get copyWith => __$$_ProductBarcodeContainerDTOCopyWithImpl<
          _$_ProductBarcodeContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductBarcodeContainerDTOToJson(
      this,
    );
  }
}

abstract class _ProductBarcodeContainerDTO
    implements ProductBarcodeContainerDTO {
  const factory _ProductBarcodeContainerDTO(
          {@JsonKey(name: 'Id') required final int id,
          @JsonKey(name: 'BarCode') required final String barCode}) =
      _$_ProductBarcodeContainerDTO;

  factory _ProductBarcodeContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_ProductBarcodeContainerDTO.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'BarCode')
  String get barCode;
  @override
  @JsonKey(ignore: true)
  _$$_ProductBarcodeContainerDTOCopyWith<_$_ProductBarcodeContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
