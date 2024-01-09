// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'pause_time_request.freezed.dart';
part 'pause_time_request.g.dart';

@freezed
class PauseTimeRequest with _$PauseTimeRequest {
  const factory PauseTimeRequest({
    @JsonKey(name: 'CardId')
    int? cardId,
    @JsonKey(name: 'ManagerId')
    int? managerId,
    @JsonKey(name: 'Remarks')
    String? remarks,
    @JsonKey(name: 'TimeStatus')
    int? timeStatus,
  }) = _PauseTimeRequest;

  factory PauseTimeRequest.fromJson(Map<String, dynamic> json) => _$PauseTimeRequestFromJson(json);
}