// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_tip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmployeeTipResponse _$EmployeeTipResponseFromJson(Map<String, dynamic> json) {
  return _EmployeeTipResponse.fromJson(json);
}

/// @nodoc
mixin _$EmployeeTipResponse {
  List<EmployeeTipData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeTipResponseCopyWith<EmployeeTipResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeTipResponseCopyWith<$Res> {
  factory $EmployeeTipResponseCopyWith(
          EmployeeTipResponse value, $Res Function(EmployeeTipResponse) then) =
      _$EmployeeTipResponseCopyWithImpl<$Res, EmployeeTipResponse>;
  @useResult
  $Res call({List<EmployeeTipData>? data, String? exception});
}

/// @nodoc
class _$EmployeeTipResponseCopyWithImpl<$Res, $Val extends EmployeeTipResponse>
    implements $EmployeeTipResponseCopyWith<$Res> {
  _$EmployeeTipResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<EmployeeTipData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmployeeTipResponseCopyWith<$Res>
    implements $EmployeeTipResponseCopyWith<$Res> {
  factory _$$_EmployeeTipResponseCopyWith(_$_EmployeeTipResponse value,
          $Res Function(_$_EmployeeTipResponse) then) =
      __$$_EmployeeTipResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EmployeeTipData>? data, String? exception});
}

/// @nodoc
class __$$_EmployeeTipResponseCopyWithImpl<$Res>
    extends _$EmployeeTipResponseCopyWithImpl<$Res, _$_EmployeeTipResponse>
    implements _$$_EmployeeTipResponseCopyWith<$Res> {
  __$$_EmployeeTipResponseCopyWithImpl(_$_EmployeeTipResponse _value,
      $Res Function(_$_EmployeeTipResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_EmployeeTipResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<EmployeeTipData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmployeeTipResponse implements _EmployeeTipResponse {
  const _$_EmployeeTipResponse(
      {final List<EmployeeTipData>? data, this.exception})
      : _data = data;

  factory _$_EmployeeTipResponse.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeTipResponseFromJson(json);

  final List<EmployeeTipData>? _data;
  @override
  List<EmployeeTipData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? exception;

  @override
  String toString() {
    return 'EmployeeTipResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmployeeTipResponse &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeeTipResponseCopyWith<_$_EmployeeTipResponse> get copyWith =>
      __$$_EmployeeTipResponseCopyWithImpl<_$_EmployeeTipResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeTipResponseToJson(
      this,
    );
  }
}

abstract class _EmployeeTipResponse implements EmployeeTipResponse {
  const factory _EmployeeTipResponse(
      {final List<EmployeeTipData>? data,
      final String? exception}) = _$_EmployeeTipResponse;

  factory _EmployeeTipResponse.fromJson(Map<String, dynamic> json) =
      _$_EmployeeTipResponse.fromJson;

  @override
  List<EmployeeTipData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeTipResponseCopyWith<_$_EmployeeTipResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
