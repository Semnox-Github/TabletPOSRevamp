// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'pause_time_response.freezed.dart';
part 'pause_time_response.g.dart';

@freezed
class PauseTimeResponse with _$PauseTimeResponse {
  const factory PauseTimeResponse({
    dynamic data,
    String? exception
  }) = _PauseTimeResponse;

  factory PauseTimeResponse.fromJson(Map<String, dynamic> json) => _$PauseTimeResponseFromJson(json);
}