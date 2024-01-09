// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_table_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityTableResponse _$FacilityTableResponseFromJson(
    Map<String, dynamic> json) {
  return _FacilityTableResponse.fromJson(json);
}

/// @nodoc
mixin _$FacilityTableResponse {
  dynamic? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityTableResponseCopyWith<FacilityTableResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityTableResponseCopyWith<$Res> {
  factory $FacilityTableResponseCopyWith(FacilityTableResponse value,
          $Res Function(FacilityTableResponse) then) =
      _$FacilityTableResponseCopyWithImpl<$Res, FacilityTableResponse>;
  @useResult
  $Res call({dynamic? data, String? exception});
}

/// @nodoc
class _$FacilityTableResponseCopyWithImpl<$Res,
        $Val extends FacilityTableResponse>
    implements $FacilityTableResponseCopyWith<$Res> {
  _$FacilityTableResponseCopyWithImpl(this._value, this._then);

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
              as dynamic?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FacilityTableResponseCopyWith<$Res>
    implements $FacilityTableResponseCopyWith<$Res> {
  factory _$$_FacilityTableResponseCopyWith(_$_FacilityTableResponse value,
          $Res Function(_$_FacilityTableResponse) then) =
      __$$_FacilityTableResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic? data, String? exception});
}

/// @nodoc
class __$$_FacilityTableResponseCopyWithImpl<$Res>
    extends _$FacilityTableResponseCopyWithImpl<$Res, _$_FacilityTableResponse>
    implements _$$_FacilityTableResponseCopyWith<$Res> {
  __$$_FacilityTableResponseCopyWithImpl(_$_FacilityTableResponse _value,
      $Res Function(_$_FacilityTableResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_FacilityTableResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilityTableResponse
    with DiagnosticableTreeMixin
    implements _FacilityTableResponse {
  const _$_FacilityTableResponse({this.data, this.exception});

  factory _$_FacilityTableResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FacilityTableResponseFromJson(json);

  @override
  final dynamic? data;
  @override
  final String? exception;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FacilityTableResponse(data: $data, exception: $exception)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FacilityTableResponse'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('exception', exception));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilityTableResponse &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FacilityTableResponseCopyWith<_$_FacilityTableResponse> get copyWith =>
      __$$_FacilityTableResponseCopyWithImpl<_$_FacilityTableResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityTableResponseToJson(
      this,
    );
  }
}

abstract class _FacilityTableResponse implements FacilityTableResponse {
  const factory _FacilityTableResponse(
      {final dynamic? data,
      final String? exception}) = _$_FacilityTableResponse;

  factory _FacilityTableResponse.fromJson(Map<String, dynamic> json) =
      _$_FacilityTableResponse.fromJson;

  @override
  dynamic? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityTableResponseCopyWith<_$_FacilityTableResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
