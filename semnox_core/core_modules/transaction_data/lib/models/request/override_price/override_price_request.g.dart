// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'override_price_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OverridePriceRequest _$$_OverridePriceRequestFromJson(
        Map<String, dynamic> json) =>
    _$_OverridePriceRequest(
      transactionLineIds: (json['TransactionLineIdList'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      lineRemarks: json['LineRemarks'] as String,
      overridePrice: (json['OverridePrice'] as num).toDouble(),
      approvalDto:
          ApprovalDTO.fromJson(json['ApprovalDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OverridePriceRequestToJson(
        _$_OverridePriceRequest instance) =>
    <String, dynamic>{
      'TransactionLineIdList': instance.transactionLineIds,
      'LineRemarks': instance.lineRemarks,
      'OverridePrice': instance.overridePrice,
      'ApprovalDTO': instance.approvalDto,
    };
