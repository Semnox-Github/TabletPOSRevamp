// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_modifier_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModifierContainerDTO _$ProductModifierContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _ProductModifierContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$ProductModifierContainerDTO {
  @JsonKey(name: 'ProductModifierId')
  int get productModifierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CategoryId')
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductId')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ModifierSetId')
  int get modifierSetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AutoShoInPOS')
  String? get autoShoInPos => throw _privateConstructorUsedError;
  @JsonKey(name: 'SortOrder')
  int get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'ModifierSetContainerDTO')
  ModifierSetContainerDTO? get modifierSetContainerDTO =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModifierContainerDTOCopyWith<ProductModifierContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModifierContainerDTOCopyWith<$Res> {
  factory $ProductModifierContainerDTOCopyWith(
          ProductModifierContainerDTO value,
          $Res Function(ProductModifierContainerDTO) then) =
      _$ProductModifierContainerDTOCopyWithImpl<$Res,
          ProductModifierContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductModifierId')
          int productModifierId,
      @JsonKey(name: 'CategoryId')
          int categoryId,
      @JsonKey(name: 'ProductId')
          int productId,
      @JsonKey(name: 'ModifierSetId')
          int modifierSetId,
      @JsonKey(name: 'AutoShoInPOS')
          String? autoShoInPos,
      @JsonKey(name: 'SortOrder')
          int sortOrder,
      @JsonKey(name: 'ModifierSetContainerDTO')
          ModifierSetContainerDTO? modifierSetContainerDTO});

  $ModifierSetContainerDTOCopyWith<$Res>? get modifierSetContainerDTO;
}

