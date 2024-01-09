import 'package:customer_data/models/country_container/state_container_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'country_container_dto.freezed.dart';
part 'country_container_dto.g.dart';

@freezed
class CountryContainerDTO with _$CountryContainerDTO {

  const factory CountryContainerDTO({
    @JsonKey(name: 'CountryId')
    required int countryId,
    @JsonKey(name: 'CountryName')
    required String countryName,
    @JsonKey(name: 'CountryCode')
    required String countryCode,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'StateContainerDTOList')
    required List<StateContainerDTO> stateContainerDTOList,
  }) =_CountryContainerDTO;

  factory CountryContainerDTO.fromJson(Map<String, Object?> json) =>
      _$CountryContainerDTOFromJson(json);
}