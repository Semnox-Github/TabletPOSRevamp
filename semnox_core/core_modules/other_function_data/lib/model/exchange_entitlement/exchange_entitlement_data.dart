// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'exchange_entitlement_data.freezed.dart';
part 'exchange_entitlement_data.g.dart';

@freezed
class ExchangeEntitlementData with _$ExchangeEntitlementData {
  const factory ExchangeEntitlementData({
    @JsonKey(name: 'CardId')
    int? cardId,
    @JsonKey(name: 'ManagerId')
    int? managerId,
    @JsonKey(name: 'Remarks')
    String? remarks,
    @JsonKey(name: 'FromValue')
    double? fromValue,
    @JsonKey(name: 'FromType')
    int? fromType,
    @JsonKey(name: 'ToType')
    int? toType,

  }) = _ExchangeEntitlementData;

  factory ExchangeEntitlementData.fromJson(Map<String, dynamic> json) => _$ExchangeEntitlementDataFromJson(json);
}
