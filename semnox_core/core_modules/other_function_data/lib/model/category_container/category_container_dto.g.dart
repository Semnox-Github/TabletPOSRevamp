// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryContainerDTO _$$_CategoryContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_CategoryContainerDTO(
      categoryId: json['CategoryId'] as int?,
      name: json['Name'] as String?,
      childCategoryIdList: (json['ChildCategoryIdList '] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      parentCategoryIdList: (json['ParentCategoryIdList'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$$_CategoryContainerDTOToJson(
        _$_CategoryContainerDTO instance) =>
    <String, dynamic>{
      'CategoryId': instance.categoryId,
      'Name': instance.name,
      'ChildCategoryIdList ': instance.childCategoryIdList,
      'ParentCategoryIdList': instance.parentCategoryIdList,
    };
