// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_line_kds_order_entry_mapping_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionLineKDSOrderEntryMappingDTO
    _$$_TransactionLineKDSOrderEntryMappingDTOFromJson(
            Map<String, dynamic> json) =>
        _$_TransactionLineKDSOrderEntryMappingDTO(
          id: json['Id'] as int?,
          transactionId: json['TransactionId'] as int?,
          transactionLineId: json['TransactionLineId'] as int?,
          kdsOrderEntryId: json['KDSOrderEntryId'] as int?,
          isActive: json['IsActive'] as bool?,
          createdBy: json['CreatedBy'] as String?,
          creationDate: json['CreationDate'] as String?,
          lastUpdatedBy: json['LastUpdatedBy'] as String?,
          lastUpdatedDate: json['LastUpdatedDate'] as String?,
          siteId: json['SiteId'] as int?,
          masterEntityId: json['MasterEntityId'] as int?,
          synchStatus: json['SynchStatus'] as bool?,
          guid: json['Guid'] as String?,
          isChanged: json['IsChanged'] as bool?,
        );

Map<String, dynamic> _$$_TransactionLineKDSOrderEntryMappingDTOToJson(
        _$_TransactionLineKDSOrderEntryMappingDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'TransactionId': instance.transactionId,
      'TransactionLineId': instance.transactionLineId,
      'KDSOrderEntryId': instance.kdsOrderEntryId,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'IsChanged': instance.isChanged,
    };
