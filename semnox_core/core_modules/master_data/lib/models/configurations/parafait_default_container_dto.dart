
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'parafait_default_container_dto.freezed.dart';
part 'parafait_default_container_dto.g.dart';

@freezed
class ParafaitDefaultContainerDTO with _$ParafaitDefaultContainerDTO {
  const factory ParafaitDefaultContainerDTO({
    @JsonKey(name: 'DefaultValueName')
    required String defaultValueName,
    @JsonKey(name: 'DefaultValue')
    required String defaultValue,
  }) = _ParafaitDefaultContainerDTO;

  factory ParafaitDefaultContainerDTO.fromJson(Map<String, dynamic> json) => _$ParafaitDefaultContainerDTOFromJson(json);
}