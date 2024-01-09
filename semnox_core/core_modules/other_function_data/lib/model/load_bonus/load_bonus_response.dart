import 'package:freezed_annotation/freezed_annotation.dart';
import 'load_bonus_data.dart';
part 'load_bonus_response.freezed.dart';
part 'load_bonus_response.g.dart';

@freezed
class LoadBonusResponse with _$LoadBonusResponse {
  const factory LoadBonusResponse({
    LoadBonusData? data,
    String? exception
  }) = _LoadBonusResponse;

  factory LoadBonusResponse.fromJson(Map<String, dynamic> json) => _$LoadBonusResponseFromJson(json);
}