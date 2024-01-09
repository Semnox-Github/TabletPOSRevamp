// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_line_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiptLineDto _$$_ReceiptLineDtoFromJson(Map<String, dynamic> json) =>
    _$_ReceiptLineDto(
      templateSection: json['TemplateSection'] as String,
      data: (json['Data'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      alignments: (json['Alignments'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      columnCount: json['ColumnCount'] as int,
      font: json['Font'] as String?,
      barCode: json['BarCode'] as String?,
      lineId: json['LineId'] as int,
      lineHeight: json['LineHeight'] as int,
      strikeThrough: json['StrikeThrough'] as bool?,
      printAttributeType: json['PrintAttributeType'] as String,
    );

Map<String, dynamic> _$$_ReceiptLineDtoToJson(_$_ReceiptLineDto instance) =>
    <String, dynamic>{
      'TemplateSection': instance.templateSection,
      'Data': instance.data,
      'Alignments': instance.alignments,
      'ColumnCount': instance.columnCount,
      'Font': instance.font,
      'BarCode': instance.barCode,
      'LineId': instance.lineId,
      'LineHeight': instance.lineHeight,
      'StrikeThrough': instance.strikeThrough,
      'PrintAttributeType': instance.printAttributeType,
    };
