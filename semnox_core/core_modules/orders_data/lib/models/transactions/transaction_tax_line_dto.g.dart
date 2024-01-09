// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_tax_line_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionTaxLineDTO _$$_TransactionTaxLineDTOFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionTaxLineDTO(
      transactionTaxLineId: json['TransactionTaxLineId'] as int,
      transactionLineId: json['TransactionLineId'] as int,
      transactionId: json['TransactionId'] as int,
      taxId: json['TaxId'] as int,
      taxStructureId: json['TaxStructureId'] as int,
      taxPercentage: (json['TaxPercentage'] as num).toDouble(),
      taxAmount: (json['TaxAmount'] as num).toDouble(),
      taxName: json['TaxName'] as String,
      taxCode: json['TaxCode'] as String,
      exempted: json['Exempted'] as bool,
      isActive: json['IsActive'] as bool,
      createdBy: json['CreatedBy'] as String,
      creationDate: json['CreationDate'] as String,
      lastUpdatedBy: json['LastUpdatedBy'] as String,
      lastUpdatedDate: json['LastUpdatedDate'] as String,
      guid: json['Guid'] as String,
      siteId: json['SiteId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      masterEntityId: json['MasterEntityId'] as int,
      isChanged: json['IsChanged'] as bool,
    );

Map<String, dynamic> _$$_TransactionTaxLineDTOToJson(
        _$_TransactionTaxLineDTO instance) =>
    <String, dynamic>{
      'TransactionTaxLineId': instance.transactionTaxLineId,
      'TransactionLineId': instance.transactionLineId,
      'TransactionId': instance.transactionId,
      'TaxId': instance.taxId,
      'TaxStructureId': instance.taxStructureId,
      'TaxPercentage': instance.taxPercentage,
      'TaxAmount': instance.taxAmount,
      'TaxName': instance.taxName,
      'TaxCode': instance.taxCode,
      'Exempted': instance.exempted,
      'IsActive': instance.isActive,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'Guid': instance.guid,
      'SiteId': instance.siteId,
      'SynchStatus': instance.synchStatus,
      'MasterEntityId': instance.masterEntityId,
      'IsChanged': instance.isChanged,
    };
