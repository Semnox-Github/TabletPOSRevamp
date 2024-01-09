// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_delivery_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SiteDeliveryDetailsDTO _$$_SiteDeliveryDetailsDTOFromJson(
        Map<String, dynamic> json) =>
    _$_SiteDeliveryDetailsDTO(
      deliveryChannelId: json['DeliveryChannelId'] as int?,
      siteDetailId: json['SiteDetailId'] as int?,
      parentSiteId: json['ParentSiteId'] as int?,
      onlineChannelStartHour:
          (json['OnlineChannelStartHour'] as num?)?.toDouble(),
      onlineChannelEndHour: (json['OnlineChannelEndHour'] as num?)?.toDouble(),
      orderDeliveryType: json['OrderDeliveryType'] as String?,
      zipCodes: (json['ZipCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      siteId: json['SiteId'] as int?,
    );

Map<String, dynamic> _$$_SiteDeliveryDetailsDTOToJson(
        _$_SiteDeliveryDetailsDTO instance) =>
    <String, dynamic>{
      'DeliveryChannelId': instance.deliveryChannelId,
      'SiteDetailId': instance.siteDetailId,
      'ParentSiteId': instance.parentSiteId,
      'OnlineChannelStartHour': instance.onlineChannelStartHour,
      'OnlineChannelEndHour': instance.onlineChannelEndHour,
      'OrderDeliveryType': instance.orderDeliveryType,
      'ZipCodes': instance.zipCodes,
      'SiteId': instance.siteId,
    };
