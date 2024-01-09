// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reversal_reason_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReversalReasonData _$ReversalReasonDataFromJson(Map<String, dynamic> json) {
  return _ReversalReasonData.fromJson(json);
}

/// @nodoc
mixin _$ReversalReasonData {
  int? get reasonId => throw _privateConstructorUsedError;
  String? get remarks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReversalReasonDataCopyWith<ReversalReasonData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReversalReasonDataCopyWith<$Res> {
  factory $ReversalReasonDataCopyWith(
          ReversalReasonData value, $Res Function(ReversalReasonData) then) =
      _$ReversalReasonDataCopyWithImpl<$Res, ReversalReasonData>;
  @useResult
  $Res call({int? reasonId, String? remarks});
}

/// @nodoc
class _$ReversalReasonDataCopyWithImpl<$Res, $Val extends ReversalReasonData>
    implements $ReversalReasonDataCopyWith<$Res> {
  _$ReversalReasonDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reasonId = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_value.copyWith(
      reasonId: freezed == reasonId
          ? _value.reasonId
          : reasonId // ignore: cast_nullable_to_non_nullable
              as int?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReversalReasonDataCopyWith<$Res>
    implements $ReversalReasonDataCopyWith<$Res> {
  factory _$$_ReversalReasonDataCopyWith(_$_ReversalReasonData value,
          $Res Function(_$_ReversalReasonData) then) =
      __$$_ReversalReasonDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? reasonId, String? remarks});
}

/// @nodoc
class __$$_ReversalReasonDataCopyWithImpl<$Res>
    extends _$ReversalReasonDataCopyWithImpl<$Res, _$_ReversalReasonData>
    implements _$$_ReversalReasonDataCopyWith<$Res> {
  __$$_ReversalReasonDataCopyWithImpl(
      _$_ReversalReasonData _value, $Res Function(_$_ReversalReasonData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reasonId = freezed,
    Object? remarks = freezed,
  }) {
    return _then(_$_ReversalReasonData(
      reasonId: freezed == reasonId
          ? _value.reasonId
          : reasonId // ignore: cast_nullable_to_non_nullable
              as int?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReversalReasonData implements _ReversalReasonData {
  const _$_ReversalReasonData({this.reasonId, this.remarks});

  factory _$_ReversalReasonData.fromJson(Map<String, dynamic> json) =>
      _$$_ReversalReasonDataFromJson(json);

  @override
  final int? reasonId;
  @override
  final String? remarks;

  @override
  String toString() {
    return 'ReversalReasonData(reasonId: $reasonId, remarks: $remarks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReversalReasonData &&
            (identical(other.reasonId, reasonId) ||
                other.reasonId == reasonId) &&
            (identical(other.remarks, remarks) || other.remarks == remarks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reasonId, remarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReversalReasonDataCopyWith<_$_ReversalReasonData> get copyWith =>
      __$$_ReversalReasonDataCopyWithImpl<_$_ReversalReasonData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReversalReasonDataToJson(
      this,
    );
  }
}

abstract class _ReversalReasonData implements ReversalReasonData {
  const factory _ReversalReasonData(
      {final int? reasonId, final String? remarks}) = _$_ReversalReasonData;

  factory _ReversalReasonData.fromJson(Map<String, dynamic> json) =
      _$_ReversalReasonData.fromJson;

  @override
  int? get reasonId;
  @override
  String? get remarks;
  @override
  @JsonKey(ignore: true)
  _$$_ReversalReasonDataCopyWith<_$_ReversalReasonData> get copyWith =>
      throw _privateConstructorUsedError;
}
