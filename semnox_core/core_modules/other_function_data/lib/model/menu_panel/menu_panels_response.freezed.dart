// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_panels_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuPanelsResponse _$MenuPanelsResponseFromJson(Map<String, dynamic> json) {
  return _MenuPanelsResponse.fromJson(json);
}

/// @nodoc
mixin _$MenuPanelsResponse {
  List<MenuPanelsDto>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuPanelsResponseCopyWith<MenuPanelsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuPanelsResponseCopyWith<$Res> {
  factory $MenuPanelsResponseCopyWith(
          MenuPanelsResponse value, $Res Function(MenuPanelsResponse) then) =
      _$MenuPanelsResponseCopyWithImpl<$Res, MenuPanelsResponse>;
  @useResult
  $Res call({List<MenuPanelsDto>? data, String? exception});
}

/// @nodoc
class _$MenuPanelsResponseCopyWithImpl<$Res, $Val extends MenuPanelsResponse>
    implements $MenuPanelsResponseCopyWith<$Res> {
  _$MenuPanelsResponseCopyWithImpl(this._value, this._then);

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
              as List<MenuPanelsDto>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuPanelsResponseCopyWith<$Res>
    implements $MenuPanelsResponseCopyWith<$Res> {
  factory _$$_MenuPanelsResponseCopyWith(_$_MenuPanelsResponse value,
          $Res Function(_$_MenuPanelsResponse) then) =
      __$$_MenuPanelsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MenuPanelsDto>? data, String? exception});
}

/// @nodoc
class __$$_MenuPanelsResponseCopyWithImpl<$Res>
    extends _$MenuPanelsResponseCopyWithImpl<$Res, _$_MenuPanelsResponse>
    implements _$$_MenuPanelsResponseCopyWith<$Res> {
  __$$_MenuPanelsResponseCopyWithImpl(
      _$_MenuPanelsResponse _value, $Res Function(_$_MenuPanelsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_MenuPanelsResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MenuPanelsDto>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuPanelsResponse implements _MenuPanelsResponse {
  const _$_MenuPanelsResponse({final List<MenuPanelsDto>? data, this.exception})
      : _data = data;

  factory _$_MenuPanelsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MenuPanelsResponseFromJson(json);

  final List<MenuPanelsDto>? _data;
  @override
  List<MenuPanelsDto>? get data {
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
    return 'MenuPanelsResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuPanelsResponse &&
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
  _$$_MenuPanelsResponseCopyWith<_$_MenuPanelsResponse> get copyWith =>
      __$$_MenuPanelsResponseCopyWithImpl<_$_MenuPanelsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuPanelsResponseToJson(
      this,
    );
  }
}

abstract class _MenuPanelsResponse implements MenuPanelsResponse {
  const factory _MenuPanelsResponse(
      {final List<MenuPanelsDto>? data,
      final String? exception}) = _$_MenuPanelsResponse;

  factory _MenuPanelsResponse.fromJson(Map<String, dynamic> json) =
      _$_MenuPanelsResponse.fromJson;

  @override
  List<MenuPanelsDto>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_MenuPanelsResponseCopyWith<_$_MenuPanelsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
