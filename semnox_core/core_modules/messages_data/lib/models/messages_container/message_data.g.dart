// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageData _$$_MessageDataFromJson(Map<String, dynamic> json) =>
    _$_MessageData(
      messageContainerDTOList: (json['MessageContainerDTOList']
              as List<dynamic>)
          .map((e) => MessageContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_MessageDataToJson(_$_MessageData instance) =>
    <String, dynamic>{
      'MessageContainerDTOList': instance.messageContainerDTOList,
      'Hash': instance.hash,
    };
