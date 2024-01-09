import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:membership_data/models/membership_data.dart';

part 'membership_response.freezed.dart';
part 'membership_response.g.dart';

@freezed
class MemberShipResponse with _$MemberShipResponse {
  const factory MemberShipResponse({
    MemberShipData? data,
    String? exception
  }) = _MemberShipResponse;

  factory MemberShipResponse.fromJson(Map<String, dynamic> json) => _$MemberShipResponseFromJson(json);
}