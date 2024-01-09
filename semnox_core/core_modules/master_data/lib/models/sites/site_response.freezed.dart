// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SiteResponse _$SiteResponseFromJson(Map<String, dynamic> json) {
  return _SiteResponse.fromJson(json);
}

/// @nodoc
mixin _$SiteResponse {
  SiteList? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiteResponseCopyWith<SiteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteResponseCopyWith<$Res> {
  factory $SiteResponseCopyWith(
          SiteResponse value, $Res Function(SiteResponse) then) =
      _$SiteResponseCopyWithImpl<$Res, SiteResponse>;
  @useResult
  $Res call({SiteList? data, String? exception});

  $SiteListCopyWith<$Res>? get data;
}

/// @nodoc
class _$SiteResponseCopyWithImpl<$Res, $Val extends SiteResponse>
    implements $SiteResponseCopyWith<$Res> {
  _$SiteResponseCopyWithImpl(this._value, this._then);

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
              as SiteList?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SiteListCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SiteListCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SiteResponseCopyWith<$Res>
    implements $SiteResponseCopyWith<$Res> {
  factory _$$_SiteResponseCopyWith(
          _$_SiteResponse value, $Res Function(_$_SiteResponse) then) =
      __$$_SiteResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SiteList? data, String? exception});

  @override
  $SiteListCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_SiteResponseCopyWithImpl<$Res>
    extends _$SiteResponseCopyWithImpl<$Res, _$_SiteResponse>
    implements _$$_SiteResponseCopyWith<$Res> {
  __$$_SiteResponseCopyWithImpl(
      _$_SiteResponse _value, $Res Function(_$_SiteResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_SiteResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SiteList?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SiteResponse with DiagnosticableTreeMixin implements _SiteResponse {
  const _$_SiteResponse({this.data, this.exception});

  factory _$_SiteResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SiteResponseFromJson(json);

  @override
  final SiteList? data;
  @override
  final String? exception;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SiteResponse(data: $data, exception: $exception)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SiteResponse'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('exception', exception));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SiteResponse &&
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
  _$$_SiteResponseCopyWith<_$_SiteResponse> get copyWith =>
      __$$_SiteResponseCopyWithImpl<_$_SiteResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SiteResponseToJson(
      this,
    );
  }
}

abstract class _SiteResponse implements SiteResponse {
  const factory _SiteResponse({final SiteList? data, final String? exception}) =
      _$_SiteResponse;

  factory _SiteResponse.fromJson(Map<String, dynamic> json) =
      _$_SiteResponse.fromJson;

  @override
  SiteList? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_SiteResponseCopyWith<_$_SiteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
