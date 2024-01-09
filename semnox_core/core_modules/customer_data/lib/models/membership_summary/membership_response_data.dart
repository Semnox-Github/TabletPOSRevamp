// To parse this JSON data, do
//
//     final membershipSummaryData = membershipSummaryDataFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'membership_response_data.freezed.dart';
part 'membership_response_data.g.dart';

@freezed
class MembershipSummaryData with _$MembershipSummaryData {
  const factory MembershipSummaryData({
    @JsonKey(name: 'CustomerId')
     int? customerId,
    @JsonKey(name: 'MembershipCard')
     String? membershipCard,
    @JsonKey(name: 'MembershipId')
     int? membershipId,
    @JsonKey(name: 'MembershipTotalPoints')
     double? membershipTotalPoints,
    @JsonKey(name: 'MemberShipRetainPoints')
     double? memberShipRetainPoints,
    @JsonKey(name: 'NextMemberShipPointsRequired')
     double? nextMemberShipPointsRequired,
    @JsonKey(name: 'MemberShipName')
     String? memberShipName,
    @JsonKey(name: 'MembershipRewardsDetails')
     String? membershipRewardsDetails,
    @JsonKey(name: 'Name')
     String? name,
    @JsonKey(name: 'MembershipPointDetails')
     String? membershipPointDetails,
    @JsonKey(name: 'NextMemberShipName')
     String? nextMemberShipName,
    @JsonKey(name: 'MembershipValidity')
     String? membershipValidity,
  }) = _MembershipSummaryData;

  factory MembershipSummaryData.fromJson(Map<String, dynamic> json) => _$MembershipSummaryDataFromJson(json);
}
