// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_item_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InventoryItemContainerDTO _$InventoryItemContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _InventoryItemContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$InventoryItemContainerDTO {
  @JsonKey(name: 'ProductId')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'CategoryId')
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DefaultLocationId')
  int get defaultLocationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OutBoundLocationId')
  int get outBoundLocationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsRedeemable')
  String get isRedeemable => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsSellable')
  String get isSellable => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriceInTickets')
  double get priceInTickets => throw _privateConstructorUsedError;
  @JsonKey(name: 'ImageFileName')
  String get imageFileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'TurnInPriceInTickets')
  int get turnInPriceInTickets => throw _privateConstructorUsedError;
  @JsonKey(name: 'LotControlled')
  bool get lotControlled => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastPurchasePrice')
  double get lastPurchasePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxInclusiveCost')
  String get taxInclusiveCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryType')
  String get expiryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryInDays')
  int get expiryInDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'MarketListItem')
  bool get marketListItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'RecipeDescription')
  dynamic get recipeDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductBarcodeContainerDTOList')
  List<ProductBarcodeContainerDTO>? get productBarcodeContainerDtoList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryItemContainerDTOCopyWith<InventoryItemContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryItemContainerDTOCopyWith<$Res> {
  factory $InventoryItemContainerDTOCopyWith(InventoryItemContainerDTO value,
          $Res Function(InventoryItemContainerDTO) then) =
      _$InventoryItemContainerDTOCopyWithImpl<$Res, InventoryItemContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductId')
          int productId,
      @JsonKey(name: 'Code')
          String code,
      @JsonKey(name: 'Description')
          String description,
      @JsonKey(name: 'CategoryId')
          int categoryId,
      @JsonKey(name: 'DefaultLocationId')
          int defaultLocationId,
      @JsonKey(name: 'OutBoundLocationId')
          int outBoundLocationId,
      @JsonKey(name: 'IsRedeemable')
          String isRedeemable,
      @JsonKey(name: 'IsSellable')
          String isSellable,
      @JsonKey(name: 'PriceInTickets')
          double priceInTickets,
      @JsonKey(name: 'ImageFileName')
          String imageFileName,
      @JsonKey(name: 'TurnInPriceInTickets')
          int turnInPriceInTickets,
      @JsonKey(name: 'LotControlled')
          bool lotControlled,
      @JsonKey(name: 'LastPurchasePrice')
          double lastPurchasePrice,
      @JsonKey(name: 'TaxInclusiveCost')
          String taxInclusiveCost,
      @JsonKey(name: 'ExpiryType')
          String expiryType,
      @JsonKey(name: 'ExpiryInDays')
          int expiryInDays,
      @JsonKey(name: 'MarketListItem')
          bool marketListItem,
      @JsonKey(name: 'RecipeDescription')
          dynamic recipeDescription,
      @JsonKey(name: 'ProductBarcodeContainerDTOList')
          List<ProductBarcodeContainerDTO>? productBarcodeContainerDtoList});
}

