// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/transaction_profiles/transaction_profile_tax_rule_container_dto.dart';

part 'transaction_profile_container_dto.freezed.dart';
part 'transaction_profile_container_dto.g.dart';

@freezed
class TransactionProfileContainerDTO with _$TransactionProfileContainerDTO {
  const factory TransactionProfileContainerDTO({
    @JsonKey(name: 'TransactionProfileId')
    required int transactionProfileId,
    @JsonKey(name: 'ProfileName')
    required String profileName,
    @JsonKey(name: 'Guid')
    required String guid,
    @JsonKey(name: 'VerificationRequired')
    required bool verificationRequired,
    @JsonKey(name: 'PriceListId')
    required int priceListId,
    @JsonKey(name: 'EnableModifiers')
    required bool enableModifiers,
    @JsonKey(name: 'TransactionRemarksMandatory')
    required bool transactionRemarksMandatory,
    @JsonKey(name: 'TransactionProfileTaxRuleContainerDTOList')
    required List<TransactionProfileTaxRuleContainerDTO> transactionProfileTaxRuleContainerDtoList,
  }) = _TransactionProfileContainerDTO;

  factory TransactionProfileContainerDTO.fromJson(Map<String, dynamic> json) => _$TransactionProfileContainerDTOFromJson(json);
}