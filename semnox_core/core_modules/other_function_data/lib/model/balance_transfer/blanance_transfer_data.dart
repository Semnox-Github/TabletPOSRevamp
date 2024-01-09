// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:other_function_data/model/balance_transfer/transfer_details_dto.dart';
part 'blanance_transfer_data.freezed.dart';
part 'blanance_transfer_data.g.dart';

@freezed
class BalanceTransferData with _$BalanceTransferData {
  const factory BalanceTransferData({
    @JsonKey(name: 'FromCardId')
    int? fromCardId,
    @JsonKey(name: 'TransferDetails')
    List<TransferDetailsDto>? transferDetails,
    @JsonKey(name: 'ManagerId')
    int? managerId,
    @JsonKey(name: 'Remarks')
    String? remarks,
  }) = _BalanceTransferData;

  factory BalanceTransferData.fromJson(Map<String, dynamic> json) => _$BalanceTransferDataFromJson(json);
}
