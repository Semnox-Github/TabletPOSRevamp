// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_tax_line_dto.freezed.dart';
part 'transaction_tax_line_dto.g.dart';

@freezed
class TransactionTaxLineDTO with _$TransactionTaxLineDTO {
  const factory TransactionTaxLineDTO({
    @JsonKey(name: 'TransactionTaxLineId')
    required int transactionTaxLineId,
    @JsonKey(name: 'TransactionLineId')
    required int transactionLineId,
    @JsonKey(name: 'TransactionId')
    required int transactionId,
    @JsonKey(name: 'TaxId')
    required int taxId,
    @JsonKey(name: 'TaxStructureId')
    required int taxStructureId,
    @JsonKey(name: 'TaxPercentage')
    required double taxPercentage,
    @JsonKey(name: 'TaxAmount')
    required double taxAmount,
    @JsonKey(name: 'TaxName')
    required String taxName,
    @JsonKey(name: 'TaxCode')
    required String taxCode,
    @JsonKey(name: 'Exempted')
    required bool exempted,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'CreatedBy')
    required String createdBy,
    @JsonKey(name: 'CreationDate')
    required String creationDate,
    @JsonKey(name: 'LastUpdatedBy')
    required String lastUpdatedBy,
    @JsonKey(name: 'LastUpdatedDate')
    required String lastUpdatedDate,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'SynchStatus')
    required bool synchStatus,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
  }) = _TransactionTaxLineDTO;

  factory TransactionTaxLineDTO.fromJson(Map<String, dynamic> json) => _$TransactionTaxLineDTOFromJson(json);
}
