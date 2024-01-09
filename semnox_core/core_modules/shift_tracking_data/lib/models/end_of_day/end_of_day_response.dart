import 'package:freezed_annotation/freezed_annotation.dart';

part 'end_of_day_response.freezed.dart';
part 'end_of_day_response.g.dart';

@freezed
class EndOfDayResponse with _$EndOfDayResponse {
  const factory EndOfDayResponse({
    @JsonKey(name: 'data')
    dynamic data,
    @JsonKey(name: 'Message')
    String? message,
    @JsonKey(name: 'exception')
    String? exception,

  }) = _EndOfDayResponse;

  factory EndOfDayResponse.fromJson(Map<String, Object?> json) => _$EndOfDayResponseFromJson(json);
}