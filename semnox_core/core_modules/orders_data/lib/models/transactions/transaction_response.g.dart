// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionResponse _$$_TransactionResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TransactionsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_TransactionResponseToJson(
        _$_TransactionResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
