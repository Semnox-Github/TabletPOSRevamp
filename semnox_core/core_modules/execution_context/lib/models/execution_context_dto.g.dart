// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'execution_context_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExecutionContextDTO _$$_ExecutionContextDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ExecutionContextDTO(
      posMachineGuid: json['posMachineGuid'] as String?,
      webApiToken: json['webApiToken'] as String?,
      token: json['token'] as String?,
      languageId: json['languageId'] as int?,
      isCorporate: json['isCorporate'] as bool?,
      userPKId: json['userPKId'] as int?,
      userRoleId: json['userRoleId'] as int?,
      machineId: json['machineId'] as int?,
      siteId: json['siteId'] as int?,
      sitePKId: json['sitePKId'] as int?,
      userId: json['userId'] as String?,
      posMachineName: json['posMachineName'] as String?,
      languageCode: json['languageCode'] as String?,
      isUserLoggedIn: json['isUserLoggedIn'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ExecutionContextDTOToJson(
        _$_ExecutionContextDTO instance) =>
    <String, dynamic>{
      'posMachineGuid': instance.posMachineGuid,
      'webApiToken': instance.webApiToken,
      'token': instance.token,
      'languageId': instance.languageId,
      'isCorporate': instance.isCorporate,
      'userPKId': instance.userPKId,
      'userRoleId': instance.userRoleId,
      'machineId': instance.machineId,
      'siteId': instance.siteId,
      'sitePKId': instance.sitePKId,
      'userId': instance.userId,
      'posMachineName': instance.posMachineName,
      'languageCode': instance.languageCode,
      'isUserLoggedIn': instance.isUserLoggedIn,
    };
