// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/order_status_container/order_status_container_dto.dart';

part 'order_status_container_data.freezed.dart';
part 'order_status_container_data.g.dart';

@freezed
class OrderStatusContainerData with _$OrderStatusContainerData {
  const factory OrderStatusContainerData({
    @JsonKey(name: 'OrderStatusContainerDTOList')
    required List<OrderStatusContainerDTO> orderStatusContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _OrderStatusContainerData;

  factory OrderStatusContainerData.fromJson(Map<String, dynamic> json) => _$OrderStatusContainerDataFromJson(json);
}
