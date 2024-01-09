// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserContainerData _$$_UserContainerDataFromJson(Map<String, dynamic> json) =>
    _$_UserContainerData(
      userContainerDTOList: (json['UserContainerDTOList'] as List<dynamic>)
          .map((e) => UserContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['hash'] as String?,
    );

Map<String, dynamic> _$$_UserContainerDataToJson(
        _$_UserContainerData instance) =>
    <String, dynamic>{
      'UserContainerDTOList': instance.userContainerDTOList,
      'hash': instance.hash,
    };
