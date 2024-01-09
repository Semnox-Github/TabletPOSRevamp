// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/request/add_modifier_product/transaction_line_request.dart';

part 'add_modifier_product_request.freezed.dart';
part 'add_modifier_product_request.g.dart';

@freezed
class AddModifierProductRequest with _$AddModifierProductRequest {
  const factory AddModifierProductRequest({
    @JsonKey(name: 'SeatName')
    required String seatName,
    @JsonKey(name: 'SeatNumber')
    required int seatNumber,
    @JsonKey(name: 'ViewGroupingNumber')
    int? viewGroupingNumber,
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'Quantity')
    required double quantity,
    @JsonKey(name: 'ProductName')
    required String productName,
    @JsonKey(name: 'TransactionLineDTOList')
    required List<TransactionLineDTORequest> transactionLineDTOList,
  }) = _AddModifierProductRequest;

  factory AddModifierProductRequest.fromJson(Map<String, dynamic> json) => _$AddModifierProductRequestFromJson(json);
}
