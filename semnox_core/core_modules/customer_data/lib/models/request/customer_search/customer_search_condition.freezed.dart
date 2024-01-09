// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_search_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerSearchCondition _$CustomerSearchConditionFromJson(
    Map<String, dynamic> json) {
  return _CustomerSearchCondition.fromJson(json);
}

/// @nodoc
mixin _$CustomerSearchCondition {
  String get Criteria => throw _privateConstructorUsedError;
  String get Operator => throw _privateConstructorUsedError;
  String get Column => throw _privateConstructorUsedError;
  String get Parameter => throw _privateConstructorUsedError;
  String? get SortByColumn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerSearchConditionCopyWith<CustomerSearchCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerSearchConditionCopyWith<$Res> {
  factory $CustomerSearchConditionCopyWith(CustomerSearchCondition value,
          $Res Function(CustomerSearchCondition) then) =
      _$CustomerSearchConditionCopyWithImpl<$Res, CustomerSearchCondition>;
  @useResult
  $Res call(
      {String Criteria,
      String Operator,
      String Column,
      String Parameter,
      String? SortByColumn});
}

/// @nodoc
class _$CustomerSearchConditionCopyWithImpl<$Res,
        $Val extends CustomerSearchCondition>
    implements $CustomerSearchConditionCopyWith<$Res> {
  _$CustomerSearchConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Criteria = null,
    Object? Operator = null,
    Object? Column = null,
    Object? Parameter = null,
    Object? SortByColumn = freezed,
  }) {
    return _then(_value.copyWith(
      Criteria: null == Criteria
          ? _value.Criteria
          : Criteria // ignore: cast_nullable_to_non_nullable
              as String,
      Operator: null == Operator
          ? _value.Operator
          : Operator // ignore: cast_nullable_to_non_nullable
              as String,
      Column: null == Column
          ? _value.Column
          : Column // ignore: cast_nullable_to_non_nullable
              as String,
      Parameter: null == Parameter
          ? _value.Parameter
          : Parameter // ignore: cast_nullable_to_non_nullable
              as String,
      SortByColumn: freezed == SortByColumn
          ? _value.SortByColumn
          : SortByColumn // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerSearchConditionCopyWith<$Res>
    implements $CustomerSearchConditionCopyWith<$Res> {
  factory _$$_CustomerSearchConditionCopyWith(_$_CustomerSearchCondition value,
          $Res Function(_$_CustomerSearchCondition) then) =
      __$$_CustomerSearchConditionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String Criteria,
      String Operator,
      String Column,
      String Parameter,
      String? SortByColumn});
}

/// @nodoc
class __$$_CustomerSearchConditionCopyWithImpl<$Res>
    extends _$CustomerSearchConditionCopyWithImpl<$Res,
        _$_CustomerSearchCondition>
    implements _$$_CustomerSearchConditionCopyWith<$Res> {
  __$$_CustomerSearchConditionCopyWithImpl(_$_CustomerSearchCondition _value,
      $Res Function(_$_CustomerSearchCondition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Criteria = null,
    Object? Operator = null,
    Object? Column = null,
    Object? Parameter = null,
    Object? SortByColumn = freezed,
  }) {
    return _then(_$_CustomerSearchCondition(
      Criteria: null == Criteria
          ? _value.Criteria
          : Criteria // ignore: cast_nullable_to_non_nullable
              as String,
      Operator: null == Operator
          ? _value.Operator
          : Operator // ignore: cast_nullable_to_non_nullable
              as String,
      Column: null == Column
          ? _value.Column
          : Column // ignore: cast_nullable_to_non_nullable
              as String,
      Parameter: null == Parameter
          ? _value.Parameter
          : Parameter // ignore: cast_nullable_to_non_nullable
              as String,
      SortByColumn: freezed == SortByColumn
          ? _value.SortByColumn
          : SortByColumn // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerSearchCondition implements _CustomerSearchCondition {
  const _$_CustomerSearchCondition(
      {required this.Criteria,
      required this.Operator,
      required this.Column,
      required this.Parameter,
      required this.SortByColumn});

  factory _$_CustomerSearchCondition.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerSearchConditionFromJson(json);

  @override
  final String Criteria;
  @override
  final String Operator;
  @override
  final String Column;
  @override
  final String Parameter;
  @override
  final String? SortByColumn;

  @override
  String toString() {
    return 'CustomerSearchCondition(Criteria: $Criteria, Operator: $Operator, Column: $Column, Parameter: $Parameter, SortByColumn: $SortByColumn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerSearchCondition &&
            (identical(other.Criteria, Criteria) ||
                other.Criteria == Criteria) &&
            (identical(other.Operator, Operator) ||
                other.Operator == Operator) &&
            (identical(other.Column, Column) || other.Column == Column) &&
            (identical(other.Parameter, Parameter) ||
                other.Parameter == Parameter) &&
            (identical(other.SortByColumn, SortByColumn) ||
                other.SortByColumn == SortByColumn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, Criteria, Operator, Column, Parameter, SortByColumn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerSearchConditionCopyWith<_$_CustomerSearchCondition>
      get copyWith =>
          __$$_CustomerSearchConditionCopyWithImpl<_$_CustomerSearchCondition>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerSearchConditionToJson(
      this,
    );
  }
}

abstract class _CustomerSearchCondition implements CustomerSearchCondition {
  const factory _CustomerSearchCondition(
      {required final String Criteria,
      required final String Operator,
      required final String Column,
      required final String Parameter,
      required final String? SortByColumn}) = _$_CustomerSearchCondition;

  factory _CustomerSearchCondition.fromJson(Map<String, dynamic> json) =
      _$_CustomerSearchCondition.fromJson;

  @override
  String get Criteria;
  @override
  String get Operator;
  @override
  String get Column;
  @override
  String get Parameter;
  @override
  String? get SortByColumn;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerSearchConditionCopyWith<_$_CustomerSearchCondition>
      get copyWith => throw _privateConstructorUsedError;
}
