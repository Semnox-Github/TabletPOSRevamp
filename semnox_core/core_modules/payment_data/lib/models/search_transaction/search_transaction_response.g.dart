// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionSearchResponse _$$_TransactionSearchResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionSearchResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TransactionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_TransactionSearchResponseToJson(
        _$_TransactionSearchResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
