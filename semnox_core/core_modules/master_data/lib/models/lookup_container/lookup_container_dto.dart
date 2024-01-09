// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/lookup_container/lookup_values_container_dto.dart';

part 'lookup_container_dto.freezed.dart';
part 'lookup_container_dto.g.dart';

@freezed
class LookupsContainerDTO with _$LookupsContainerDTO {
  const factory LookupsContainerDTO({
    @JsonKey(name: 'LookupId')
    required int lookupId,
    @JsonKey(name: 'LookupName')
    required String lookupName,
    @JsonKey(name: 'IsProtected')
    required String isProtected,
    @JsonKey(name: 'LookupValuesContainerDTOList')
    required List<LookupValuesContainerDTO> lookupValuesContainerDTOList,
  }) = _LookupsContainerDTO;

  factory LookupsContainerDTO.fromJson(Map<String, dynamic> json) => _$LookupsContainerDTOFromJson(json);
}