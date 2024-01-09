// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MembershipContainerDTO _$$_MembershipContainerDTOFromJson(
        Map<String, dynamic> json) =>
    _$_MembershipContainerDTO(
      membershipId: json['MembershipId'] as int,
      membershipName: json['MembershipName'] as String,
      description: json['Description'] as String,
      redemptionDiscount: (json['RedemptionDiscount'] as num).toDouble(),
      priceListId: json['PriceListId'] as int,
    );

Map<String, dynamic> _$$_MembershipContainerDTOToJson(
        _$_MembershipContainerDTO instance) =>
    <String, dynamic>{
      'MembershipId': instance.membershipId,
      'MembershipName': instance.membershipName,
      'Description': instance.description,
      'RedemptionDiscount': instance.redemptionDiscount,
      'PriceListId': instance.priceListId,
    };
