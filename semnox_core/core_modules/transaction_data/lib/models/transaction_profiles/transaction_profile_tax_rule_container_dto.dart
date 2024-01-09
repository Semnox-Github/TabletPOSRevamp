// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_profile_tax_rule_container_dto.freezed.dart';
part 'transaction_profile_tax_rule_container_dto.g.dart';

@freezed
class TransactionProfileTaxRuleContainerDTO with _$TransactionProfileTaxRuleContainerDTO {
  const factory TransactionProfileTaxRuleContainerDTO({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'TrxProfileId')
    required int trxProfileId,
    @JsonKey(name: 'TaxId')
    required int taxId,
    @JsonKey(name: 'TaxStructure')
    required int taxStructure,
    @JsonKey(name: 'Exempt')
    required bool exempt,
  }) = _TransactionProfileTaxRuleContainerDTO;

  factory TransactionProfileTaxRuleContainerDTO.fromJson(Map<String, dynamic> json) => _$TransactionProfileTaxRuleContainerDTOFromJson(json);
}