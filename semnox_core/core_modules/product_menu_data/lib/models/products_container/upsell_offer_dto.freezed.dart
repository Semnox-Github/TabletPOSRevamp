// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upsell_offer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpsellOffersContainerDTO _$UpsellOffersContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _UpsellOffersContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$UpsellOffersContainerDTO {
  @JsonKey(name: 'OfferId')
  int get offerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductId')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OfferProductId')
  int get offerProductId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SaleGroupId')
  int get saleGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OfferMessage')
  String get offerMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'EffectiveDate')
  String get effectiveDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'SalesOfferGroupContainerDTO')
  SalesOfferGroupContainerDTO? get salesOfferGroupContainerDTO =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpsellOffersContainerDTOCopyWith<UpsellOffersContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpsellOffersContainerDTOCopyWith<$Res> {
  factory $UpsellOffersContainerDTOCopyWith(UpsellOffersContainerDTO value,
          $Res Function(UpsellOffersContainerDTO) then) =
      _$UpsellOffersContainerDTOCopyWithImpl<$Res, UpsellOffersContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OfferId')
          int offerId,
      @JsonKey(name: 'ProductId')
          int productId,
      @JsonKey(name: 'OfferProductId')
          int offerProductId,
      @JsonKey(name: 'SaleGroupId')
          int saleGroupId,
      @JsonKey(name: 'OfferMessage')
          String offerMessage,
      @JsonKey(name: 'EffectiveDate')
          String effectiveDate,
      @JsonKey(name: 'SalesOfferGroupContainerDTO')
          SalesOfferGroupContainerDTO? salesOfferGroupContainerDTO});

  $SalesOfferGroupContainerDTOCopyWith<$Res>? get salesOfferGroupContainerDTO;
}

