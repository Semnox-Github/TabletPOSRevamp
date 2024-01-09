// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_payment_mode_inclusion_dto.freezed.dart';
part 'pos_payment_mode_inclusion_dto.g.dart';


@freezed
class POSPaymentModeInclusionContainerDTO with _$POSPaymentModeInclusionContainerDTO {
  const factory POSPaymentModeInclusionContainerDTO({
    @JsonKey(name: 'POSPaymentModeInclusionId')
    required int posPaymentModeInclusionId,
    @JsonKey(name: 'POSMachineId')
    required int posMachineId,
    @JsonKey(name: 'PaymentModeId')
    required int paymentModeId,
    @JsonKey(name: 'FriendlyName')
    required String friendlyName,
  }) = _POSPaymentModeInclusionContainerDTO;

  factory POSPaymentModeInclusionContainerDTO.fromJson(Map<String, dynamic> json) => _$POSPaymentModeInclusionContainerDTOFromJson(json);
}