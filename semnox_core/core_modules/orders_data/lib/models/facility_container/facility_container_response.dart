
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:orders_data/models/facility_container/facility_container_data.dart';

part 'facility_container_response.freezed.dart';
part 'facility_container_response.g.dart';

@freezed
class FacilityContainerResponse with _$FacilityContainerResponse{
  const factory FacilityContainerResponse({
    FacilityContainerData? data,
    String? exception,
  }) = _FaciltyContainerResponse;

  factory FacilityContainerResponse.fromJson(Map<String,dynamic> json) => _$FacilityContainerResponseFromJson(json);
}