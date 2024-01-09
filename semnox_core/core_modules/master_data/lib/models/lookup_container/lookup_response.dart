import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/lookup_container/lookup_data.dart';

part 'lookup_response.freezed.dart';
part 'lookup_response.g.dart';

@freezed
class LookupResponse with _$LookupResponse {
  const factory LookupResponse({
    LookupData? data,
    String? exception
  }) = _LookupResponse;

  factory LookupResponse.fromJson(Map<String, dynamic> json) => _$LookupResponseFromJson(json);
}