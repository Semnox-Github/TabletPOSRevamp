
// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_search_condition.freezed.dart';
part 'customer_search_condition.g.dart';

@freezed
class CustomerSearchCondition with _$CustomerSearchCondition {
  const factory CustomerSearchCondition({
    required String Criteria,
    required String Operator,
    required String Column,
    required String Parameter,
    required String? SortByColumn,
  }) = _CustomerSearchCondition;


  factory CustomerSearchCondition.fromJson(Map<String, dynamic> json) =>
      _$CustomerSearchConditionFromJson(json);
}