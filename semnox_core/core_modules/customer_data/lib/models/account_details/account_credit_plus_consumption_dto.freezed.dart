// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_credit_plus_consumption_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountCreditPlusConsumptionDTO _$AccountCreditPlusConsumptionDTOFromJson(
    Map<String, dynamic> json) {
  return _AccountCreditPlusConsumptionDTO.fromJson(json);
}

/// @nodoc
mixin _$AccountCreditPlusConsumptionDTO {
  @JsonKey(name: 'CategoryId')
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductId')
  int get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OrderTypeId')
  int get orderTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'GameProfileId')
  double get gameProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'GameId')
  double get gameId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountPercentage')
  double? get discountPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountAmount')
  String? get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'DiscountedPrice')
  double? get discountedPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'ConsumptionQty')
  int? get consumptionQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'ConsumptionBalance')
  double? get consumptionBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExpiryDate')
  String? get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'QuantityLimit')
  bool? get quantityLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCreditPlusConsumptionDTOCopyWith<AccountCreditPlusConsumptionDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCreditPlusConsumptionDTOCopyWith<$Res> {
  factory $AccountCreditPlusConsumptionDTOCopyWith(
          AccountCreditPlusConsumptionDTO value,
          $Res Function(AccountCreditPlusConsumptionDTO) then) =
      _$AccountCreditPlusConsumptionDTOCopyWithImpl<$Res,
          AccountCreditPlusConsumptionDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CategoryId') int categoryId,
      @JsonKey(name: 'ProductId') int productId,
      @JsonKey(name: 'OrderTypeId') int orderTypeId,
      @JsonKey(name: 'GameProfileId') double gameProfileId,
      @JsonKey(name: 'GameId') double gameId,
      @JsonKey(name: 'DiscountPercentage') double? discountPercentage,
      @JsonKey(name: 'DiscountAmount') String? discountAmount,
      @JsonKey(name: 'DiscountedPrice') double? discountedPrice,
      @JsonKey(name: 'ConsumptionQty') int? consumptionQty,
      @JsonKey(name: 'ConsumptionBalance') double? consumptionBalance,
      @JsonKey(name: 'ExpiryDate') String? expiryDate,
      @JsonKey(name: 'QuantityLimit') bool? quantityLimit});
}

/// @nodoc
class _$AccountCreditPlusConsumptionDTOCopyWithImpl<$Res,
        $Val extends AccountCreditPlusConsumptionDTO>
    implements $AccountCreditPlusConsumptionDTOCopyWith<$Res> {
  _$AccountCreditPlusConsumptionDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? productId = null,
    Object? orderTypeId = null,
    Object? gameProfileId = null,
    Object? gameId = null,
    Object? discountPercentage = freezed,
    Object? discountAmount = freezed,
    Object? discountedPrice = freezed,
    Object? consumptionQty = freezed,
    Object? consumptionBalance = freezed,
    Object? expiryDate = freezed,
    Object? quantityLimit = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      orderTypeId: null == orderTypeId
          ? _value.orderTypeId
          : orderTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      gameProfileId: null == gameProfileId
          ? _value.gameProfileId
          : gameProfileId // ignore: cast_nullable_to_non_nullable
              as double,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercentage: freezed == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      consumptionQty: freezed == consumptionQty
          ? _value.consumptionQty
          : consumptionQty // ignore: cast_nullable_to_non_nullable
              as int?,
      consumptionBalance: freezed == consumptionBalance
          ? _value.consumptionBalance
          : consumptionBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityLimit: freezed == quantityLimit
          ? _value.quantityLimit
          : quantityLimit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountCreditPlusConsumptionDTOCopyWith<$Res>
    implements $AccountCreditPlusConsumptionDTOCopyWith<$Res> {
  factory _$$_AccountCreditPlusConsumptionDTOCopyWith(
          _$_AccountCreditPlusConsumptionDTO value,
          $Res Function(_$_AccountCreditPlusConsumptionDTO) then) =
      __$$_AccountCreditPlusConsumptionDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CategoryId') int categoryId,
      @JsonKey(name: 'ProductId') int productId,
      @JsonKey(name: 'OrderTypeId') int orderTypeId,
      @JsonKey(name: 'GameProfileId') double gameProfileId,
      @JsonKey(name: 'GameId') double gameId,
      @JsonKey(name: 'DiscountPercentage') double? discountPercentage,
      @JsonKey(name: 'DiscountAmount') String? discountAmount,
      @JsonKey(name: 'DiscountedPrice') double? discountedPrice,
      @JsonKey(name: 'ConsumptionQty') int? consumptionQty,
      @JsonKey(name: 'ConsumptionBalance') double? consumptionBalance,
      @JsonKey(name: 'ExpiryDate') String? expiryDate,
      @JsonKey(name: 'QuantityLimit') bool? quantityLimit});
}

