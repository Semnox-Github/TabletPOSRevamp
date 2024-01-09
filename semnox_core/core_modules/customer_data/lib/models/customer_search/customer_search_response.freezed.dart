// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_search_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerSearchResponse _$CustomerSearchResponseFromJson(
    Map<String, dynamic> json) {
  return _CustomerSearchResponse.fromJson(json);
}

/// @nodoc
mixin _$CustomerSearchResponse {
  List<CustomerData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerSearchResponseCopyWith<CustomerSearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerSearchResponseCopyWith<$Res> {
  factory $CustomerSearchResponseCopyWith(CustomerSearchResponse value,
          $Res Function(CustomerSearchResponse) then) =
      _$CustomerSearchResponseCopyWithImpl<$Res, CustomerSearchResponse>;
  @useResult
  $Res call({List<CustomerData>? data, String? exception});
}

/// @nodoc
class _$CustomerSearchResponseCopyWithImpl<$Res,
        $Val extends CustomerSearchResponse>
    implements $CustomerSearchResponseCopyWith<$Res> {
  _$CustomerSearchResponseCopyWithImpl(this._value, this._then);

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
              as List<CustomerData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerSearchResponseCopyWith<$Res>
    implements $CustomerSearchResponseCopyWith<$Res> {
  factory _$$_CustomerSearchResponseCopyWith(_$_CustomerSearchResponse value,
          $Res Function(_$_CustomerSearchResponse) then) =
      __$$_CustomerSearchResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CustomerData>? data, String? exception});
}

/// @nodoc
class __$$_CustomerSearchResponseCopyWithImpl<$Res>
    extends _$CustomerSearchResponseCopyWithImpl<$Res,
        _$_CustomerSearchResponse>
    implements _$$_CustomerSearchResponseCopyWith<$Res> {
  __$$_CustomerSearchResponseCopyWithImpl(_$_CustomerSearchResponse _value,
      $Res Function(_$_CustomerSearchResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_CustomerSearchResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CustomerData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerSearchResponse implements _CustomerSearchResponse {
  const _$_CustomerSearchResponse(
      {final List<CustomerData>? data, this.exception})
      : _data = data;

  factory _$_CustomerSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerSearchResponseFromJson(json);

  final List<CustomerData>? _data;
  @override
  List<CustomerData>? get data {
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
    return 'CustomerSearchResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerSearchResponse &&
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
  _$$_CustomerSearchResponseCopyWith<_$_CustomerSearchResponse> get copyWith =>
      __$$_CustomerSearchResponseCopyWithImpl<_$_CustomerSearchResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerSearchResponseToJson(
      this,
    );
  }
}

abstract class _CustomerSearchResponse implements CustomerSearchResponse {
  const factory _CustomerSearchResponse(
      {final List<CustomerData>? data,
      final String? exception}) = _$_CustomerSearchResponse;

  factory _CustomerSearchResponse.fromJson(Map<String, dynamic> json) =
      _$_CustomerSearchResponse.fromJson;

  @override
  List<CustomerData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerSearchResponseCopyWith<_$_CustomerSearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
