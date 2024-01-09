import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/order_status_container/order_status_container_data.dart';

part 'order_status_container_response.freezed.dart';
part 'order_status_container_response.g.dart';

@freezed
class OrderStatusContainerResponse with _$OrderStatusContainerResponse {
  const factory OrderStatusContainerResponse({
    OrderStatusContainerData? data,
    String? exception
  }) = _OrderStatusContainerResponse;

  factory OrderStatusContainerResponse.fromJson(Map<String, dynamic> json) => _$OrderStatusContainerResponseFromJson(json);
}
