// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_non_chargable_request.freezed.dart';
part 'transaction_non_chargable_request.g.dart';

@freezed
class TransactionNonChargableRequest with _$TransactionNonChargableRequest {
  const factory TransactionNonChargableRequest({
    @JsonKey(name: 'ApproverId')
    required int approverId,
    @JsonKey(name: 'Remarks')
    required String remarks,
  }) = _TransactionNonChargableRequest;

  factory TransactionNonChargableRequest.fromJson(Map<String, dynamic> json) => _$TransactionNonChargableRequestFromJson(json);
}
