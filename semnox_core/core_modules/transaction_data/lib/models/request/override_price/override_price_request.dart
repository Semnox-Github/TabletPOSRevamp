import 'package:freezed_annotation/freezed_annotation.dart';
import '../approval_dto.dart';

part 'override_price_request.freezed.dart';
part 'override_price_request.g.dart';

@freezed
class OverridePriceRequest with _$OverridePriceRequest {
  const factory OverridePriceRequest({
    @JsonKey(name: 'TransactionLineIdList')
    required List<int> transactionLineIds,
    @JsonKey(name: 'LineRemarks')
    required String lineRemarks,
    @JsonKey(name: 'OverridePrice')
    required double overridePrice,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDto,
  }) = _OverridePriceRequest;

  factory OverridePriceRequest.fromJson(Map<String, dynamic> json) => _$OverridePriceRequestFromJson(json);
}