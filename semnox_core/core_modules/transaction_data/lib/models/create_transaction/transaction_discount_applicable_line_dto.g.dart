// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_discount_applicable_line_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionDiscountApplicableLineDto
    _$$_TransactionDiscountApplicableLineDtoFromJson(
            Map<String, dynamic> json) =>
        _$_TransactionDiscountApplicableLineDto(
          transactionDiscountApplicableLineId:
              json['TransactionDiscountApplicableLineId'] as int?,
          transactionId: json['TransactionId'] as int?,
          transactionDiscountId: json['TransactionDiscountId'] as int?,
          transactionLineId: json['TransactionLineId'] as int?,
          discountAmount: json['DiscountAmount'],
          discountPercentage: json['DiscountPercentage'],
          isActive: json['IsActive'] as bool?,
          createdBy: json['CreatedBy'] as String?,
          creationDate: json['CreationDate'] as String?,
          lastUpdatedBy: json['LastUpdatedBy'] as String?,
          lastUpdatedDate: json['LastUpdatedDate'] as String?,
          guid: json['Guid'] as String?,
          siteId: json['SiteId'] as int?,
          synchStatus: json['SynchStatus'] as bool?,
          masterEntityId: json['MasterEntityId'] as int?,
          transactionTaxLineDTOList:
              json['TransactionTaxLineDTOList'] as List<dynamic>?,
          isChanged: json['IsChanged'] as bool?,
          isChangedRecursive: json['IsChangedRecursive'] as bool?,
        );

Map<String, dynamic> _$$_TransactionDiscountApplicableLineDtoToJson(
        _$_TransactionDiscountApplicableLineDto instance) =>
    <String, dynamic>{
      'TransactionDiscountApplicableLineId':
          instance.transactionDiscountApplicableLineId,
      'TransactionId': instance.transactionId,
      'TransactionDiscountId': instance.transactionDiscountId,
      'TransactionLineId': instance.transactionLineId,
      'DiscountAmount': instance.discountAmount,
      'DiscountPercentage': instance.discountPercentage,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'Guid': instance.guid,
      'SiteId': instance.siteId,
      'SynchStatus': instance.synchStatus,
      'MasterEntityId': instance.masterEntityId,
      'TransactionTaxLineDTOList': instance.transactionTaxLineDTOList,
      'IsChanged': instance.isChanged,
      'IsChangedRecursive': instance.isChangedRecursive,
    };
