import 'package:freezed_annotation/freezed_annotation.dart';


part 'state_container_dto.freezed.dart';
part 'state_container_dto.g.dart';

@freezed
class StateContainerDTO with _$StateContainerDTO {

  const factory StateContainerDTO({
    @JsonKey(name: 'StateId')
    required int stateId,
    @JsonKey(name: 'State')
    required String state,
    @JsonKey(name: 'Description')
    required String description,
    @JsonKey(name: 'CountryId')
    required int countryId,
  }) =_StateContainerDTO;

  factory StateContainerDTO.fromJson(Map<String, Object?> json) =>
      _$StateContainerDTOFromJson(json);
}