// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compatible_payment_modes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompatiblePaymentModesContainerDTO
    _$$_CompatiblePaymentModesContainerDTOFromJson(Map<String, dynamic> json) =>
        _$_CompatiblePaymentModesContainerDTO(
          id: json['Id'] as int,
          paymentModeId: json['PaymentModeId'] as int,
          compatiblePaymentModeId: json['CompatiablePaymentModeId'] as int,
        );

Map<String, dynamic> _$$_CompatiblePaymentModesContainerDTOToJson(
        _$_CompatiblePaymentModesContainerDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'PaymentModeId': instance.paymentModeId,
      'CompatiablePaymentModeId': instance.compatiblePaymentModeId,
    };
