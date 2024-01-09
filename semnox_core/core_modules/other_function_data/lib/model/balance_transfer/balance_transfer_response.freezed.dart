// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_transfer_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BalanceTransferResponse _$BalanceTransferResponseFromJson(
    Map<String, dynamic> json) {
  return _BalanceTransferResponse.fromJson(json);
}

/// @nodoc
mixin _$BalanceTransferResponse {
  BalanceTransferData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceTransferResponseCopyWith<BalanceTransferResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceTransferResponseCopyWith<$Res> {
  factory $BalanceTransferResponseCopyWith(BalanceTransferResponse value,
          $Res Function(BalanceTransferResponse) then) =
      _$BalanceTransferResponseCopyWithImpl<$Res, BalanceTransferResponse>;
  @useResult
  $Res call({BalanceTransferData? data, String? exception});

  $BalanceTransferDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$BalanceTransferResponseCopyWithImpl<$Res,
        $Val extends BalanceTransferResponse>
    implements $BalanceTransferResponseCopyWith<$Res> {
  _$BalanceTransferResponseCopyWithImpl(this._value, this._then);

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
              as BalanceTransferData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BalanceTransferDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $BalanceTransferDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BalanceTransferResponseCopyWith<$Res>
    implements $BalanceTransferResponseCopyWith<$Res> {
  factory _$$_BalanceTransferResponseCopyWith(_$_BalanceTransferResponse value,
          $Res Function(_$_BalanceTransferResponse) then) =
      __$$_BalanceTransferResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BalanceTransferData? data, String? exception});

  @override
  $BalanceTransferDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_BalanceTransferResponseCopyWithImpl<$Res>
    extends _$BalanceTransferResponseCopyWithImpl<$Res,
        _$_BalanceTransferResponse>
    implements _$$_BalanceTransferResponseCopyWith<$Res> {
  __$$_BalanceTransferResponseCopyWithImpl(_$_BalanceTransferResponse _value,
      $Res Function(_$_BalanceTransferResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_BalanceTransferResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BalanceTransferData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BalanceTransferResponse implements _BalanceTransferResponse {
  const _$_BalanceTransferResponse({this.data, this.exception});

  factory _$_BalanceTransferResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BalanceTransferResponseFromJson(json);

  @override
  final BalanceTransferData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'BalanceTransferResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BalanceTransferResponse &&
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
  _$$_BalanceTransferResponseCopyWith<_$_BalanceTransferResponse>
      get copyWith =>
          __$$_BalanceTransferResponseCopyWithImpl<_$_BalanceTransferResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BalanceTransferResponseToJson(
      this,
    );
  }
}

abstract class _BalanceTransferResponse implements BalanceTransferResponse {
  const factory _BalanceTransferResponse(
      {final BalanceTransferData? data,
      final String? exception}) = _$_BalanceTransferResponse;

  factory _BalanceTransferResponse.fromJson(Map<String, dynamic> json) =
      _$_BalanceTransferResponse.fromJson;

  @override
  BalanceTransferData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_BalanceTransferResponseCopyWith<_$_BalanceTransferResponse>
      get copyWith => throw _privateConstructorUsedError;
}
