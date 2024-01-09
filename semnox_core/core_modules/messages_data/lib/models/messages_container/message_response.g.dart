// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessagesResponse _$$_MessagesResponseFromJson(Map<String, dynamic> json) =>
    _$_MessagesResponse(
      data: json['data'] == null
          ? null
          : MessageData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_MessagesResponseToJson(_$_MessagesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
