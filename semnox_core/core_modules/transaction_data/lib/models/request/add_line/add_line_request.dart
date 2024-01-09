// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/request/add_line/transaction_account_dto.dart';

part 'add_line_request.freezed.dart';
part 'add_line_request.g.dart';

@freezed
class AddLineRequest with _$AddLineRequest {
  const factory AddLineRequest({
    @JsonKey(name: 'SeatName')
    required String seatName,
    @JsonKey(name: 'CourseName')
    dynamic courseName,
    @JsonKey(name: 'ComboProductId')
    int? comboProductId,
    @JsonKey(name: 'ModifierSetId')
    int? modifierSetId,
    @JsonKey(name: 'IsNonChargeable')
    bool? isNonChargeable,
    @JsonKey(name: 'OrderTypeId')
    int? orderTypeId,
    @JsonKey(name: 'IsReversed')
    bool? isReversed,
    @JsonKey(name: 'OnPrintHold')
    bool? onPrintHold,
    @JsonKey(name: 'Is9999Product')
    bool? is9999Product,
    @JsonKey(name: 'IsCrossSellProduct')
    bool? isCrossSellProduct,
    @JsonKey(name: 'IsUpsellProduct')
    bool? isUpsellProduct,
    @JsonKey(name: 'UserOverriddenPrice')
    dynamic userOverriddenPrice,
    @JsonKey(name: 'SeatNumber')
    required int seatNumber,
    @JsonKey(name: 'TransactionProfileId')
    int? transactionProfileId,
    @JsonKey(name: 'LineNumber')
    required int lineNumber,
    @JsonKey(name: 'ProductId')
    required int productId,
    @JsonKey(name: 'Quantity')
    required int quantity,
    @JsonKey(name: 'Remarks')
    String? remarks,
    @JsonKey(name:"TagNumber")
    String? tagNumber,
    @JsonKey(name:"TransactionAccountDTOList")
    List<TransactionAccountDto>? transactionAccountDTO,
    @JsonKey(name: 'ApprovedBy')
    String? approvedBy,
    @JsonKey(name: 'LineDate')
    String? lineDate,
  }) = _AddLineRequest;

  factory AddLineRequest.fromJson(Map<String, dynamic> json) => _$AddLineRequestFromJson(json);
}
