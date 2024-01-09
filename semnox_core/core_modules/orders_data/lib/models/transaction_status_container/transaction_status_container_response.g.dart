// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_status_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionStatusContainerResponse
    _$$_TransactionStatusContainerResponseFromJson(Map<String, dynamic> json) =>
        _$_TransactionStatusContainerResponse(
          data: json['data'] == null
              ? null
              : TransacationStatusContainerData.fromJson(
                  json['data'] as Map<String, dynamic>),
          exception: json['exception'] as String?,
        );

Map<String, dynamic> _$$_TransactionStatusContainerResponseToJson(
        _$_TransactionStatusContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
