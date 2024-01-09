// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountDetailsResponse _$$_AccountDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AccountDetailsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AccountDetailsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
      currentPageNo: json['currentPageNo'] as int?,
      totalCount: json['totalCount'] as int?,
      barCode: json['barCode'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$_AccountDetailsResponseToJson(
        _$_AccountDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
      'currentPageNo': instance.currentPageNo,
      'totalCount': instance.totalCount,
      'barCode': instance.barCode,
      'token': instance.token,
    };
