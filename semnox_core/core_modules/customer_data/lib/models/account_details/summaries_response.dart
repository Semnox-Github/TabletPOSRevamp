
import 'package:customer_data/models/account_details/summaries_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'summaries_response.freezed.dart';
part 'summaries_response.g.dart';

@freezed
class SummariesResponse with _$SummariesResponse {
  const factory SummariesResponse({
    List<SummariesData>? data,
    String? exception,
  }) = _SummariesResponse;

  factory SummariesResponse.fromJson(Map<String, dynamic> json) => _$SummariesResponseFromJson(json);
}