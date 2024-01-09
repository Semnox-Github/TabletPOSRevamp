
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';

part 'configuration_data.freezed.dart';
part 'configuration_data.g.dart';

@freezed
class ConfigurationData with _$ConfigurationData {
  const factory ConfigurationData({
    @JsonKey(name: 'ParafaitDefaultContainerDTOList')
    required List<ParafaitDefaultContainerDTO> parafaitDefaultContainerDtoList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _ConfigurationData;

  factory ConfigurationData.fromJson(Map<String, dynamic> json) => _$ConfigurationDataFromJson(json);
}