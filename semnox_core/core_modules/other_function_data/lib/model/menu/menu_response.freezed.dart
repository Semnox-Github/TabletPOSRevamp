// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) {
  return _MenuResponse.fromJson(json);
}

/// @nodoc
mixin _$MenuResponse {
  List<MenuDto>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuResponseCopyWith<MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuResponseCopyWith<$Res> {
  factory $MenuResponseCopyWith(
          MenuResponse value, $Res Function(MenuResponse) then) =
      _$MenuResponseCopyWithImpl<$Res, MenuResponse>;
  @useResult
  $Res call({List<MenuDto>? data, String? exception});
}

/// @nodoc
class _$MenuResponseCopyWithImpl<$Res, $Val extends MenuResponse>
    implements $MenuResponseCopyWith<$Res> {
  _$MenuResponseCopyWithImpl(this._value, this._then);

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
              as List<MenuDto>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuResponseCopyWith<$Res>
    implements $MenuResponseCopyWith<$Res> {
  factory _$$_MenuResponseCopyWith(
          _$_MenuResponse value, $Res Function(_$_MenuResponse) then) =
      __$$_MenuResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MenuDto>? data, String? exception});
}

/// @nodoc
class __$$_MenuResponseCopyWithImpl<$Res>
    extends _$MenuResponseCopyWithImpl<$Res, _$_MenuResponse>
    implements _$$_MenuResponseCopyWith<$Res> {
  __$$_MenuResponseCopyWithImpl(
      _$_MenuResponse _value, $Res Function(_$_MenuResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_MenuResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MenuDto>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuResponse implements _MenuResponse {
  const _$_MenuResponse({final List<MenuDto>? data, this.exception})
      : _data = data;

  factory _$_MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MenuResponseFromJson(json);

  final List<MenuDto>? _data;
  @override
  List<MenuDto>? get data {
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
    return 'MenuResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuResponse &&
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
  _$$_MenuResponseCopyWith<_$_MenuResponse> get copyWith =>
      __$$_MenuResponseCopyWithImpl<_$_MenuResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuResponseToJson(
      this,
    );
  }
}

abstract class _MenuResponse implements MenuResponse {
  const factory _MenuResponse(
      {final List<MenuDto>? data, final String? exception}) = _$_MenuResponse;

  factory _MenuResponse.fromJson(Map<String, dynamic> json) =
      _$_MenuResponse.fromJson;

  @override
  List<MenuDto>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_MenuResponseCopyWith<_$_MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
