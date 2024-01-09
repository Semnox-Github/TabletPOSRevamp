// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summaries_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SummariesResponse _$SummariesResponseFromJson(Map<String, dynamic> json) {
  return _SummariesResponse.fromJson(json);
}

/// @nodoc
mixin _$SummariesResponse {
  List<SummariesData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummariesResponseCopyWith<SummariesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummariesResponseCopyWith<$Res> {
  factory $SummariesResponseCopyWith(
          SummariesResponse value, $Res Function(SummariesResponse) then) =
      _$SummariesResponseCopyWithImpl<$Res, SummariesResponse>;
  @useResult
  $Res call({List<SummariesData>? data, String? exception});
}

/// @nodoc
class _$SummariesResponseCopyWithImpl<$Res, $Val extends SummariesResponse>
    implements $SummariesResponseCopyWith<$Res> {
  _$SummariesResponseCopyWithImpl(this._value, this._then);

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
              as List<SummariesData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SummariesResponseCopyWith<$Res>
    implements $SummariesResponseCopyWith<$Res> {
  factory _$$_SummariesResponseCopyWith(_$_SummariesResponse value,
          $Res Function(_$_SummariesResponse) then) =
      __$$_SummariesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SummariesData>? data, String? exception});
}

/// @nodoc
class __$$_SummariesResponseCopyWithImpl<$Res>
    extends _$SummariesResponseCopyWithImpl<$Res, _$_SummariesResponse>
    implements _$$_SummariesResponseCopyWith<$Res> {
  __$$_SummariesResponseCopyWithImpl(
      _$_SummariesResponse _value, $Res Function(_$_SummariesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_SummariesResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SummariesData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SummariesResponse implements _SummariesResponse {
  const _$_SummariesResponse({final List<SummariesData>? data, this.exception})
      : _data = data;

  factory _$_SummariesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SummariesResponseFromJson(json);

  final List<SummariesData>? _data;
  @override
  List<SummariesData>? get data {
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
    return 'SummariesResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SummariesResponse &&
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
  _$$_SummariesResponseCopyWith<_$_SummariesResponse> get copyWith =>
      __$$_SummariesResponseCopyWithImpl<_$_SummariesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SummariesResponseToJson(
      this,
    );
  }
}

abstract class _SummariesResponse implements SummariesResponse {
  const factory _SummariesResponse(
      {final List<SummariesData>? data,
      final String? exception}) = _$_SummariesResponse;

  factory _SummariesResponse.fromJson(Map<String, dynamic> json) =
      _$_SummariesResponse.fromJson;

  @override
  List<SummariesData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_SummariesResponseCopyWith<_$_SummariesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
