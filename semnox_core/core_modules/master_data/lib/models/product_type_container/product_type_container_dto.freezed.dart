// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_type_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductTypeContainerDto _$ProductTypeContainerDtoFromJson(
    Map<String, dynamic> json) {
  return _ProductTypeContainerDto.fromJson(json);
}

/// @nodoc
mixin _$ProductTypeContainerDto {
  @JsonKey(name: 'ProductTypeId')
  int? get productTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductType')
  String? get productType => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'CardSale')
  bool? get cardSale => throw _privateConstructorUsedError;
  @JsonKey(name: 'ReportGroup')
  String? get reportGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderTypeId')
  int? get orderTypeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductTypeContainerDtoCopyWith<ProductTypeContainerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductTypeContainerDtoCopyWith<$Res> {
  factory $ProductTypeContainerDtoCopyWith(ProductTypeContainerDto value,
          $Res Function(ProductTypeContainerDto) then) =
      _$ProductTypeContainerDtoCopyWithImpl<$Res, ProductTypeContainerDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductTypeId') int? productTypeId,
      @JsonKey(name: 'ProductType') String? productType,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'CardSale') bool? cardSale,
      @JsonKey(name: 'ReportGroup') String? reportGroup,
      @JsonKey(name: 'OrderTypeId') int? orderTypeId});
}

/// @nodoc
class _$ProductTypeContainerDtoCopyWithImpl<$Res,
        $Val extends ProductTypeContainerDto>
    implements $ProductTypeContainerDtoCopyWith<$Res> {
  _$ProductTypeContainerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productTypeId = freezed,
    Object? productType = freezed,
    Object? description = freezed,
    Object? cardSale = freezed,
    Object? reportGroup = freezed,
    Object? orderTypeId = freezed,
  }) {
    return _then(_value.copyWith(
      productTypeId: freezed == productTypeId
          ? _value.productTypeId
          : productTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      productType: freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      cardSale: freezed == cardSale
          ? _value.cardSale
          : cardSale // ignore: cast_nullable_to_non_nullable
              as bool?,
      reportGroup: freezed == reportGroup
          ? _value.reportGroup
          : reportGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      orderTypeId: freezed == orderTypeId
          ? _value.orderTypeId
          : orderTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductTypeContainerDtoCopyWith<$Res>
    implements $ProductTypeContainerDtoCopyWith<$Res> {
  factory _$$_ProductTypeContainerDtoCopyWith(_$_ProductTypeContainerDto value,
          $Res Function(_$_ProductTypeContainerDto) then) =
      __$$_ProductTypeContainerDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductTypeId') int? productTypeId,
      @JsonKey(name: 'ProductType') String? productType,
      @JsonKey(name: 'Description') String? description,
      @JsonKey(name: 'CardSale') bool? cardSale,
      @JsonKey(name: 'ReportGroup') String? reportGroup,
      @JsonKey(name: 'OrderTypeId') int? orderTypeId});
}

/// @nodoc
class __$$_ProductTypeContainerDtoCopyWithImpl<$Res>
    extends _$ProductTypeContainerDtoCopyWithImpl<$Res,
        _$_ProductTypeContainerDto>
    implements _$$_ProductTypeContainerDtoCopyWith<$Res> {
  __$$_ProductTypeContainerDtoCopyWithImpl(_$_ProductTypeContainerDto _value,
      $Res Function(_$_ProductTypeContainerDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productTypeId = freezed,
    Object? productType = freezed,
    Object? description = freezed,
    Object? cardSale = freezed,
    Object? reportGroup = freezed,
    Object? orderTypeId = freezed,
  }) {
    return _then(_$_ProductTypeContainerDto(
      productTypeId: freezed == productTypeId
          ? _value.productTypeId
          : productTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      productType: freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      cardSale: freezed == cardSale
          ? _value.cardSale
          : cardSale // ignore: cast_nullable_to_non_nullable
              as bool?,
      reportGroup: freezed == reportGroup
          ? _value.reportGroup
          : reportGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      orderTypeId: freezed == orderTypeId
          ? _value.orderTypeId
          : orderTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductTypeContainerDto implements _ProductTypeContainerDto {
  const _$_ProductTypeContainerDto(
      {@JsonKey(name: 'ProductTypeId') this.productTypeId,
      @JsonKey(name: 'ProductType') this.productType,
      @JsonKey(name: 'Description') this.description,
      @JsonKey(name: 'CardSale') this.cardSale,
      @JsonKey(name: 'ReportGroup') this.reportGroup,
      @JsonKey(name: 'OrderTypeId') this.orderTypeId});

  factory _$_ProductTypeContainerDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProductTypeContainerDtoFromJson(json);

  @override
  @JsonKey(name: 'ProductTypeId')
  final int? productTypeId;
  @override
  @JsonKey(name: 'ProductType')
  final String? productType;
  @override
  @JsonKey(name: 'Description')
  final String? description;
  @override
  @JsonKey(name: 'CardSale')
  final bool? cardSale;
  @override
  @JsonKey(name: 'ReportGroup')
  final String? reportGroup;
  @override
  @JsonKey(name: 'OrderTypeId')
  final int? orderTypeId;

  @override
  String toString() {
    return 'ProductTypeContainerDto(productTypeId: $productTypeId, productType: $productType, description: $description, cardSale: $cardSale, reportGroup: $reportGroup, orderTypeId: $orderTypeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductTypeContainerDto &&
            (identical(other.productTypeId, productTypeId) ||
                other.productTypeId == productTypeId) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.cardSale, cardSale) ||
                other.cardSale == cardSale) &&
            (identical(other.reportGroup, reportGroup) ||
                other.reportGroup == reportGroup) &&
            (identical(other.orderTypeId, orderTypeId) ||
                other.orderTypeId == orderTypeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productTypeId, productType,
      description, cardSale, reportGroup, orderTypeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductTypeContainerDtoCopyWith<_$_ProductTypeContainerDto>
      get copyWith =>
          __$$_ProductTypeContainerDtoCopyWithImpl<_$_ProductTypeContainerDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductTypeContainerDtoToJson(
      this,
    );
  }
}

abstract class _ProductTypeContainerDto implements ProductTypeContainerDto {
  const factory _ProductTypeContainerDto(
          {@JsonKey(name: 'ProductTypeId') final int? productTypeId,
          @JsonKey(name: 'ProductType') final String? productType,
          @JsonKey(name: 'Description') final String? description,
          @JsonKey(name: 'CardSale') final bool? cardSale,
          @JsonKey(name: 'ReportGroup') final String? reportGroup,
          @JsonKey(name: 'OrderTypeId') final int? orderTypeId}) =
      _$_ProductTypeContainerDto;

  factory _ProductTypeContainerDto.fromJson(Map<String, dynamic> json) =
      _$_ProductTypeContainerDto.fromJson;

  @override
  @JsonKey(name: 'ProductTypeId')
  int? get productTypeId;
  @override
  @JsonKey(name: 'ProductType')
  String? get productType;
  @override
  @JsonKey(name: 'Description')
  String? get description;
  @override
  @JsonKey(name: 'CardSale')
  bool? get cardSale;
  @override
  @JsonKey(name: 'ReportGroup')
  String? get reportGroup;
  @override
  @JsonKey(name: 'OrderTypeId')
  int? get orderTypeId;
  @override
  @JsonKey(ignore: true)
  _$$_ProductTypeContainerDtoCopyWith<_$_ProductTypeContainerDto>
      get copyWith => throw _privateConstructorUsedError;
}
