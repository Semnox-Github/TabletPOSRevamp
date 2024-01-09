import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_credit_plus_consumption_dto.freezed.dart';
part 'account_credit_plus_consumption_dto.g.dart';

@freezed
class AccountCreditPlusConsumptionDTO with _$AccountCreditPlusConsumptionDTO{
  const factory AccountCreditPlusConsumptionDTO({
    @JsonKey(name: 'CategoryId')
    required int categoryId,
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'OrderTypeId')
    required int orderTypeId,
    @JsonKey(name: 'GameProfileId')
    required double gameProfileId,
    @JsonKey(name: 'GameId')
    required double gameId,
    @JsonKey(name: 'DiscountPercentage')
    double? discountPercentage,
    @JsonKey(name: 'DiscountAmount')
    String? discountAmount,
    @JsonKey(name: 'DiscountedPrice')
    double? discountedPrice,
    @JsonKey(name: 'ConsumptionQty')
    int? consumptionQty,
    @JsonKey(name: 'ConsumptionBalance')
    double? consumptionBalance,
    @JsonKey(name: 'ExpiryDate')
    String? expiryDate,
    @JsonKey(name: 'QuantityLimit')
     bool? quantityLimit,
  }) = _AccountCreditPlusConsumptionDTO;

  factory AccountCreditPlusConsumptionDTO.fromJson(Map<String, dynamic> json) => _$AccountCreditPlusConsumptionDTOFromJson(json);
}