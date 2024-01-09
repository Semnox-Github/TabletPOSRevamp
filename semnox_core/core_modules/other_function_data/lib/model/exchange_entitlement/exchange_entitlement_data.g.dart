// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_entitlement_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExchangeEntitlementData _$$_ExchangeEntitlementDataFromJson(
        Map<String, dynamic> json) =>
    _$_ExchangeEntitlementData(
      cardId: json['CardId'] as int?,
      managerId: json['ManagerId'] as int?,
      remarks: json['Remarks'] as String?,
      fromValue: (json['FromValue'] as num?)?.toDouble(),
      fromType: json['FromType'] as int?,
      toType: json['ToType'] as int?,
    );

Map<String, dynamic> _$$_ExchangeEntitlementDataToJson(
        _$_ExchangeEntitlementData instance) =>
    <String, dynamic>{
      'CardId': instance.cardId,
      'ManagerId': instance.managerId,
      'Remarks': instance.remarks,
      'FromValue': instance.fromValue,
      'FromType': instance.fromType,
      'ToType': instance.toType,
    };
