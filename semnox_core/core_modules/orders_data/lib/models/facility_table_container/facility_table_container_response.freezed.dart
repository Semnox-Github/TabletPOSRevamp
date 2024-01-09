// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_table_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityTableContainerResponse _$FacilityTableContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _FacilityTableContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$FacilityTableContainerResponse {
  FacilityTableContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityTableContainerResponseCopyWith<FacilityTableContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityTableContainerResponseCopyWith<$Res> {
  factory $FacilityTableContainerResponseCopyWith(
          FacilityTableContainerResponse value,
          $Res Function(FacilityTableContainerResponse) then) =
      _$FacilityTableContainerResponseCopyWithImpl<$Res,
          FacilityTableContainerResponse>;
  @useResult
  $Res call({FacilityTableContainerData? data, String? exception});

  $FacilityTableContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$FacilityTableContainerResponseCopyWithImpl<$Res,
        $Val extends FacilityTableContainerResponse>
    implements $FacilityTableContainerResponseCopyWith<$Res> {
  _$FacilityTableContainerResponseCopyWithImpl(this._value, this._then);

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
              as FacilityTableContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FacilityTableContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $FacilityTableContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FacilityTableContainerResponseCopyWith<$Res>
    implements $FacilityTableContainerResponseCopyWith<$Res> {
  factory _$$_FacilityTableContainerResponseCopyWith(
          _$_FacilityTableContainerResponse value,
          $Res Function(_$_FacilityTableContainerResponse) then) =
      __$$_FacilityTableContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FacilityTableContainerData? data, String? exception});

  @override
  $FacilityTableContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_FacilityTableContainerResponseCopyWithImpl<$Res>
    extends _$FacilityTableContainerResponseCopyWithImpl<$Res,
        _$_FacilityTableContainerResponse>
    implements _$$_FacilityTableContainerResponseCopyWith<$Res> {
  __$$_FacilityTableContainerResponseCopyWithImpl(
      _$_FacilityTableContainerResponse _value,
      $Res Function(_$_FacilityTableContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_FacilityTableContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FacilityTableContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilityTableContainerResponse
    implements _FacilityTableContainerResponse {
  const _$_FacilityTableContainerResponse({this.data, this.exception});

  factory _$_FacilityTableContainerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_FacilityTableContainerResponseFromJson(json);

  @override
  final FacilityTableContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'FacilityTableContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilityTableContainerResponse &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FacilityTableContainerResponseCopyWith<_$_FacilityTableContainerResponse>
      get copyWith => __$$_FacilityTableContainerResponseCopyWithImpl<
          _$_FacilityTableContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityTableContainerResponseToJson(
      this,
    );
  }
}

abstract class _FacilityTableContainerResponse
    implements FacilityTableContainerResponse {
  const factory _FacilityTableContainerResponse(
      {final FacilityTableContainerData? data,
      final String? exception}) = _$_FacilityTableContainerResponse;

  factory _FacilityTableContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_FacilityTableContainerResponse.fromJson;

  @override
  FacilityTableContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityTableContainerResponseCopyWith<_$_FacilityTableContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
