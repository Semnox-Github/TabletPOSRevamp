// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_search_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TableSearchCountResponse _$TableSearchCountResponseFromJson(
    Map<String, dynamic> json) {
  return _TableSearchCountResponse.fromJson(json);
}

/// @nodoc
mixin _$TableSearchCountResponse {
  int? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableSearchCountResponseCopyWith<TableSearchCountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableSearchCountResponseCopyWith<$Res> {
  factory $TableSearchCountResponseCopyWith(TableSearchCountResponse value,
          $Res Function(TableSearchCountResponse) then) =
      _$TableSearchCountResponseCopyWithImpl<$Res, TableSearchCountResponse>;
  @useResult
  $Res call({int? data, String? exception});
}

/// @nodoc
class _$TableSearchCountResponseCopyWithImpl<$Res,
        $Val extends TableSearchCountResponse>
    implements $TableSearchCountResponseCopyWith<$Res> {
  _$TableSearchCountResponseCopyWithImpl(this._value, this._then);

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
              as int?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TableSearchCountResponseCopyWith<$Res>
    implements $TableSearchCountResponseCopyWith<$Res> {
  factory _$$_TableSearchCountResponseCopyWith(
          _$_TableSearchCountResponse value,
          $Res Function(_$_TableSearchCountResponse) then) =
      __$$_TableSearchCountResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? data, String? exception});
}

/// @nodoc
class __$$_TableSearchCountResponseCopyWithImpl<$Res>
    extends _$TableSearchCountResponseCopyWithImpl<$Res,
        _$_TableSearchCountResponse>
    implements _$$_TableSearchCountResponseCopyWith<$Res> {
  __$$_TableSearchCountResponseCopyWithImpl(_$_TableSearchCountResponse _value,
      $Res Function(_$_TableSearchCountResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_TableSearchCountResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TableSearchCountResponse implements _TableSearchCountResponse {
  const _$_TableSearchCountResponse({this.data, this.exception});

  factory _$_TableSearchCountResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TableSearchCountResponseFromJson(json);

  @override
  final int? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'TableSearchCountResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableSearchCountResponse &&
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
  _$$_TableSearchCountResponseCopyWith<_$_TableSearchCountResponse>
      get copyWith => __$$_TableSearchCountResponseCopyWithImpl<
          _$_TableSearchCountResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TableSearchCountResponseToJson(
      this,
    );
  }
}

abstract class _TableSearchCountResponse implements TableSearchCountResponse {
  const factory _TableSearchCountResponse(
      {final int? data, final String? exception}) = _$_TableSearchCountResponse;

  factory _TableSearchCountResponse.fromJson(Map<String, dynamic> json) =
      _$_TableSearchCountResponse.fromJson;

  @override
  int? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_TableSearchCountResponseCopyWith<_$_TableSearchCountResponse>
      get copyWith => throw _privateConstructorUsedError;
}
