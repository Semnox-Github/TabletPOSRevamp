// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'customer_search_count_response.freezed.dart';
part 'customer_search_count_response.g.dart';

@freezed
class CustomerSearchCountResponse with _$CustomerSearchCountResponse {

  const factory CustomerSearchCountResponse({
    required int data,
    @JsonKey(name: 'TotalNoOfPages')
    required int totalNoOfPages,
    String? exception
  }) =_CustomerSearchCountResponse;

  factory CustomerSearchCountResponse.fromJson(Map<String, Object?> json) =>
      _$CustomerSearchCountResponseFromJson(json);
}
