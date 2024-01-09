// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_template_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TicketTemplateContainerDTO _$$_TicketTemplateContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_TicketTemplateContainerDTO(
      id: json['ID'] as int,
      templateId: json['TemplateId'] as int,
      width: (json['Width'] as num).toDouble(),
      height: (json['Height'] as num).toDouble(),
      leftMargin: json['LeftMargin'] as int,
      rightMargin: json['RightMargin'] as int,
      topMargin: json['TopMargin'] as int,
      bottomMargin: json['BottomMargin'] as int,
      borderWidth: json['BorderWidth'] as int,
      backgroundImage: json['BackgroundImage'],
      backsideTemplateId: json['BacksideTemplateId'],
      guid: json['GUID'] as String,
    );

Map<String, dynamic> _$$_TicketTemplateContainerDTOToJson(
        _$_TicketTemplateContainerDTO instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'TemplateId': instance.templateId,
      'Width': instance.width,
      'Height': instance.height,
      'LeftMargin': instance.leftMargin,
      'RightMargin': instance.rightMargin,
      'TopMargin': instance.topMargin,
      'BottomMargin': instance.bottomMargin,
      'BorderWidth': instance.borderWidth,
      'BackgroundImage': instance.backgroundImage,
      'BacksideTemplateId': instance.backsideTemplateId,
      'GUID': instance.guid,
    };
