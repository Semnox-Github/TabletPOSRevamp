

import 'package:freezed_annotation/freezed_annotation.dart';
part 'posx_receipt_content.freezed.dart';
part 'posx_receipt_content.g.dart';

@freezed
class PosXReceiptContentResponse with _$PosXReceiptContentResponse {
  const factory PosXReceiptContentResponse({
    @JsonKey(name: 'data')
    String? data,
    @JsonKey(name: 'exception')
    String? exception
  }) = _PosXReceiptContentResponse;

  factory PosXReceiptContentResponse.fromJson(Map<String, dynamic> json) => _$PosXReceiptContentResponseFromJson(json);
}
