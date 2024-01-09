// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_line_request.freezed.dart';
part 'update_line_request.g.dart';

@freezed
class UpdateLineRequest with _$UpdateLineRequest {
  const factory UpdateLineRequest({
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
    @JsonKey(name:'TransactionLineId')
    required int transactionLineId,
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
  }) = _UpdateLineRequest;

  factory UpdateLineRequest.fromJson(Map<String, dynamic> json) => _$UpdateLineRequestFromJson(json);
}
