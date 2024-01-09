// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_payment_mode_inclusion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_POSPaymentModeInclusionContainerDTO
    _$$_POSPaymentModeInclusionContainerDTOFromJson(
            Map<String, dynamic> json) =>
        _$_POSPaymentModeInclusionContainerDTO(
          posPaymentModeInclusionId: json['POSPaymentModeInclusionId'] as int,
          posMachineId: json['POSMachineId'] as int,
          paymentModeId: json['PaymentModeId'] as int,
          friendlyName: json['FriendlyName'] as String,
        );

Map<String, dynamic> _$$_POSPaymentModeInclusionContainerDTOToJson(
        _$_POSPaymentModeInclusionContainerDTO instance) =>
    <String, dynamic>{
      'POSPaymentModeInclusionId': instance.posPaymentModeInclusionId,
      'POSMachineId': instance.posMachineId,
      'PaymentModeId': instance.paymentModeId,
      'FriendlyName': instance.friendlyName,
    };
