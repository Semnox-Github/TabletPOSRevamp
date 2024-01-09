// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_function_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionFunctionResponse _$$_TransactionFunctionResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionFunctionResponse(
      data: json['data'] == null
          ? null
          : TransactionFunctionData.fromJson(
              json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_TransactionFunctionResponseToJson(
        _$_TransactionFunctionResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
