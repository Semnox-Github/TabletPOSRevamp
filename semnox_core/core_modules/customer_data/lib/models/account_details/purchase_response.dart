
import 'package:customer_data/models/account_details/purchase_data.dart';
import 'package:customer_data/models/account_details/summaries_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'purchase_response.freezed.dart';
part 'purchase_response.g.dart';

@freezed
class PurchaseResponse with _$PurchaseResponse {
  const factory PurchaseResponse({
    List<PurchaseData>? data,
    String? exception,
  }) = _PurchaseResponse;

  factory PurchaseResponse.fromJson(Map<String, dynamic> json) => _$PurchaseResponseFromJson(json);
}