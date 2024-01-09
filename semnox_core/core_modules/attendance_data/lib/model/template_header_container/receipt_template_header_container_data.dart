// ignore_for_file: invalid_annotation_target

import 'package:attendance_data/model/template_header_container/receipt_template_header_container_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'receipt_template_header_container_data.freezed.dart';
part 'receipt_template_header_container_data.g.dart';

@freezed
class ReceiptTemplateHeaderContainerData with _$ReceiptTemplateHeaderContainerData {
  const factory ReceiptTemplateHeaderContainerData({
    @JsonKey(name: 'ReceiptPrintTemplateHeaderContainerDTOList')
    required List<ReceiptTemplateHeaderContainerDTO> receiptPrintTemplateHeaderContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _ReceiptTemplateHeaderContainerData;

  factory ReceiptTemplateHeaderContainerData.fromJson(Map<String, dynamic> json) => _$ReceiptTemplateHeaderContainerDataFromJson(json);
}