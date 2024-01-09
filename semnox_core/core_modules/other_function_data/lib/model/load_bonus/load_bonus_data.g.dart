// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_bonus_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoadBonusData _$$_LoadBonusDataFromJson(Map<String, dynamic> json) =>
    _$_LoadBonusData(
      accountId: json['AccountId'] as int?,
      managerId: json['ManagerId'] as int?,
      remarks: json['Remarks'] as String?,
      bonusValue: (json['BonusValue'] as num?)?.toDouble(),
      bonusType: json['BonusType'] as int?,
      gamePlayId: json['GamePlayId'] as int?,
      trxId: json['TrxId'] as int?,
    );

Map<String, dynamic> _$$_LoadBonusDataToJson(_$_LoadBonusData instance) =>
    <String, dynamic>{
      'AccountId': instance.accountId,
      'ManagerId': instance.managerId,
      'Remarks': instance.remarks,
      'BonusValue': instance.bonusValue,
      'BonusType': instance.bonusType,
      'GamePlayId': instance.gamePlayId,
      'TrxId': instance.trxId,
    };
