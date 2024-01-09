// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiptContentResponse _$$_ReceiptContentResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ReceiptContentResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReceiptContentData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_ReceiptContentResponseToJson(
        _$_ReceiptContentResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
