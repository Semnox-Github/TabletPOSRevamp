import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/facility_table_status_container/facility_table_status_container_data.dart';

part 'facility_table_status_container_response.freezed.dart';
part 'facility_table_status_container_response.g.dart';

@freezed
class FacilityTableStatusContainerResponse with _$FacilityTableStatusContainerResponse {
  const factory FacilityTableStatusContainerResponse({
    FacilityTableStatusContainerData? data,
    String? exception
  }) = _FacilityTableStatusContainerResponse;

  factory FacilityTableStatusContainerResponse.fromJson(Map<String, dynamic> json) => _$FacilityTableStatusContainerResponseFromJson(json);
}