// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posx_receipt_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PosXReceiptContentResponse _$PosXReceiptContentResponseFromJson(
    Map<String, dynamic> json) {
  return _PosXReceiptContentResponse.fromJson(json);
}

/// @nodoc
mixin _$PosXReceiptContentResponse {
  @JsonKey(name: 'data')
  String? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'exception')
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PosXReceiptContentResponseCopyWith<PosXReceiptContentResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosXReceiptContentResponseCopyWith<$Res> {
  factory $PosXReceiptContentResponseCopyWith(PosXReceiptContentResponse value,
          $Res Function(PosXReceiptContentResponse) then) =
      _$PosXReceiptContentResponseCopyWithImpl<$Res,
          PosXReceiptContentResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') String? data,
      @JsonKey(name: 'exception') String? exception});
}

/// @nodoc
class _$PosXReceiptContentResponseCopyWithImpl<$Res,
        $Val extends PosXReceiptContentResponse>
    implements $PosXReceiptContentResponseCopyWith<$Res> {
  _$PosXReceiptContentResponseCopyWithImpl(this._value, this._then);

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
              as String?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PosXReceiptContentResponseCopyWith<$Res>
    implements $PosXReceiptContentResponseCopyWith<$Res> {
  factory _$$_PosXReceiptContentResponseCopyWith(
          _$_PosXReceiptContentResponse value,
          $Res Function(_$_PosXReceiptContentResponse) then) =
      __$$_PosXReceiptContentResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') String? data,
      @JsonKey(name: 'exception') String? exception});
}

/// @nodoc
class __$$_PosXReceiptContentResponseCopyWithImpl<$Res>
    extends _$PosXReceiptContentResponseCopyWithImpl<$Res,
        _$_PosXReceiptContentResponse>
    implements _$$_PosXReceiptContentResponseCopyWith<$Res> {
  __$$_PosXReceiptContentResponseCopyWithImpl(
      _$_PosXReceiptContentResponse _value,
      $Res Function(_$_PosXReceiptContentResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_PosXReceiptContentResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PosXReceiptContentResponse implements _PosXReceiptContentResponse {
  const _$_PosXReceiptContentResponse(
      {@JsonKey(name: 'data') this.data,
      @JsonKey(name: 'exception') this.exception});

  factory _$_PosXReceiptContentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PosXReceiptContentResponseFromJson(json);

  @override
  @JsonKey(name: 'data')
  final String? data;
  @override
  @JsonKey(name: 'exception')
  final String? exception;

  @override
  String toString() {
    return 'PosXReceiptContentResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PosXReceiptContentResponse &&
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
  _$$_PosXReceiptContentResponseCopyWith<_$_PosXReceiptContentResponse>
      get copyWith => __$$_PosXReceiptContentResponseCopyWithImpl<
          _$_PosXReceiptContentResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PosXReceiptContentResponseToJson(
      this,
    );
  }
}

abstract class _PosXReceiptContentResponse
    implements PosXReceiptContentResponse {
  const factory _PosXReceiptContentResponse(
          {@JsonKey(name: 'data') final String? data,
          @JsonKey(name: 'exception') final String? exception}) =
      _$_PosXReceiptContentResponse;

  factory _PosXReceiptContentResponse.fromJson(Map<String, dynamic> json) =
      _$_PosXReceiptContentResponse.fromJson;

  @override
  @JsonKey(name: 'data')
  String? get data;
  @override
  @JsonKey(name: 'exception')
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_PosXReceiptContentResponseCopyWith<_$_PosXReceiptContentResponse>
      get copyWith => throw _privateConstructorUsedError;
}