/// @nodoc
class __$$_AccountCreditPlusConsumptionDTOCopyWithImpl<$Res>
    extends _$AccountCreditPlusConsumptionDTOCopyWithImpl<$Res,
        _$_AccountCreditPlusConsumptionDTO>
    implements _$$_AccountCreditPlusConsumptionDTOCopyWith<$Res> {
  __$$_AccountCreditPlusConsumptionDTOCopyWithImpl(
      _$_AccountCreditPlusConsumptionDTO _value,
      $Res Function(_$_AccountCreditPlusConsumptionDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? productId = null,
    Object? orderTypeId = null,
    Object? gameProfileId = null,
    Object? gameId = null,
    Object? discountPercentage = freezed,
    Object? discountAmount = freezed,
    Object? discountedPrice = freezed,
    Object? consumptionQty = freezed,
    Object? consumptionBalance = freezed,
    Object? expiryDate = freezed,
    Object? quantityLimit = freezed,
  }) {
    return _then(_$_AccountCreditPlusConsumptionDTO(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
      orderTypeId: null == orderTypeId
          ? _value.orderTypeId
          : orderTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      gameProfileId: null == gameProfileId
          ? _value.gameProfileId
          : gameProfileId // ignore: cast_nullable_to_non_nullable
              as double,
      gameId: null == gameId
          ? _value.gameId
          : gameId // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercentage: freezed == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
      discountAmount: freezed == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      consumptionQty: freezed == consumptionQty
          ? _value.consumptionQty
          : consumptionQty // ignore: cast_nullable_to_non_nullable
              as int?,
      consumptionBalance: freezed == consumptionBalance
          ? _value.consumptionBalance
          : consumptionBalance // ignore: cast_nullable_to_non_nullable
              as double?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityLimit: freezed == quantityLimit
          ? _value.quantityLimit
          : quantityLimit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountCreditPlusConsumptionDTO
    implements _AccountCreditPlusConsumptionDTO {
  const _$_AccountCreditPlusConsumptionDTO(
      {@JsonKey(name: 'CategoryId') required this.categoryId,
      @JsonKey(name: 'ProductId') required this.productId,
      @JsonKey(name: 'OrderTypeId') required this.orderTypeId,
      @JsonKey(name: 'GameProfileId') required this.gameProfileId,
      @JsonKey(name: 'GameId') required this.gameId,
      @JsonKey(name: 'DiscountPercentage') this.discountPercentage,
      @JsonKey(name: 'DiscountAmount') this.discountAmount,
      @JsonKey(name: 'DiscountedPrice') this.discountedPrice,
      @JsonKey(name: 'ConsumptionQty') this.consumptionQty,
      @JsonKey(name: 'ConsumptionBalance') this.consumptionBalance,
      @JsonKey(name: 'ExpiryDate') this.expiryDate,
      @JsonKey(name: 'QuantityLimit') this.quantityLimit});

  factory _$_AccountCreditPlusConsumptionDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_AccountCreditPlusConsumptionDTOFromJson(json);

  @override
  @JsonKey(name: 'CategoryId')
  final int categoryId;
  @override
  @JsonKey(name: 'ProductId')
  final int productId;
  @override
  @JsonKey(name: 'OrderTypeId')
  final int orderTypeId;
  @override
  @JsonKey(name: 'GameProfileId')
  final double gameProfileId;
  @override
  @JsonKey(name: 'GameId')
  final double gameId;
  @override
  @JsonKey(name: 'DiscountPercentage')
  final double? discountPercentage;
  @override
  @JsonKey(name: 'DiscountAmount')
  final String? discountAmount;
  @override
  @JsonKey(name: 'DiscountedPrice')
  final double? discountedPrice;
  @override
  @JsonKey(name: 'ConsumptionQty')
  final int? consumptionQty;
  @override
  @JsonKey(name: 'ConsumptionBalance')
  final double? consumptionBalance;
  @override
  @JsonKey(name: 'ExpiryDate')
  final String? expiryDate;
  @override
  @JsonKey(name: 'QuantityLimit')
  final bool? quantityLimit;

  @override
  String toString() {
    return 'AccountCreditPlusConsumptionDTO(categoryId: $categoryId, productId: $productId, orderTypeId: $orderTypeId, gameProfileId: $gameProfileId, gameId: $gameId, discountPercentage: $discountPercentage, discountAmount: $discountAmount, discountedPrice: $discountedPrice, consumptionQty: $consumptionQty, consumptionBalance: $consumptionBalance, expiryDate: $expiryDate, quantityLimit: $quantityLimit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountCreditPlusConsumptionDTO &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.orderTypeId, orderTypeId) ||
                other.orderTypeId == orderTypeId) &&
            (identical(other.gameProfileId, gameProfileId) ||
                other.gameProfileId == gameProfileId) &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.consumptionQty, consumptionQty) ||
                other.consumptionQty == consumptionQty) &&
            (identical(other.consumptionBalance, consumptionBalance) ||
                other.consumptionBalance == consumptionBalance) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.quantityLimit, quantityLimit) ||
                other.quantityLimit == quantityLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      categoryId,
      productId,
      orderTypeId,
      gameProfileId,
      gameId,
      discountPercentage,
      discountAmount,
      discountedPrice,
      consumptionQty,
      consumptionBalance,
      expiryDate,
      quantityLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountCreditPlusConsumptionDTOCopyWith<
          _$_AccountCreditPlusConsumptionDTO>
      get copyWith => __$$_AccountCreditPlusConsumptionDTOCopyWithImpl<
          _$_AccountCreditPlusConsumptionDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountCreditPlusConsumptionDTOToJson(
      this,
    );
  }
}

