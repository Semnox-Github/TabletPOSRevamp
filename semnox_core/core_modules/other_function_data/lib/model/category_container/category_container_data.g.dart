// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryContainerData _$$_CategoryContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_CategoryContainerData(
      categoryContainerDTOList: (json['CategoryContainerDTOList']
              as List<dynamic>?)
          ?.map((e) => CategoryContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$$_CategoryContainerDataToJson(
        _$_CategoryContainerData instance) =>
    <String, dynamic>{
      'CategoryContainerDTOList': instance.categoryContainerDTOList,
      'hash': instance.hash,
    };
