
// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.freezed.dart';
part 'login_request.g.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    @JsonKey(name: 'LoginId')
    String? loginId,
    @JsonKey(name: 'Password')
    String? password,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'MachineName')
    required String machineName,
    @JsonKey(name: 'TagNumber')
    String? tagNumber,
  }) = _LoginRequest;


  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}