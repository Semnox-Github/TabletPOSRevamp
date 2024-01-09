// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/request/approval_dto.dart';

part 'add_open_line_request.freezed.dart';
part 'add_open_line_request.g.dart';

@freezed
class AddOpenLineRequest with _$AddOpenLineRequest {
  const factory AddOpenLineRequest({
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'Description')
    required String description,
    @JsonKey(name: 'Price')
    required double price,
    @JsonKey(name: 'PrinterId')
    required int printerId,
    @JsonKey(name: 'Remarks')
    required String remarks,
    @JsonKey(name: 'ApprovalDTO')
    required ApprovalDTO approvalDTO,
    @JsonKey(name: 'SeatNumber')
    required int seatNo,
    @JsonKey(name: 'SeatName')
    required String seatName,
  }) = _AddOpenLineRequest;

  factory AddOpenLineRequest.fromJson(Map<String, dynamic> json) => _$AddOpenLineRequestFromJson(json);
}
