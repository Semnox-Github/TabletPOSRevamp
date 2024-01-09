// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/request/approval_dto.dart';
import 'package:transaction_data/models/request/create_order/table_operation_details.dart';


part 'order_request.freezed.dart';
part 'order_request.g.dart';

@freezed
class OrderRequest with _$OrderRequest {
  const factory OrderRequest({
    @JsonKey(name: 'TableId')
    required int tableId,
    @JsonKey(name: 'TableOperationDetails')
    required TableOperationDetails tableOperationDetails,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
  }) = _OrderRequest;

  factory OrderRequest.fromJson(Map<String, dynamic> json) => _$OrderRequestFromJson(json);
}