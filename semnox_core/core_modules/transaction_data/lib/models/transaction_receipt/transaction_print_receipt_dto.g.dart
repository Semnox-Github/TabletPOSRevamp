// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_print_receipt_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionPrintReceiptDto _$$_TransactionPrintReceiptDtoFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionPrintReceiptDto(
      name: json['Name'] as String,
      format: json['Format'] as String?,
      documentType: json['DocumentType'] as String,
      templateId: json['TemplateId'] as int,
      posPrinterId: json['POSPrinterId'] as int,
      data: PrintReceiptData.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TransactionPrintReceiptDtoToJson(
        _$_TransactionPrintReceiptDto instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Format': instance.format,
      'DocumentType': instance.documentType,
      'TemplateId': instance.templateId,
      'POSPrinterId': instance.posPrinterId,
      'Data': instance.data,
    };
