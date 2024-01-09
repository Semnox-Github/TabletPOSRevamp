// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status_container_dto.freezed.dart';
part 'order_status_container_dto.g.dart';

@freezed
class OrderStatusContainerDTO with _$OrderStatusContainerDTO {
  const factory OrderStatusContainerDTO({
    @JsonKey(name: 'OrderStatusId')
    required int orderStatusId,
    @JsonKey(name: 'OrderStatus')
    required String orderStatus,
    @JsonKey(name: 'Guid')
    required String guid,
  }) = _OrderStatusContainerDTO;

  factory OrderStatusContainerDTO.fromJson(Map<String, dynamic> json) => _$OrderStatusContainerDTOFromJson(json);
}
