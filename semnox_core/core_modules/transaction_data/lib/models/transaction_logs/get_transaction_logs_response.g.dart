// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transaction_logs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetTransactionLogsResponse _$$_GetTransactionLogsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GetTransactionLogsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => GetTransactionLogsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_GetTransactionLogsResponseToJson(
        _$_GetTransactionLogsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
