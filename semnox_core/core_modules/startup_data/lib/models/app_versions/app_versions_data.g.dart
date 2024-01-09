// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_versions_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppVersionsData _$$_AppVersionsDataFromJson(Map<String, dynamic> json) =>
    _$_AppVersionsData(
      id: json['Id'] as int,
      parafaitExecutableName: json['ParafaitExecutableName'] as String,
      majorVersion: json['MajorVersion'] as int,
      minorVersion: json['MinorVersion'] as int,
      patchVersion: json['PatchVersion'] as int,
      executableGeneratedAt: json['ExecutableGeneratedAt'] as String,
      isActive: json['IsActive'] as bool,
      createdBy: json['CreatedBy'] as String,
      creationDate: json['CreationDate'] as String,
      lastUpdatedBy: json['LastUpdatedBy'] as String,
      lastupdatedDate: json['LastupdatedDate'] as String,
      guid: json['Guid'] as String,
      siteId: json['SiteId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      masterEntityId: json['MasterEntityId'] as int,
      isChanged: json['IsChanged'] as bool,
    );

Map<String, dynamic> _$$_AppVersionsDataToJson(_$_AppVersionsData instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ParafaitExecutableName': instance.parafaitExecutableName,
      'MajorVersion': instance.majorVersion,
      'MinorVersion': instance.minorVersion,
      'PatchVersion': instance.patchVersion,
      'ExecutableGeneratedAt': instance.executableGeneratedAt,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastupdatedDate': instance.lastupdatedDate,
      'Guid': instance.guid,
      'SiteId': instance.siteId,
      'SynchStatus': instance.synchStatus,
      'MasterEntityId': instance.masterEntityId,
      'IsChanged': instance.isChanged,
    };
