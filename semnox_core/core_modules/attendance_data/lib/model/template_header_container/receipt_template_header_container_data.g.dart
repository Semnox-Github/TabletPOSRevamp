// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_template_header_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiptTemplateHeaderContainerData
    _$$_ReceiptTemplateHeaderContainerDataFromJson(Map<String, dynamic> json) =>
        _$_ReceiptTemplateHeaderContainerData(
          receiptPrintTemplateHeaderContainerDTOList:
              (json['ReceiptPrintTemplateHeaderContainerDTOList']
                      as List<dynamic>)
                  .map((e) => ReceiptTemplateHeaderContainerDTO.fromJson(
                      e as Map<String, dynamic>))
                  .toList(),
          hash: json['Hash'] as String?,
        );

Map<String, dynamic> _$$_ReceiptTemplateHeaderContainerDataToJson(
        _$_ReceiptTemplateHeaderContainerData instance) =>
    <String, dynamic>{
      'ReceiptPrintTemplateHeaderContainerDTOList':
          instance.receiptPrintTemplateHeaderContainerDTOList,
      'Hash': instance.hash,
    };
