// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'system_user_login_data.dart';

part 'system_user_login_response.freezed.dart';

part 'system_user_login_response.g.dart';

@freezed
class SystemUserLoginResponse with _$SystemUserLoginResponse {
  const factory SystemUserLoginResponse({SystemUserLoginData? data, String? exception}) =
      _SystemUserLoginResponse;

  factory SystemUserLoginResponse.fromJson(Map<String, Object?> json) =>
      _$SystemUserLoginResponseFromJson(json);
}
