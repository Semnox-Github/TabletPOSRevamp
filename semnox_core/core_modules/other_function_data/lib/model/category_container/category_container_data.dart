// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:other_function_data/model/balance_transfer/transfer_details_dto.dart';

import 'category_container_dto.dart';
part 'category_container_data.freezed.dart';
part 'category_container_data.g.dart';

@freezed
class CategoryContainerData with _$CategoryContainerData {
  const factory CategoryContainerData({
    @JsonKey(name: 'CategoryContainerDTOList')
    List<CategoryContainerDTO>? categoryContainerDTOList,
    String? hash,
  }) = _CategoryContainerData;

  factory CategoryContainerData.fromJson(Map<String, dynamic> json) => _$CategoryContainerDataFromJson(json);
}
