// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_search_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TableSearchDataResponse _$TableSearchDataResponseFromJson(
    Map<String, dynamic> json) {
  return _TableSearchDataResponse.fromJson(json);
}

/// @nodoc
mixin _$TableSearchDataResponse {
  List<TableSearchData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableSearchDataResponseCopyWith<TableSearchDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableSearchDataResponseCopyWith<$Res> {
  factory $TableSearchDataResponseCopyWith(TableSearchDataResponse value,
          $Res Function(TableSearchDataResponse) then) =
      _$TableSearchDataResponseCopyWithImpl<$Res, TableSearchDataResponse>;
  @useResult
  $Res call({List<TableSearchData>? data, String? exception});
}

/// @nodoc
class _$TableSearchDataResponseCopyWithImpl<$Res,
        $Val extends TableSearchDataResponse>
    implements $TableSearchDataResponseCopyWith<$Res> {
  _$TableSearchDataResponseCopyWithImpl(this._value, this._then);

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
              as List<TableSearchData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TableSearchDataResponseCopyWith<$Res>
    implements $TableSearchDataResponseCopyWith<$Res> {
  factory _$$_TableSearchDataResponseCopyWith(_$_TableSearchDataResponse value,
          $Res Function(_$_TableSearchDataResponse) then) =
      __$$_TableSearchDataResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TableSearchData>? data, String? exception});
}

/// @nodoc
class __$$_TableSearchDataResponseCopyWithImpl<$Res>
    extends _$TableSearchDataResponseCopyWithImpl<$Res,
        _$_TableSearchDataResponse>
    implements _$$_TableSearchDataResponseCopyWith<$Res> {
  __$$_TableSearchDataResponseCopyWithImpl(_$_TableSearchDataResponse _value,
      $Res Function(_$_TableSearchDataResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_TableSearchDataResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TableSearchData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TableSearchDataResponse implements _TableSearchDataResponse {
  const _$_TableSearchDataResponse(
      {final List<TableSearchData>? data, this.exception})
      : _data = data;

  factory _$_TableSearchDataResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TableSearchDataResponseFromJson(json);

  final List<TableSearchData>? _data;
  @override
  List<TableSearchData>? get data {
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
    return 'TableSearchDataResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableSearchDataResponse &&
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
  _$$_TableSearchDataResponseCopyWith<_$_TableSearchDataResponse>
      get copyWith =>
          __$$_TableSearchDataResponseCopyWithImpl<_$_TableSearchDataResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TableSearchDataResponseToJson(
      this,
    );
  }
}

abstract class _TableSearchDataResponse implements TableSearchDataResponse {
  const factory _TableSearchDataResponse(
      {final List<TableSearchData>? data,
      final String? exception}) = _$_TableSearchDataResponse;

  factory _TableSearchDataResponse.fromJson(Map<String, dynamic> json) =
      _$_TableSearchDataResponse.fromJson;

  @override
  List<TableSearchData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_TableSearchDataResponseCopyWith<_$_TableSearchDataResponse>
      get copyWith => throw _privateConstructorUsedError;
}
