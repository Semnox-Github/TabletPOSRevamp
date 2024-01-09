
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/facility_table_container/facility_table_container_data.dart';

part 'facility_table_container_response.freezed.dart';
part 'facility_table_container_response.g.dart';

@freezed
class FacilityTableContainerResponse with _$FacilityTableContainerResponse{
  const factory FacilityTableContainerResponse({
      FacilityTableContainerData? data,
      String? exception,
  }) =_FacilityTableContainerResponse;

  factory FacilityTableContainerResponse.fromJson(Map<String,dynamic> json) => _$FacilityTableContainerResponseFromJson(json);
}