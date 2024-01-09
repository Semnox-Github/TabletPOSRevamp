// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_machines_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

POSMachinesResponse _$POSMachinesResponseFromJson(Map<String, dynamic> json) {
  return _POSMachinesResponse.fromJson(json);
}

/// @nodoc
mixin _$POSMachinesResponse {
  POSMachinesData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $POSMachinesResponseCopyWith<POSMachinesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $POSMachinesResponseCopyWith<$Res> {
  factory $POSMachinesResponseCopyWith(
          POSMachinesResponse value, $Res Function(POSMachinesResponse) then) =
      _$POSMachinesResponseCopyWithImpl<$Res, POSMachinesResponse>;
  @useResult
  $Res call({POSMachinesData? data, String? exception});

  $POSMachinesDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$POSMachinesResponseCopyWithImpl<$Res, $Val extends POSMachinesResponse>
    implements $POSMachinesResponseCopyWith<$Res> {
  _$POSMachinesResponseCopyWithImpl(this._value, this._then);

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
              as POSMachinesData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $POSMachinesDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $POSMachinesDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_POSMachinesResponseCopyWith<$Res>
    implements $POSMachinesResponseCopyWith<$Res> {
  factory _$$_POSMachinesResponseCopyWith(_$_POSMachinesResponse value,
          $Res Function(_$_POSMachinesResponse) then) =
      __$$_POSMachinesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({POSMachinesData? data, String? exception});

  @override
  $POSMachinesDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_POSMachinesResponseCopyWithImpl<$Res>
    extends _$POSMachinesResponseCopyWithImpl<$Res, _$_POSMachinesResponse>
    implements _$$_POSMachinesResponseCopyWith<$Res> {
  __$$_POSMachinesResponseCopyWithImpl(_$_POSMachinesResponse _value,
      $Res Function(_$_POSMachinesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_POSMachinesResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as POSMachinesData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_POSMachinesResponse implements _POSMachinesResponse {
  const _$_POSMachinesResponse({this.data, this.exception});

  factory _$_POSMachinesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_POSMachinesResponseFromJson(json);

  @override
  final POSMachinesData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'POSMachinesResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_POSMachinesResponse &&
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
  _$$_POSMachinesResponseCopyWith<_$_POSMachinesResponse> get copyWith =>
      __$$_POSMachinesResponseCopyWithImpl<_$_POSMachinesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_POSMachinesResponseToJson(
      this,
    );
  }
}

abstract class _POSMachinesResponse implements POSMachinesResponse {
  const factory _POSMachinesResponse(
      {final POSMachinesData? data,
      final String? exception}) = _$_POSMachinesResponse;

  factory _POSMachinesResponse.fromJson(Map<String, dynamic> json) =
      _$_POSMachinesResponse.fromJson;

  @override
  POSMachinesData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_POSMachinesResponseCopyWith<_$_POSMachinesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
