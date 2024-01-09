// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_printers_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActivePrintersResponse _$ActivePrintersResponseFromJson(
    Map<String, dynamic> json) {
  return _ActivePrintersResponse.fromJson(json);
}

/// @nodoc
mixin _$ActivePrintersResponse {
  List<ActivePrintersData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivePrintersResponseCopyWith<ActivePrintersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivePrintersResponseCopyWith<$Res> {
  factory $ActivePrintersResponseCopyWith(ActivePrintersResponse value,
          $Res Function(ActivePrintersResponse) then) =
      _$ActivePrintersResponseCopyWithImpl<$Res, ActivePrintersResponse>;
  @useResult
  $Res call({List<ActivePrintersData>? data, String? exception});
}

/// @nodoc
class _$ActivePrintersResponseCopyWithImpl<$Res,
        $Val extends ActivePrintersResponse>
    implements $ActivePrintersResponseCopyWith<$Res> {
  _$ActivePrintersResponseCopyWithImpl(this._value, this._then);

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
              as List<ActivePrintersData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActivePrintersResponseCopyWith<$Res>
    implements $ActivePrintersResponseCopyWith<$Res> {
  factory _$$_ActivePrintersResponseCopyWith(_$_ActivePrintersResponse value,
          $Res Function(_$_ActivePrintersResponse) then) =
      __$$_ActivePrintersResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ActivePrintersData>? data, String? exception});
}

/// @nodoc
class __$$_ActivePrintersResponseCopyWithImpl<$Res>
    extends _$ActivePrintersResponseCopyWithImpl<$Res,
        _$_ActivePrintersResponse>
    implements _$$_ActivePrintersResponseCopyWith<$Res> {
  __$$_ActivePrintersResponseCopyWithImpl(_$_ActivePrintersResponse _value,
      $Res Function(_$_ActivePrintersResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_ActivePrintersResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ActivePrintersData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActivePrintersResponse implements _ActivePrintersResponse {
  const _$_ActivePrintersResponse(
      {final List<ActivePrintersData>? data, this.exception})
      : _data = data;

  factory _$_ActivePrintersResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ActivePrintersResponseFromJson(json);

  final List<ActivePrintersData>? _data;
  @override
  List<ActivePrintersData>? get data {
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
    return 'ActivePrintersResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActivePrintersResponse &&
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
  _$$_ActivePrintersResponseCopyWith<_$_ActivePrintersResponse> get copyWith =>
      __$$_ActivePrintersResponseCopyWithImpl<_$_ActivePrintersResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActivePrintersResponseToJson(
      this,
    );
  }
}

abstract class _ActivePrintersResponse implements ActivePrintersResponse {
  const factory _ActivePrintersResponse(
      {final List<ActivePrintersData>? data,
      final String? exception}) = _$_ActivePrintersResponse;

  factory _ActivePrintersResponse.fromJson(Map<String, dynamic> json) =
      _$_ActivePrintersResponse.fromJson;

  @override
  List<ActivePrintersData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ActivePrintersResponseCopyWith<_$_ActivePrintersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
