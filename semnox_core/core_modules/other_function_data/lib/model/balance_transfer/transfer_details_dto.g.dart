// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransferDetailsDto _$$_TransferDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_TransferDetailsDto(
      cardId: json['CardId'] as int?,
      entitlements: json['Entitlements'] == null
          ? null
          : Entitlements.fromJson(json['Entitlements'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TransferDetailsDtoToJson(
        _$_TransferDetailsDto instance) =>
    <String, dynamic>{
      'CardId': instance.cardId,
      'Entitlements': instance.entitlements,
    };
