// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionProfileResponse _$TransactionProfileResponseFromJson(
    Map<String, dynamic> json) {
  return _TransactionProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionProfileResponse {
  TransactionProfileData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionProfileResponseCopyWith<TransactionProfileResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionProfileResponseCopyWith<$Res> {
  factory $TransactionProfileResponseCopyWith(TransactionProfileResponse value,
          $Res Function(TransactionProfileResponse) then) =
      _$TransactionProfileResponseCopyWithImpl<$Res,
          TransactionProfileResponse>;
  @useResult
  $Res call({TransactionProfileData? data, String? exception});

  $TransactionProfileDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$TransactionProfileResponseCopyWithImpl<$Res,
        $Val extends TransactionProfileResponse>
    implements $TransactionProfileResponseCopyWith<$Res> {
  _$TransactionProfileResponseCopyWithImpl(this._value, this._then);

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
              as TransactionProfileData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionProfileDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $TransactionProfileDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionProfileResponseCopyWith<$Res>
    implements $TransactionProfileResponseCopyWith<$Res> {
  factory _$$_TransactionProfileResponseCopyWith(
          _$_TransactionProfileResponse value,
          $Res Function(_$_TransactionProfileResponse) then) =
      __$$_TransactionProfileResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TransactionProfileData? data, String? exception});

  @override
  $TransactionProfileDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_TransactionProfileResponseCopyWithImpl<$Res>
    extends _$TransactionProfileResponseCopyWithImpl<$Res,
        _$_TransactionProfileResponse>
    implements _$$_TransactionProfileResponseCopyWith<$Res> {
  __$$_TransactionProfileResponseCopyWithImpl(
      _$_TransactionProfileResponse _value,
      $Res Function(_$_TransactionProfileResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_TransactionProfileResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TransactionProfileData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionProfileResponse implements _TransactionProfileResponse {
  const _$_TransactionProfileResponse({this.data, this.exception});

  factory _$_TransactionProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionProfileResponseFromJson(json);

  @override
  final TransactionProfileData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'TransactionProfileResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionProfileResponse &&
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
  _$$_TransactionProfileResponseCopyWith<_$_TransactionProfileResponse>
      get copyWith => __$$_TransactionProfileResponseCopyWithImpl<
          _$_TransactionProfileResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionProfileResponseToJson(
      this,
    );
  }
}

abstract class _TransactionProfileResponse
    implements TransactionProfileResponse {
  const factory _TransactionProfileResponse(
      {final TransactionProfileData? data,
      final String? exception}) = _$_TransactionProfileResponse;

  factory _TransactionProfileResponse.fromJson(Map<String, dynamic> json) =
      _$_TransactionProfileResponse.fromJson;

  @override
  TransactionProfileData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionProfileResponseCopyWith<_$_TransactionProfileResponse>
      get copyWith => throw _privateConstructorUsedError;
}
