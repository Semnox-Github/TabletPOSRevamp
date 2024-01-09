import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_type_container_dto.freezed.dart';
part 'order_type_container_dto.g.dart';

@freezed
class OrderTypeContainerDTO with _$OrderTypeContainerDTO{
  const factory OrderTypeContainerDTO({
    @JsonKey(name: 'OrderTypeId')
    required int? orderTypeId,
    @JsonKey(name: 'Name')
    required String? name,
    @JsonKey(name: 'Description')
    required String? description,
  }) = _OrderTypeContainerDTO;

  factory OrderTypeContainerDTO.fromJson(Map<String, dynamic> json) => _$OrderTypeContainerDTOFromJson(json);
}