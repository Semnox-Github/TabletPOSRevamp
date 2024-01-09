// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_search_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionSearchCondition _$TransactionSearchConditionFromJson(
    Map<String, dynamic> json) {
  return _TransactionSearchCondition.fromJson(json);
}

/// @nodoc
mixin _$TransactionSearchCondition {
  @JsonKey(name: 'Criteria')
  String get criteria => throw _privateConstructorUsedError;
  @JsonKey(name: 'Operator')
  String get operator => throw _privateConstructorUsedError;
  @JsonKey(name: 'Column')
  String get column => throw _privateConstructorUsedError;
  @JsonKey(name: 'Parameter')
  String get parameter => throw _privateConstructorUsedError;
  @JsonKey(name: 'SortByColumn')
  String? get sortByColumn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionSearchConditionCopyWith<TransactionSearchCondition>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSearchConditionCopyWith<$Res> {
  factory $TransactionSearchConditionCopyWith(TransactionSearchCondition value,
          $Res Function(TransactionSearchCondition) then) =
      _$TransactionSearchConditionCopyWithImpl<$Res,
          TransactionSearchCondition>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Criteria') String criteria,
      @JsonKey(name: 'Operator') String operator,
      @JsonKey(name: 'Column') String column,
      @JsonKey(name: 'Parameter') String parameter,
      @JsonKey(name: 'SortByColumn') String? sortByColumn});
}

/// @nodoc
class _$TransactionSearchConditionCopyWithImpl<$Res,
        $Val extends TransactionSearchCondition>
    implements $TransactionSearchConditionCopyWith<$Res> {
  _$TransactionSearchConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? criteria = null,
    Object? operator = null,
    Object? column = null,
    Object? parameter = null,
    Object? sortByColumn = freezed,
  }) {
    return _then(_value.copyWith(
      criteria: null == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as String,
      parameter: null == parameter
          ? _value.parameter
          : parameter // ignore: cast_nullable_to_non_nullable
              as String,
      sortByColumn: freezed == sortByColumn
          ? _value.sortByColumn
          : sortByColumn // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionSearchConditionCopyWith<$Res>
    implements $TransactionSearchConditionCopyWith<$Res> {
  factory _$$_TransactionSearchConditionCopyWith(
          _$_TransactionSearchCondition value,
          $Res Function(_$_TransactionSearchCondition) then) =
      __$$_TransactionSearchConditionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Criteria') String criteria,
      @JsonKey(name: 'Operator') String operator,
      @JsonKey(name: 'Column') String column,
      @JsonKey(name: 'Parameter') String parameter,
      @JsonKey(name: 'SortByColumn') String? sortByColumn});
}

/// @nodoc
class __$$_TransactionSearchConditionCopyWithImpl<$Res>
    extends _$TransactionSearchConditionCopyWithImpl<$Res,
        _$_TransactionSearchCondition>
    implements _$$_TransactionSearchConditionCopyWith<$Res> {
  __$$_TransactionSearchConditionCopyWithImpl(
      _$_TransactionSearchCondition _value,
      $Res Function(_$_TransactionSearchCondition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? criteria = null,
    Object? operator = null,
    Object? column = null,
    Object? parameter = null,
    Object? sortByColumn = freezed,
  }) {
    return _then(_$_TransactionSearchCondition(
      criteria: null == criteria
          ? _value.criteria
          : criteria // ignore: cast_nullable_to_non_nullable
              as String,
      operator: null == operator
          ? _value.operator
          : operator // ignore: cast_nullable_to_non_nullable
              as String,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as String,
      parameter: null == parameter
          ? _value.parameter
          : parameter // ignore: cast_nullable_to_non_nullable
              as String,
      sortByColumn: freezed == sortByColumn
          ? _value.sortByColumn
          : sortByColumn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionSearchCondition implements _TransactionSearchCondition {
  const _$_TransactionSearchCondition(
      {@JsonKey(name: 'Criteria') required this.criteria,
      @JsonKey(name: 'Operator') required this.operator,
      @JsonKey(name: 'Column') required this.column,
      @JsonKey(name: 'Parameter') required this.parameter,
      @JsonKey(name: 'SortByColumn') this.sortByColumn});

  factory _$_TransactionSearchCondition.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionSearchConditionFromJson(json);

  @override
  @JsonKey(name: 'Criteria')
  final String criteria;
  @override
  @JsonKey(name: 'Operator')
  final String operator;
  @override
  @JsonKey(name: 'Column')
  final String column;
  @override
  @JsonKey(name: 'Parameter')
  final String parameter;
  @override
  @JsonKey(name: 'SortByColumn')
  final String? sortByColumn;

  @override
  String toString() {
    return 'TransactionSearchCondition(criteria: $criteria, operator: $operator, column: $column, parameter: $parameter, sortByColumn: $sortByColumn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionSearchCondition &&
            (identical(other.criteria, criteria) ||
                other.criteria == criteria) &&
            (identical(other.operator, operator) ||
                other.operator == operator) &&
            (identical(other.column, column) || other.column == column) &&
            (identical(other.parameter, parameter) ||
                other.parameter == parameter) &&
            (identical(other.sortByColumn, sortByColumn) ||
                other.sortByColumn == sortByColumn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, criteria, operator, column, parameter, sortByColumn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionSearchConditionCopyWith<_$_TransactionSearchCondition>
      get copyWith => __$$_TransactionSearchConditionCopyWithImpl<
          _$_TransactionSearchCondition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionSearchConditionToJson(
      this,
    );
  }
}

abstract class _TransactionSearchCondition
    implements TransactionSearchCondition {
  const factory _TransactionSearchCondition(
          {@JsonKey(name: 'Criteria') required final String criteria,
          @JsonKey(name: 'Operator') required final String operator,
          @JsonKey(name: 'Column') required final String column,
          @JsonKey(name: 'Parameter') required final String parameter,
          @JsonKey(name: 'SortByColumn') final String? sortByColumn}) =
      _$_TransactionSearchCondition;

  factory _TransactionSearchCondition.fromJson(Map<String, dynamic> json) =
      _$_TransactionSearchCondition.fromJson;

  @override
  @JsonKey(name: 'Criteria')
  String get criteria;
  @override
  @JsonKey(name: 'Operator')
  String get operator;
  @override
  @JsonKey(name: 'Column')
  String get column;
  @override
  @JsonKey(name: 'Parameter')
  String get parameter;
  @override
  @JsonKey(name: 'SortByColumn')
  String? get sortByColumn;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionSearchConditionCopyWith<_$_TransactionSearchCondition>
      get copyWith => throw _privateConstructorUsedError;
}
