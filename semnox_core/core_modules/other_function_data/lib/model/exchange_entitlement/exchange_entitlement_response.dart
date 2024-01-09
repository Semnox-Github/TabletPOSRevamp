import 'package:freezed_annotation/freezed_annotation.dart';
import 'exchange_entitlement_data.dart';
part 'exchange_entitlement_response.freezed.dart';
part 'exchange_entitlement_response.g.dart';

@freezed
class ExchangeEntitlementResponse with _$ExchangeEntitlementResponse {
  const factory ExchangeEntitlementResponse({
    ExchangeEntitlementData? data,
    String? exception
  }) = _ExchangeEntitlementResponse;

  factory ExchangeEntitlementResponse.fromJson(Map<String, dynamic> json) => _$ExchangeEntitlementResponseFromJson(json);
}