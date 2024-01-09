// ignore_for_file: depend_on_referenced_packages

import 'package:customer_data/models/customer_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'customer_response.freezed.dart';
part 'customer_response.g.dart';

@freezed
class CustomerResponse with _$CustomerResponse {

  const factory CustomerResponse({
    CustomerData? data, String? exception
  }) =_CustomerResponse;

  factory CustomerResponse.fromJson(Map<String, Object?> json) =>
      _$CustomerResponseFromJson(json);
}
