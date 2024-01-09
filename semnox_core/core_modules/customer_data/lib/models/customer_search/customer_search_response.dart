// ignore_for_file: depend_on_referenced_packages

import 'package:customer_data/models/customer_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'customer_search_response.freezed.dart';
part 'customer_search_response.g.dart';

@freezed
class CustomerSearchResponse with _$CustomerSearchResponse {

  const factory CustomerSearchResponse({
    List<CustomerData>? data, String? exception
  }) =_CustomerSearchResponse;

  factory CustomerSearchResponse.fromJson(Map<String, Object?> json) =>
      _$CustomerSearchResponseFromJson(json);
}
