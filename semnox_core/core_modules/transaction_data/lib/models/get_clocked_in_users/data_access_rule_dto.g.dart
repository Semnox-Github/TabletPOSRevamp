// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_access_rule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DataAccessRuleDto _$$_DataAccessRuleDtoFromJson(Map<String, dynamic> json) =>
    _$_DataAccessRuleDto(
      dataAccessRuleId: json['DataAccessRuleId'] as int,
      name: json['Name'],
      isActive: json['IsActive'] as bool,
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] as String,
      guid: json['Guid'],
      siteId: json['SiteId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      masterEntityId: json['MasterEntityId'] as int,
      dataAccessDetailDtoList: json['DataAccessDetailDTOList'],
      isChangedRecursive: json['IsChangedRecursive'] as bool,
      isChanged: json['IsChanged'] as bool,
    );

Map<String, dynamic> _$$_DataAccessRuleDtoToJson(
        _$_DataAccessRuleDto instance) =>
    <String, dynamic>{
      'DataAccessRuleId': instance.dataAccessRuleId,
      'Name': instance.name,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'Guid': instance.guid,
      'SiteId': instance.siteId,
      'SynchStatus': instance.synchStatus,
      'MasterEntityId': instance.masterEntityId,
      'DataAccessDetailDTOList': instance.dataAccessDetailDtoList,
      'IsChangedRecursive': instance.isChangedRecursive,
      'IsChanged': instance.isChanged,
    };
