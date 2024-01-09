// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'discount_container_dto.dart';

part 'discount_container_data.freezed.dart';
part 'discount_container_data.g.dart';

@freezed
class DiscountContainerData with _$DiscountContainerData {
  const factory DiscountContainerData({
    @JsonKey(name: 'DiscountContainerDTOList')
    required List<DiscountContainerDto> discountContainerDtoList,
    @JsonKey(name: 'Hash')
    String? hash,
  }) = _DiscountContainerData;

  factory DiscountContainerData.fromJson(Map<String, dynamic> json) => _$DiscountContainerDataFromJson(json);
}