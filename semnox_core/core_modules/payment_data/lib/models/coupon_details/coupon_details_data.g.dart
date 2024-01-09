// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CouponDetailsData _$$_CouponDetailsDataFromJson(Map<String, dynamic> json) =>
    _$_CouponDetailsData(
      couponSetId: json['CouponSetId'] as int,
      fromNumber: json['FromNumber'] as String,
      toNumber: json['ToNumber'] as String,
      count: json['Count'] as int,
      usedCount: json['UsedCount'] as int,
      paymentModeId: json['PaymentModeId'] as int,
      startDate: json['StartDate'] as String,
      expiryDate: json['ExpiryDate'] as String,
      couponValue: (json['CouponValue'] as num).toDouble(),
      isActive: json['IsActive'] as bool,
      lastUpdatedDate: json['LastUpdatedDate'] as String,
      createdBy: json['CreatedBy'] as String,
      creationDate: json['CreationDate'] as String,
      lastUpdatedBy: json['LastUpdatedBy'] as String,
      siteId: json['SiteId'] as int,
      masterEntityId: json['MasterEntityId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      guid: json['Guid'] as String,
      paymentCouponsUsedDTOList: (json['PaymentCouponsUsedDTOList']
              as List<dynamic>)
          .map((e) => PaymentCouponsUsedDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      isChangedRecursive: json['IsChangedRecursive'] as bool,
      isChanged: json['IsChanged'] as bool,
    );

Map<String, dynamic> _$$_CouponDetailsDataToJson(
        _$_CouponDetailsData instance) =>
    <String, dynamic>{
      'CouponSetId': instance.couponSetId,
      'FromNumber': instance.fromNumber,
      'ToNumber': instance.toNumber,
      'Count': instance.count,
      'UsedCount': instance.usedCount,
      'PaymentModeId': instance.paymentModeId,
      'StartDate': instance.startDate,
      'ExpiryDate': instance.expiryDate,
      'CouponValue': instance.couponValue,
      'IsActive': instance.isActive,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'PaymentCouponsUsedDTOList': instance.paymentCouponsUsedDTOList,
      'IsChangedRecursive': instance.isChangedRecursive,
      'IsChanged': instance.isChanged,
    };
