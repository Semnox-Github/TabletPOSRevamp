// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_transaction_logs_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetTransactionLogsResponse _$GetTransactionLogsResponseFromJson(
    Map<String, dynamic> json) {
  return _GetTransactionLogsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetTransactionLogsResponse {
  List<GetTransactionLogsData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetTransactionLogsResponseCopyWith<GetTransactionLogsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTransactionLogsResponseCopyWith<$Res> {
  factory $GetTransactionLogsResponseCopyWith(GetTransactionLogsResponse value,
          $Res Function(GetTransactionLogsResponse) then) =
      _$GetTransactionLogsResponseCopyWithImpl<$Res,
          GetTransactionLogsResponse>;
  @useResult
  $Res call({List<GetTransactionLogsData>? data, String? exception});
}

/// @nodoc
class _$GetTransactionLogsResponseCopyWithImpl<$Res,
        $Val extends GetTransactionLogsResponse>
    implements $GetTransactionLogsResponseCopyWith<$Res> {
  _$GetTransactionLogsResponseCopyWithImpl(this._value, this._then);

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
              as List<GetTransactionLogsData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetTransactionLogsResponseCopyWith<$Res>
    implements $GetTransactionLogsResponseCopyWith<$Res> {
  factory _$$_GetTransactionLogsResponseCopyWith(
          _$_GetTransactionLogsResponse value,
          $Res Function(_$_GetTransactionLogsResponse) then) =
      __$$_GetTransactionLogsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GetTransactionLogsData>? data, String? exception});
}

/// @nodoc
class __$$_GetTransactionLogsResponseCopyWithImpl<$Res>
    extends _$GetTransactionLogsResponseCopyWithImpl<$Res,
        _$_GetTransactionLogsResponse>
    implements _$$_GetTransactionLogsResponseCopyWith<$Res> {
  __$$_GetTransactionLogsResponseCopyWithImpl(
      _$_GetTransactionLogsResponse _value,
      $Res Function(_$_GetTransactionLogsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_GetTransactionLogsResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetTransactionLogsData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetTransactionLogsResponse implements _GetTransactionLogsResponse {
  const _$_GetTransactionLogsResponse(
      {final List<GetTransactionLogsData>? data, this.exception})
      : _data = data;

  factory _$_GetTransactionLogsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetTransactionLogsResponseFromJson(json);

  final List<GetTransactionLogsData>? _data;
  @override
  List<GetTransactionLogsData>? get data {
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
    return 'GetTransactionLogsResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetTransactionLogsResponse &&
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
  _$$_GetTransactionLogsResponseCopyWith<_$_GetTransactionLogsResponse>
      get copyWith => __$$_GetTransactionLogsResponseCopyWithImpl<
          _$_GetTransactionLogsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetTransactionLogsResponseToJson(
      this,
    );
  }
}

abstract class _GetTransactionLogsResponse
    implements GetTransactionLogsResponse {
  const factory _GetTransactionLogsResponse(
      {final List<GetTransactionLogsData>? data,
      final String? exception}) = _$_GetTransactionLogsResponse;

  factory _GetTransactionLogsResponse.fromJson(Map<String, dynamic> json) =
      _$_GetTransactionLogsResponse.fromJson;

  @override
  List<GetTransactionLogsData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_GetTransactionLogsResponseCopyWith<_$_GetTransactionLogsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
