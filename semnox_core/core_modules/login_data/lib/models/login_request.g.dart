// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginRequest _$$_LoginRequestFromJson(Map<String, dynamic> json) =>
    _$_LoginRequest(
      loginId: json['LoginId'] as String?,
      password: json['Password'] as String?,
      siteId: json['SiteId'] as int,
      machineName: json['MachineName'] as String,
      tagNumber: json['TagNumber'] as String?,
    );

Map<String, dynamic> _$$_LoginRequestToJson(_$_LoginRequest instance) =>
    <String, dynamic>{
      'LoginId': instance.loginId,
      'Password': instance.password,
      'SiteId': instance.siteId,
      'MachineName': instance.machineName,
      'TagNumber': instance.tagNumber,
    };