/// @nodoc
class _$UpsellOffersContainerDTOCopyWithImpl<$Res,
        $Val extends UpsellOffersContainerDTO>
    implements $UpsellOffersContainerDTOCopyWith<$Res> {
  _$UpsellOffersContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerId = null,
    Object? productId = null,
    Object? offerProductId = null,
    Object? saleGroupId = null,
    Object? offerMessage = null,
    Object? effectiveDate = null,
    Object? salesOfferGroupContainerDTO = freezed,
  }) {
    return _then(_value.copyWith(
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      offerProductId: null == offerProductId
          ? _value.offerProductId
          : offerProductId // ignore: cast_nullable_to_non_nullable
              as int,
      saleGroupId: null == saleGroupId
          ? _value.saleGroupId
          : saleGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      offerMessage: null == offerMessage
          ? _value.offerMessage
          : offerMessage // ignore: cast_nullable_to_non_nullable
              as String,
      effectiveDate: null == effectiveDate
          ? _value.effectiveDate
          : effectiveDate // ignore: cast_nullable_to_non_nullable
              as String,
      salesOfferGroupContainerDTO: freezed == salesOfferGroupContainerDTO
          ? _value.salesOfferGroupContainerDTO
          : salesOfferGroupContainerDTO // ignore: cast_nullable_to_non_nullable
              as SalesOfferGroupContainerDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOfferGroupContainerDTOCopyWith<$Res>? get salesOfferGroupContainerDTO {
    if (_value.salesOfferGroupContainerDTO == null) {
      return null;
    }

    return $SalesOfferGroupContainerDTOCopyWith<$Res>(
        _value.salesOfferGroupContainerDTO!, (value) {
      return _then(_value.copyWith(salesOfferGroupContainerDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UpsellOffersContainerDTOCopyWith<$Res>
    implements $UpsellOffersContainerDTOCopyWith<$Res> {
  factory _$$_UpsellOffersContainerDTOCopyWith(
          _$_UpsellOffersContainerDTO value,
          $Res Function(_$_UpsellOffersContainerDTO) then) =
      __$$_UpsellOffersContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OfferId')
          int offerId,
      @JsonKey(name: 'ProductId')
          int productId,
      @JsonKey(name: 'OfferProductId')
          int offerProductId,
      @JsonKey(name: 'SaleGroupId')
          int saleGroupId,
      @JsonKey(name: 'OfferMessage')
          String offerMessage,
      @JsonKey(name: 'EffectiveDate')
          String effectiveDate,
      @JsonKey(name: 'SalesOfferGroupContainerDTO')
          SalesOfferGroupContainerDTO? salesOfferGroupContainerDTO});

  @override
  $SalesOfferGroupContainerDTOCopyWith<$Res>? get salesOfferGroupContainerDTO;
}

/// @nodoc
class __$$_UpsellOffersContainerDTOCopyWithImpl<$Res>
    extends _$UpsellOffersContainerDTOCopyWithImpl<$Res,
        _$_UpsellOffersContainerDTO>
    implements _$$_UpsellOffersContainerDTOCopyWith<$Res> {
  __$$_UpsellOffersContainerDTOCopyWithImpl(_$_UpsellOffersContainerDTO _value,
      $Res Function(_$_UpsellOffersContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offerId = null,
    Object? productId = null,
    Object? offerProductId = null,
    Object? saleGroupId = null,
    Object? offerMessage = null,
    Object? effectiveDate = null,
    Object? salesOfferGroupContainerDTO = freezed,
  }) {
    return _then(_$_UpsellOffersContainerDTO(
      offerId: null == offerId
          ? _value.offerId
          : offerId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      offerProductId: null == offerProductId
          ? _value.offerProductId
          : offerProductId // ignore: cast_nullable_to_non_nullable
              as int,
      saleGroupId: null == saleGroupId
          ? _value.saleGroupId
          : saleGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      offerMessage: null == offerMessage
          ? _value.offerMessage
          : offerMessage // ignore: cast_nullable_to_non_nullable
              as String,
      effectiveDate: null == effectiveDate
          ? _value.effectiveDate
          : effectiveDate // ignore: cast_nullable_to_non_nullable
              as String,
      salesOfferGroupContainerDTO: freezed == salesOfferGroupContainerDTO
          ? _value.salesOfferGroupContainerDTO
          : salesOfferGroupContainerDTO // ignore: cast_nullable_to_non_nullable
              as SalesOfferGroupContainerDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpsellOffersContainerDTO implements _UpsellOffersContainerDTO {
  const _$_UpsellOffersContainerDTO(
      {@JsonKey(name: 'OfferId')
          required this.offerId,
      @JsonKey(name: 'ProductId')
          required this.productId,
      @JsonKey(name: 'OfferProductId')
          required this.offerProductId,
      @JsonKey(name: 'SaleGroupId')
          required this.saleGroupId,
      @JsonKey(name: 'OfferMessage')
          required this.offerMessage,
      @JsonKey(name: 'EffectiveDate')
          required this.effectiveDate,
      @JsonKey(name: 'SalesOfferGroupContainerDTO')
          this.salesOfferGroupContainerDTO});

  factory _$_UpsellOffersContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_UpsellOffersContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'OfferId')
  final int offerId;
  @override
  @JsonKey(name: 'ProductId')
  final int productId;
  @override
  @JsonKey(name: 'OfferProductId')
  final int offerProductId;
  @override
  @JsonKey(name: 'SaleGroupId')
  final int saleGroupId;
  @override
  @JsonKey(name: 'OfferMessage')
  final String offerMessage;
  @override
  @JsonKey(name: 'EffectiveDate')
  final String effectiveDate;
  @override
  @JsonKey(name: 'SalesOfferGroupContainerDTO')
  final SalesOfferGroupContainerDTO? salesOfferGroupContainerDTO;

  @override
  String toString() {
    return 'UpsellOffersContainerDTO(offerId: $offerId, productId: $productId, offerProductId: $offerProductId, saleGroupId: $saleGroupId, offerMessage: $offerMessage, effectiveDate: $effectiveDate, salesOfferGroupContainerDTO: $salesOfferGroupContainerDTO)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpsellOffersContainerDTO &&
            (identical(other.offerId, offerId) || other.offerId == offerId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.offerProductId, offerProductId) ||
                other.offerProductId == offerProductId) &&
            (identical(other.saleGroupId, saleGroupId) ||
                other.saleGroupId == saleGroupId) &&
            (identical(other.offerMessage, offerMessage) ||
                other.offerMessage == offerMessage) &&
            (identical(other.effectiveDate, effectiveDate) ||
                other.effectiveDate == effectiveDate) &&
            (identical(other.salesOfferGroupContainerDTO,
                    salesOfferGroupContainerDTO) ||
                other.salesOfferGroupContainerDTO ==
                    salesOfferGroupContainerDTO));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      offerId,
      productId,
      offerProductId,
      saleGroupId,
      offerMessage,
      effectiveDate,
      salesOfferGroupContainerDTO);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpsellOffersContainerDTOCopyWith<_$_UpsellOffersContainerDTO>
      get copyWith => __$$_UpsellOffersContainerDTOCopyWithImpl<
          _$_UpsellOffersContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpsellOffersContainerDTOToJson(
      this,
    );
  }
}

abstract class _UpsellOffersContainerDTO implements UpsellOffersContainerDTO {
  const factory _UpsellOffersContainerDTO(
          {@JsonKey(name: 'OfferId')
              required final int offerId,
          @JsonKey(name: 'ProductId')
              required final int productId,
          @JsonKey(name: 'OfferProductId')
              required final int offerProductId,
          @JsonKey(name: 'SaleGroupId')
              required final int saleGroupId,
          @JsonKey(name: 'OfferMessage')
              required final String offerMessage,
          @JsonKey(name: 'EffectiveDate')
              required final String effectiveDate,
          @JsonKey(name: 'SalesOfferGroupContainerDTO')
              final SalesOfferGroupContainerDTO? salesOfferGroupContainerDTO}) =
      _$_UpsellOffersContainerDTO;

  factory _UpsellOffersContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_UpsellOffersContainerDTO.fromJson;

  @override
  @JsonKey(name: 'OfferId')
  int get offerId;
  @override
  @JsonKey(name: 'ProductId')
  int get productId;
  @override
  @JsonKey(name: 'OfferProductId')
  int get offerProductId;
  @override
  @JsonKey(name: 'SaleGroupId')
  int get saleGroupId;
  @override
  @JsonKey(name: 'OfferMessage')
  String get offerMessage;
  @override
  @JsonKey(name: 'EffectiveDate')
  String get effectiveDate;
  @override
  @JsonKey(name: 'SalesOfferGroupContainerDTO')
  SalesOfferGroupContainerDTO? get salesOfferGroupContainerDTO;
  @override
  @JsonKey(ignore: true)
  _$$_UpsellOffersContainerDTOCopyWith<_$_UpsellOffersContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
