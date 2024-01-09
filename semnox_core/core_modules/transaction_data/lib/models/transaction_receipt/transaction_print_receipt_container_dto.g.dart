// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_print_receipt_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionPrintReceiptContainerDto
    _$$_TransactionPrintReceiptContainerDtoFromJson(
            Map<String, dynamic> json) =>
        _$_TransactionPrintReceiptContainerDto(
          name: json['Name'] as String,
          format: json['Format'] as String?,
          documentType: json['DocumentType'] as String,
          templateId: json['TemplateId'] as int,
          posPrinterId: json['POSPrinterId'] as int,
          data: json['Data'] as String,
        );

Map<String, dynamic> _$$_TransactionPrintReceiptContainerDtoToJson(
        _$_TransactionPrintReceiptContainerDto instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Format': instance.format,
      'DocumentType': instance.documentType,
      'TemplateId': instance.templateId,
      'POSPrinterId': instance.posPrinterId,
      'Data': instance.data,
    };
