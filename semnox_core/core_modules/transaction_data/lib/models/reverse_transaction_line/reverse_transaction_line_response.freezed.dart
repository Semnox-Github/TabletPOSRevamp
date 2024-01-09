// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reverse_transaction_line_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReverseTransactionLineResponse _$ReverseTransactionLineResponseFromJson(
    Map<String, dynamic> json) {
  return _ReverseTransactionLineResponse.fromJson(json);
}

/// @nodoc
mixin _$ReverseTransactionLineResponse {
  TransactionResponse? get transactionResponse =>
      throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReverseTransactionLineResponseCopyWith<ReverseTransactionLineResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReverseTransactionLineResponseCopyWith<$Res> {
  factory $ReverseTransactionLineResponseCopyWith(
          ReverseTransactionLineResponse value,
          $Res Function(ReverseTransactionLineResponse) then) =
      _$ReverseTransactionLineResponseCopyWithImpl<$Res,
          ReverseTransactionLineResponse>;
  @useResult
  $Res call({TransactionResponse? transactionResponse, String? exception});

  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class _$ReverseTransactionLineResponseCopyWithImpl<$Res,
        $Val extends ReverseTransactionLineResponse>
    implements $ReverseTransactionLineResponseCopyWith<$Res> {
  _$ReverseTransactionLineResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionResponse = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionResponseCopyWith<$Res>? get transactionResponse {
    if (_value.transactionResponse == null) {
      return null;
    }

    return $TransactionResponseCopyWith<$Res>(_value.transactionResponse!,
        (value) {
      return _then(_value.copyWith(transactionResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReverseTransactionLineResponseCopyWith<$Res>
    implements $ReverseTransactionLineResponseCopyWith<$Res> {
  factory _$$_ReverseTransactionLineResponseCopyWith(
          _$_ReverseTransactionLineResponse value,
          $Res Function(_$_ReverseTransactionLineResponse) then) =
      __$$_ReverseTransactionLineResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TransactionResponse? transactionResponse, String? exception});

  @override
  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class __$$_ReverseTransactionLineResponseCopyWithImpl<$Res>
    extends _$ReverseTransactionLineResponseCopyWithImpl<$Res,
        _$_ReverseTransactionLineResponse>
    implements _$$_ReverseTransactionLineResponseCopyWith<$Res> {
  __$$_ReverseTransactionLineResponseCopyWithImpl(
      _$_ReverseTransactionLineResponse _value,
      $Res Function(_$_ReverseTransactionLineResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionResponse = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_ReverseTransactionLineResponse(
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReverseTransactionLineResponse
    implements _ReverseTransactionLineResponse {
  const _$_ReverseTransactionLineResponse(
      {this.transactionResponse, this.exception});

  factory _$_ReverseTransactionLineResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_ReverseTransactionLineResponseFromJson(json);

  @override
  final TransactionResponse? transactionResponse;
  @override
  final String? exception;

  @override
  String toString() {
    return 'ReverseTransactionLineResponse(transactionResponse: $transactionResponse, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReverseTransactionLineResponse &&
            (identical(other.transactionResponse, transactionResponse) ||
                other.transactionResponse == transactionResponse) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionResponse, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReverseTransactionLineResponseCopyWith<_$_ReverseTransactionLineResponse>
      get copyWith => __$$_ReverseTransactionLineResponseCopyWithImpl<
          _$_ReverseTransactionLineResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReverseTransactionLineResponseToJson(
      this,
    );
  }
}

abstract class _ReverseTransactionLineResponse
    implements ReverseTransactionLineResponse {
  const factory _ReverseTransactionLineResponse(
      {final TransactionResponse? transactionResponse,
      final String? exception}) = _$_ReverseTransactionLineResponse;

  factory _ReverseTransactionLineResponse.fromJson(Map<String, dynamic> json) =
      _$_ReverseTransactionLineResponse.fromJson;

  @override
  TransactionResponse? get transactionResponse;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ReverseTransactionLineResponseCopyWith<_$_ReverseTransactionLineResponse>
      get copyWith => throw _privateConstructorUsedError;
}
