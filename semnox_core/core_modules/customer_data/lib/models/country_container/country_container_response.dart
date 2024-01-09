
import 'package:customer_data/models/country_container/country_container_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'country_container_response.freezed.dart';
part 'country_container_response.g.dart';

@freezed
class CountryContainerResponse with _$CountryContainerResponse {

  const factory CountryContainerResponse({
    CountryContainerData? data,
    String? exception
  }) =_CountryContainerResponse;

  factory CountryContainerResponse.fromJson(Map<String, Object?> json) =>
      _$CountryContainerResponseFromJson(json);
}