// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/lookup_container/lookup_container_dto.dart';

part 'lookup_data.freezed.dart';
part 'lookup_data.g.dart';

@freezed
class LookupData with _$LookupData {
  const factory LookupData({
    @JsonKey(name: 'LookupsContainerDTOList')
    required List<LookupsContainerDTO> lookupsContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _LookupData;

  factory LookupData.fromJson(Map<String, dynamic> json) => _$LookupDataFromJson(json);
}