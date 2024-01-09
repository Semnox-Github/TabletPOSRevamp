// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_receipt_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrintReceiptData _$$_PrintReceiptDataFromJson(Map<String, dynamic> json) =>
    _$_PrintReceiptData(
      name: json['Name'] as String,
      printDocumentType: json['PrintDocumentType'] as String?,
      templateId: json['TemplateId'] as int,
      posPrinterId: json['POSPrinterId'] as int,
      receiptLineDtoList: (json['ReceiptLineDTOList'] as List<dynamic>)
          .map((e) => ReceiptLineDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PrintReceiptDataToJson(_$_PrintReceiptData instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'PrintDocumentType': instance.printDocumentType,
      'TemplateId': instance.templateId,
      'POSPrinterId': instance.posPrinterId,
      'ReceiptLineDTOList': instance.receiptLineDtoList,
    };
