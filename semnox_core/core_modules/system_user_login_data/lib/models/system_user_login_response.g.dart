// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_user_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SystemUserLoginResponse _$$_SystemUserLoginResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SystemUserLoginResponse(
      data: json['data'] == null
          ? null
          : SystemUserLoginData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_SystemUserLoginResponseToJson(
        _$_SystemUserLoginResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
