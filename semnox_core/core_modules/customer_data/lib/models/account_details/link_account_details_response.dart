import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'link_account_details_response.freezed.dart';
part 'link_account_details_response.g.dart';

@freezed
class LinkAccountDetailsResponse with _$LinkAccountDetailsResponse {
  const factory LinkAccountDetailsResponse({
    AccountDetailsData? data,
    String? exception,
    int? currentPageNo,
    int? totalCount,
    String? barCode,
    String? token,
  }) = _LinkAccountDetailsResponse;

  factory LinkAccountDetailsResponse.fromJson(Map<String, dynamic> json) => _$LinkAccountDetailsResponseFromJson(json);
}