abstract class _AccountCreditPlusConsumptionDTO
    implements AccountCreditPlusConsumptionDTO {
  const factory _AccountCreditPlusConsumptionDTO(
          {@JsonKey(name: 'CategoryId') required final int categoryId,
          @JsonKey(name: 'ProductId') required final int productId,
          @JsonKey(name: 'OrderTypeId') required final int orderTypeId,
          @JsonKey(name: 'GameProfileId') required final double gameProfileId,
          @JsonKey(name: 'GameId') required final double gameId,
          @JsonKey(name: 'DiscountPercentage') final double? discountPercentage,
          @JsonKey(name: 'DiscountAmount') final String? discountAmount,
          @JsonKey(name: 'DiscountedPrice') final double? discountedPrice,
          @JsonKey(name: 'ConsumptionQty') final int? consumptionQty,
          @JsonKey(name: 'ConsumptionBalance') final double? consumptionBalance,
          @JsonKey(name: 'ExpiryDate') final String? expiryDate,
          @JsonKey(name: 'QuantityLimit') final bool? quantityLimit}) =
      _$_AccountCreditPlusConsumptionDTO;

  factory _AccountCreditPlusConsumptionDTO.fromJson(Map<String, dynamic> json) =
      _$_AccountCreditPlusConsumptionDTO.fromJson;

  @override
  @JsonKey(name: 'CategoryId')
  int get categoryId;
  @override
  @JsonKey(name: 'ProductId')
  int get productId;
  @override
  @JsonKey(name: 'OrderTypeId')
  int get orderTypeId;
  @override
  @JsonKey(name: 'GameProfileId')
  double get gameProfileId;
  @override
  @JsonKey(name: 'GameId')
  double get gameId;
  @override
  @JsonKey(name: 'DiscountPercentage')
  double? get discountPercentage;
  @override
  @JsonKey(name: 'DiscountAmount')
  String? get discountAmount;
  @override
  @JsonKey(name: 'DiscountedPrice')
  double? get discountedPrice;
  @override
  @JsonKey(name: 'ConsumptionQty')
  int? get consumptionQty;
  @override
  @JsonKey(name: 'ConsumptionBalance')
  double? get consumptionBalance;
  @override
  @JsonKey(name: 'ExpiryDate')
  String? get expiryDate;
  @override
  @JsonKey(name: 'QuantityLimit')
  bool? get quantityLimit;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCreditPlusConsumptionDTOCopyWith<
          _$_AccountCreditPlusConsumptionDTO>
      get copyWith => throw _privateConstructorUsedError;
}
