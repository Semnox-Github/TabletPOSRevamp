// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MembershipSummaryData _$$_MembershipSummaryDataFromJson(
        Map<String, dynamic> json) =>
    _$_MembershipSummaryData(
      customerId: json['CustomerId'] as int?,
      membershipCard: json['MembershipCard'] as String?,
      membershipId: json['MembershipId'] as int?,
      membershipTotalPoints:
          (json['MembershipTotalPoints'] as num?)?.toDouble(),
      memberShipRetainPoints:
          (json['MemberShipRetainPoints'] as num?)?.toDouble(),
      nextMemberShipPointsRequired:
          (json['NextMemberShipPointsRequired'] as num?)?.toDouble(),
      memberShipName: json['MemberShipName'] as String?,
      membershipRewardsDetails: json['MembershipRewardsDetails'] as String?,
      name: json['Name'] as String?,
      membershipPointDetails: json['MembershipPointDetails'] as String?,
      nextMemberShipName: json['NextMemberShipName'] as String?,
      membershipValidity: json['MembershipValidity'] as String?,
    );

Map<String, dynamic> _$$_MembershipSummaryDataToJson(
        _$_MembershipSummaryData instance) =>
    <String, dynamic>{
      'CustomerId': instance.customerId,
      'MembershipCard': instance.membershipCard,
      'MembershipId': instance.membershipId,
      'MembershipTotalPoints': instance.membershipTotalPoints,
      'MemberShipRetainPoints': instance.memberShipRetainPoints,
      'NextMemberShipPointsRequired': instance.nextMemberShipPointsRequired,
      'MemberShipName': instance.memberShipName,
      'MembershipRewardsDetails': instance.membershipRewardsDetails,
      'Name': instance.name,
      'MembershipPointDetails': instance.membershipPointDetails,
      'NextMemberShipName': instance.nextMemberShipName,
      'MembershipValidity': instance.membershipValidity,
    };
