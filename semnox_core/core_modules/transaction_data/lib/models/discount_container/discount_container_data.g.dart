// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DiscountContainerData _$$_DiscountContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_DiscountContainerData(
      discountContainerDtoList: (json['DiscountContainerDTOList']
              as List<dynamic>)
          .map((e) => DiscountContainerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_DiscountContainerDataToJson(
        _$_DiscountContainerData instance) =>
    <String, dynamic>{
      'DiscountContainerDTOList': instance.discountContainerDtoList,
      'Hash': instance.hash,
    };
