import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/create_order/order_data.dart';

part 'order_response.freezed.dart';
part 'order_response.g.dart';

@freezed
class OrderResponse with _$OrderResponse {
  const factory OrderResponse({
    OrderData? data,
    String? exception
  }) = _COrderResponse;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => _$OrderResponseFromJson(json);
}