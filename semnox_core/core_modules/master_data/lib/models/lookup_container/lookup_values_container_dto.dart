// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'lookup_values_container_dto.freezed.dart';
part 'lookup_values_container_dto.g.dart';

@freezed
class LookupValuesContainerDTO with _$LookupValuesContainerDTO {
  const factory LookupValuesContainerDTO({
    @JsonKey(name: 'LookupValueId')
    required int lookupValueId,
    @JsonKey(name: 'LookupValue')
    required String lookupValue,
    @JsonKey(name: 'Description')
    required String description,
    @JsonKey(name: 'LookupName')
    dynamic lookupName,
  }) = _LookupValuesContainerDTO;

  factory LookupValuesContainerDTO.fromJson(Map<String, dynamic> json) => _$LookupValuesContainerDTOFromJson(json);
}