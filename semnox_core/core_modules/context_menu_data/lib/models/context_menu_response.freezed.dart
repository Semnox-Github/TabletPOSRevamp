// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'context_menu_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContextMenuResponse _$ContextMenuResponseFromJson(Map<String, dynamic> json) {
  return _ContextMenuResponse.fromJson(json);
}

/// @nodoc
mixin _$ContextMenuResponse {
  ContextMenuData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContextMenuResponseCopyWith<ContextMenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextMenuResponseCopyWith<$Res> {
  factory $ContextMenuResponseCopyWith(
          ContextMenuResponse value, $Res Function(ContextMenuResponse) then) =
      _$ContextMenuResponseCopyWithImpl<$Res, ContextMenuResponse>;
  @useResult
  $Res call({ContextMenuData? data, String? exception});

  $ContextMenuDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ContextMenuResponseCopyWithImpl<$Res, $Val extends ContextMenuResponse>
    implements $ContextMenuResponseCopyWith<$Res> {
  _$ContextMenuResponseCopyWithImpl(this._value, this._then);

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
              as ContextMenuData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContextMenuDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ContextMenuDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ContextMenuResponseCopyWith<$Res>
    implements $ContextMenuResponseCopyWith<$Res> {
  factory _$$_ContextMenuResponseCopyWith(_$_ContextMenuResponse value,
          $Res Function(_$_ContextMenuResponse) then) =
      __$$_ContextMenuResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ContextMenuData? data, String? exception});

  @override
  $ContextMenuDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ContextMenuResponseCopyWithImpl<$Res>
    extends _$ContextMenuResponseCopyWithImpl<$Res, _$_ContextMenuResponse>
    implements _$$_ContextMenuResponseCopyWith<$Res> {
  __$$_ContextMenuResponseCopyWithImpl(_$_ContextMenuResponse _value,
      $Res Function(_$_ContextMenuResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_ContextMenuResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ContextMenuData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContextMenuResponse implements _ContextMenuResponse {
  const _$_ContextMenuResponse({this.data, this.exception});

  factory _$_ContextMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ContextMenuResponseFromJson(json);

  @override
  final ContextMenuData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'ContextMenuResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContextMenuResponse &&
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
  _$$_ContextMenuResponseCopyWith<_$_ContextMenuResponse> get copyWith =>
      __$$_ContextMenuResponseCopyWithImpl<_$_ContextMenuResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContextMenuResponseToJson(
      this,
    );
  }
}

abstract class _ContextMenuResponse implements ContextMenuResponse {
  const factory _ContextMenuResponse(
      {final ContextMenuData? data,
      final String? exception}) = _$_ContextMenuResponse;

  factory _ContextMenuResponse.fromJson(Map<String, dynamic> json) =
      _$_ContextMenuResponse.fromJson;

  @override
  ContextMenuData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ContextMenuResponseCopyWith<_$_ContextMenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
