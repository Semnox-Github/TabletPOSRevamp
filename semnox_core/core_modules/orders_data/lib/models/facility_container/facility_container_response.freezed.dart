// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityContainerResponse _$FacilityContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _FaciltyContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$FacilityContainerResponse {
  FacilityContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityContainerResponseCopyWith<FacilityContainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityContainerResponseCopyWith<$Res> {
  factory $FacilityContainerResponseCopyWith(FacilityContainerResponse value,
          $Res Function(FacilityContainerResponse) then) =
      _$FacilityContainerResponseCopyWithImpl<$Res, FacilityContainerResponse>;
  @useResult
  $Res call({FacilityContainerData? data, String? exception});

  $FacilityContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$FacilityContainerResponseCopyWithImpl<$Res,
        $Val extends FacilityContainerResponse>
    implements $FacilityContainerResponseCopyWith<$Res> {
  _$FacilityContainerResponseCopyWithImpl(this._value, this._then);

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
              as FacilityContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FacilityContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $FacilityContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FaciltyContainerResponseCopyWith<$Res>
    implements $FacilityContainerResponseCopyWith<$Res> {
  factory _$$_FaciltyContainerResponseCopyWith(
          _$_FaciltyContainerResponse value,
          $Res Function(_$_FaciltyContainerResponse) then) =
      __$$_FaciltyContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FacilityContainerData? data, String? exception});

  @override
  $FacilityContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_FaciltyContainerResponseCopyWithImpl<$Res>
    extends _$FacilityContainerResponseCopyWithImpl<$Res,
        _$_FaciltyContainerResponse>
    implements _$$_FaciltyContainerResponseCopyWith<$Res> {
  __$$_FaciltyContainerResponseCopyWithImpl(_$_FaciltyContainerResponse _value,
      $Res Function(_$_FaciltyContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_FaciltyContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as FacilityContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FaciltyContainerResponse implements _FaciltyContainerResponse {
  const _$_FaciltyContainerResponse({this.data, this.exception});

  factory _$_FaciltyContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FaciltyContainerResponseFromJson(json);

  @override
  final FacilityContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'FacilityContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FaciltyContainerResponse &&
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
  _$$_FaciltyContainerResponseCopyWith<_$_FaciltyContainerResponse>
      get copyWith => __$$_FaciltyContainerResponseCopyWithImpl<
          _$_FaciltyContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FaciltyContainerResponseToJson(
      this,
    );
  }
}

abstract class _FaciltyContainerResponse implements FacilityContainerResponse {
  const factory _FaciltyContainerResponse(
      {final FacilityContainerData? data,
      final String? exception}) = _$_FaciltyContainerResponse;

  factory _FaciltyContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_FaciltyContainerResponse.fromJson;

  @override
  FacilityContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_FaciltyContainerResponseCopyWith<_$_FaciltyContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
