// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRoleContainerData _$$_UserRoleContainerDataFromJson(
        Map<String, dynamic> json) =>
    _$_UserRoleContainerData(
      userRoleContainerDTOList: (json['UserRoleContainerDTOList']
              as List<dynamic>)
          .map((e) => UserRoleContainerDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_UserRoleContainerDataToJson(
        _$_UserRoleContainerData instance) =>
    <String, dynamic>{
      'UserRoleContainerDTOList': instance.userRoleContainerDTOList,
      'Hash': instance.hash,
    };
