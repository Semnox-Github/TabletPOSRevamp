// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_profile_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionProfileContainerDTO _$$_TransactionProfileContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionProfileContainerDTO(
      transactionProfileId: json['TransactionProfileId'] as int,
      profileName: json['ProfileName'] as String,
      guid: json['Guid'] as String,
      verificationRequired: json['VerificationRequired'] as bool,
      priceListId: json['PriceListId'] as int,
      enableModifiers: json['EnableModifiers'] as bool,
      transactionRemarksMandatory: json['TransactionRemarksMandatory'] as bool,
      transactionProfileTaxRuleContainerDtoList:
          (json['TransactionProfileTaxRuleContainerDTOList'] as List<dynamic>)
              .map((e) => TransactionProfileTaxRuleContainerDTO.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$_TransactionProfileContainerDTOToJson(
        _$_TransactionProfileContainerDTO instance) =>
    <String, dynamic>{
      'TransactionProfileId': instance.transactionProfileId,
      'ProfileName': instance.profileName,
      'Guid': instance.guid,
      'VerificationRequired': instance.verificationRequired,
      'PriceListId': instance.priceListId,
      'EnableModifiers': instance.enableModifiers,
      'TransactionRemarksMandatory': instance.transactionRemarksMandatory,
      'TransactionProfileTaxRuleContainerDTOList':
          instance.transactionProfileTaxRuleContainerDtoList,
    };
