// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionsCountResponse _$TransactionsCountResponseFromJson(
    Map<String, dynamic> json) {
  return _TTransactionsCountResponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionsCountResponse {
  int? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionsCountResponseCopyWith<TransactionsCountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsCountResponseCopyWith<$Res> {
  factory $TransactionsCountResponseCopyWith(TransactionsCountResponse value,
          $Res Function(TransactionsCountResponse) then) =
      _$TransactionsCountResponseCopyWithImpl<$Res, TransactionsCountResponse>;
  @useResult
  $Res call({int? data, String? exception});
}

/// @nodoc
class _$TransactionsCountResponseCopyWithImpl<$Res,
        $Val extends TransactionsCountResponse>
    implements $TransactionsCountResponseCopyWith<$Res> {
  _$TransactionsCountResponseCopyWithImpl(this._value, this._then);

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
              as int?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TTransactionsCountResponseCopyWith<$Res>
    implements $TransactionsCountResponseCopyWith<$Res> {
  factory _$$_TTransactionsCountResponseCopyWith(
          _$_TTransactionsCountResponse value,
          $Res Function(_$_TTransactionsCountResponse) then) =
      __$$_TTransactionsCountResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? data, String? exception});
}

/// @nodoc
class __$$_TTransactionsCountResponseCopyWithImpl<$Res>
    extends _$TransactionsCountResponseCopyWithImpl<$Res,
        _$_TTransactionsCountResponse>
    implements _$$_TTransactionsCountResponseCopyWith<$Res> {
  __$$_TTransactionsCountResponseCopyWithImpl(
      _$_TTransactionsCountResponse _value,
      $Res Function(_$_TTransactionsCountResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_TTransactionsCountResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TTransactionsCountResponse implements _TTransactionsCountResponse {
  const _$_TTransactionsCountResponse({this.data, this.exception});

  factory _$_TTransactionsCountResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TTransactionsCountResponseFromJson(json);

  @override
  final int? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'TransactionsCountResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TTransactionsCountResponse &&
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
  _$$_TTransactionsCountResponseCopyWith<_$_TTransactionsCountResponse>
      get copyWith => __$$_TTransactionsCountResponseCopyWithImpl<
          _$_TTransactionsCountResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TTransactionsCountResponseToJson(
      this,
    );
  }
}

abstract class _TTransactionsCountResponse
    implements TransactionsCountResponse {
  const factory _TTransactionsCountResponse(
      {final int? data,
      final String? exception}) = _$_TTransactionsCountResponse;

  factory _TTransactionsCountResponse.fromJson(Map<String, dynamic> json) =
      _$_TTransactionsCountResponse.fromJson;

  @override
  int? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_TTransactionsCountResponseCopyWith<_$_TTransactionsCountResponse>
      get copyWith => throw _privateConstructorUsedError;
}
