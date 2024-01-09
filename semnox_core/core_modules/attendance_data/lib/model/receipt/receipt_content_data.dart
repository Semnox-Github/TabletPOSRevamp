// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_content_data.freezed.dart';
part 'receipt_content_data.g.dart';

@freezed
class ReceiptContentData with _$ReceiptContentData {
  const factory ReceiptContentData({
    @JsonKey(name: 'Name')
    required String name,
    @JsonKey(name: 'Format')
    required String format,
    @JsonKey(name: 'DocumentType')
    dynamic documentType,
    @JsonKey(name: 'TemplateId')
    required int templateId,
    @JsonKey(name: 'POSPrinterId')
    required int posPrinterId,
    @JsonKey(name: 'Data')
    required String data,
  }) = _ReceiptContentData;

  factory ReceiptContentData.fromJson(Map<String, dynamic> json) => _$ReceiptContentDataFromJson(json);
}