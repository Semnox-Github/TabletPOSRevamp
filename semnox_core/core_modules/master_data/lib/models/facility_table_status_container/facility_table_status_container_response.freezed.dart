// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_table_status_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityTableStatusContainerResponse
    _$FacilityTableStatusContainerResponseFromJson(Map<String, dynamic> json) {
  return _FacilityTableStatusContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$FacilityTableStatusContainerResponse {
  FacilityTableStatusContainerData? get data =>
      throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityTableStatusContainerResponseCopyWith<
          FacilityTableStatusContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityTableStatusContainerResponseCopyWith<$Res> {
  factory $FacilityTableStatusContainerResponseCopyWith(
          FacilityTableStatusContainerResponse value,
          $Res Function(FacilityTableStatusContainerResponse) then) =
      _$FacilityTableStatusContainerResponseCopyWithImpl<$Res,
          FacilityTableStatusContainerResponse>;
  @useResult
  $Res call({FacilityTableStatusContainerData? data, String? exception});

  $FacilityTableStatusContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$FacilityTableStatusContainerResponseCopyWithImpl<$Res,
        $Val extends FacilityTableStatusContainerResponse>
    implements $FacilityTableStatusContainerResponseCopyWith<$Res> {
  _$FacilityTableStatusContainerResponseCopyWithImpl(this._value, this._then);

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
              as FacilityTableStatusContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FacilityTableStatusContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $FacilityTableStatusContainerDataCopyWith<$Res>(_value.data!,
        (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FacilityTableStatusContainerResponseCopyWith<$Res>
    implements $FacilityTableStatusContainerResponseCopyWith<$Res> {
  factory _$$_FacilityTableStatusContainerResponseCopyWith(
          _$_FacilityTableStatusContainerResponse value,
          $Res Function(_$_FacilityTableStatusContainerResponse) then) =
      __$$_FacilityTableStatusContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FacilityTableStatusContainerData? data, String? exception});

  @override
  $FacilityTableStatusContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_FacilityTableStatusContainerResponseCopyWithImpl<$Res>
    extends _$FacilityTableStatusContainerResponseCopyWithImpl<$Res,
        _$_FacilityTableStatusContainerResponse>
    implements _$$_FacilityTableStatusContainerResponseCopyWith<$Res> {
  __$$_FacilityTableStatusContainerResponseCopyWithImpl(
      _$_FacilityTableStatusContainerResponse _value,
      $Res Function(_$_FacilityTableStatusContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_FacilityTableStatusContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FacilityTableStatusContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilityTableStatusContainerResponse
    implements _FacilityTableStatusContainerResponse {
  const _$_FacilityTableStatusContainerResponse({this.data, this.exception});

  factory _$_FacilityTableStatusContainerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_FacilityTableStatusContainerResponseFromJson(json);

  @override
  final FacilityTableStatusContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'FacilityTableStatusContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilityTableStatusContainerResponse &&
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
  _$$_FacilityTableStatusContainerResponseCopyWith<
          _$_FacilityTableStatusContainerResponse>
      get copyWith => __$$_FacilityTableStatusContainerResponseCopyWithImpl<
          _$_FacilityTableStatusContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityTableStatusContainerResponseToJson(
      this,
    );
  }
}

abstract class _FacilityTableStatusContainerResponse
    implements FacilityTableStatusContainerResponse {
  const factory _FacilityTableStatusContainerResponse(
      {final FacilityTableStatusContainerData? data,
      final String? exception}) = _$_FacilityTableStatusContainerResponse;

  factory _FacilityTableStatusContainerResponse.fromJson(
          Map<String, dynamic> json) =
      _$_FacilityTableStatusContainerResponse.fromJson;

  @override
  FacilityTableStatusContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityTableStatusContainerResponseCopyWith<
          _$_FacilityTableStatusContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
