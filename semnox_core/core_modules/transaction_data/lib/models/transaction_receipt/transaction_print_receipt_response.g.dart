// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_print_receipt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionPrintReceiptResponse _$$_TransactionPrintReceiptResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionPrintReceiptResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TransactionPrintReceiptContainerDto.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_TransactionPrintReceiptResponseToJson(
        _$_TransactionPrintReceiptResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
