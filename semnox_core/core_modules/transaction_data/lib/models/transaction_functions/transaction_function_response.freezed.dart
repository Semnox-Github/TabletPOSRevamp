// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_function_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionFunctionResponse _$TransactionFunctionResponseFromJson(
    Map<String, dynamic> json) {
  return _TransactionFunctionResponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionFunctionResponse {
  TransactionFunctionData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionFunctionResponseCopyWith<TransactionFunctionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFunctionResponseCopyWith<$Res> {
  factory $TransactionFunctionResponseCopyWith(
          TransactionFunctionResponse value,
          $Res Function(TransactionFunctionResponse) then) =
      _$TransactionFunctionResponseCopyWithImpl<$Res,
          TransactionFunctionResponse>;
  @useResult
  $Res call({TransactionFunctionData? data, String? exception});

  $TransactionFunctionDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$TransactionFunctionResponseCopyWithImpl<$Res,
        $Val extends TransactionFunctionResponse>
    implements $TransactionFunctionResponseCopyWith<$Res> {
  _$TransactionFunctionResponseCopyWithImpl(this._value, this._then);

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
              as TransactionFunctionData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionFunctionDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $TransactionFunctionDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionFunctionResponseCopyWith<$Res>
    implements $TransactionFunctionResponseCopyWith<$Res> {
  factory _$$_TransactionFunctionResponseCopyWith(
          _$_TransactionFunctionResponse value,
          $Res Function(_$_TransactionFunctionResponse) then) =
      __$$_TransactionFunctionResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TransactionFunctionData? data, String? exception});

  @override
  $TransactionFunctionDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_TransactionFunctionResponseCopyWithImpl<$Res>
    extends _$TransactionFunctionResponseCopyWithImpl<$Res,
        _$_TransactionFunctionResponse>
    implements _$$_TransactionFunctionResponseCopyWith<$Res> {
  __$$_TransactionFunctionResponseCopyWithImpl(
      _$_TransactionFunctionResponse _value,
      $Res Function(_$_TransactionFunctionResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_TransactionFunctionResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TransactionFunctionData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionFunctionResponse implements _TransactionFunctionResponse {
  const _$_TransactionFunctionResponse({this.data, this.exception});

  factory _$_TransactionFunctionResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFunctionResponseFromJson(json);

  @override
  final TransactionFunctionData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'TransactionFunctionResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionFunctionResponse &&
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
  _$$_TransactionFunctionResponseCopyWith<_$_TransactionFunctionResponse>
      get copyWith => __$$_TransactionFunctionResponseCopyWithImpl<
          _$_TransactionFunctionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionFunctionResponseToJson(
      this,
    );
  }
}

abstract class _TransactionFunctionResponse
    implements TransactionFunctionResponse {
  const factory _TransactionFunctionResponse(
      {final TransactionFunctionData? data,
      final String? exception}) = _$_TransactionFunctionResponse;

  factory _TransactionFunctionResponse.fromJson(Map<String, dynamic> json) =
      _$_TransactionFunctionResponse.fromJson;

  @override
  TransactionFunctionData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionFunctionResponseCopyWith<_$_TransactionFunctionResponse>
      get copyWith => throw _privateConstructorUsedError;
}
