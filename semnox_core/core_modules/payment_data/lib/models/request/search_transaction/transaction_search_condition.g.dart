// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_search_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionSearchCondition _$$_TransactionSearchConditionFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionSearchCondition(
      criteria: json['Criteria'] as String,
      operator: json['Operator'] as String,
      column: json['Column'] as String,
      parameter: json['Parameter'] as String,
      sortByColumn: json['SortByColumn'] as String?,
    );

Map<String, dynamic> _$$_TransactionSearchConditionToJson(
        _$_TransactionSearchCondition instance) =>
    <String, dynamic>{
      'Criteria': instance.criteria,
      'Operator': instance.operator,
      'Column': instance.column,
      'Parameter': instance.parameter,
      'SortByColumn': instance.sortByColumn,
    };
