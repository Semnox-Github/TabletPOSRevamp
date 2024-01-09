
// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_user_login_request.freezed.dart';
part 'system_user_login_request.g.dart';

@freezed
class SystemUserLoginRequest with _$SystemUserLoginRequest {
  const factory SystemUserLoginRequest({
    required String LoginId,
    required String Password,
    required String MachineName,
    required int SiteId,
  }) = _SystemUserLoginRequest;


  factory SystemUserLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$SystemUserLoginRequestFromJson(json);
}