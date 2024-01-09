// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'load_bonus_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoadBonusResponse _$LoadBonusResponseFromJson(Map<String, dynamic> json) {
  return _LoadBonusResponse.fromJson(json);
}

/// @nodoc
mixin _$LoadBonusResponse {
  LoadBonusData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadBonusResponseCopyWith<LoadBonusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadBonusResponseCopyWith<$Res> {
  factory $LoadBonusResponseCopyWith(
          LoadBonusResponse value, $Res Function(LoadBonusResponse) then) =
      _$LoadBonusResponseCopyWithImpl<$Res, LoadBonusResponse>;
  @useResult
  $Res call({LoadBonusData? data, String? exception});

  $LoadBonusDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$LoadBonusResponseCopyWithImpl<$Res, $Val extends LoadBonusResponse>
    implements $LoadBonusResponseCopyWith<$Res> {
  _$LoadBonusResponseCopyWithImpl(this._value, this._then);

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
              as LoadBonusData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoadBonusDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $LoadBonusDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoadBonusResponseCopyWith<$Res>
    implements $LoadBonusResponseCopyWith<$Res> {
  factory _$$_LoadBonusResponseCopyWith(_$_LoadBonusResponse value,
          $Res Function(_$_LoadBonusResponse) then) =
      __$$_LoadBonusResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoadBonusData? data, String? exception});

  @override
  $LoadBonusDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_LoadBonusResponseCopyWithImpl<$Res>
    extends _$LoadBonusResponseCopyWithImpl<$Res, _$_LoadBonusResponse>
    implements _$$_LoadBonusResponseCopyWith<$Res> {
  __$$_LoadBonusResponseCopyWithImpl(
      _$_LoadBonusResponse _value, $Res Function(_$_LoadBonusResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_LoadBonusResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoadBonusData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoadBonusResponse implements _LoadBonusResponse {
  const _$_LoadBonusResponse({this.data, this.exception});

  factory _$_LoadBonusResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LoadBonusResponseFromJson(json);

  @override
  final LoadBonusData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'LoadBonusResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadBonusResponse &&
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
  _$$_LoadBonusResponseCopyWith<_$_LoadBonusResponse> get copyWith =>
      __$$_LoadBonusResponseCopyWithImpl<_$_LoadBonusResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoadBonusResponseToJson(
      this,
    );
  }
}

abstract class _LoadBonusResponse implements LoadBonusResponse {
  const factory _LoadBonusResponse(
      {final LoadBonusData? data,
      final String? exception}) = _$_LoadBonusResponse;

  factory _LoadBonusResponse.fromJson(Map<String, dynamic> json) =
      _$_LoadBonusResponse.fromJson;

  @override
  LoadBonusData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_LoadBonusResponseCopyWith<_$_LoadBonusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
