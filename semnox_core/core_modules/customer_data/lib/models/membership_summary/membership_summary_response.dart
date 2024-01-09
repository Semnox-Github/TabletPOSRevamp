import 'package:customer_data/models/account_details/summaries_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'membership_response_data.dart';

part 'membership_summary_response.freezed.dart';
part 'membership_summary_response.g.dart';

@freezed
class MembershipSummaryResponse with _$MembershipSummaryResponse {
  const factory MembershipSummaryResponse(
      {
        String? exception,
        @JsonKey(name: 'data')
        MembershipSummaryData? data,
        @JsonKey(name: 'TotalNoOfPages') int? totalNoOfPages}) =
  _MembershipSummaryResponse;

  factory MembershipSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$MembershipSummaryResponseFromJson(json);
}
