// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'login_data.dart';

part 'login_response.freezed.dart';

part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({LoginData? data, String? exception}) =
      _LoginResponse;

  factory LoginResponse.fromJson(Map<String, Object?> json) =>
      _$LoginResponseFromJson(json);
}
