// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'custom_data_set_dto.freezed.dart';
part 'custom_data_set_dto.g.dart';

@freezed
class CustomDataSetDTO with _$CustomDataSetDTO {

  const factory CustomDataSetDTO({
    @JsonKey(name: 'CustomDataSetId')
    required int customDataSetId,
    @JsonKey(name: 'Dummy')
    required String dummy,
    @JsonKey(name: 'CreatedBy')
    String? createdBy,
    @JsonKey(name: 'CreationDate')
    required String creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    String? lastUpdatedBy,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'Guid')
    String? guid,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
    @JsonKey(name: 'IsChangedRecursive')
    required bool isChangedRecursive,
    @JsonKey(name: 'CustomDataDTOList')
    required List<dynamic> customDataDTOList,
  }) =_CustomDataSetDTO;

  factory CustomDataSetDTO.fromJson(Map<String, Object?> json) =>
      _$CustomDataSetDTOFromJson(json);
}
