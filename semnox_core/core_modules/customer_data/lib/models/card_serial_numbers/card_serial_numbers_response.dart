import 'package:customer_data/models/card_serial_numbers/serial_number_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_serial_numbers_response.freezed.dart';
part 'card_serial_numbers_response.g.dart';

@freezed
class CardSerialNumbersResponse with _$CardSerialNumbersResponse {
  const factory CardSerialNumbersResponse({
    List<CardSerialNumberData>? data,
    String? exception
  }) = _CardSerialNumbersResponse;

  factory CardSerialNumbersResponse.fromJson(Map<String, dynamic> json) => _$CardSerialNumbersResponseFromJson(json);
}