// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_relationship_dto_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountRelationshipDTOList _$$_AccountRelationshipDTOListFromJson(
        Map<String, dynamic> json) =>
    _$_AccountRelationshipDTOList(
      accountRelationId: json['AccountRelationshipId'] as int?,
      accountId: json['AccountId'] as int?,
      relatedAccountId: json['RelatedAccountId'] as int?,
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdateDate: json['LastUpdateDate'] as String?,
      siteId: json['SiteId'] as int?,
      masterEntityId: json['MasterEntityId'] as int?,
      synchStatus: json['SynchStatus'] as bool?,
      guid: json['Guid'] as String?,
      isActive: json['IsActive'] as bool?,
      isChanged: json['IsChanged'] as bool?,
      dailyLimitPercentage: json['DailyLimitPercentage'] as int?,
    );

Map<String, dynamic> _$$_AccountRelationshipDTOListToJson(
        _$_AccountRelationshipDTOList instance) =>
    <String, dynamic>{
      'AccountRelationshipId': instance.accountRelationId,
      'AccountId': instance.accountId,
      'RelatedAccountId': instance.relatedAccountId,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdateDate': instance.lastUpdateDate,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'IsActive': instance.isActive,
      'IsChanged': instance.isChanged,
      'DailyLimitPercentage': instance.dailyLimitPercentage,
    };
