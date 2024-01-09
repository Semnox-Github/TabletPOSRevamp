// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_content_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiptContentData _$$_ReceiptContentDataFromJson(
        Map<String, dynamic> json) =>
    _$_ReceiptContentData(
      name: json['Name'] as String,
      format: json['Format'] as String,
      documentType: json['DocumentType'],
      templateId: json['TemplateId'] as int,
      posPrinterId: json['POSPrinterId'] as int,
      data: json['Data'] as String,
    );

Map<String, dynamic> _$$_ReceiptContentDataToJson(
        _$_ReceiptContentData instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Format': instance.format,
      'DocumentType': instance.documentType,
      'TemplateId': instance.templateId,
      'POSPrinterId': instance.posPrinterId,
      'Data': instance.data,
    };