/// @nodoc
class _$InventoryItemContainerDTOCopyWithImpl<$Res,
        $Val extends InventoryItemContainerDTO>
    implements $InventoryItemContainerDTOCopyWith<$Res> {
  _$InventoryItemContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? code = null,
    Object? description = null,
    Object? categoryId = null,
    Object? defaultLocationId = null,
    Object? outBoundLocationId = null,
    Object? isRedeemable = null,
    Object? isSellable = null,
    Object? priceInTickets = null,
    Object? imageFileName = null,
    Object? turnInPriceInTickets = null,
    Object? lotControlled = null,
    Object? lastPurchasePrice = null,
    Object? taxInclusiveCost = null,
    Object? expiryType = null,
    Object? expiryInDays = null,
    Object? marketListItem = null,
    Object? recipeDescription = freezed,
    Object? productBarcodeContainerDtoList = freezed,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      defaultLocationId: null == defaultLocationId
          ? _value.defaultLocationId
          : defaultLocationId // ignore: cast_nullable_to_non_nullable
              as int,
      outBoundLocationId: null == outBoundLocationId
          ? _value.outBoundLocationId
          : outBoundLocationId // ignore: cast_nullable_to_non_nullable
              as int,
      isRedeemable: null == isRedeemable
          ? _value.isRedeemable
          : isRedeemable // ignore: cast_nullable_to_non_nullable
              as String,
      isSellable: null == isSellable
          ? _value.isSellable
          : isSellable // ignore: cast_nullable_to_non_nullable
              as String,
      priceInTickets: null == priceInTickets
          ? _value.priceInTickets
          : priceInTickets // ignore: cast_nullable_to_non_nullable
              as double,
      imageFileName: null == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String,
      turnInPriceInTickets: null == turnInPriceInTickets
          ? _value.turnInPriceInTickets
          : turnInPriceInTickets // ignore: cast_nullable_to_non_nullable
              as int,
      lotControlled: null == lotControlled
          ? _value.lotControlled
          : lotControlled // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPurchasePrice: null == lastPurchasePrice
          ? _value.lastPurchasePrice
          : lastPurchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      taxInclusiveCost: null == taxInclusiveCost
          ? _value.taxInclusiveCost
          : taxInclusiveCost // ignore: cast_nullable_to_non_nullable
              as String,
      expiryType: null == expiryType
          ? _value.expiryType
          : expiryType // ignore: cast_nullable_to_non_nullable
              as String,
      expiryInDays: null == expiryInDays
          ? _value.expiryInDays
          : expiryInDays // ignore: cast_nullable_to_non_nullable
              as int,
      marketListItem: null == marketListItem
          ? _value.marketListItem
          : marketListItem // ignore: cast_nullable_to_non_nullable
              as bool,
      recipeDescription: freezed == recipeDescription
          ? _value.recipeDescription
          : recipeDescription // ignore: cast_nullable_to_non_nullable
              as dynamic,
      productBarcodeContainerDtoList: freezed == productBarcodeContainerDtoList
          ? _value.productBarcodeContainerDtoList
          : productBarcodeContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<ProductBarcodeContainerDTO>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InventoryItemContainerDTOCopyWith<$Res>
    implements $InventoryItemContainerDTOCopyWith<$Res> {
  factory _$$_InventoryItemContainerDTOCopyWith(
          _$_InventoryItemContainerDTO value,
          $Res Function(_$_InventoryItemContainerDTO) then) =
      __$$_InventoryItemContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ProductId')
          int productId,
      @JsonKey(name: 'Code')
          String code,
      @JsonKey(name: 'Description')
          String description,
      @JsonKey(name: 'CategoryId')
          int categoryId,
      @JsonKey(name: 'DefaultLocationId')
          int defaultLocationId,
      @JsonKey(name: 'OutBoundLocationId')
          int outBoundLocationId,
      @JsonKey(name: 'IsRedeemable')
          String isRedeemable,
      @JsonKey(name: 'IsSellable')
          String isSellable,
      @JsonKey(name: 'PriceInTickets')
          double priceInTickets,
      @JsonKey(name: 'ImageFileName')
          String imageFileName,
      @JsonKey(name: 'TurnInPriceInTickets')
          int turnInPriceInTickets,
      @JsonKey(name: 'LotControlled')
          bool lotControlled,
      @JsonKey(name: 'LastPurchasePrice')
          double lastPurchasePrice,
      @JsonKey(name: 'TaxInclusiveCost')
          String taxInclusiveCost,
      @JsonKey(name: 'ExpiryType')
          String expiryType,
      @JsonKey(name: 'ExpiryInDays')
          int expiryInDays,
      @JsonKey(name: 'MarketListItem')
          bool marketListItem,
      @JsonKey(name: 'RecipeDescription')
          dynamic recipeDescription,
      @JsonKey(name: 'ProductBarcodeContainerDTOList')
          List<ProductBarcodeContainerDTO>? productBarcodeContainerDtoList});
}

