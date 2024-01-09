import 'package:customer_data/models/account_details/summaries_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summaries_counts_response.freezed.dart';
part 'summaries_counts_response.g.dart';

@freezed
class SummariesCountsResponse with _$SummariesCountsResponse {
  const factory SummariesCountsResponse(
          {String? exception,
          @JsonKey(name: 'data') int? data,
          @JsonKey(name: 'TotalNoOfPages') int? totalNoOfPages}) =
      _SummariesCountsResponse;

  factory SummariesCountsResponse.fromJson(Map<String, dynamic> json) =>
      _$SummariesCountsResponseFromJson(json);
}
