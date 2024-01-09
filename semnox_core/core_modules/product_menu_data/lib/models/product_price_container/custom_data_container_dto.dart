// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';



part 'custom_data_container_dto.freezed.dart';
part 'custom_data_container_dto.g.dart';

@freezed
class CustomDataContainerDTO with _$CustomDataContainerDTO {
  const factory CustomDataContainerDTO({
    @JsonKey(name: 'CustomAttributeId')
    required int customAttributeId,
    @JsonKey(name: 'Name')
    required String name,
    @JsonKey(name: 'Type')
    required String type,
    @JsonKey(name: 'CustomDataId')
    required int customDataId,
    @JsonKey(name: 'CustomDataSetId')
    required int customDataSetId,
    @JsonKey(name: 'Value')
    dynamic value,
    @JsonKey(name: 'CustomDataText')
    required String customDataText,
    @JsonKey(name: 'CustomDataNumber')
    double? customDataNumber,
    @JsonKey(name: 'CustomDataDate')
    dynamic customDataDate,
    @JsonKey(name: 'ValueId')
    required int valueId,
    @JsonKey(name: 'CustomeDataSetGuid')
    dynamic customeDataSetGuid,
    @JsonKey(name: 'CustomeDataGuid')
    dynamic customeDataGuid,
  }) = _CustomDataContainerDTO;

  factory CustomDataContainerDTO.fromJson(Map<String, dynamic> json) => _$CustomDataContainerDTOFromJson(json);
}