/// @nodoc
class __$$_InventoryItemContainerDTOCopyWithImpl<$Res>
    extends _$InventoryItemContainerDTOCopyWithImpl<$Res,
        _$_InventoryItemContainerDTO>
    implements _$$_InventoryItemContainerDTOCopyWith<$Res> {
  __$$_InventoryItemContainerDTOCopyWithImpl(
      _$_InventoryItemContainerDTO _value,
      $Res Function(_$_InventoryItemContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? code = null,
    Object? description = null,
    Object? categoryId = null,
    Object? defaultLocationId = null,
    Object? outBoundLocationId = null,
    Object? isRedeemable = null,
    Object? isSellable = null,
    Object? priceInTickets = null,
    Object? imageFileName = null,
    Object? turnInPriceInTickets = null,
    Object? lotControlled = null,
    Object? lastPurchasePrice = null,
    Object? taxInclusiveCost = null,
    Object? expiryType = null,
    Object? expiryInDays = null,
    Object? marketListItem = null,
    Object? recipeDescription = freezed,
    Object? productBarcodeContainerDtoList = freezed,
  }) {
    return _then(_$_InventoryItemContainerDTO(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      defaultLocationId: null == defaultLocationId
          ? _value.defaultLocationId
          : defaultLocationId // ignore: cast_nullable_to_non_nullable
              as int,
      outBoundLocationId: null == outBoundLocationId
          ? _value.outBoundLocationId
          : outBoundLocationId // ignore: cast_nullable_to_non_nullable
              as int,
      isRedeemable: null == isRedeemable
          ? _value.isRedeemable
          : isRedeemable // ignore: cast_nullable_to_non_nullable
              as String,
      isSellable: null == isSellable
          ? _value.isSellable
          : isSellable // ignore: cast_nullable_to_non_nullable
              as String,
      priceInTickets: null == priceInTickets
          ? _value.priceInTickets
          : priceInTickets // ignore: cast_nullable_to_non_nullable
              as double,
      imageFileName: null == imageFileName
          ? _value.imageFileName
          : imageFileName // ignore: cast_nullable_to_non_nullable
              as String,
      turnInPriceInTickets: null == turnInPriceInTickets
          ? _value.turnInPriceInTickets
          : turnInPriceInTickets // ignore: cast_nullable_to_non_nullable
              as int,
      lotControlled: null == lotControlled
          ? _value.lotControlled
          : lotControlled // ignore: cast_nullable_to_non_nullable
              as bool,
      lastPurchasePrice: null == lastPurchasePrice
          ? _value.lastPurchasePrice
          : lastPurchasePrice // ignore: cast_nullable_to_non_nullable
              as double,
      taxInclusiveCost: null == taxInclusiveCost
          ? _value.taxInclusiveCost
          : taxInclusiveCost // ignore: cast_nullable_to_non_nullable
              as String,
      expiryType: null == expiryType
          ? _value.expiryType
          : expiryType // ignore: cast_nullable_to_non_nullable
              as String,
      expiryInDays: null == expiryInDays
          ? _value.expiryInDays
          : expiryInDays // ignore: cast_nullable_to_non_nullable
              as int,
      marketListItem: null == marketListItem
          ? _value.marketListItem
          : marketListItem // ignore: cast_nullable_to_non_nullable
              as bool,
      recipeDescription: freezed == recipeDescription
          ? _value.recipeDescription
          : recipeDescription // ignore: cast_nullable_to_non_nullable
              as dynamic,
      productBarcodeContainerDtoList: freezed == productBarcodeContainerDtoList
          ? _value._productBarcodeContainerDtoList
          : productBarcodeContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<ProductBarcodeContainerDTO>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InventoryItemContainerDTO implements _InventoryItemContainerDTO {
  const _$_InventoryItemContainerDTO(
      {@JsonKey(name: 'ProductId')
          required this.productId,
      @JsonKey(name: 'Code')
          required this.code,
      @JsonKey(name: 'Description')
          required this.description,
      @JsonKey(name: 'CategoryId')
          required this.categoryId,
      @JsonKey(name: 'DefaultLocationId')
          required this.defaultLocationId,
      @JsonKey(name: 'OutBoundLocationId')
          required this.outBoundLocationId,
      @JsonKey(name: 'IsRedeemable')
          required this.isRedeemable,
      @JsonKey(name: 'IsSellable')
          required this.isSellable,
      @JsonKey(name: 'PriceInTickets')
          required this.priceInTickets,
      @JsonKey(name: 'ImageFileName')
          required this.imageFileName,
      @JsonKey(name: 'TurnInPriceInTickets')
          required this.turnInPriceInTickets,
      @JsonKey(name: 'LotControlled')
          required this.lotControlled,
      @JsonKey(name: 'LastPurchasePrice')
          required this.lastPurchasePrice,
      @JsonKey(name: 'TaxInclusiveCost')
          required this.taxInclusiveCost,
      @JsonKey(name: 'ExpiryType')
          required this.expiryType,
      @JsonKey(name: 'ExpiryInDays')
          required this.expiryInDays,
      @JsonKey(name: 'MarketListItem')
          required this.marketListItem,
      @JsonKey(name: 'RecipeDescription')
          this.recipeDescription,
      @JsonKey(name: 'ProductBarcodeContainerDTOList')
          final List<ProductBarcodeContainerDTO>?
              productBarcodeContainerDtoList})
      : _productBarcodeContainerDtoList = productBarcodeContainerDtoList;

  factory _$_InventoryItemContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_InventoryItemContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'ProductId')
  final int productId;
  @override
  @JsonKey(name: 'Code')
  final String code;
  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'CategoryId')
  final int categoryId;
  @override
  @JsonKey(name: 'DefaultLocationId')
  final int defaultLocationId;
  @override
  @JsonKey(name: 'OutBoundLocationId')
  final int outBoundLocationId;
  @override
  @JsonKey(name: 'IsRedeemable')
  final String isRedeemable;
  @override
  @JsonKey(name: 'IsSellable')
  final String isSellable;
  @override
  @JsonKey(name: 'PriceInTickets')
  final double priceInTickets;
  @override
  @JsonKey(name: 'ImageFileName')
  final String imageFileName;
  @override
  @JsonKey(name: 'TurnInPriceInTickets')
  final int turnInPriceInTickets;
  @override
  @JsonKey(name: 'LotControlled')
  final bool lotControlled;
  @override
  @JsonKey(name: 'LastPurchasePrice')
  final double lastPurchasePrice;
  @override
  @JsonKey(name: 'TaxInclusiveCost')
  final String taxInclusiveCost;
  @override
  @JsonKey(name: 'ExpiryType')
  final String expiryType;
  @override
  @JsonKey(name: 'ExpiryInDays')
  final int expiryInDays;
  @override
  @JsonKey(name: 'MarketListItem')
  final bool marketListItem;
  @override
  @JsonKey(name: 'RecipeDescription')
  final dynamic recipeDescription;
  final List<ProductBarcodeContainerDTO>? _productBarcodeContainerDtoList;
  @override
  @JsonKey(name: 'ProductBarcodeContainerDTOList')
  List<ProductBarcodeContainerDTO>? get productBarcodeContainerDtoList {
    final value = _productBarcodeContainerDtoList;
    if (value == null) return null;
    if (_productBarcodeContainerDtoList is EqualUnmodifiableListView)
      return _productBarcodeContainerDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InventoryItemContainerDTO(productId: $productId, code: $code, description: $description, categoryId: $categoryId, defaultLocationId: $defaultLocationId, outBoundLocationId: $outBoundLocationId, isRedeemable: $isRedeemable, isSellable: $isSellable, priceInTickets: $priceInTickets, imageFileName: $imageFileName, turnInPriceInTickets: $turnInPriceInTickets, lotControlled: $lotControlled, lastPurchasePrice: $lastPurchasePrice, taxInclusiveCost: $taxInclusiveCost, expiryType: $expiryType, expiryInDays: $expiryInDays, marketListItem: $marketListItem, recipeDescription: $recipeDescription, productBarcodeContainerDtoList: $productBarcodeContainerDtoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InventoryItemContainerDTO &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.defaultLocationId, defaultLocationId) ||
                other.defaultLocationId == defaultLocationId) &&
            (identical(other.outBoundLocationId, outBoundLocationId) ||
                other.outBoundLocationId == outBoundLocationId) &&
            (identical(other.isRedeemable, isRedeemable) ||
                other.isRedeemable == isRedeemable) &&
            (identical(other.isSellable, isSellable) ||
                other.isSellable == isSellable) &&
            (identical(other.priceInTickets, priceInTickets) ||
                other.priceInTickets == priceInTickets) &&
            (identical(other.imageFileName, imageFileName) ||
                other.imageFileName == imageFileName) &&
            (identical(other.turnInPriceInTickets, turnInPriceInTickets) ||
                other.turnInPriceInTickets == turnInPriceInTickets) &&
            (identical(other.lotControlled, lotControlled) ||
                other.lotControlled == lotControlled) &&
            (identical(other.lastPurchasePrice, lastPurchasePrice) ||
                other.lastPurchasePrice == lastPurchasePrice) &&
            (identical(other.taxInclusiveCost, taxInclusiveCost) ||
                other.taxInclusiveCost == taxInclusiveCost) &&
            (identical(other.expiryType, expiryType) ||
                other.expiryType == expiryType) &&
            (identical(other.expiryInDays, expiryInDays) ||
                other.expiryInDays == expiryInDays) &&
            (identical(other.marketListItem, marketListItem) ||
                other.marketListItem == marketListItem) &&
            const DeepCollectionEquality()
                .equals(other.recipeDescription, recipeDescription) &&
            const DeepCollectionEquality().equals(
                other._productBarcodeContainerDtoList,
                _productBarcodeContainerDtoList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        productId,
        code,
        description,
        categoryId,
        defaultLocationId,
        outBoundLocationId,
        isRedeemable,
        isSellable,
        priceInTickets,
        imageFileName,
        turnInPriceInTickets,
        lotControlled,
        lastPurchasePrice,
        taxInclusiveCost,
        expiryType,
        expiryInDays,
        marketListItem,
        const DeepCollectionEquality().hash(recipeDescription),
        const DeepCollectionEquality().hash(_productBarcodeContainerDtoList)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InventoryItemContainerDTOCopyWith<_$_InventoryItemContainerDTO>
      get copyWith => __$$_InventoryItemContainerDTOCopyWithImpl<
          _$_InventoryItemContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InventoryItemContainerDTOToJson(
      this,
    );
  }
}

abstract class _InventoryItemContainerDTO implements InventoryItemContainerDTO {
  const factory _InventoryItemContainerDTO(
      {@JsonKey(name: 'ProductId')
          required final int productId,
      @JsonKey(name: 'Code')
          required final String code,
      @JsonKey(name: 'Description')
          required final String description,
      @JsonKey(name: 'CategoryId')
          required final int categoryId,
      @JsonKey(name: 'DefaultLocationId')
          required final int defaultLocationId,
      @JsonKey(name: 'OutBoundLocationId')
          required final int outBoundLocationId,
      @JsonKey(name: 'IsRedeemable')
          required final String isRedeemable,
      @JsonKey(name: 'IsSellable')
          required final String isSellable,
      @JsonKey(name: 'PriceInTickets')
          required final double priceInTickets,
      @JsonKey(name: 'ImageFileName')
          required final String imageFileName,
      @JsonKey(name: 'TurnInPriceInTickets')
          required final int turnInPriceInTickets,
      @JsonKey(name: 'LotControlled')
          required final bool lotControlled,
      @JsonKey(name: 'LastPurchasePrice')
          required final double lastPurchasePrice,
      @JsonKey(name: 'TaxInclusiveCost')
          required final String taxInclusiveCost,
      @JsonKey(name: 'ExpiryType')
          required final String expiryType,
      @JsonKey(name: 'ExpiryInDays')
          required final int expiryInDays,
      @JsonKey(name: 'MarketListItem')
          required final bool marketListItem,
      @JsonKey(name: 'RecipeDescription')
          final dynamic recipeDescription,
      @JsonKey(name: 'ProductBarcodeContainerDTOList')
          final List<ProductBarcodeContainerDTO>?
              productBarcodeContainerDtoList}) = _$_InventoryItemContainerDTO;

  factory _InventoryItemContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_InventoryItemContainerDTO.fromJson;

  @override
  @JsonKey(name: 'ProductId')
  int get productId;
  @override
  @JsonKey(name: 'Code')
  String get code;
  @override
  @JsonKey(name: 'Description')
  String get description;
  @override
  @JsonKey(name: 'CategoryId')
  int get categoryId;
  @override
  @JsonKey(name: 'DefaultLocationId')
  int get defaultLocationId;
  @override
  @JsonKey(name: 'OutBoundLocationId')
  int get outBoundLocationId;
  @override
  @JsonKey(name: 'IsRedeemable')
  String get isRedeemable;
  @override
  @JsonKey(name: 'IsSellable')
  String get isSellable;
  @override
  @JsonKey(name: 'PriceInTickets')
  double get priceInTickets;
  @override
  @JsonKey(name: 'ImageFileName')
  String get imageFileName;
  @override
  @JsonKey(name: 'TurnInPriceInTickets')
  int get turnInPriceInTickets;
  @override
  @JsonKey(name: 'LotControlled')
  bool get lotControlled;
  @override
  @JsonKey(name: 'LastPurchasePrice')
  double get lastPurchasePrice;
  @override
  @JsonKey(name: 'TaxInclusiveCost')
  String get taxInclusiveCost;
  @override
  @JsonKey(name: 'ExpiryType')
  String get expiryType;
  @override
  @JsonKey(name: 'ExpiryInDays')
  int get expiryInDays;
  @override
  @JsonKey(name: 'MarketListItem')
  bool get marketListItem;
  @override
  @JsonKey(name: 'RecipeDescription')
  dynamic get recipeDescription;
  @override
  @JsonKey(name: 'ProductBarcodeContainerDTOList')
  List<ProductBarcodeContainerDTO>? get productBarcodeContainerDtoList;
  @override
  @JsonKey(ignore: true)
  _$$_InventoryItemContainerDTOCopyWith<_$_InventoryItemContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
