// ignore_for_file: invalid_annotation_target

import 'package:attendance_data/model/template_header_container/receipt_template_container_dto.dart';
import 'package:attendance_data/model/template_header_container/ticket_template_container_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'receipt_template_header_container_dto.freezed.dart';
part 'receipt_template_header_container_dto.g.dart';

@freezed
class ReceiptTemplateHeaderContainerDTO with _$ReceiptTemplateHeaderContainerDTO {
  const factory ReceiptTemplateHeaderContainerDTO({
    @JsonKey(name: 'TemplateId')
    required int templateId,
    @JsonKey(name: 'TemplateName')
    required String templateName,
    @JsonKey(name: 'FontName')
    required String fontName,
    @JsonKey(name: 'FontSize')
    dynamic fontSize,
    @JsonKey(name: 'GUID')
    required String guid,
    @JsonKey(name: 'TicketTemplateContainerDTO')
    TicketTemplateContainerDTO? ticketTemplateContainerDTO,
    @JsonKey(name: 'ReceiptPrintTemplateContainerDTOList')
    required List<ReceiptTemplateContainerDTO> receiptPrintTemplateContainerDTOList,
  }) = _ReceiptTemplateHeaderContainerDTO;

  factory ReceiptTemplateHeaderContainerDTO.fromJson(Map<String, dynamic> json) => _$ReceiptTemplateHeaderContainerDTOFromJson(json);
}