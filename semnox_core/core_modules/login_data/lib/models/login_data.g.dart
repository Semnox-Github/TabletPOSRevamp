// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginData _$$_LoginDataFromJson(Map<String, dynamic> json) => _$_LoginData(
      posMachineGuid: json['PosMachineGuid'] as String,
      webApiToken: json['WebApiToken'] as String,
      token: json['Token'] as String?,
      languageId: json['LanguageId'] as int,
      isCorporate: json['IsCorporate'] as bool,
      userPKId: json['UserPKId'] as int,
      userRoleId: json['UserRoleId'] as int,
      machineId: json['MachineId'] as int,
      siteId: json['SiteId'] as int,
      sitePKId: json['SitePKId'] as int,
      userId: json['UserId'] as String,
      posMachineName: json['POSMachineName'] as String,
      languageCode: json['LanguageCode'] as String,
    );

Map<String, dynamic> _$$_LoginDataToJson(_$_LoginData instance) =>
    <String, dynamic>{
      'PosMachineGuid': instance.posMachineGuid,
      'WebApiToken': instance.webApiToken,
      'Token': instance.token,
      'LanguageId': instance.languageId,
      'IsCorporate': instance.isCorporate,
      'UserPKId': instance.userPKId,
      'UserRoleId': instance.userRoleId,
      'MachineId': instance.machineId,
      'SiteId': instance.siteId,
      'SitePKId': instance.sitePKId,
      'UserId': instance.userId,
      'POSMachineName': instance.posMachineName,
      'LanguageCode': instance.languageCode,
    };
