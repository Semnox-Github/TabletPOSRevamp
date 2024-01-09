// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';

part 'payment_mode_data.freezed.dart';
part 'payment_mode_data.g.dart';

@freezed
class PaymentModesData with _$PaymentModesData {
  const factory PaymentModesData({
    @JsonKey(name: 'PaymentModeContainerDTOList')
    required List<PaymentModeContainerDTO> paymentModeContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _PaymentModesData;

  factory PaymentModesData.fromJson(Map<String, dynamic> json) => _$PaymentModesDataFromJson(json);
}