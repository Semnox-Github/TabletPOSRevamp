// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_mode_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentModesData _$$_PaymentModesDataFromJson(Map<String, dynamic> json) =>
    _$_PaymentModesData(
      paymentModeContainerDTOList:
          (json['PaymentModeContainerDTOList'] as List<dynamic>)
              .map((e) =>
                  PaymentModeContainerDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_PaymentModesDataToJson(_$_PaymentModesData instance) =>
    <String, dynamic>{
      'PaymentModeContainerDTOList': instance.paymentModeContainerDTOList,
      'Hash': instance.hash,
    };
