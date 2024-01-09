// ignore_for_file: depend_on_referenced_packages, invalid_annotation_target

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/sites/site_delivery_details_dto.dart';

part 'site_dto.freezed.dart';
part 'site_dto.g.dart';

@freezed
class SiteDTO with _$SiteDTO {

  const factory SiteDTO({
    @JsonKey(name: 'SiteId')
    required int siteId,
    @JsonKey(name: 'SiteName')
    required String siteName,
    @JsonKey(name: 'SiteAddress')
    required String siteAddress,
    @JsonKey(name: 'IsMasterSite')
    required bool isMasterSite,
    @JsonKey(name: 'OnlineEnabled')
    required bool onlineEnabled,
    @JsonKey(name: 'PinCode')
    required String pinCode,
    @JsonKey(name: 'SiteURL')
    required String siteURL,
    @JsonKey(name: 'SiteShortName')
    required String siteShortName,
    @JsonKey(name: 'City')
    required String city,
    @JsonKey(name: 'State')
    required String state,
    @JsonKey(name: 'Country')
    required String country,
    @JsonKey(name: 'StoreType')
    required String storeType,
    @JsonKey(name: 'Logo')
    String? logo,
    @JsonKey(name: 'StoreRanking')
    required String storeRanking,
    @JsonKey(name: 'OpenTime')
    required double openTime,
    @JsonKey(name: 'CloseTime')
    required double closeTime,
    @JsonKey(name: 'OpenDate')
    required String openDate,
    @JsonKey(name: 'ClosureDate')
    required String closureDate,
    @JsonKey(name: 'BusinessDayStartTime')
    required int businessDayStartTime,
    @JsonKey(name: 'TimeZoneName')
    required String timeZoneName,
    @JsonKey(name: 'Email')
    required String email,
    @JsonKey(name: 'PhoneNumber')
    required String phoneNumber,
    @JsonKey(name: 'SiteDeliveryDetailsDTOList')
    List<SiteDeliveryDetailsDTO>? siteDeliveryDetailsDTOList,
  }) = _SiteDTO;

  factory SiteDTO.fromJson(Map<String, Object?> json) =>
      _$SiteDTOFromJson(json);
}