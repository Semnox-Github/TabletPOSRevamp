// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'compatible_payment_modes_dto.freezed.dart';
part 'compatible_payment_modes_dto.g.dart';

@freezed
class CompatiblePaymentModesContainerDTO with _$CompatiblePaymentModesContainerDTO {
  const factory CompatiblePaymentModesContainerDTO({
    @JsonKey(name: 'Id')
    required int id,
    @JsonKey(name: 'PaymentModeId')
    required int paymentModeId,
    @JsonKey(name: 'CompatiablePaymentModeId')
    required int compatiblePaymentModeId,
  }) = _CompatiblePaymentModesContainerDTO;

  factory CompatiblePaymentModesContainerDTO.fromJson(Map<String, dynamic> json) => _$CompatiblePaymentModesContainerDTOFromJson(json);
}