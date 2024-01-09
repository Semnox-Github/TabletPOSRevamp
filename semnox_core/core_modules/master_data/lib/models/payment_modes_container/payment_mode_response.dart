import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_data.dart';

part 'payment_mode_response.freezed.dart';
part 'payment_mode_response.g.dart';

@freezed
class PaymentModesResponse with _$PaymentModesResponse {
  const factory PaymentModesResponse({
    PaymentModesData? data,
    String? exception
  }) = _PaymentModesResponse;

  factory PaymentModesResponse.fromJson(Map<String, dynamic> json) => _$PaymentModesResponseFromJson(json);
}