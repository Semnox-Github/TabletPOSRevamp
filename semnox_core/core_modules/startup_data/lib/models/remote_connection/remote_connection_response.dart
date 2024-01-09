// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_connection_response.freezed.dart';
part 'remote_connection_response.g.dart';

@freezed
class RemoteConnectionResponse with _$RemoteConnectionResponse {
  const factory RemoteConnectionResponse({
    String? data,
    @JsonKey(name: 'Message')
    String? message
  }) = _RemoteConnectionResponse;

  factory RemoteConnectionResponse.fromJson(Map<String, dynamic> json) => _$RemoteConnectionResponseFromJson(json);
}