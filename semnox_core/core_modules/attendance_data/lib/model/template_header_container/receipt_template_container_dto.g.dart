// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_template_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiptTemplateContainerDTO _$$_ReceiptTemplateContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ReceiptTemplateContainerDTO(
      id: json['ID'] as int,
      templateId: json['TemplateId'] as int,
      font: json['Font'] as String,
      metaData: json['MetaData'] as String,
      section: json['Section'] as String,
      sequence: json['Sequence'] as int,
      data: (json['Data'] as List<dynamic>).map((e) => e as String).toList(),
      alignments: (json['Alignments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ReceiptTemplateContainerDTOToJson(
        _$_ReceiptTemplateContainerDTO instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TemplateId': instance.templateId,
      'Font': instance.font,
      'MetaData': instance.metaData,
      'Section': instance.section,
      'Sequence': instance.sequence,
      'Data': instance.data,
      'Alignments': instance.alignments,
    };
