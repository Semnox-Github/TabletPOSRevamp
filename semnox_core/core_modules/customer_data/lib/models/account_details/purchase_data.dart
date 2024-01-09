// ignore_for_file: invalid_annotation_target

import 'package:customer_data/models/customer_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_data.freezed.dart';
part 'purchase_data.g.dart';

@freezed
class PurchaseData with _$PurchaseData {
  const factory PurchaseData({
    @JsonKey(name: 'AccountId')
    int? accountId,
    @JsonKey(name: 'Date')
    String? date,
    @JsonKey(name: 'Product')
    String? product,
    @JsonKey(name: 'Amount')
    double? amount,
    @JsonKey(name: 'Credits')
    double? credits,
    @JsonKey(name: 'Courtesy')
    double? courtesy,
    @JsonKey(name: 'Bonus')
    double? bonus,
    @JsonKey(name: 'Time')
    double? time,
    @JsonKey(name: 'Tokens')
    double? tokens,
    @JsonKey(name: 'Tickets')
    int? tickets,
    @JsonKey(name: 'LoyaltyPoints')
    double? loyaltyPoints,
    @JsonKey(name: 'VirtualPoints')
    double? virtualPoints,
    @JsonKey(name: 'Site')
    String? site,
    @JsonKey(name: 'POS')
    String? POS,
    @JsonKey(name: 'UserName')
    String? userName,
    @JsonKey(name: 'Quantity')
    double? quantity,
    @JsonKey(name: 'Price')
    double? price,
    @JsonKey(name: 'RefId')
    int? refId,
    @JsonKey(name: 'RowNumber')
    int? rowNumber,
    @JsonKey(name: 'ActivityType')
    String? activityType,
    @JsonKey(name: 'Status')
    String? status,
    @JsonKey(name: 'PlayCredits')
    double? playCredits,
    @JsonKey(name: 'CounterItems')
    double? counterItems,

  }) = _PurchaseData;

  factory PurchaseData.fromJson(Map<String, dynamic> json) => _$PurchaseDataFromJson(json);

}