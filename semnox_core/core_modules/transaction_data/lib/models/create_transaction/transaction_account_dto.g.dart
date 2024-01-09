// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionLineAccountDto _$$_TransactionLineAccountDtoFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionLineAccountDto(
      transactionAccountId: json['TransactionAccountId'] as int?,
      transactionId: json['TransactionId'] as int?,
      transactionLineId: json['TransactionLineId'] as int?,
      accountId: json['AccountId'] as int?,
      tagNumber: json['TagNumber'] as String?,
      serialNumber: json['SerialNumber'] as String?,
      existingAccount: json['ExistingAccount'] as bool?,
      isActive: json['IsActive'] as bool?,
      createdBy: json['CreatedBy'] as String?,
      creationDate: json['CreationDate'] as String?,
      lastUpdatedBy: json['LastUpdatedBy'] as String?,
      lastUpdatedDate: json['LastUpdatedDate'] as String?,
      guid: json['Guid'] as String?,
      siteId: json['SiteId'] as int?,
      synchStatus: json['SynchStatus'] as bool?,
      masterEntityId: json['MasterEntityId'] as int?,
      transactionLineAccountDiscountMappingDTOList:
          json['TransactionLineAccountDiscountMappingDTOList']
              as List<dynamic>?,
      transactionLineAccountGameMappingDTOList:
          json['TransactionLineAccountGameMappingDTOList'] as List<dynamic>?,
      transactionLineAccountCreditPlusMappingDTOList:
          json['TransactionLineAccountCreditPlusMappingDTOList']
              as List<dynamic>?,
      isChanged: json['IsChanged'] as bool?,
      isChangedRecursive: json['IsChangedRecursive'] as bool?,
    );

Map<String, dynamic> _$$_TransactionLineAccountDtoToJson(
        _$_TransactionLineAccountDto instance) =>
    <String, dynamic>{
      'TransactionAccountId': instance.transactionAccountId,
      'TransactionId': instance.transactionId,
      'TransactionLineId': instance.transactionLineId,
      'AccountId': instance.accountId,
      'TagNumber': instance.tagNumber,
      'SerialNumber': instance.serialNumber,
      'ExistingAccount': instance.existingAccount,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'Guid': instance.guid,
      'SiteId': instance.siteId,
      'SynchStatus': instance.synchStatus,
      'MasterEntityId': instance.masterEntityId,
      'TransactionLineAccountDiscountMappingDTOList':
          instance.transactionLineAccountDiscountMappingDTOList,
      'TransactionLineAccountGameMappingDTOList':
          instance.transactionLineAccountGameMappingDTOList,
      'TransactionLineAccountCreditPlusMappingDTOList':
          instance.transactionLineAccountCreditPlusMappingDTOList,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
    };
