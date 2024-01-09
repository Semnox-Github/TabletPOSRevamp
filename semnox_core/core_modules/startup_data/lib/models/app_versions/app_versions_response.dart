// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:startup_data/models/app_versions/app_versions_data.dart';

part 'app_versions_response.freezed.dart';
part 'app_versions_response.g.dart';

@freezed
class AppVersionsResponse with _$AppVersionsResponse {
  const factory AppVersionsResponse({
    List<AppVersionsData>? data,
    @JsonKey(name: 'Message')
    String? message,
    String? exception
  }) = _AppVersionsResponse;

  factory AppVersionsResponse.fromJson(Map<String, dynamic> json) => _$AppVersionsResponseFromJson(json);
}
