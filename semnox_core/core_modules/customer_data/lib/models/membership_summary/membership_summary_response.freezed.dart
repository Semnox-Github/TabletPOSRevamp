// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MembershipSummaryResponse _$MembershipSummaryResponseFromJson(
    Map<String, dynamic> json) {
  return _MembershipSummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$MembershipSummaryResponse {
  String? get exception => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  MembershipSummaryData? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalNoOfPages')
  int? get totalNoOfPages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MembershipSummaryResponseCopyWith<MembershipSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipSummaryResponseCopyWith<$Res> {
  factory $MembershipSummaryResponseCopyWith(MembershipSummaryResponse value,
          $Res Function(MembershipSummaryResponse) then) =
      _$MembershipSummaryResponseCopyWithImpl<$Res, MembershipSummaryResponse>;
  @useResult
  $Res call(
      {String? exception,
      @JsonKey(name: 'data') MembershipSummaryData? data,
      @JsonKey(name: 'TotalNoOfPages') int? totalNoOfPages});

  $MembershipSummaryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$MembershipSummaryResponseCopyWithImpl<$Res,
        $Val extends MembershipSummaryResponse>
    implements $MembershipSummaryResponseCopyWith<$Res> {
  _$MembershipSummaryResponseCopyWithImpl(this._value, this._then);

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
              as MembershipSummaryData?,
      totalNoOfPages: freezed == totalNoOfPages
          ? _value.totalNoOfPages
          : totalNoOfPages // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MembershipSummaryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $MembershipSummaryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MembershipSummaryResponseCopyWith<$Res>
    implements $MembershipSummaryResponseCopyWith<$Res> {
  factory _$$_MembershipSummaryResponseCopyWith(
          _$_MembershipSummaryResponse value,
          $Res Function(_$_MembershipSummaryResponse) then) =
      __$$_MembershipSummaryResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? exception,
      @JsonKey(name: 'data') MembershipSummaryData? data,
      @JsonKey(name: 'TotalNoOfPages') int? totalNoOfPages});

  @override
  $MembershipSummaryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_MembershipSummaryResponseCopyWithImpl<$Res>
    extends _$MembershipSummaryResponseCopyWithImpl<$Res,
        _$_MembershipSummaryResponse>
    implements _$$_MembershipSummaryResponseCopyWith<$Res> {
  __$$_MembershipSummaryResponseCopyWithImpl(
      _$_MembershipSummaryResponse _value,
      $Res Function(_$_MembershipSummaryResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? data = freezed,
    Object? totalNoOfPages = freezed,
  }) {
    return _then(_$_MembershipSummaryResponse(
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MembershipSummaryData?,
      totalNoOfPages: freezed == totalNoOfPages
          ? _value.totalNoOfPages
          : totalNoOfPages // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MembershipSummaryResponse implements _MembershipSummaryResponse {
  const _$_MembershipSummaryResponse(
      {this.exception,
      @JsonKey(name: 'data') this.data,
      @JsonKey(name: 'TotalNoOfPages') this.totalNoOfPages});

  factory _$_MembershipSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MembershipSummaryResponseFromJson(json);

  @override
  final String? exception;
  @override
  @JsonKey(name: 'data')
  final MembershipSummaryData? data;
  @override
  @JsonKey(name: 'TotalNoOfPages')
  final int? totalNoOfPages;

  @override
  String toString() {
    return 'MembershipSummaryResponse(exception: $exception, data: $data, totalNoOfPages: $totalNoOfPages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MembershipSummaryResponse &&
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
  _$$_MembershipSummaryResponseCopyWith<_$_MembershipSummaryResponse>
      get copyWith => __$$_MembershipSummaryResponseCopyWithImpl<
          _$_MembershipSummaryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MembershipSummaryResponseToJson(
      this,
    );
  }
}

abstract class _MembershipSummaryResponse implements MembershipSummaryResponse {
  const factory _MembershipSummaryResponse(
          {final String? exception,
          @JsonKey(name: 'data') final MembershipSummaryData? data,
          @JsonKey(name: 'TotalNoOfPages') final int? totalNoOfPages}) =
      _$_MembershipSummaryResponse;

  factory _MembershipSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$_MembershipSummaryResponse.fromJson;

  @override
  String? get exception;
  @override
  @JsonKey(name: 'data')
  MembershipSummaryData? get data;
  @override
  @JsonKey(name: 'TotalNoOfPages')
  int? get totalNoOfPages;
  @override
  @JsonKey(ignore: true)
  _$$_MembershipSummaryResponseCopyWith<_$_MembershipSummaryResponse>
      get copyWith => throw _privateConstructorUsedError;
}
