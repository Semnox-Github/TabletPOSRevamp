// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reverse_transaction_line_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReverseTransactionLineResponse _$$_ReverseTransactionLineResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ReverseTransactionLineResponse(
      transactionResponse: json['transactionResponse'] == null
          ? null
          : TransactionResponse.fromJson(
              json['transactionResponse'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_ReverseTransactionLineResponseToJson(
        _$_ReverseTransactionLineResponse instance) =>
    <String, dynamic>{
      'transactionResponse': instance.transactionResponse,
      'exception': instance.exception,
    };
