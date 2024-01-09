// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summaries_counts_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SummariesCountsResponse _$SummariesCountsResponseFromJson(
    Map<String, dynamic> json) {
  return _SummariesCountsResponse.fromJson(json);
}

/// @nodoc
mixin _$SummariesCountsResponse {
  String? get exception => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  int? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalNoOfPages')
  int? get totalNoOfPages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SummariesCountsResponseCopyWith<SummariesCountsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummariesCountsResponseCopyWith<$Res> {
  factory $SummariesCountsResponseCopyWith(SummariesCountsResponse value,
          $Res Function(SummariesCountsResponse) then) =
      _$SummariesCountsResponseCopyWithImpl<$Res, SummariesCountsResponse>;
  @useResult
  $Res call(
      {String? exception,
      @JsonKey(name: 'data') int? data,
      @JsonKey(name: 'TotalNoOfPages') int? totalNoOfPages});
}

/// @nodoc
class _$SummariesCountsResponseCopyWithImpl<$Res,
        $Val extends SummariesCountsResponse>
    implements $SummariesCountsResponseCopyWith<$Res> {
  _$SummariesCountsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? data = freezed,
    Object? totalNoOfPages = freezed,
  }) {
    return _then(_value.copyWith(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int?,
      totalNoOfPages: freezed == totalNoOfPages
          ? _value.totalNoOfPages
          : totalNoOfPages // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SummariesCountsResponseCopyWith<$Res>
    implements $SummariesCountsResponseCopyWith<$Res> {
  factory _$$_SummariesCountsResponseCopyWith(_$_SummariesCountsResponse value,
          $Res Function(_$_SummariesCountsResponse) then) =
      __$$_SummariesCountsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? exception,
      @JsonKey(name: 'data') int? data,
      @JsonKey(name: 'TotalNoOfPages') int? totalNoOfPages});
}

/// @nodoc
class __$$_SummariesCountsResponseCopyWithImpl<$Res>
    extends _$SummariesCountsResponseCopyWithImpl<$Res,
        _$_SummariesCountsResponse>
    implements _$$_SummariesCountsResponseCopyWith<$Res> {
  __$$_SummariesCountsResponseCopyWithImpl(_$_SummariesCountsResponse _value,
      $Res Function(_$_SummariesCountsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? data = freezed,
    Object? totalNoOfPages = freezed,
  }) {
    return _then(_$_SummariesCountsResponse(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int?,
      totalNoOfPages: freezed == totalNoOfPages
          ? _value.totalNoOfPages
          : totalNoOfPages // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SummariesCountsResponse implements _SummariesCountsResponse {
  const _$_SummariesCountsResponse(
      {this.exception,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'TotalNoOfPages') this.totalNoOfPages});

  factory _$_SummariesCountsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SummariesCountsResponseFromJson(json);

  @override
  final String? exception;
  @override
  @JsonKey(name: 'data')
  final int? data;
  @override
  @JsonKey(name: 'TotalNoOfPages')
  final int? totalNoOfPages;

  @override
  String toString() {
    return 'SummariesCountsResponse(exception: $exception, data: $data, totalNoOfPages: $totalNoOfPages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SummariesCountsResponse &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.totalNoOfPages, totalNoOfPages) ||
                other.totalNoOfPages == totalNoOfPages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, exception, data, totalNoOfPages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SummariesCountsResponseCopyWith<_$_SummariesCountsResponse>
      get copyWith =>
          __$$_SummariesCountsResponseCopyWithImpl<_$_SummariesCountsResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SummariesCountsResponseToJson(
      this,
    );
  }
}

abstract class _SummariesCountsResponse implements SummariesCountsResponse {
  const factory _SummariesCountsResponse(
          {final String? exception,
          @JsonKey(name: 'data') final int? data,
          @JsonKey(name: 'TotalNoOfPages') final int? totalNoOfPages}) =
      _$_SummariesCountsResponse;

  factory _SummariesCountsResponse.fromJson(Map<String, dynamic> json) =
      _$_SummariesCountsResponse.fromJson;

  @override
  String? get exception;
  @override
  @JsonKey(name: 'data')
  int? get data;
  @override
  @JsonKey(name: 'TotalNoOfPages')
  int? get totalNoOfPages;
  @override
  @JsonKey(ignore: true)
  _$$_SummariesCountsResponseCopyWith<_$_SummariesCountsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
