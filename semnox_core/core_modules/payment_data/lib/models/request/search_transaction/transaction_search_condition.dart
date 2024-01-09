// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_search_condition.freezed.dart';
part 'transaction_search_condition.g.dart';

@freezed
class TransactionSearchCondition with _$TransactionSearchCondition {
  const factory TransactionSearchCondition({
    @JsonKey(name: 'Criteria')
    required String criteria,
    @JsonKey(name: 'Operator')
    required String operator,
    @JsonKey(name: 'Column')
    required String column,
    @JsonKey(name: 'Parameter')
    required String parameter,
    @JsonKey(name: 'SortByColumn')
    String? sortByColumn,
  }) = _TransactionSearchCondition;


  factory TransactionSearchCondition.fromJson(Map<String, dynamic> json) =>
      _$TransactionSearchConditionFromJson(json);
}