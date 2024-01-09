// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_panels_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuPanelsResponse _$$_MenuPanelsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_MenuPanelsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MenuPanelsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_MenuPanelsResponseToJson(
        _$_MenuPanelsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
