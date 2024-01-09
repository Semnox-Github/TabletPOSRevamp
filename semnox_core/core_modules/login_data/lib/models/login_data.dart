// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_data.freezed.dart';
part 'login_data.g.dart';

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    @JsonKey(name: 'PosMachineGuid')
    required String posMachineGuid,
    @JsonKey(name: 'WebApiToken')
    required String webApiToken,
    @JsonKey(name: 'Token')
    String? token,
    @JsonKey(name: 'LanguageId')
    required int languageId,
    @JsonKey(name: 'IsCorporate')
    required bool isCorporate,
    @JsonKey(name: 'UserPKId')
    required int userPKId,
    @JsonKey(name: 'UserRoleId')
    required int userRoleId,
    @JsonKey(name: 'MachineId')
    required int machineId,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'SitePKId')
    required int sitePKId,
    @JsonKey(name: 'UserId')
    required String userId,
    @JsonKey(name: 'POSMachineName')
    required String posMachineName,
    @JsonKey(name: 'LanguageCode')
    required String languageCode,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, Object?> json) => _$LoginDataFromJson(json);
}