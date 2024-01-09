// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'key_management_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KeyManagementItem _$$_KeyManagementItemFromJson(Map<String, dynamic> json) =>
    _$_KeyManagementItem(
      keyManagementWarningType: json['KeyManagementWarningType'] as String,
      messageNumber: json['MessageNumber'] as int,
      parameters: (json['Parameters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_KeyManagementItemToJson(
        _$_KeyManagementItem instance) =>
    <String, dynamic>{
      'KeyManagementWarningType': instance.keyManagementWarningType,
      'MessageNumber': instance.messageNumber,
      'Parameters': instance.parameters,
    };
