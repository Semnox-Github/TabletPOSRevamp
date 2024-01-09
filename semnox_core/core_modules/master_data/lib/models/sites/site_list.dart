// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/sites/site_dto.dart';

part 'site_list.freezed.dart';
part 'site_list.g.dart';

@freezed
class SiteList with _$SiteList {

  const factory SiteList({
    @JsonKey(name: 'SiteContainerDTOList')
    required List<SiteDTO> siteContainerDTOList,
    @JsonKey(name: 'Hash')
    required String hash
  }) = _SiteList;

  factory SiteList.fromJson(Map<String, Object?> json) =>
      _$SiteListFromJson(json);
}