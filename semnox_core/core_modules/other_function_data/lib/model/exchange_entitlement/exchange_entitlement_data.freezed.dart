// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exchange_entitlement_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExchangeEntitlementData _$ExchangeEntitlementDataFromJson(
    Map<String, dynamic> json) {
  return _ExchangeEntitlementData.fromJson(json);
}

/// @nodoc
mixin _$ExchangeEntitlementData {
  @JsonKey(name: 'CardId')
  int? get cardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'ManagerId')
  int? get managerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Remarks')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'FromValue')
  double? get fromValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'FromType')
  int? get fromType => throw _privateConstructorUsedError;
  @JsonKey(name: 'ToType')
  int? get toType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExchangeEntitlementDataCopyWith<ExchangeEntitlementData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExchangeEntitlementDataCopyWith<$Res> {
  factory $ExchangeEntitlementDataCopyWith(ExchangeEntitlementData value,
          $Res Function(ExchangeEntitlementData) then) =
      _$ExchangeEntitlementDataCopyWithImpl<$Res, ExchangeEntitlementData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CardId') int? cardId,
      @JsonKey(name: 'ManagerId') int? managerId,
      @JsonKey(name: 'Remarks') String? remarks,
      @JsonKey(name: 'FromValue') double? fromValue,
      @JsonKey(name: 'FromType') int? fromType,
      @JsonKey(name: 'ToType') int? toType});
}

/// @nodoc
class _$ExchangeEntitlementDataCopyWithImpl<$Res,
        $Val extends ExchangeEntitlementData>
    implements $ExchangeEntitlementDataCopyWith<$Res> {
  _$ExchangeEntitlementDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = freezed,
    Object? managerId = freezed,
    Object? remarks = freezed,
    Object? fromValue = freezed,
    Object? fromType = freezed,
    Object? toType = freezed,
  }) {
    return _then(_value.copyWith(
      cardId: freezed == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int?,
      managerId: freezed == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      fromValue: freezed == fromValue
          ? _value.fromValue
          : fromValue // ignore: cast_nullable_to_non_nullable
              as double?,
      fromType: freezed == fromType
          ? _value.fromType
          : fromType // ignore: cast_nullable_to_non_nullable
              as int?,
      toType: freezed == toType
          ? _value.toType
          : toType // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExchangeEntitlementDataCopyWith<$Res>
    implements $ExchangeEntitlementDataCopyWith<$Res> {
  factory _$$_ExchangeEntitlementDataCopyWith(_$_ExchangeEntitlementData value,
          $Res Function(_$_ExchangeEntitlementData) then) =
      __$$_ExchangeEntitlementDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CardId') int? cardId,
      @JsonKey(name: 'ManagerId') int? managerId,
      @JsonKey(name: 'Remarks') String? remarks,
      @JsonKey(name: 'FromValue') double? fromValue,
      @JsonKey(name: 'FromType') int? fromType,
      @JsonKey(name: 'ToType') int? toType});
}

/// @nodoc
class __$$_ExchangeEntitlementDataCopyWithImpl<$Res>
    extends _$ExchangeEntitlementDataCopyWithImpl<$Res,
        _$_ExchangeEntitlementData>
    implements _$$_ExchangeEntitlementDataCopyWith<$Res> {
  __$$_ExchangeEntitlementDataCopyWithImpl(_$_ExchangeEntitlementData _value,
      $Res Function(_$_ExchangeEntitlementData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = freezed,
    Object? managerId = freezed,
    Object? remarks = freezed,
    Object? fromValue = freezed,
    Object? fromType = freezed,
    Object? toType = freezed,
  }) {
    return _then(_$_ExchangeEntitlementData(
      cardId: freezed == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as int?,
      managerId: freezed == managerId
          ? _value.managerId
          : managerId // ignore: cast_nullable_to_non_nullable
              as int?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      fromValue: freezed == fromValue
          ? _value.fromValue
          : fromValue // ignore: cast_nullable_to_non_nullable
              as double?,
      fromType: freezed == fromType
          ? _value.fromType
          : fromType // ignore: cast_nullable_to_non_nullable
              as int?,
      toType: freezed == toType
          ? _value.toType
          : toType // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExchangeEntitlementData implements _ExchangeEntitlementData {
  const _$_ExchangeEntitlementData(
      {@JsonKey(name: 'CardId') this.cardId,
      @JsonKey(name: 'ManagerId') this.managerId,
      @JsonKey(name: 'Remarks') this.remarks,
      @JsonKey(name: 'FromValue') this.fromValue,
      @JsonKey(name: 'FromType') this.fromType,
      @JsonKey(name: 'ToType') this.toType});

  factory _$_ExchangeEntitlementData.fromJson(Map<String, dynamic> json) =>
      _$$_ExchangeEntitlementDataFromJson(json);

  @override
  @JsonKey(name: 'CardId')
  final int? cardId;
  @override
  @JsonKey(name: 'ManagerId')
  final int? managerId;
  @override
  @JsonKey(name: 'Remarks')
  final String? remarks;
  @override
  @JsonKey(name: 'FromValue')
  final double? fromValue;
  @override
  @JsonKey(name: 'FromType')
  final int? fromType;
  @override
  @JsonKey(name: 'ToType')
  final int? toType;

  @override
  String toString() {
    return 'ExchangeEntitlementData(cardId: $cardId, managerId: $managerId, remarks: $remarks, fromValue: $fromValue, fromType: $fromType, toType: $toType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExchangeEntitlementData &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.managerId, managerId) ||
                other.managerId == managerId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.fromValue, fromValue) ||
                other.fromValue == fromValue) &&
            (identical(other.fromType, fromType) ||
                other.fromType == fromType) &&
            (identical(other.toType, toType) || other.toType == toType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, cardId, managerId, remarks, fromValue, fromType, toType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExchangeEntitlementDataCopyWith<_$_ExchangeEntitlementData>
      get copyWith =>
          __$$_ExchangeEntitlementDataCopyWithImpl<_$_ExchangeEntitlementData>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExchangeEntitlementDataToJson(
      this,
    );
  }
}

abstract class _ExchangeEntitlementData implements ExchangeEntitlementData {
  const factory _ExchangeEntitlementData(
      {@JsonKey(name: 'CardId') final int? cardId,
      @JsonKey(name: 'ManagerId') final int? managerId,
      @JsonKey(name: 'Remarks') final String? remarks,
      @JsonKey(name: 'FromValue') final double? fromValue,
      @JsonKey(name: 'FromType') final int? fromType,
      @JsonKey(name: 'ToType') final int? toType}) = _$_ExchangeEntitlementData;

  factory _ExchangeEntitlementData.fromJson(Map<String, dynamic> json) =
      _$_ExchangeEntitlementData.fromJson;

  @override
  @JsonKey(name: 'CardId')
  int? get cardId;
  @override
  @JsonKey(name: 'ManagerId')
  int? get managerId;
  @override
  @JsonKey(name: 'Remarks')
  String? get remarks;
  @override
  @JsonKey(name: 'FromValue')
  double? get fromValue;
  @override
  @JsonKey(name: 'FromType')
  int? get fromType;
  @override
  @JsonKey(name: 'ToType')
  int? get toType;
  @override
  @JsonKey(ignore: true)
  _$$_ExchangeEntitlementDataCopyWith<_$_ExchangeEntitlementData>
      get copyWith => throw _privateConstructorUsedError;
}
