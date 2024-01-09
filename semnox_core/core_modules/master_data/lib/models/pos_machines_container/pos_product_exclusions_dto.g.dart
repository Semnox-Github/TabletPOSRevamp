// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_product_exclusions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_POSProductExclusionsContainerDTO
    _$$_POSProductExclusionsContainerDTOFromJson(Map<String, dynamic> json) =>
        _$_POSProductExclusionsContainerDTO(
          exclusionId: json['ExclusionId'] as int,
          posMachineId: json['PosMachineId'] as int,
          posTypeId: json['PosTypeId'] as int,
          productDisplayGroupFormatId:
              json['ProductDisplayGroupFormatId'] as int,
          productGroup: json['ProductGroup'] as String,
        );

Map<String, dynamic> _$$_POSProductExclusionsContainerDTOToJson(
        _$_POSProductExclusionsContainerDTO instance) =>
    <String, dynamic>{
      'ExclusionId': instance.exclusionId,
      'PosMachineId': instance.posMachineId,
      'PosTypeId': instance.posTypeId,
      'ProductDisplayGroupFormatId': instance.productDisplayGroupFormatId,
      'ProductGroup': instance.productGroup,
    };
