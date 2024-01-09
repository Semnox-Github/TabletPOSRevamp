// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summaries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SummariesResponse _$$_SummariesResponseFromJson(Map<String, dynamic> json) =>
    _$_SummariesResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SummariesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_SummariesResponseToJson(
        _$_SummariesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
