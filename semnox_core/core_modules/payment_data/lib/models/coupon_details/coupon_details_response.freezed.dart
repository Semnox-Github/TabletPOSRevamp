// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupon_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CouponDetailsResponse _$CouponDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _CouponDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$CouponDetailsResponse {
  List<CouponDetailsData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CouponDetailsResponseCopyWith<CouponDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CouponDetailsResponseCopyWith<$Res> {
  factory $CouponDetailsResponseCopyWith(CouponDetailsResponse value,
          $Res Function(CouponDetailsResponse) then) =
      _$CouponDetailsResponseCopyWithImpl<$Res, CouponDetailsResponse>;
  @useResult
  $Res call({List<CouponDetailsData>? data, String? exception});
}

/// @nodoc
class _$CouponDetailsResponseCopyWithImpl<$Res,
        $Val extends CouponDetailsResponse>
    implements $CouponDetailsResponseCopyWith<$Res> {
  _$CouponDetailsResponseCopyWithImpl(this._value, this._then);

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
              as List<CouponDetailsData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CouponDetailsResponseCopyWith<$Res>
    implements $CouponDetailsResponseCopyWith<$Res> {
  factory _$$_CouponDetailsResponseCopyWith(_$_CouponDetailsResponse value,
          $Res Function(_$_CouponDetailsResponse) then) =
      __$$_CouponDetailsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CouponDetailsData>? data, String? exception});
}

/// @nodoc
class __$$_CouponDetailsResponseCopyWithImpl<$Res>
    extends _$CouponDetailsResponseCopyWithImpl<$Res, _$_CouponDetailsResponse>
    implements _$$_CouponDetailsResponseCopyWith<$Res> {
  __$$_CouponDetailsResponseCopyWithImpl(_$_CouponDetailsResponse _value,
      $Res Function(_$_CouponDetailsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_CouponDetailsResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CouponDetailsData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CouponDetailsResponse implements _CouponDetailsResponse {
  const _$_CouponDetailsResponse(
      {final List<CouponDetailsData>? data, this.exception})
      : _data = data;

  factory _$_CouponDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CouponDetailsResponseFromJson(json);

  final List<CouponDetailsData>? _data;
  @override
  List<CouponDetailsData>? get data {
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
    return 'CouponDetailsResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CouponDetailsResponse &&
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
  _$$_CouponDetailsResponseCopyWith<_$_CouponDetailsResponse> get copyWith =>
      __$$_CouponDetailsResponseCopyWithImpl<_$_CouponDetailsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CouponDetailsResponseToJson(
      this,
    );
  }
}

abstract class _CouponDetailsResponse implements CouponDetailsResponse {
  const factory _CouponDetailsResponse(
      {final List<CouponDetailsData>? data,
      final String? exception}) = _$_CouponDetailsResponse;

  factory _CouponDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$_CouponDetailsResponse.fromJson;

  @override
  List<CouponDetailsData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_CouponDetailsResponseCopyWith<_$_CouponDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
