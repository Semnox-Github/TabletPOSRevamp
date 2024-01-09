// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_product_exclusions_dto.freezed.dart';
part 'pos_product_exclusions_dto.g.dart';


@freezed
class POSProductExclusionsContainerDTO with _$POSProductExclusionsContainerDTO {
  const factory POSProductExclusionsContainerDTO({
    @JsonKey(name: 'ExclusionId')
    required int exclusionId,
    @JsonKey(name: 'PosMachineId')
    required int posMachineId,
    @JsonKey(name: 'PosTypeId')
    required int posTypeId,
    @JsonKey(name: 'ProductDisplayGroupFormatId')
    required int productDisplayGroupFormatId,
    @JsonKey(name: 'ProductGroup')
    required String productGroup,
  }) = _POSProductExclusionsContainerDTO;

  factory POSProductExclusionsContainerDTO.fromJson(Map<String, dynamic> json) => _$POSProductExclusionsContainerDTOFromJson(json);
}