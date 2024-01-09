

import 'package:freezed_annotation/freezed_annotation.dart';
part 'posz_reciept_content.freezed.dart';
part 'posz_reciept_content.g.dart';

@freezed
class PosZReceiptContentResponse with _$PosZReceiptContentResponse {
  const factory PosZReceiptContentResponse({
    @JsonKey(name: 'data')
    String? data,
    @JsonKey(name: 'exception')
    String? exception
  }) = _PosZReceiptContentResponse;

  factory PosZReceiptContentResponse.fromJson(Map<String, dynamic> json) => _$PosZReceiptContentResponseFromJson(json);
}
