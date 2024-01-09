// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CouponDetailsResponse _$$_CouponDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_CouponDetailsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CouponDetailsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      exception: json['exception'] as String?,
    );

Map<String, dynamic> _$$_CouponDetailsResponseToJson(
        _$_CouponDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'exception': instance.exception,
    };
