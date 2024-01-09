// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_search_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TableSearchDataResponse _$$_TableSearchDataResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TableSearchDataResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TableSearchData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_TableSearchDataResponseToJson(
        _$_TableSearchDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
