// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MemberShipResponse _$$_MemberShipResponseFromJson(
        Map<String, dynamic> json) =>
    _$_MemberShipResponse(
      data: json['data'] == null
          ? null
          : MemberShipData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_MemberShipResponseToJson(
        _$_MemberShipResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
