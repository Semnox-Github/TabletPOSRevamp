// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/order_type_container/order_type_container_dto.dart';

part 'order_type_container_data.freezed.dart';
part 'order_type_container_data.g.dart';

@freezed
class OrderTypeContainerData with _$OrderTypeContainerData{
  const factory OrderTypeContainerData({
    @JsonKey(name: 'OrderTypeContainerDTOList')
    required List<OrderTypeContainerDTO> orderTypeContainerDTOList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _OrderTypeContainerData;

  factory OrderTypeContainerData.fromJson(Map<String, dynamic> json) => _$OrderTypeContainerDataFromJson(json);
}