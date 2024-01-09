// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_check_response.freezed.dart';
part 'version_check_response.g.dart';

@freezed
class VersionCheckResponse with _$VersionCheckResponse {
  const factory VersionCheckResponse({
    String? data,
    String? exception
  }) = _VersionCheckResponse;

  factory VersionCheckResponse.fromJson(Map<String, dynamic> json) => _$VersionCheckResponseFromJson(json);
}