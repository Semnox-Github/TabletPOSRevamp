import 'package:freezed_annotation/freezed_annotation.dart';

part 'reversal_reason_data.freezed.dart';
part 'reversal_reason_data.g.dart';

@freezed
class ReversalReasonData with _$ReversalReasonData {
  const factory ReversalReasonData({
    int? reasonId,
    String? remarks
  }) = _ReversalReasonData;

  factory ReversalReasonData.fromJson(Map<String, dynamic> json) => _$ReversalReasonDataFromJson(json);
}