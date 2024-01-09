// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_tip_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SplitTipRequest _$$_SplitTipRequestFromJson(Map<String, dynamic> json) =>
    _$_SplitTipRequest(
      tipId: json['TipId'] as int,
      paymentId: json['PaymentId'] as int,
      userId: json['UserId'] as int,
      splitByPercentage: json['SplitByPercentage'] as int,
      isActive: json['IsActive'] as bool,
      siteId: json['SiteId'] as int,
      masterEntityId: json['MasterEntityId'] as int,
      isChanged: json['IsChanged'] as bool,
    );

Map<String, dynamic> _$$_SplitTipRequestToJson(_$_SplitTipRequest instance) =>
    <String, dynamic>{
      'TipId': instance.tipId,
      'PaymentId': instance.paymentId,
      'UserId': instance.userId,
      'SplitByPercentage': instance.splitByPercentage,
      'IsActive': instance.isActive,
      'SiteId': instance.siteId,
      'MasterEntityId': instance.masterEntityId,
      'IsChanged': instance.isChanged,
    };
