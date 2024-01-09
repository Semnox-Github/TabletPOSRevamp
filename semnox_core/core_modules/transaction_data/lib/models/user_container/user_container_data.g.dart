// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserContainerData _$$_UserContainerDataFromJson(Map<String, dynamic> json) =>
    _$_UserContainerData(
      userContainerDtoList: (json['UserContainerDTOList'] as List<dynamic>)
          .map((e) => UserContainerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_UserContainerDataToJson(
        _$_UserContainerData instance) =>
    <String, dynamic>{
      'UserContainerDTOList': instance.userContainerDtoList,
      'Hash': instance.hash,
    };
