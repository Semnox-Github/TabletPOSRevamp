// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_clocked_in_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetClockedInUsersResponse _$$_GetClockedInUsersResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GetClockedInUsersResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => GetClockedInUsersData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_GetClockedInUsersResponseToJson(
        _$_GetClockedInUsersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
