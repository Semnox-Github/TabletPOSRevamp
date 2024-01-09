// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_template_header_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptTemplateHeaderContainerResponse
    _$ReceiptTemplateHeaderContainerResponseFromJson(
        Map<String, dynamic> json) {
  return _ReceiptTemplateHeaderContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$ReceiptTemplateHeaderContainerResponse {
  ReceiptTemplateHeaderContainerData? get data =>
      throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptTemplateHeaderContainerResponseCopyWith<
          ReceiptTemplateHeaderContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptTemplateHeaderContainerResponseCopyWith<$Res> {
  factory $ReceiptTemplateHeaderContainerResponseCopyWith(
          ReceiptTemplateHeaderContainerResponse value,
          $Res Function(ReceiptTemplateHeaderContainerResponse) then) =
      _$ReceiptTemplateHeaderContainerResponseCopyWithImpl<$Res,
          ReceiptTemplateHeaderContainerResponse>;
  @useResult
  $Res call({ReceiptTemplateHeaderContainerData? data, String? exception});

  $ReceiptTemplateHeaderContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ReceiptTemplateHeaderContainerResponseCopyWithImpl<$Res,
        $Val extends ReceiptTemplateHeaderContainerResponse>
    implements $ReceiptTemplateHeaderContainerResponseCopyWith<$Res> {
  _$ReceiptTemplateHeaderContainerResponseCopyWithImpl(this._value, this._then);

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
              as ReceiptTemplateHeaderContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiptTemplateHeaderContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ReceiptTemplateHeaderContainerDataCopyWith<$Res>(_value.data!,
        (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReceiptTemplateHeaderContainerResponseCopyWith<$Res>
    implements $ReceiptTemplateHeaderContainerResponseCopyWith<$Res> {
  factory _$$_ReceiptTemplateHeaderContainerResponseCopyWith(
          _$_ReceiptTemplateHeaderContainerResponse value,
          $Res Function(_$_ReceiptTemplateHeaderContainerResponse) then) =
      __$$_ReceiptTemplateHeaderContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReceiptTemplateHeaderContainerData? data, String? exception});

  @override
  $ReceiptTemplateHeaderContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ReceiptTemplateHeaderContainerResponseCopyWithImpl<$Res>
    extends _$ReceiptTemplateHeaderContainerResponseCopyWithImpl<$Res,
        _$_ReceiptTemplateHeaderContainerResponse>
    implements _$$_ReceiptTemplateHeaderContainerResponseCopyWith<$Res> {
  __$$_ReceiptTemplateHeaderContainerResponseCopyWithImpl(
      _$_ReceiptTemplateHeaderContainerResponse _value,
      $Res Function(_$_ReceiptTemplateHeaderContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_ReceiptTemplateHeaderContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ReceiptTemplateHeaderContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceiptTemplateHeaderContainerResponse
    implements _ReceiptTemplateHeaderContainerResponse {
  const _$_ReceiptTemplateHeaderContainerResponse({this.data, this.exception});

  factory _$_ReceiptTemplateHeaderContainerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_ReceiptTemplateHeaderContainerResponseFromJson(json);

  @override
  final ReceiptTemplateHeaderContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'ReceiptTemplateHeaderContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiptTemplateHeaderContainerResponse &&
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
  _$$_ReceiptTemplateHeaderContainerResponseCopyWith<
          _$_ReceiptTemplateHeaderContainerResponse>
      get copyWith => __$$_ReceiptTemplateHeaderContainerResponseCopyWithImpl<
          _$_ReceiptTemplateHeaderContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiptTemplateHeaderContainerResponseToJson(
      this,
    );
  }
}

abstract class _ReceiptTemplateHeaderContainerResponse
    implements ReceiptTemplateHeaderContainerResponse {
  const factory _ReceiptTemplateHeaderContainerResponse(
      {final ReceiptTemplateHeaderContainerData? data,
      final String? exception}) = _$_ReceiptTemplateHeaderContainerResponse;

  factory _ReceiptTemplateHeaderContainerResponse.fromJson(
          Map<String, dynamic> json) =
      _$_ReceiptTemplateHeaderContainerResponse.fromJson;

  @override
  ReceiptTemplateHeaderContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiptTemplateHeaderContainerResponseCopyWith<
          _$_ReceiptTemplateHeaderContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
