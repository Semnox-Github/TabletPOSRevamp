import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/orders_data/orders_data.dart';

part 'orders_data_response.freezed.dart';
part 'orders_data_response.g.dart';

@freezed
class OrdersDataResponse with _$OrdersDataResponse{
  const factory OrdersDataResponse({
    List<OrdersData>? data,
    String? exception,
  }) = _OrdersDataResponse;

  factory OrdersDataResponse.fromJson(Map<String,dynamic> json) => _$OrdersDataResponseFromJson(json);

}