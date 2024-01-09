// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionResponse _$$_TransactionResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionResponse(
      data: json['data'] == null
          ? null
          : TransactionData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_TransactionResponseToJson(
        _$_TransactionResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
