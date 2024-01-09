// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContextMenuResponse _$$_ContextMenuResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ContextMenuResponse(
      data: json['data'] == null
          ? null
          : ContextMenuData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_ContextMenuResponseToJson(
        _$_ContextMenuResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
