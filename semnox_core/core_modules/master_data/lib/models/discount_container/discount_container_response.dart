import 'package:freezed_annotation/freezed_annotation.dart';

import 'discount_container_data.dart';

part 'discount_container_response.freezed.dart';
part 'discount_container_response.g.dart';

@freezed
class DiscountContainerResponse with _$DiscountContainerResponse {
  const factory DiscountContainerResponse({
    DiscountContainerData? data,
    String? exception
  }) = _DiscountContainerResponse;

  factory DiscountContainerResponse.fromJson(Map<String, dynamic> json) => _$DiscountContainerResponseFromJson(json);
}