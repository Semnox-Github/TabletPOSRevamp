
import 'package:freezed_annotation/freezed_annotation.dart';
part 'orders_data_count_response.freezed.dart';
part 'orders_data_count_response.g.dart';
@freezed
class OrdersDataCountResponse with _$OrdersDataCountResponse{
  const factory OrdersDataCountResponse({
    int? data,
    String? exception,
  }) = _OrdersDataCountResponse;

  factory OrdersDataCountResponse.fromJson(Map<String,dynamic> json) => _$OrdersDataCountResponseFromJson(json);

}