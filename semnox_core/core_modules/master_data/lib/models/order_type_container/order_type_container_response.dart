import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/order_type_container/order_type_container_data.dart';

part 'order_type_container_response.freezed.dart';
part 'order_type_container_response.g.dart';

@freezed
class OrderTypeContainerResponse with _$OrderTypeContainerResponse{
  const factory OrderTypeContainerResponse({
    OrderTypeContainerData? data,
    String? exception
  }) = _OrderTypeContainerResponse;

  factory OrderTypeContainerResponse.fromJson(Map<String, dynamic> json) => _$OrderTypeContainerResponseFromJson(json);
}