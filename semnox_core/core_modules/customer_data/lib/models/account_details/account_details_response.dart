import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_details_response.freezed.dart';
part 'account_details_response.g.dart';

@freezed
class AccountDetailsResponse with _$AccountDetailsResponse {
  const factory AccountDetailsResponse({
    List<AccountDetailsData>? data,
    String? exception,
    int? currentPageNo,
    int? totalCount,
    String? barCode,
    String? token,
  }) = _AccountDetailsResponse;

  factory AccountDetailsResponse.fromJson(Map<String, dynamic> json) => _$AccountDetailsResponseFromJson(json);
}