/// @nodoc
class _$ProductModifierContainerDTOCopyWithImpl<$Res,
        $Val extends ProductModifierContainerDTO>
    implements $ProductModifierContainerDTOCopyWith<$Res> {
  _$ProductModifierContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productModifierId = null,
    Object? categoryId = null,
    Object? productId = null,
    Object? modifierSetId = null,
    Object? autoShoInPos = freezed,
    Object? sortOrder = null,
    Object? modifierSetContainerDTO = freezed,
  }) {
    return _then(_value.copyWith(
      productModifierId: null == productModifierId
          ? _value.productModifierId
          : productModifierId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      modifierSetId: null == modifierSetId
          ? _value.modifierSetId
          : modifierSetId // ignore: cast_nullable_to_non_nullable
              as int,
      autoShoInPos: freezed == autoShoInPos
          ? _value.autoShoInPos
          : autoShoInPos // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      modifierSetContainerDTO: freezed == modifierSetContainerDTO
          ? _value.modifierSetContainerDTO
          : modifierSetContainerDTO // ignore: cast_nullable_to_non_nullable
              as ModifierSetContainerDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ModifierSetContainerDTOCopyWith<$Res>? get modifierSetContainerDTO {
    if (_value.modifierSetContainerDTO == null) {
      return null;
    }

    return $ModifierSetContainerDTOCopyWith<$Res>(
        _value.modifierSetContainerDTO!, (value) {
      return _then(_value.copyWith(modifierSetContainerDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductModifierContainerDTOCopyWith<$Res>
    implements $ProductModifierContainerDTOCopyWith<$Res> {
  factory _$$_ProductModifierContainerDTOCopyWith(
          _$_ProductModifierContainerDTO value,
          $Res Function(_$_ProductModifierContainerDTO) then) =
      __$$_ProductModifierContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductModifierId')
          int productModifierId,
      @JsonKey(name: 'CategoryId')
          int categoryId,
      @JsonKey(name: 'ProductId')
          int productId,
      @JsonKey(name: 'ModifierSetId')
          int modifierSetId,
      @JsonKey(name: 'AutoShoInPOS')
          String? autoShoInPos,
      @JsonKey(name: 'SortOrder')
          int sortOrder,
      @JsonKey(name: 'ModifierSetContainerDTO')
          ModifierSetContainerDTO? modifierSetContainerDTO});

  @override
  $ModifierSetContainerDTOCopyWith<$Res>? get modifierSetContainerDTO;
}

/// @nodoc
class __$$_ProductModifierContainerDTOCopyWithImpl<$Res>
    extends _$ProductModifierContainerDTOCopyWithImpl<$Res,
        _$_ProductModifierContainerDTO>
    implements _$$_ProductModifierContainerDTOCopyWith<$Res> {
  __$$_ProductModifierContainerDTOCopyWithImpl(
      _$_ProductModifierContainerDTO _value,
      $Res Function(_$_ProductModifierContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productModifierId = null,
    Object? categoryId = null,
    Object? productId = null,
    Object? modifierSetId = null,
    Object? autoShoInPos = freezed,
    Object? sortOrder = null,
    Object? modifierSetContainerDTO = freezed,
  }) {
    return _then(_$_ProductModifierContainerDTO(
      productModifierId: null == productModifierId
          ? _value.productModifierId
          : productModifierId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      modifierSetId: null == modifierSetId
          ? _value.modifierSetId
          : modifierSetId // ignore: cast_nullable_to_non_nullable
              as int,
      autoShoInPos: freezed == autoShoInPos
          ? _value.autoShoInPos
          : autoShoInPos // ignore: cast_nullable_to_non_nullable
              as String?,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as int,
      modifierSetContainerDTO: freezed == modifierSetContainerDTO
          ? _value.modifierSetContainerDTO
          : modifierSetContainerDTO // ignore: cast_nullable_to_non_nullable
              as ModifierSetContainerDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModifierContainerDTO implements _ProductModifierContainerDTO {
  const _$_ProductModifierContainerDTO(
      {@JsonKey(name: 'ProductModifierId') required this.productModifierId,
      @JsonKey(name: 'CategoryId') required this.categoryId,
      @JsonKey(name: 'ProductId') required this.productId,
      @JsonKey(name: 'ModifierSetId') required this.modifierSetId,
      @JsonKey(name: 'AutoShoInPOS') this.autoShoInPos,
      @JsonKey(name: 'SortOrder') required this.sortOrder,
      @JsonKey(name: 'ModifierSetContainerDTO') this.modifierSetContainerDTO});

  factory _$_ProductModifierContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModifierContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'ProductModifierId')
  final int productModifierId;
  @override
  @JsonKey(name: 'CategoryId')
  final int categoryId;
  @override
  @JsonKey(name: 'ProductId')
  final int productId;
  @override
  @JsonKey(name: 'ModifierSetId')
  final int modifierSetId;
  @override
  @JsonKey(name: 'AutoShoInPOS')
  final String? autoShoInPos;
  @override
  @JsonKey(name: 'SortOrder')
  final int sortOrder;
  @override
  @JsonKey(name: 'ModifierSetContainerDTO')
  final ModifierSetContainerDTO? modifierSetContainerDTO;

  @override
  String toString() {
    return 'ProductModifierContainerDTO(productModifierId: $productModifierId, categoryId: $categoryId, productId: $productId, modifierSetId: $modifierSetId, autoShoInPos: $autoShoInPos, sortOrder: $sortOrder, modifierSetContainerDTO: $modifierSetContainerDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModifierContainerDTO &&
            (identical(other.productModifierId, productModifierId) ||
                other.productModifierId == productModifierId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.modifierSetId, modifierSetId) ||
                other.modifierSetId == modifierSetId) &&
            (identical(other.autoShoInPos, autoShoInPos) ||
                other.autoShoInPos == autoShoInPos) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(
                    other.modifierSetContainerDTO, modifierSetContainerDTO) ||
                other.modifierSetContainerDTO == modifierSetContainerDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productModifierId,
      categoryId,
      productId,
      modifierSetId,
      autoShoInPos,
      sortOrder,
      modifierSetContainerDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductModifierContainerDTOCopyWith<_$_ProductModifierContainerDTO>
      get copyWith => __$$_ProductModifierContainerDTOCopyWithImpl<
          _$_ProductModifierContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModifierContainerDTOToJson(
      this,
    );
  }
}

abstract class _ProductModifierContainerDTO
    implements ProductModifierContainerDTO {
  const factory _ProductModifierContainerDTO(
          {@JsonKey(name: 'ProductModifierId')
              required final int productModifierId,
          @JsonKey(name: 'CategoryId')
              required final int categoryId,
          @JsonKey(name: 'ProductId')
              required final int productId,
          @JsonKey(name: 'ModifierSetId')
              required final int modifierSetId,
          @JsonKey(name: 'AutoShoInPOS')
              final String? autoShoInPos,
          @JsonKey(name: 'SortOrder')
              required final int sortOrder,
          @JsonKey(name: 'ModifierSetContainerDTO')
              final ModifierSetContainerDTO? modifierSetContainerDTO}) =
      _$_ProductModifierContainerDTO;

  factory _ProductModifierContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_ProductModifierContainerDTO.fromJson;

  @override
  @JsonKey(name: 'ProductModifierId')
  int get productModifierId;
  @override
  @JsonKey(name: 'CategoryId')
  int get categoryId;
  @override
  @JsonKey(name: 'ProductId')
  int get productId;
  @override
  @JsonKey(name: 'ModifierSetId')
  int get modifierSetId;
  @override
  @JsonKey(name: 'AutoShoInPOS')
  String? get autoShoInPos;
  @override
  @JsonKey(name: 'SortOrder')
  int get sortOrder;
  @override
  @JsonKey(name: 'ModifierSetContainerDTO')
  ModifierSetContainerDTO? get modifierSetContainerDTO;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModifierContainerDTOCopyWith<_$_ProductModifierContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
