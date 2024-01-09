// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/sites/site_list.dart';

part 'site_response.freezed.dart';
part 'site_response.g.dart';

@freezed
class SiteResponse with _$SiteResponse {

  const factory SiteResponse({
    SiteList? data, String? exception
  }) = _SiteResponse;

  factory SiteResponse.fromJson(Map<String, Object?> json) =>
      _$SiteResponseFromJson(json);
}