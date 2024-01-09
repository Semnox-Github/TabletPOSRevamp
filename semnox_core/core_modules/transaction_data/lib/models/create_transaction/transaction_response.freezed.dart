// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) {
  return _TransactionResponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionResponse {
  TransactionData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionResponseCopyWith<TransactionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionResponseCopyWith<$Res> {
  factory $TransactionResponseCopyWith(
          TransactionResponse value, $Res Function(TransactionResponse) then) =
      _$TransactionResponseCopyWithImpl<$Res, TransactionResponse>;
  @useResult
  $Res call({TransactionData? data, String? exception});

  $TransactionDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$TransactionResponseCopyWithImpl<$Res, $Val extends TransactionResponse>
    implements $TransactionResponseCopyWith<$Res> {
  _$TransactionResponseCopyWithImpl(this._value, this._then);

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
              as TransactionData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $TransactionDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionResponseCopyWith<$Res>
    implements $TransactionResponseCopyWith<$Res> {
  factory _$$_TransactionResponseCopyWith(_$_TransactionResponse value,
          $Res Function(_$_TransactionResponse) then) =
      __$$_TransactionResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TransactionData? data, String? exception});

  @override
  $TransactionDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_TransactionResponseCopyWithImpl<$Res>
    extends _$TransactionResponseCopyWithImpl<$Res, _$_TransactionResponse>
    implements _$$_TransactionResponseCopyWith<$Res> {
  __$$_TransactionResponseCopyWithImpl(_$_TransactionResponse _value,
      $Res Function(_$_TransactionResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_TransactionResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TransactionData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionResponse implements _TransactionResponse {
  const _$_TransactionResponse({this.data, this.exception});

  factory _$_TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionResponseFromJson(json);

  @override
  final TransactionData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'TransactionResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionResponse &&
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
  _$$_TransactionResponseCopyWith<_$_TransactionResponse> get copyWith =>
      __$$_TransactionResponseCopyWithImpl<_$_TransactionResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionResponseToJson(
      this,
    );
  }
}

abstract class _TransactionResponse implements TransactionResponse {
  const factory _TransactionResponse(
      {final TransactionData? data,
      final String? exception}) = _$_TransactionResponse;

  factory _TransactionResponse.fromJson(Map<String, dynamic> json) =
      _$_TransactionResponse.fromJson;

  @override
  TransactionData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionResponseCopyWith<_$_TransactionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
