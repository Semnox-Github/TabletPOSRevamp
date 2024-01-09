// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageContainerDTO _$$_MessageContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_MessageContainerDTO(
      messageId: json['MessageId'] as int,
      messageNumber: json['MessageNumber'] as int,
      message: json['Message'] as String,
      translatedMessage: json['TranslatedMessage'] as String,
    );

Map<String, dynamic> _$$_MessageContainerDTOToJson(
        _$_MessageContainerDTO instance) =>
    <String, dynamic>{
      'MessageId': instance.messageId,
      'MessageNumber': instance.messageNumber,
      'Message': instance.message,
      'TranslatedMessage': instance.translatedMessage,
    };
