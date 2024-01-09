// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link_account_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LinkAccountDetailsResponse _$$_LinkAccountDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_LinkAccountDetailsResponse(
      data: json['data'] == null
          ? null
          : AccountDetailsData.fromJson(json['data'] as Map<String, dynamic>),
      exception: json['exception'] as String?,
      currentPageNo: json['currentPageNo'] as int?,
      totalCount: json['totalCount'] as int?,
      barCode: json['barCode'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$_LinkAccountDetailsResponseToJson(
        _$_LinkAccountDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
      'currentPageNo': instance.currentPageNo,
      'totalCount': instance.totalCount,
      'barCode': instance.barCode,
      'token': instance.token,
    };
