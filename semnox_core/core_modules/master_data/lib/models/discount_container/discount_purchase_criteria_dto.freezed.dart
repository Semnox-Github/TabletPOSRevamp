// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_purchase_criteria_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiscountPurchaseCriteriaDto _$DiscountPurchaseCriteriaDtoFromJson(
    Map<String, dynamic> json) {
  return _DiscountPurchaseCriteriaDto.fromJson(json);
}

/// @nodoc
mixin _$DiscountPurchaseCriteriaDto {
  @JsonKey(name: 'CriteriaId')
  int? get criteriaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountId')
  int? get discountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductId')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CategoryId')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MinQuantity')
  int? get minQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscountPurchaseCriteriaDtoCopyWith<DiscountPurchaseCriteriaDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountPurchaseCriteriaDtoCopyWith<$Res> {
  factory $DiscountPurchaseCriteriaDtoCopyWith(
          DiscountPurchaseCriteriaDto value,
          $Res Function(DiscountPurchaseCriteriaDto) then) =
      _$DiscountPurchaseCriteriaDtoCopyWithImpl<$Res,
          DiscountPurchaseCriteriaDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CriteriaId') int? criteriaId,
      @JsonKey(name: 'DiscountId') int? discountId,
      @JsonKey(name: 'ProductId') int? productId,
      @JsonKey(name: 'CategoryId') int? categoryId,
      @JsonKey(name: 'MinQuantity') int? minQuantity});
}

/// @nodoc
class _$DiscountPurchaseCriteriaDtoCopyWithImpl<$Res,
        $Val extends DiscountPurchaseCriteriaDto>
    implements $DiscountPurchaseCriteriaDtoCopyWith<$Res> {
  _$DiscountPurchaseCriteriaDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? criteriaId = freezed,
    Object? discountId = freezed,
    Object? productId = freezed,
    Object? categoryId = freezed,
    Object? minQuantity = freezed,
  }) {
    return _then(_value.copyWith(
      criteriaId: freezed == criteriaId
          ? _value.criteriaId
          : criteriaId // ignore: cast_nullable_to_non_nullable
              as int?,
      discountId: freezed == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      minQuantity: freezed == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscountPurchaseCriteriaDtoCopyWith<$Res>
    implements $DiscountPurchaseCriteriaDtoCopyWith<$Res> {
  factory _$$_DiscountPurchaseCriteriaDtoCopyWith(
          _$_DiscountPurchaseCriteriaDto value,
          $Res Function(_$_DiscountPurchaseCriteriaDto) then) =
      __$$_DiscountPurchaseCriteriaDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CriteriaId') int? criteriaId,
      @JsonKey(name: 'DiscountId') int? discountId,
      @JsonKey(name: 'ProductId') int? productId,
      @JsonKey(name: 'CategoryId') int? categoryId,
      @JsonKey(name: 'MinQuantity') int? minQuantity});
}

/// @nodoc
class __$$_DiscountPurchaseCriteriaDtoCopyWithImpl<$Res>
    extends _$DiscountPurchaseCriteriaDtoCopyWithImpl<$Res,
        _$_DiscountPurchaseCriteriaDto>
    implements _$$_DiscountPurchaseCriteriaDtoCopyWith<$Res> {
  __$$_DiscountPurchaseCriteriaDtoCopyWithImpl(
      _$_DiscountPurchaseCriteriaDto _value,
      $Res Function(_$_DiscountPurchaseCriteriaDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? criteriaId = freezed,
    Object? discountId = freezed,
    Object? productId = freezed,
    Object? categoryId = freezed,
    Object? minQuantity = freezed,
  }) {
    return _then(_$_DiscountPurchaseCriteriaDto(
      criteriaId: freezed == criteriaId
          ? _value.criteriaId
          : criteriaId // ignore: cast_nullable_to_non_nullable
              as int?,
      discountId: freezed == discountId
          ? _value.discountId
          : discountId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      minQuantity: freezed == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiscountPurchaseCriteriaDto implements _DiscountPurchaseCriteriaDto {
  const _$_DiscountPurchaseCriteriaDto(
      {@JsonKey(name: 'CriteriaId') this.criteriaId,
      @JsonKey(name: 'DiscountId') this.discountId,
      @JsonKey(name: 'ProductId') this.productId,
      @JsonKey(name: 'CategoryId') this.categoryId,
      @JsonKey(name: 'MinQuantity') this.minQuantity});

  factory _$_DiscountPurchaseCriteriaDto.fromJson(Map<String, dynamic> json) =>
      _$$_DiscountPurchaseCriteriaDtoFromJson(json);

  @override
  @JsonKey(name: 'CriteriaId')
  final int? criteriaId;
  @override
  @JsonKey(name: 'DiscountId')
  final int? discountId;
  @override
  @JsonKey(name: 'ProductId')
  final int? productId;
  @override
  @JsonKey(name: 'CategoryId')
  final int? categoryId;
  @override
  @JsonKey(name: 'MinQuantity')
  final int? minQuantity;

  @override
  String toString() {
    return 'DiscountPurchaseCriteriaDto(criteriaId: $criteriaId, discountId: $discountId, productId: $productId, categoryId: $categoryId, minQuantity: $minQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscountPurchaseCriteriaDto &&
            (identical(other.criteriaId, criteriaId) ||
                other.criteriaId == criteriaId) &&
            (identical(other.discountId, discountId) ||
                other.discountId == discountId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, criteriaId, discountId, productId, categoryId, minQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscountPurchaseCriteriaDtoCopyWith<_$_DiscountPurchaseCriteriaDto>
      get copyWith => __$$_DiscountPurchaseCriteriaDtoCopyWithImpl<
          _$_DiscountPurchaseCriteriaDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscountPurchaseCriteriaDtoToJson(
      this,
    );
  }
}

abstract class _DiscountPurchaseCriteriaDto
    implements DiscountPurchaseCriteriaDto {
  const factory _DiscountPurchaseCriteriaDto(
          {@JsonKey(name: 'CriteriaId') final int? criteriaId,
          @JsonKey(name: 'DiscountId') final int? discountId,
          @JsonKey(name: 'ProductId') final int? productId,
          @JsonKey(name: 'CategoryId') final int? categoryId,
          @JsonKey(name: 'MinQuantity') final int? minQuantity}) =
      _$_DiscountPurchaseCriteriaDto;

  factory _DiscountPurchaseCriteriaDto.fromJson(Map<String, dynamic> json) =
      _$_DiscountPurchaseCriteriaDto.fromJson;

  @override
  @JsonKey(name: 'CriteriaId')
  int? get criteriaId;
  @override
  @JsonKey(name: 'DiscountId')
  int? get discountId;
  @override
  @JsonKey(name: 'ProductId')
  int? get productId;
  @override
  @JsonKey(name: 'CategoryId')
  int? get categoryId;
  @override
  @JsonKey(name: 'MinQuantity')
  int? get minQuantity;
  @override
  @JsonKey(ignore: true)
  _$$_DiscountPurchaseCriteriaDtoCopyWith<_$_DiscountPurchaseCriteriaDto>
      get copyWith => throw _privateConstructorUsedError;
}
