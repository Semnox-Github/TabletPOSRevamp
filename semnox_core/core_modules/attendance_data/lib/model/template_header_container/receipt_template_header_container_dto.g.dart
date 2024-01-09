// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_template_header_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiptTemplateHeaderContainerDTO
    _$$_ReceiptTemplateHeaderContainerDTOFromJson(Map<String, dynamic> json) =>
        _$_ReceiptTemplateHeaderContainerDTO(
          templateId: json['TemplateId'] as int,
          templateName: json['TemplateName'] as String,
          fontName: json['FontName'] as String,
          fontSize: json['FontSize'],
          guid: json['GUID'] as String,
          ticketTemplateContainerDTO: json['TicketTemplateContainerDTO'] == null
              ? null
              : TicketTemplateContainerDTO.fromJson(
                  json['TicketTemplateContainerDTO'] as Map<String, dynamic>),
          receiptPrintTemplateContainerDTOList:
              (json['ReceiptPrintTemplateContainerDTOList'] as List<dynamic>)
                  .map((e) => ReceiptTemplateContainerDTO.fromJson(
                      e as Map<String, dynamic>))
                  .toList(),
        );

Map<String, dynamic> _$$_ReceiptTemplateHeaderContainerDTOToJson(
        _$_ReceiptTemplateHeaderContainerDTO instance) =>
    <String, dynamic>{
      'TemplateId': instance.templateId,
      'TemplateName': instance.templateName,
      'FontName': instance.fontName,
      'FontSize': instance.fontSize,
      'GUID': instance.guid,
      'TicketTemplateContainerDTO': instance.ticketTemplateContainerDTO,
      'ReceiptPrintTemplateContainerDTOList':
          instance.receiptPrintTemplateContainerDTOList,
    };
