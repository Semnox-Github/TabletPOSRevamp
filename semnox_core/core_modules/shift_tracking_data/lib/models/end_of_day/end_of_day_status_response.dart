import 'package:freezed_annotation/freezed_annotation.dart';

part 'end_of_day_status_response.freezed.dart';
part 'end_of_day_status_response.g.dart';

@freezed
class EndOfDayStatus with _$EndOfDayStatus {
  const factory EndOfDayStatus({
    @JsonKey(name: 'data')
    dynamic data,
    @JsonKey(name: 'Message')
    String? message,
    @JsonKey(name: 'exception')
    String? exception,

  }) = _EndOfDayStatus;

  factory EndOfDayStatus.fromJson(Map<String, Object?> json) => _$EndOfDayStatusFromJson(json);
}