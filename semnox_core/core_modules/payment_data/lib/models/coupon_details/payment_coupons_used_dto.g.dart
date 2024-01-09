// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_coupons_used_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentCouponsUsedDTO _$$_PaymentCouponsUsedDTOFromJson(
        Map<String, dynamic> json) =>
    _$_PaymentCouponsUsedDTO(
      id: json['Id'] as int,
      couponSetId: json['CouponSetId'] as int,
      discountId: json['DiscountId'] as int,
      couponNumber: json['CouponNumber'] as String,
      transactionId: json['TransactionId'] as int,
      lineId: json['LineId'] as int,
      paymentId: json['PaymentId'] as int,
      isActive: json['IsActive'] as bool,
      siteId: json['SiteId'] as int,
      masterEntityId: json['MasterEntityId'] as int,
      synchStatus: json['SynchStatus'] as bool,
      guid: json['Guid'] as String,
      createdBy: json['CreatedBy'] as String,
      creationDate: json['CreationDate'] as String,
      lastUpdatedBy: json['LastUpdatedBy'] as String,
      lastUpdatedDate: json['LastUpdatedDate'] as String,
      isChanged: json['IsChanged'] as bool,
    );

Map<String, dynamic> _$$_PaymentCouponsUsedDTOToJson(
        _$_PaymentCouponsUsedDTO instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'CouponSetId': instance.couponSetId,
      'DiscountId': instance.discountId,
      'CouponNumber': instance.couponNumber,
      'TransactionId': instance.transactionId,
      'LineId': instance.lineId,
      'PaymentId': instance.paymentId,
      'IsActive': instance.isActive,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'SynchStatus': instance.synchStatus,
      'Guid': instance.guid,
      'CreatedBy': instance.createdBy,
      'CreationDate': instance.creationDate,
      'LastUpdatedBy': instance.lastUpdatedBy,
      'LastUpdatedDate': instance.lastUpdatedDate,
      'IsChanged': instance.isChanged,
    };
