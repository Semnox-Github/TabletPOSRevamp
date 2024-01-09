import 'package:attendance_data/model/template_header_container/receipt_template_header_container_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'receipt_template_header_container_response.freezed.dart';
part 'receipt_template_header_container_response.g.dart';

@freezed
class ReceiptTemplateHeaderContainerResponse with _$ReceiptTemplateHeaderContainerResponse {
  const factory ReceiptTemplateHeaderContainerResponse({
    ReceiptTemplateHeaderContainerData? data,
    String? exception
  }) = _ReceiptTemplateHeaderContainerResponse;

  factory ReceiptTemplateHeaderContainerResponse.fromJson(Map<String, dynamic> json) => _$ReceiptTemplateHeaderContainerResponseFromJson(json);
}