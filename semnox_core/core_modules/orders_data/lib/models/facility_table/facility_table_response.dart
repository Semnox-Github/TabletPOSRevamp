
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'facility_table_response.freezed.dart';
part 'facility_table_response.g.dart';

@freezed
class FacilityTableResponse with _$FacilityTableResponse{
  const factory FacilityTableResponse({
    dynamic? data, String? exception
  }) =_FacilityTableResponse;

  factory FacilityTableResponse.fromJson(Map<String, Object?> json) =>
      _$FacilityTableResponseFromJson(json);
}