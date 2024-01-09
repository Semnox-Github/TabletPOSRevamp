import 'package:customer_data/models/country_container/country_container_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'country_container_data.freezed.dart';
part 'country_container_data.g.dart';

@freezed
class CountryContainerData with _$CountryContainerData {

  const factory CountryContainerData({
    @JsonKey(name: 'CountryContainerDTOList')
    required List<CountryContainerDTO> countryContainerDTOList,
    String? hash,
  }) =_CountryContainerData;

  factory CountryContainerData.fromJson(Map<String, Object?> json) =>
      _$CountryContainerDataFromJson(json);
}