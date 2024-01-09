// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
part 'load_bonus_data.freezed.dart';
part 'load_bonus_data.g.dart';

@freezed
class LoadBonusData with _$LoadBonusData {
  const factory LoadBonusData({
    @JsonKey(name: 'AccountId')
    int? accountId,
    @JsonKey(name: 'ManagerId')
    int? managerId,
    @JsonKey(name: 'Remarks')
    String? remarks,
    @JsonKey(name: 'BonusValue')
    double? bonusValue,
    @JsonKey(name: 'BonusType')
    int? bonusType,
    @JsonKey(name: 'GamePlayId')
    int? gamePlayId,
    @JsonKey(name: 'TrxId')
    int? trxId,

  }) = _LoadBonusData;

  factory LoadBonusData.fromJson(Map<String, dynamic> json) => _$LoadBonusDataFromJson(json);
}
