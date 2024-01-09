// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_group_product_map_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SaleGroupProductMapDTO _$SaleGroupProductMapDTOFromJson(
    Map<String, dynamic> json) {
  return _SaleGroupProductMapDTO.fromJson(json);
}

/// @nodoc
mixin _$SaleGroupProductMapDTO {
  @JsonKey(name: 'TypeMapId')
  int get typeMapId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SaleGroupId')
  int get saleGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductId')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DisplayOrder')
  int get displayOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'Guid')
  String get guid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaleGroupProductMapDTOCopyWith<SaleGroupProductMapDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleGroupProductMapDTOCopyWith<$Res> {
  factory $SaleGroupProductMapDTOCopyWith(SaleGroupProductMapDTO value,
          $Res Function(SaleGroupProductMapDTO) then) =
      _$SaleGroupProductMapDTOCopyWithImpl<$Res, SaleGroupProductMapDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TypeMapId') int typeMapId,
      @JsonKey(name: 'SaleGroupId') int saleGroupId,
      @JsonKey(name: 'ProductId') int productId,
      @JsonKey(name: 'DisplayOrder') int displayOrder,
      @JsonKey(name: 'Guid') String guid});
}

/// @nodoc
class _$SaleGroupProductMapDTOCopyWithImpl<$Res,
        $Val extends SaleGroupProductMapDTO>
    implements $SaleGroupProductMapDTOCopyWith<$Res> {
  _$SaleGroupProductMapDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeMapId = null,
    Object? saleGroupId = null,
    Object? productId = null,
    Object? displayOrder = null,
    Object? guid = null,
  }) {
    return _then(_value.copyWith(
      typeMapId: null == typeMapId
          ? _value.typeMapId
          : typeMapId // ignore: cast_nullable_to_non_nullable
              as int,
      saleGroupId: null == saleGroupId
          ? _value.saleGroupId
          : saleGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SaleGroupProductMapDTOCopyWith<$Res>
    implements $SaleGroupProductMapDTOCopyWith<$Res> {
  factory _$$_SaleGroupProductMapDTOCopyWith(_$_SaleGroupProductMapDTO value,
          $Res Function(_$_SaleGroupProductMapDTO) then) =
      __$$_SaleGroupProductMapDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TypeMapId') int typeMapId,
      @JsonKey(name: 'SaleGroupId') int saleGroupId,
      @JsonKey(name: 'ProductId') int productId,
      @JsonKey(name: 'DisplayOrder') int displayOrder,
      @JsonKey(name: 'Guid') String guid});
}

/// @nodoc
class __$$_SaleGroupProductMapDTOCopyWithImpl<$Res>
    extends _$SaleGroupProductMapDTOCopyWithImpl<$Res,
        _$_SaleGroupProductMapDTO>
    implements _$$_SaleGroupProductMapDTOCopyWith<$Res> {
  __$$_SaleGroupProductMapDTOCopyWithImpl(_$_SaleGroupProductMapDTO _value,
      $Res Function(_$_SaleGroupProductMapDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeMapId = null,
    Object? saleGroupId = null,
    Object? productId = null,
    Object? displayOrder = null,
    Object? guid = null,
  }) {
    return _then(_$_SaleGroupProductMapDTO(
      typeMapId: null == typeMapId
          ? _value.typeMapId
          : typeMapId // ignore: cast_nullable_to_non_nullable
              as int,
      saleGroupId: null == saleGroupId
          ? _value.saleGroupId
          : saleGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      displayOrder: null == displayOrder
          ? _value.displayOrder
          : displayOrder // ignore: cast_nullable_to_non_nullable
              as int,
      guid: null == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SaleGroupProductMapDTO implements _SaleGroupProductMapDTO {
  const _$_SaleGroupProductMapDTO(
      {@JsonKey(name: 'TypeMapId') required this.typeMapId,
      @JsonKey(name: 'SaleGroupId') required this.saleGroupId,
      @JsonKey(name: 'ProductId') required this.productId,
      @JsonKey(name: 'DisplayOrder') required this.displayOrder,
      @JsonKey(name: 'Guid') required this.guid});

  factory _$_SaleGroupProductMapDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SaleGroupProductMapDTOFromJson(json);

  @override
  @JsonKey(name: 'TypeMapId')
  final int typeMapId;
  @override
  @JsonKey(name: 'SaleGroupId')
  final int saleGroupId;
  @override
  @JsonKey(name: 'ProductId')
  final int productId;
  @override
  @JsonKey(name: 'DisplayOrder')
  final int displayOrder;
  @override
  @JsonKey(name: 'Guid')
  final String guid;

  @override
  String toString() {
    return 'SaleGroupProductMapDTO(typeMapId: $typeMapId, saleGroupId: $saleGroupId, productId: $productId, displayOrder: $displayOrder, guid: $guid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaleGroupProductMapDTO &&
            (identical(other.typeMapId, typeMapId) ||
                other.typeMapId == typeMapId) &&
            (identical(other.saleGroupId, saleGroupId) ||
                other.saleGroupId == saleGroupId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.displayOrder, displayOrder) ||
                other.displayOrder == displayOrder) &&
            (identical(other.guid, guid) || other.guid == guid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, typeMapId, saleGroupId, productId, displayOrder, guid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaleGroupProductMapDTOCopyWith<_$_SaleGroupProductMapDTO> get copyWith =>
      __$$_SaleGroupProductMapDTOCopyWithImpl<_$_SaleGroupProductMapDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SaleGroupProductMapDTOToJson(
      this,
    );
  }
}

abstract class _SaleGroupProductMapDTO implements SaleGroupProductMapDTO {
  const factory _SaleGroupProductMapDTO(
          {@JsonKey(name: 'TypeMapId') required final int typeMapId,
          @JsonKey(name: 'SaleGroupId') required final int saleGroupId,
          @JsonKey(name: 'ProductId') required final int productId,
          @JsonKey(name: 'DisplayOrder') required final int displayOrder,
          @JsonKey(name: 'Guid') required final String guid}) =
      _$_SaleGroupProductMapDTO;

  factory _SaleGroupProductMapDTO.fromJson(Map<String, dynamic> json) =
      _$_SaleGroupProductMapDTO.fromJson;

  @override
  @JsonKey(name: 'TypeMapId')
  int get typeMapId;
  @override
  @JsonKey(name: 'SaleGroupId')
  int get saleGroupId;
  @override
  @JsonKey(name: 'ProductId')
  int get productId;
  @override
  @JsonKey(name: 'DisplayOrder')
  int get displayOrder;
  @override
  @JsonKey(name: 'Guid')
  String get guid;
  @override
  @JsonKey(ignore: true)
  _$$_SaleGroupProductMapDTOCopyWith<_$_SaleGroupProductMapDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
