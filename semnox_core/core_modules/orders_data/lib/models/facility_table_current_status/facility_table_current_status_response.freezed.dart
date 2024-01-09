// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_table_current_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityTableCurrentStatusResponse _$FacilityTableCurrentStatusResponseFromJson(
    Map<String, dynamic> json) {
  return _FacilityTableCurrentStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$FacilityTableCurrentStatusResponse {
  List<FacilityTableCurrentStatusDTO>? get data =>
      throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityTableCurrentStatusResponseCopyWith<
          FacilityTableCurrentStatusResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityTableCurrentStatusResponseCopyWith<$Res> {
  factory $FacilityTableCurrentStatusResponseCopyWith(
          FacilityTableCurrentStatusResponse value,
          $Res Function(FacilityTableCurrentStatusResponse) then) =
      _$FacilityTableCurrentStatusResponseCopyWithImpl<$Res,
          FacilityTableCurrentStatusResponse>;
  @useResult
  $Res call({List<FacilityTableCurrentStatusDTO>? data, String? exception});
}

/// @nodoc
class _$FacilityTableCurrentStatusResponseCopyWithImpl<$Res,
        $Val extends FacilityTableCurrentStatusResponse>
    implements $FacilityTableCurrentStatusResponseCopyWith<$Res> {
  _$FacilityTableCurrentStatusResponseCopyWithImpl(this._value, this._then);

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
              as List<FacilityTableCurrentStatusDTO>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FacilityTableCurrentStatusResponseCopyWith<$Res>
    implements $FacilityTableCurrentStatusResponseCopyWith<$Res> {
  factory _$$_FacilityTableCurrentStatusResponseCopyWith(
          _$_FacilityTableCurrentStatusResponse value,
          $Res Function(_$_FacilityTableCurrentStatusResponse) then) =
      __$$_FacilityTableCurrentStatusResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FacilityTableCurrentStatusDTO>? data, String? exception});
}

/// @nodoc
class __$$_FacilityTableCurrentStatusResponseCopyWithImpl<$Res>
    extends _$FacilityTableCurrentStatusResponseCopyWithImpl<$Res,
        _$_FacilityTableCurrentStatusResponse>
    implements _$$_FacilityTableCurrentStatusResponseCopyWith<$Res> {
  __$$_FacilityTableCurrentStatusResponseCopyWithImpl(
      _$_FacilityTableCurrentStatusResponse _value,
      $Res Function(_$_FacilityTableCurrentStatusResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_FacilityTableCurrentStatusResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FacilityTableCurrentStatusDTO>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilityTableCurrentStatusResponse
    implements _FacilityTableCurrentStatusResponse {
  const _$_FacilityTableCurrentStatusResponse(
      {final List<FacilityTableCurrentStatusDTO>? data, this.exception})
      : _data = data;

  factory _$_FacilityTableCurrentStatusResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_FacilityTableCurrentStatusResponseFromJson(json);

  final List<FacilityTableCurrentStatusDTO>? _data;
  @override
  List<FacilityTableCurrentStatusDTO>? get data {
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
    return 'FacilityTableCurrentStatusResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilityTableCurrentStatusResponse &&
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
  _$$_FacilityTableCurrentStatusResponseCopyWith<
          _$_FacilityTableCurrentStatusResponse>
      get copyWith => __$$_FacilityTableCurrentStatusResponseCopyWithImpl<
          _$_FacilityTableCurrentStatusResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityTableCurrentStatusResponseToJson(
      this,
    );
  }
}

abstract class _FacilityTableCurrentStatusResponse
    implements FacilityTableCurrentStatusResponse {
  const factory _FacilityTableCurrentStatusResponse(
      {final List<FacilityTableCurrentStatusDTO>? data,
      final String? exception}) = _$_FacilityTableCurrentStatusResponse;

  factory _FacilityTableCurrentStatusResponse.fromJson(
          Map<String, dynamic> json) =
      _$_FacilityTableCurrentStatusResponse.fromJson;

  @override
  List<FacilityTableCurrentStatusDTO>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityTableCurrentStatusResponseCopyWith<
          _$_FacilityTableCurrentStatusResponse>
      get copyWith => throw _privateConstructorUsedError;
}
