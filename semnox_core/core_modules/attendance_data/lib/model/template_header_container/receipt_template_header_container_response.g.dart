// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_template_header_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiptTemplateHeaderContainerResponse
    _$$_ReceiptTemplateHeaderContainerResponseFromJson(
            Map<String, dynamic> json) =>
        _$_ReceiptTemplateHeaderContainerResponse(
          data: json['data'] == null
              ? null
              : ReceiptTemplateHeaderContainerData.fromJson(
                  json['data'] as Map<String, dynamic>),
          exception: json['exception'] as String?,
        );

Map<String, dynamic> _$$_ReceiptTemplateHeaderContainerResponseToJson(
        _$_ReceiptTemplateHeaderContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
