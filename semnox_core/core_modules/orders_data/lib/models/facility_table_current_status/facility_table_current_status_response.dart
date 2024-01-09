import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/facility_table_current_status/facility_table_current_status_dto.dart';

part 'facility_table_current_status_response.freezed.dart';
part 'facility_table_current_status_response.g.dart';

@freezed
class FacilityTableCurrentStatusResponse with _$FacilityTableCurrentStatusResponse {
  const factory FacilityTableCurrentStatusResponse({
    List<FacilityTableCurrentStatusDTO>? data,
    String? exception,
  }) = _FacilityTableCurrentStatusResponse;

  factory FacilityTableCurrentStatusResponse.fromJson(Map<String, dynamic> json) => _$FacilityTableCurrentStatusResponseFromJson(json);
}