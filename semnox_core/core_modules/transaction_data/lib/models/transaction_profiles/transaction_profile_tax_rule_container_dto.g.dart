// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_profile_tax_rule_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionProfileTaxRuleContainerDTO
    _$$_TransactionProfileTaxRuleContainerDTOFromJson(
            Map<String, dynamic> json) =>
        _$_TransactionProfileTaxRuleContainerDTO(
          id: json['Id'] as int,
          trxProfileId: json['TrxProfileId'] as int,
          taxId: json['TaxId'] as int,
          taxStructure: json['TaxStructure'] as int,
          exempt: json['Exempt'] as bool,
        );

Map<String, dynamic> _$$_TransactionProfileTaxRuleContainerDTOToJson(
        _$_TransactionProfileTaxRuleContainerDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'TrxProfileId': instance.trxProfileId,
      'TaxId': instance.taxId,
      'TaxStructure': instance.taxStructure,
      'Exempt': instance.exempt,
    };
