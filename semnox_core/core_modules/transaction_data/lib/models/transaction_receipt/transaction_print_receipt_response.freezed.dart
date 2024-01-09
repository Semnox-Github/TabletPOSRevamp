// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_print_receipt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionPrintReceiptResponse _$TransactionPrintReceiptResponseFromJson(
    Map<String, dynamic> json) {
  return _TransactionPrintReceiptResponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionPrintReceiptResponse {
  List<TransactionPrintReceiptContainerDto>? get data =>
      throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionPrintReceiptResponseCopyWith<TransactionPrintReceiptResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionPrintReceiptResponseCopyWith<$Res> {
  factory $TransactionPrintReceiptResponseCopyWith(
          TransactionPrintReceiptResponse value,
          $Res Function(TransactionPrintReceiptResponse) then) =
      _$TransactionPrintReceiptResponseCopyWithImpl<$Res,
          TransactionPrintReceiptResponse>;
  @useResult
  $Res call(
      {List<TransactionPrintReceiptContainerDto>? data, String? exception});
}

/// @nodoc
class _$TransactionPrintReceiptResponseCopyWithImpl<$Res,
        $Val extends TransactionPrintReceiptResponse>
    implements $TransactionPrintReceiptResponseCopyWith<$Res> {
  _$TransactionPrintReceiptResponseCopyWithImpl(this._value, this._then);

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
              as List<TransactionPrintReceiptContainerDto>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionPrintReceiptResponseCopyWith<$Res>
    implements $TransactionPrintReceiptResponseCopyWith<$Res> {
  factory _$$_TransactionPrintReceiptResponseCopyWith(
          _$_TransactionPrintReceiptResponse value,
          $Res Function(_$_TransactionPrintReceiptResponse) then) =
      __$$_TransactionPrintReceiptResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionPrintReceiptContainerDto>? data, String? exception});
}

/// @nodoc
class __$$_TransactionPrintReceiptResponseCopyWithImpl<$Res>
    extends _$TransactionPrintReceiptResponseCopyWithImpl<$Res,
        _$_TransactionPrintReceiptResponse>
    implements _$$_TransactionPrintReceiptResponseCopyWith<$Res> {
  __$$_TransactionPrintReceiptResponseCopyWithImpl(
      _$_TransactionPrintReceiptResponse _value,
      $Res Function(_$_TransactionPrintReceiptResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_TransactionPrintReceiptResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TransactionPrintReceiptContainerDto>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionPrintReceiptResponse
    implements _TransactionPrintReceiptResponse {
  const _$_TransactionPrintReceiptResponse(
      {final List<TransactionPrintReceiptContainerDto>? data, this.exception})
      : _data = data;

  factory _$_TransactionPrintReceiptResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_TransactionPrintReceiptResponseFromJson(json);

  final List<TransactionPrintReceiptContainerDto>? _data;
  @override
  List<TransactionPrintReceiptContainerDto>? get data {
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
    return 'TransactionPrintReceiptResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionPrintReceiptResponse &&
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
  _$$_TransactionPrintReceiptResponseCopyWith<
          _$_TransactionPrintReceiptResponse>
      get copyWith => __$$_TransactionPrintReceiptResponseCopyWithImpl<
          _$_TransactionPrintReceiptResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionPrintReceiptResponseToJson(
      this,
    );
  }
}

abstract class _TransactionPrintReceiptResponse
    implements TransactionPrintReceiptResponse {
  const factory _TransactionPrintReceiptResponse(
      {final List<TransactionPrintReceiptContainerDto>? data,
      final String? exception}) = _$_TransactionPrintReceiptResponse;

  factory _TransactionPrintReceiptResponse.fromJson(Map<String, dynamic> json) =
      _$_TransactionPrintReceiptResponse.fromJson;

  @override
  List<TransactionPrintReceiptContainerDto>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionPrintReceiptResponseCopyWith<
          _$_TransactionPrintReceiptResponse>
      get copyWith => throw _privateConstructorUsedError;
}
