// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'receipt_template_container_dto.freezed.dart';
part 'receipt_template_container_dto.g.dart';

@freezed
class ReceiptTemplateContainerDTO with _$ReceiptTemplateContainerDTO {
  const factory ReceiptTemplateContainerDTO({
    @JsonKey(name: 'ID')
    required int id,
    @JsonKey(name: 'TemplateId')
    required int templateId,
    @JsonKey(name: 'Font')
    required String font,
    @JsonKey(name: 'MetaData')
    required String metaData,
    @JsonKey(name: 'Section')
    required String section,
    @JsonKey(name: 'Sequence')
    required int sequence,
    @JsonKey(name: 'Data')
    required List<String> data,
    @JsonKey(name: 'Alignments')
    required List<String> alignments,
  }) = _ReceiptTemplateContainerDTO;

  factory ReceiptTemplateContainerDTO.fromJson(Map<String, dynamic> json) => _$ReceiptTemplateContainerDTOFromJson(json);
}