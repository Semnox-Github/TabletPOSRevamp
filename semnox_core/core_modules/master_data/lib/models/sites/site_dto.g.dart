// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SiteDTO _$$_SiteDTOFromJson(Map<String, dynamic> json) => _$_SiteDTO(
      siteId: json['SiteId'] as int,
      siteName: json['SiteName'] as String,
      siteAddress: json['SiteAddress'] as String,
      isMasterSite: json['IsMasterSite'] as bool,
      onlineEnabled: json['OnlineEnabled'] as bool,
      pinCode: json['PinCode'] as String,
      siteURL: json['SiteURL'] as String,
      siteShortName: json['SiteShortName'] as String,
      city: json['City'] as String,
      state: json['State'] as String,
      country: json['Country'] as String,
      storeType: json['StoreType'] as String,
      logo: json['Logo'] as String?,
      storeRanking: json['StoreRanking'] as String,
      openTime: (json['OpenTime'] as num).toDouble(),
      closeTime: (json['CloseTime'] as num).toDouble(),
      openDate: json['OpenDate'] as String,
      closureDate: json['ClosureDate'] as String,
      businessDayStartTime: json['BusinessDayStartTime'] as int,
      timeZoneName: json['TimeZoneName'] as String,
      email: json['Email'] as String,
      phoneNumber: json['PhoneNumber'] as String,
      siteDeliveryDetailsDTOList: (json['SiteDeliveryDetailsDTOList']
              as List<dynamic>?)
          ?.map(
              (e) => SiteDeliveryDetailsDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SiteDTOToJson(_$_SiteDTO instance) =>
    <String, dynamic>{
      'SiteId': instance.siteId,
      'SiteName': instance.siteName,
      'SiteAddress': instance.siteAddress,
      'IsMasterSite': instance.isMasterSite,
      'OnlineEnabled': instance.onlineEnabled,
      'PinCode': instance.pinCode,
      'SiteURL': instance.siteURL,
      'SiteShortName': instance.siteShortName,
      'City': instance.city,
      'State': instance.state,
      'Country': instance.country,
      'StoreType': instance.storeType,
      'Logo': instance.logo,
      'StoreRanking': instance.storeRanking,
      'OpenTime': instance.openTime,
      'CloseTime': instance.closeTime,
      'OpenDate': instance.openDate,
      'ClosureDate': instance.closureDate,
      'BusinessDayStartTime': instance.businessDayStartTime,
      'TimeZoneName': instance.timeZoneName,
      'Email': instance.email,
      'PhoneNumber': instance.phoneNumber,
      'SiteDeliveryDetailsDTOList': instance.siteDeliveryDetailsDTOList,
    };
