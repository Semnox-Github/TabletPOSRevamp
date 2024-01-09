// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_balance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransferBalanceResponse _$TransferBalanceResponseFromJson(
    Map<String, dynamic> json) {
  return _TransferBalanceResponse.fromJson(json);
}

/// @nodoc
mixin _$TransferBalanceResponse {
  dynamic get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransferBalanceResponseCopyWith<TransferBalanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferBalanceResponseCopyWith<$Res> {
  factory $TransferBalanceResponseCopyWith(TransferBalanceResponse value,
          $Res Function(TransferBalanceResponse) then) =
      _$TransferBalanceResponseCopyWithImpl<$Res, TransferBalanceResponse>;
  @useResult
  $Res call({dynamic data, String? exception});
}

/// @nodoc
class _$TransferBalanceResponseCopyWithImpl<$Res,
        $Val extends TransferBalanceResponse>
    implements $TransferBalanceResponseCopyWith<$Res> {
  _$TransferBalanceResponseCopyWithImpl(this._value, this._then);

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
              as dynamic,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransferBalanceResponseCopyWith<$Res>
    implements $TransferBalanceResponseCopyWith<$Res> {
  factory _$$_TransferBalanceResponseCopyWith(_$_TransferBalanceResponse value,
          $Res Function(_$_TransferBalanceResponse) then) =
      __$$_TransferBalanceResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic data, String? exception});
}

/// @nodoc
class __$$_TransferBalanceResponseCopyWithImpl<$Res>
    extends _$TransferBalanceResponseCopyWithImpl<$Res,
        _$_TransferBalanceResponse>
    implements _$$_TransferBalanceResponseCopyWith<$Res> {
  __$$_TransferBalanceResponseCopyWithImpl(_$_TransferBalanceResponse _value,
      $Res Function(_$_TransferBalanceResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_TransferBalanceResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransferBalanceResponse implements _TransferBalanceResponse {
  const _$_TransferBalanceResponse({this.data, this.exception});

  factory _$_TransferBalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TransferBalanceResponseFromJson(json);

  @override
  final dynamic data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'TransferBalanceResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransferBalanceResponse &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransferBalanceResponseCopyWith<_$_TransferBalanceResponse>
      get copyWith =>
          __$$_TransferBalanceResponseCopyWithImpl<_$_TransferBalanceResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransferBalanceResponseToJson(
      this,
    );
  }
}

abstract class _TransferBalanceResponse implements TransferBalanceResponse {
  const factory _TransferBalanceResponse(
      {final dynamic data,
      final String? exception}) = _$_TransferBalanceResponse;

  factory _TransferBalanceResponse.fromJson(Map<String, dynamic> json) =
      _$_TransferBalanceResponse.fromJson;

  @override
  dynamic get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_TransferBalanceResponseCopyWith<_$_TransferBalanceResponse>
      get copyWith => throw _privateConstructorUsedError;
}
