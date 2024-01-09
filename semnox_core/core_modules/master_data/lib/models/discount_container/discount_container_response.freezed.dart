// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiscountContainerResponse _$DiscountContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _DiscountContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$DiscountContainerResponse {
  DiscountContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscountContainerResponseCopyWith<DiscountContainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountContainerResponseCopyWith<$Res> {
  factory $DiscountContainerResponseCopyWith(DiscountContainerResponse value,
          $Res Function(DiscountContainerResponse) then) =
      _$DiscountContainerResponseCopyWithImpl<$Res, DiscountContainerResponse>;
  @useResult
  $Res call({DiscountContainerData? data, String? exception});

  $DiscountContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$DiscountContainerResponseCopyWithImpl<$Res,
        $Val extends DiscountContainerResponse>
    implements $DiscountContainerResponseCopyWith<$Res> {
  _$DiscountContainerResponseCopyWithImpl(this._value, this._then);

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
              as DiscountContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscountContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DiscountContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DiscountContainerResponseCopyWith<$Res>
    implements $DiscountContainerResponseCopyWith<$Res> {
  factory _$$_DiscountContainerResponseCopyWith(
          _$_DiscountContainerResponse value,
          $Res Function(_$_DiscountContainerResponse) then) =
      __$$_DiscountContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DiscountContainerData? data, String? exception});

  @override
  $DiscountContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_DiscountContainerResponseCopyWithImpl<$Res>
    extends _$DiscountContainerResponseCopyWithImpl<$Res,
        _$_DiscountContainerResponse>
    implements _$$_DiscountContainerResponseCopyWith<$Res> {
  __$$_DiscountContainerResponseCopyWithImpl(
      _$_DiscountContainerResponse _value,
      $Res Function(_$_DiscountContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_DiscountContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DiscountContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiscountContainerResponse implements _DiscountContainerResponse {
  const _$_DiscountContainerResponse({this.data, this.exception});

  factory _$_DiscountContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DiscountContainerResponseFromJson(json);

  @override
  final DiscountContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'DiscountContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscountContainerResponse &&
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
  _$$_DiscountContainerResponseCopyWith<_$_DiscountContainerResponse>
      get copyWith => __$$_DiscountContainerResponseCopyWithImpl<
          _$_DiscountContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscountContainerResponseToJson(
      this,
    );
  }
}

abstract class _DiscountContainerResponse implements DiscountContainerResponse {
  const factory _DiscountContainerResponse(
      {final DiscountContainerData? data,
      final String? exception}) = _$_DiscountContainerResponse;

  factory _DiscountContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_DiscountContainerResponse.fromJson;

  @override
  DiscountContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_DiscountContainerResponseCopyWith<_$_DiscountContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
