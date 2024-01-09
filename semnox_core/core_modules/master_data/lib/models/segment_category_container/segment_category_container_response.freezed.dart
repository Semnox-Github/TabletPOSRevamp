// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment_category_container_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SegmentCategoryContainerResponse _$SegmentCategoryContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _SegmentCategoryContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$SegmentCategoryContainerResponse {
  SegmentCategoryContainerData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SegmentCategoryContainerResponseCopyWith<SegmentCategoryContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SegmentCategoryContainerResponseCopyWith<$Res> {
  factory $SegmentCategoryContainerResponseCopyWith(
          SegmentCategoryContainerResponse value,
          $Res Function(SegmentCategoryContainerResponse) then) =
      _$SegmentCategoryContainerResponseCopyWithImpl<$Res,
          SegmentCategoryContainerResponse>;
  @useResult
  $Res call({SegmentCategoryContainerData? data, String? exception});

  $SegmentCategoryContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$SegmentCategoryContainerResponseCopyWithImpl<$Res,
        $Val extends SegmentCategoryContainerResponse>
    implements $SegmentCategoryContainerResponseCopyWith<$Res> {
  _$SegmentCategoryContainerResponseCopyWithImpl(this._value, this._then);

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
              as SegmentCategoryContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SegmentCategoryContainerDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SegmentCategoryContainerDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SegmentCategoryContainerResponseCopyWith<$Res>
    implements $SegmentCategoryContainerResponseCopyWith<$Res> {
  factory _$$_SegmentCategoryContainerResponseCopyWith(
          _$_SegmentCategoryContainerResponse value,
          $Res Function(_$_SegmentCategoryContainerResponse) then) =
      __$$_SegmentCategoryContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SegmentCategoryContainerData? data, String? exception});

  @override
  $SegmentCategoryContainerDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_SegmentCategoryContainerResponseCopyWithImpl<$Res>
    extends _$SegmentCategoryContainerResponseCopyWithImpl<$Res,
        _$_SegmentCategoryContainerResponse>
    implements _$$_SegmentCategoryContainerResponseCopyWith<$Res> {
  __$$_SegmentCategoryContainerResponseCopyWithImpl(
      _$_SegmentCategoryContainerResponse _value,
      $Res Function(_$_SegmentCategoryContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_SegmentCategoryContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SegmentCategoryContainerData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SegmentCategoryContainerResponse
    implements _SegmentCategoryContainerResponse {
  const _$_SegmentCategoryContainerResponse({this.data, this.exception});

  factory _$_SegmentCategoryContainerResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_SegmentCategoryContainerResponseFromJson(json);

  @override
  final SegmentCategoryContainerData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'SegmentCategoryContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SegmentCategoryContainerResponse &&
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
  _$$_SegmentCategoryContainerResponseCopyWith<
          _$_SegmentCategoryContainerResponse>
      get copyWith => __$$_SegmentCategoryContainerResponseCopyWithImpl<
          _$_SegmentCategoryContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SegmentCategoryContainerResponseToJson(
      this,
    );
  }
}

abstract class _SegmentCategoryContainerResponse
    implements SegmentCategoryContainerResponse {
  const factory _SegmentCategoryContainerResponse(
      {final SegmentCategoryContainerData? data,
      final String? exception}) = _$_SegmentCategoryContainerResponse;

  factory _SegmentCategoryContainerResponse.fromJson(
      Map<String, dynamic> json) = _$_SegmentCategoryContainerResponse.fromJson;

  @override
  SegmentCategoryContainerData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_SegmentCategoryContainerResponseCopyWith<
          _$_SegmentCategoryContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
