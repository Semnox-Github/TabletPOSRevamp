// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_transfer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BalanceTransferResponse _$$_BalanceTransferResponseFromJson(
        Map<String, dynamic> json) =>
    _$_BalanceTransferResponse(
      data: json['data'] == null
          ? null
          : BalanceTransferData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_BalanceTransferResponseToJson(
        _$_BalanceTransferResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
