// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summaries_counts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SummariesCountsResponse _$$_SummariesCountsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SummariesCountsResponse(
      exception: json['exception'] as String?,
      data: json['data'] as int?,
      totalNoOfPages: json['TotalNoOfPages'] as int?,
    );

Map<String, dynamic> _$$_SummariesCountsResponseToJson(
        _$_SummariesCountsResponse instance) =>
    <String, dynamic>{
      'exception': instance.exception,
      'data': instance.data,
      'TotalNoOfPages': instance.totalNoOfPages,
    };
