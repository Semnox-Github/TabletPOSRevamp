// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_line_request.freezed.dart';
part 'transaction_line_request.g.dart';

@freezed
class TransactionLineDTORequest with _$TransactionLineDTORequest {
  const factory TransactionLineDTORequest({
    @JsonKey(name: 'ModifierSetId')
    required int modifierSetId,
    @JsonKey(name: 'ModifierSetDetailId')
    required int modifierSetDetailId,
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'ProductName')
    required String productName,
    @JsonKey(name: 'Remarks')
    String? remarks,
    @JsonKey(name: 'ApprovedBy')
    String? approvedBy,
    @JsonKey(name: 'Quantity')
    @Default(0.0) double quantity,
    @JsonKey(name: 'IsParentModifier')
    @Default(false) bool isParentModifier,
    @JsonKey(name: 'TransactionLineDTOList')
    @Default([]) List<TransactionLineDTORequest>? transactionLineDTOList
  }) = _TransactionLineDTORequest;

  factory TransactionLineDTORequest.fromJson(Map<String, dynamic> json) => _$TransactionLineDTORequestFromJson(json);
}
