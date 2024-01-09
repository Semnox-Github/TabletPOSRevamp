// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_container_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRoleContainerResponse _$$_UserRoleContainerResponseFromJson(
        Map<String, dynamic> json) =>
    _$_UserRoleContainerResponse(
      data: json['data'] == null
          ? null
          : UserRoleContainerData.fromJson(
              json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_UserRoleContainerResponseToJson(
        _$_UserRoleContainerResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
