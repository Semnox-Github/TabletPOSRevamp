// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_transaction_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionSearchResponse _$TransactionSearchResponseFromJson(
    Map<String, dynamic> json) {
  return _TransactionSearchResponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionSearchResponse {
  List<TransactionData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionSearchResponseCopyWith<TransactionSearchResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSearchResponseCopyWith<$Res> {
  factory $TransactionSearchResponseCopyWith(TransactionSearchResponse value,
          $Res Function(TransactionSearchResponse) then) =
      _$TransactionSearchResponseCopyWithImpl<$Res, TransactionSearchResponse>;
  @useResult
  $Res call({List<TransactionData>? data, String? exception});
}

/// @nodoc
class _$TransactionSearchResponseCopyWithImpl<$Res,
        $Val extends TransactionSearchResponse>
    implements $TransactionSearchResponseCopyWith<$Res> {
  _$TransactionSearchResponseCopyWithImpl(this._value, this._then);

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
              as List<TransactionData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionSearchResponseCopyWith<$Res>
    implements $TransactionSearchResponseCopyWith<$Res> {
  factory _$$_TransactionSearchResponseCopyWith(
          _$_TransactionSearchResponse value,
          $Res Function(_$_TransactionSearchResponse) then) =
      __$$_TransactionSearchResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TransactionData>? data, String? exception});
}

/// @nodoc
class __$$_TransactionSearchResponseCopyWithImpl<$Res>
    extends _$TransactionSearchResponseCopyWithImpl<$Res,
        _$_TransactionSearchResponse>
    implements _$$_TransactionSearchResponseCopyWith<$Res> {
  __$$_TransactionSearchResponseCopyWithImpl(
      _$_TransactionSearchResponse _value,
      $Res Function(_$_TransactionSearchResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_TransactionSearchResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionSearchResponse implements _TransactionSearchResponse {
  const _$_TransactionSearchResponse(
      {final List<TransactionData>? data, this.exception})
      : _data = data;

  factory _$_TransactionSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionSearchResponseFromJson(json);

  final List<TransactionData>? _data;
  @override
  List<TransactionData>? get data {
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
    return 'TransactionSearchResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionSearchResponse &&
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
  _$$_TransactionSearchResponseCopyWith<_$_TransactionSearchResponse>
      get copyWith => __$$_TransactionSearchResponseCopyWithImpl<
          _$_TransactionSearchResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionSearchResponseToJson(
      this,
    );
  }
}

abstract class _TransactionSearchResponse implements TransactionSearchResponse {
  const factory _TransactionSearchResponse(
      {final List<TransactionData>? data,
      final String? exception}) = _$_TransactionSearchResponse;

  factory _TransactionSearchResponse.fromJson(Map<String, dynamic> json) =
      _$_TransactionSearchResponse.fromJson;

  @override
  List<TransactionData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionSearchResponseCopyWith<_$_TransactionSearchResponse>
      get copyWith => throw _privateConstructorUsedError;
}
