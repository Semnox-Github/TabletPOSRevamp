// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_search_condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerSearchCondition _$$_CustomerSearchConditionFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerSearchCondition(
      Criteria: json['Criteria'] as String,
      Operator: json['Operator'] as String,
      Column: json['Column'] as String,
      Parameter: json['Parameter'] as String,
      SortByColumn: json['SortByColumn'] as String?,
    );

Map<String, dynamic> _$$_CustomerSearchConditionToJson(
        _$_CustomerSearchCondition instance) =>
    <String, dynamic>{
      'Criteria': instance.Criteria,
      'Operator': instance.Operator,
      'Column': instance.Column,
      'Parameter': instance.Parameter,
      'SortByColumn': instance.SortByColumn,
    };
