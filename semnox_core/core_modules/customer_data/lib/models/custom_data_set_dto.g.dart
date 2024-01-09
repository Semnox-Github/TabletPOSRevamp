// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_data_set_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomDataSetDTO _$$_CustomDataSetDTOFromJson(Map<String, dynamic> json) =>
    _$_CustomDataSetDTO(
      customDataSetId: json['CustomDataSetId'] as int,
      dummy: json['Dummy'] as String,
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      siteId: json['SiteId'] as int,
      masterEntityId: json['MasterEntityId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      guid: json['Guid'] as String?,
      isChanged: json['IsChanged'] as bool,
      isChangedRecursive: json['IsChangedRecursive'] as bool,
      customDataDTOList: json['CustomDataDTOList'] as List<dynamic>,
    );

Map<String, dynamic> _$$_CustomDataSetDTOToJson(_$_CustomDataSetDTO instance) =>
    <String, dynamic>{
      'CustomDataSetId': instance.customDataSetId,
      'Dummy': instance.dummy,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
      'CustomDataDTOList': instance.customDataDTOList,
    };
