// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_content_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptContentResponse _$ReceiptContentResponseFromJson(
    Map<String, dynamic> json) {
  return _ReceiptContentResponse.fromJson(json);
}

/// @nodoc
mixin _$ReceiptContentResponse {
  List<ReceiptContentData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptContentResponseCopyWith<ReceiptContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptContentResponseCopyWith<$Res> {
  factory $ReceiptContentResponseCopyWith(ReceiptContentResponse value,
          $Res Function(ReceiptContentResponse) then) =
      _$ReceiptContentResponseCopyWithImpl<$Res, ReceiptContentResponse>;
  @useResult
  $Res call({List<ReceiptContentData>? data, String? exception});
}

/// @nodoc
class _$ReceiptContentResponseCopyWithImpl<$Res,
        $Val extends ReceiptContentResponse>
    implements $ReceiptContentResponseCopyWith<$Res> {
  _$ReceiptContentResponseCopyWithImpl(this._value, this._then);

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
              as List<ReceiptContentData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceiptContentResponseCopyWith<$Res>
    implements $ReceiptContentResponseCopyWith<$Res> {
  factory _$$_ReceiptContentResponseCopyWith(_$_ReceiptContentResponse value,
          $Res Function(_$_ReceiptContentResponse) then) =
      __$$_ReceiptContentResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReceiptContentData>? data, String? exception});
}

/// @nodoc
class __$$_ReceiptContentResponseCopyWithImpl<$Res>
    extends _$ReceiptContentResponseCopyWithImpl<$Res,
        _$_ReceiptContentResponse>
    implements _$$_ReceiptContentResponseCopyWith<$Res> {
  __$$_ReceiptContentResponseCopyWithImpl(_$_ReceiptContentResponse _value,
      $Res Function(_$_ReceiptContentResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_ReceiptContentResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReceiptContentData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceiptContentResponse implements _ReceiptContentResponse {
  const _$_ReceiptContentResponse(
      {final List<ReceiptContentData>? data, this.exception})
      : _data = data;

  factory _$_ReceiptContentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ReceiptContentResponseFromJson(json);

  final List<ReceiptContentData>? _data;
  @override
  List<ReceiptContentData>? get data {
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
    return 'ReceiptContentResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiptContentResponse &&
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
  _$$_ReceiptContentResponseCopyWith<_$_ReceiptContentResponse> get copyWith =>
      __$$_ReceiptContentResponseCopyWithImpl<_$_ReceiptContentResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiptContentResponseToJson(
      this,
    );
  }
}

abstract class _ReceiptContentResponse implements ReceiptContentResponse {
  const factory _ReceiptContentResponse(
      {final List<ReceiptContentData>? data,
      final String? exception}) = _$_ReceiptContentResponse;

  factory _ReceiptContentResponse.fromJson(Map<String, dynamic> json) =
      _$_ReceiptContentResponse.fromJson;

  @override
  List<ReceiptContentData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiptContentResponseCopyWith<_$_ReceiptContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
