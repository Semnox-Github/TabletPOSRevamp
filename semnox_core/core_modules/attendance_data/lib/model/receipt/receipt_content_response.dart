import 'package:attendance_data/model/receipt/receipt_content_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_content_response.freezed.dart';
part 'receipt_content_response.g.dart';

@freezed
class ReceiptContentResponse with _$ReceiptContentResponse {
  const factory ReceiptContentResponse({
    List<ReceiptContentData>? data,
    String? exception
  }) = _ReceiptContentResponse;

  factory ReceiptContentResponse.fromJson(Map<String, dynamic> json) => _$ReceiptContentResponseFromJson(json);
}
