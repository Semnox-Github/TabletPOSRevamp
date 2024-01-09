// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_serial_numbers_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardSerialNumbersResponse _$CardSerialNumbersResponseFromJson(
    Map<String, dynamic> json) {
  return _CardSerialNumbersResponse.fromJson(json);
}

/// @nodoc
mixin _$CardSerialNumbersResponse {
  List<CardSerialNumberData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardSerialNumbersResponseCopyWith<CardSerialNumbersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardSerialNumbersResponseCopyWith<$Res> {
  factory $CardSerialNumbersResponseCopyWith(CardSerialNumbersResponse value,
          $Res Function(CardSerialNumbersResponse) then) =
      _$CardSerialNumbersResponseCopyWithImpl<$Res, CardSerialNumbersResponse>;
  @useResult
  $Res call({List<CardSerialNumberData>? data, String? exception});
}

/// @nodoc
class _$CardSerialNumbersResponseCopyWithImpl<$Res,
        $Val extends CardSerialNumbersResponse>
    implements $CardSerialNumbersResponseCopyWith<$Res> {
  _$CardSerialNumbersResponseCopyWithImpl(this._value, this._then);

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
              as List<CardSerialNumberData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardSerialNumbersResponseCopyWith<$Res>
    implements $CardSerialNumbersResponseCopyWith<$Res> {
  factory _$$_CardSerialNumbersResponseCopyWith(
          _$_CardSerialNumbersResponse value,
          $Res Function(_$_CardSerialNumbersResponse) then) =
      __$$_CardSerialNumbersResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CardSerialNumberData>? data, String? exception});
}

/// @nodoc
class __$$_CardSerialNumbersResponseCopyWithImpl<$Res>
    extends _$CardSerialNumbersResponseCopyWithImpl<$Res,
        _$_CardSerialNumbersResponse>
    implements _$$_CardSerialNumbersResponseCopyWith<$Res> {
  __$$_CardSerialNumbersResponseCopyWithImpl(
      _$_CardSerialNumbersResponse _value,
      $Res Function(_$_CardSerialNumbersResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_CardSerialNumbersResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CardSerialNumberData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardSerialNumbersResponse implements _CardSerialNumbersResponse {
  const _$_CardSerialNumbersResponse(
      {final List<CardSerialNumberData>? data, this.exception})
      : _data = data;

  factory _$_CardSerialNumbersResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CardSerialNumbersResponseFromJson(json);

  final List<CardSerialNumberData>? _data;
  @override
  List<CardSerialNumberData>? get data {
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
    return 'CardSerialNumbersResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardSerialNumbersResponse &&
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
  _$$_CardSerialNumbersResponseCopyWith<_$_CardSerialNumbersResponse>
      get copyWith => __$$_CardSerialNumbersResponseCopyWithImpl<
          _$_CardSerialNumbersResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardSerialNumbersResponseToJson(
      this,
    );
  }
}

abstract class _CardSerialNumbersResponse implements CardSerialNumbersResponse {
  const factory _CardSerialNumbersResponse(
      {final List<CardSerialNumberData>? data,
      final String? exception}) = _$_CardSerialNumbersResponse;

  factory _CardSerialNumbersResponse.fromJson(Map<String, dynamic> json) =
      _$_CardSerialNumbersResponse.fromJson;

  @override
  List<CardSerialNumberData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_CardSerialNumbersResponseCopyWith<_$_CardSerialNumbersResponse>
      get copyWith => throw _privateConstructorUsedError;
}
