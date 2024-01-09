// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_container_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRoleContanierData _$$_UserRoleContanierDataFromJson(
        Map<String, dynamic> json) =>
    _$_UserRoleContanierData(
      userRoleContainerDtoList: (json['UserRoleContainerDTOList']
              as List<dynamic>)
          .map((e) => UserRoleContanierDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      hash: json['Hash'] as String?,
    );

Map<String, dynamic> _$$_UserRoleContanierDataToJson(
        _$_UserRoleContanierData instance) =>
    <String, dynamic>{
      'UserRoleContainerDTOList': instance.userRoleContainerDtoList,
      'Hash': instance.hash,
    };
