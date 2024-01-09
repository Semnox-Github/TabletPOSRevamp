// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_attribute_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoyaltyAttributeContainerResponse _$LoyaltyAttributeContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _LoyaltyAttributeContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyAttributeContainerResponse {
  LoyaltyAttributeContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyAttributeContainerResponseCopyWith<LoyaltyAttributeContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyAttributeContainerResponseCopyWith<$Res> {
  factory $LoyaltyAttributeContainerResponseCopyWith(
          LoyaltyAttributeContainerResponse value,
          $Res Function(LoyaltyAttributeContainerResponse) then) =
      _$LoyaltyAttributeContainerResponseCopyWithImpl<$Res,
          LoyaltyAttributeContainerResponse>;
  @useResult
  $Res call({LoyaltyAttributeContainerData? data, String? exception});

  $LoyaltyAttributeContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$LoyaltyAttributeContainerResponseCopyWithImpl<$Res,
        $Val extends LoyaltyAttributeContainerResponse>
    implements $LoyaltyAttributeContainerResponseCopyWith<$Res> {
  _$LoyaltyAttributeContainerResponseCopyWithImpl(this._value, this._then);

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
              as LoyaltyAttributeContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoyaltyAttributeContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $LoyaltyAttributeContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoyaltyAttributeContainerResponseCopyWith<$Res>
    implements $LoyaltyAttributeContainerResponseCopyWith<$Res> {
  factory _$$_LoyaltyAttributeContainerResponseCopyWith(
          _$_LoyaltyAttributeContainerResponse value,
          $Res Function(_$_LoyaltyAttributeContainerResponse) then) =
      __$$_LoyaltyAttributeContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoyaltyAttributeContainerData? data, String? exception});

  @override
  $LoyaltyAttributeContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_LoyaltyAttributeContainerResponseCopyWithImpl<$Res>
    extends _$LoyaltyAttributeContainerResponseCopyWithImpl<$Res,
        _$_LoyaltyAttributeContainerResponse>
    implements _$$_LoyaltyAttributeContainerResponseCopyWith<$Res> {
  __$$_LoyaltyAttributeContainerResponseCopyWithImpl(
      _$_LoyaltyAttributeContainerResponse _value,
      $Res Function(_$_LoyaltyAttributeContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_LoyaltyAttributeContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoyaltyAttributeContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyAttributeContainerResponse
    implements _LoyaltyAttributeContainerResponse {
  const _$_LoyaltyAttributeContainerResponse({this.data, this.exception});

  factory _$_LoyaltyAttributeContainerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_LoyaltyAttributeContainerResponseFromJson(json);

  @override
  final LoyaltyAttributeContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'LoyaltyAttributeContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyAttributeContainerResponse &&
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
  _$$_LoyaltyAttributeContainerResponseCopyWith<
          _$_LoyaltyAttributeContainerResponse>
      get copyWith => __$$_LoyaltyAttributeContainerResponseCopyWithImpl<
          _$_LoyaltyAttributeContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyAttributeContainerResponseToJson(
      this,
    );
  }
}

abstract class _LoyaltyAttributeContainerResponse
    implements LoyaltyAttributeContainerResponse {
  const factory _LoyaltyAttributeContainerResponse(
      {final LoyaltyAttributeContainerData? data,
      final String? exception}) = _$_LoyaltyAttributeContainerResponse;

  factory _LoyaltyAttributeContainerResponse.fromJson(
          Map<String, dynamic> json) =
      _$_LoyaltyAttributeContainerResponse.fromJson;

  @override
  LoyaltyAttributeContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyAttributeContainerResponseCopyWith<
          _$_LoyaltyAttributeContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
