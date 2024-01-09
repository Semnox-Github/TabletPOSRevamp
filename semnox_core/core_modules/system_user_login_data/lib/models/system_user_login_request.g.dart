// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_user_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SystemUserLoginRequest _$$_SystemUserLoginRequestFromJson(
        Map<String, dynamic> json) =>
    _$_SystemUserLoginRequest(
      LoginId: json['LoginId'] as String,
      Password: json['Password'] as String,
      MachineName: json['MachineName'] as String,
      SiteId: json['SiteId'] as int,
    );

Map<String, dynamic> _$$_SystemUserLoginRequestToJson(
        _$_SystemUserLoginRequest instance) =>
    <String, dynamic>{
      'LoginId': instance.LoginId,
      'Password': instance.Password,
      'MachineName': instance.MachineName,
      'SiteId': instance.SiteId,
    };
