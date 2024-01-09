// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryContainerResponse _$CategoryContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _CategoryContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$CategoryContainerResponse {
  CategoryContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryContainerResponseCopyWith<CategoryContainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryContainerResponseCopyWith<$Res> {
  factory $CategoryContainerResponseCopyWith(CategoryContainerResponse value,
          $Res Function(CategoryContainerResponse) then) =
      _$CategoryContainerResponseCopyWithImpl<$Res, CategoryContainerResponse>;
  @useResult
  $Res call({CategoryContainerData? data, String? exception});

  $CategoryContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CategoryContainerResponseCopyWithImpl<$Res,
        $Val extends CategoryContainerResponse>
    implements $CategoryContainerResponseCopyWith<$Res> {
  _$CategoryContainerResponseCopyWithImpl(this._value, this._then);

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
              as CategoryContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CategoryContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CategoryContainerResponseCopyWith<$Res>
    implements $CategoryContainerResponseCopyWith<$Res> {
  factory _$$_CategoryContainerResponseCopyWith(
          _$_CategoryContainerResponse value,
          $Res Function(_$_CategoryContainerResponse) then) =
      __$$_CategoryContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CategoryContainerData? data, String? exception});

  @override
  $CategoryContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_CategoryContainerResponseCopyWithImpl<$Res>
    extends _$CategoryContainerResponseCopyWithImpl<$Res,
        _$_CategoryContainerResponse>
    implements _$$_CategoryContainerResponseCopyWith<$Res> {
  __$$_CategoryContainerResponseCopyWithImpl(
      _$_CategoryContainerResponse _value,
      $Res Function(_$_CategoryContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_CategoryContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CategoryContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryContainerResponse implements _CategoryContainerResponse {
  const _$_CategoryContainerResponse({this.data, this.exception});

  factory _$_CategoryContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryContainerResponseFromJson(json);

  @override
  final CategoryContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'CategoryContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryContainerResponse &&
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
  _$$_CategoryContainerResponseCopyWith<_$_CategoryContainerResponse>
      get copyWith => __$$_CategoryContainerResponseCopyWithImpl<
          _$_CategoryContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryContainerResponseToJson(
      this,
    );
  }
}

abstract class _CategoryContainerResponse implements CategoryContainerResponse {
  const factory _CategoryContainerResponse(
      {final CategoryContainerData? data,
      final String? exception}) = _$_CategoryContainerResponse;

  factory _CategoryContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_CategoryContainerResponse.fromJson;

  @override
  CategoryContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryContainerResponseCopyWith<_$_CategoryContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
