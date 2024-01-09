// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posz_reciept_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PosZReceiptContentResponse _$PosZReceiptContentResponseFromJson(
    Map<String, dynamic> json) {
  return _PosZReceiptContentResponse.fromJson(json);
}

/// @nodoc
mixin _$PosZReceiptContentResponse {
  @JsonKey(name: 'data')
  String? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'exception')
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PosZReceiptContentResponseCopyWith<PosZReceiptContentResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosZReceiptContentResponseCopyWith<$Res> {
  factory $PosZReceiptContentResponseCopyWith(PosZReceiptContentResponse value,
          $Res Function(PosZReceiptContentResponse) then) =
      _$PosZReceiptContentResponseCopyWithImpl<$Res,
          PosZReceiptContentResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') String? data,
      @JsonKey(name: 'exception') String? exception});
}

/// @nodoc
class _$PosZReceiptContentResponseCopyWithImpl<$Res,
        $Val extends PosZReceiptContentResponse>
    implements $PosZReceiptContentResponseCopyWith<$Res> {
  _$PosZReceiptContentResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_PosZReceiptContentResponseCopyWith<$Res>
    implements $PosZReceiptContentResponseCopyWith<$Res> {
  factory _$$_PosZReceiptContentResponseCopyWith(
          _$_PosZReceiptContentResponse value,
          $Res Function(_$_PosZReceiptContentResponse) then) =
      __$$_PosZReceiptContentResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') String? data,
      @JsonKey(name: 'exception') String? exception});
}

/// @nodoc
class __$$_PosZReceiptContentResponseCopyWithImpl<$Res>
    extends _$PosZReceiptContentResponseCopyWithImpl<$Res,
        _$_PosZReceiptContentResponse>
    implements _$$_PosZReceiptContentResponseCopyWith<$Res> {
  __$$_PosZReceiptContentResponseCopyWithImpl(
      _$_PosZReceiptContentResponse _value,
      $Res Function(_$_PosZReceiptContentResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_PosZReceiptContentResponse(
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
class _$_PosZReceiptContentResponse implements _PosZReceiptContentResponse {
  const _$_PosZReceiptContentResponse(
      {@JsonKey(name: 'data') this.data,
      @JsonKey(name: 'exception') this.exception});

  factory _$_PosZReceiptContentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PosZReceiptContentResponseFromJson(json);

  @override
  @JsonKey(name: 'data')
  final String? data;
  @override
  @JsonKey(name: 'exception')
  final String? exception;

  @override
  String toString() {
    return 'PosZReceiptContentResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PosZReceiptContentResponse &&
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
  _$$_PosZReceiptContentResponseCopyWith<_$_PosZReceiptContentResponse>
      get copyWith => __$$_PosZReceiptContentResponseCopyWithImpl<
          _$_PosZReceiptContentResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PosZReceiptContentResponseToJson(
      this,
    );
  }
}

abstract class _PosZReceiptContentResponse
    implements PosZReceiptContentResponse {
  const factory _PosZReceiptContentResponse(
          {@JsonKey(name: 'data') final String? data,
          @JsonKey(name: 'exception') final String? exception}) =
      _$_PosZReceiptContentResponse;

  factory _PosZReceiptContentResponse.fromJson(Map<String, dynamic> json) =
      _$_PosZReceiptContentResponse.fromJson;

  @override
  @JsonKey(name: 'data')
  String? get data;
  @override
  @JsonKey(name: 'exception')
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_PosZReceiptContentResponseCopyWith<_$_PosZReceiptContentResponse>
      get copyWith => throw _privateConstructorUsedError;
}
