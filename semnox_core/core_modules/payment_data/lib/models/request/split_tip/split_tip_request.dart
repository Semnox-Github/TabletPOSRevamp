// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'split_tip_request.freezed.dart';
part 'split_tip_request.g.dart';

@freezed
class SplitTipRequest with _$SplitTipRequest {
  const factory SplitTipRequest({
    @JsonKey(name: 'TipId')
    required int tipId,
    @JsonKey(name: 'PaymentId')
    required int paymentId,
    @JsonKey(name: 'UserId')
    required int userId,
    @JsonKey(name: 'SplitByPercentage')
    required int splitByPercentage,
    @JsonKey(name: 'IsActive')
    required bool isActive,
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'MasterEntityId')
    required int masterEntityId,
    @JsonKey(name: 'IsChanged')
    required bool isChanged,
  }) = _SplitTipRequest;


  factory SplitTipRequest.fromJson(Map<String, dynamic> json) =>
      _$SplitTipRequestFromJson(json);
}