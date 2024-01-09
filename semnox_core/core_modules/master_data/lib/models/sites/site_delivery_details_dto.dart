// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'site_delivery_details_dto.freezed.dart';
part 'site_delivery_details_dto.g.dart';

@freezed
class SiteDeliveryDetailsDTO with _$SiteDeliveryDetailsDTO {

  const factory SiteDeliveryDetailsDTO({
    @JsonKey(name: 'DeliveryChannelId')
    int? deliveryChannelId,
    @JsonKey(name: 'SiteDetailId')
    int? siteDetailId,
    @JsonKey(name: 'ParentSiteId')
    int? parentSiteId,
    @JsonKey(name: 'OnlineChannelStartHour')
    double? onlineChannelStartHour,
    @JsonKey(name: 'OnlineChannelEndHour')
    double? onlineChannelEndHour,
    @JsonKey(name: 'OrderDeliveryType')
    String? orderDeliveryType,
    @JsonKey(name: 'ZipCodes')
    List<String>? zipCodes,
    @JsonKey(name: 'SiteId')
    int? siteId,
  }) = _SiteDeliveryDetailsDTO;

  factory SiteDeliveryDetailsDTO.fromJson(Map<String, Object?> json) => _$SiteDeliveryDetailsDTOFromJson(json);
}