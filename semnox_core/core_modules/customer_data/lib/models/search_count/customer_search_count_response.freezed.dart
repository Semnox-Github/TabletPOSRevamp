// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_search_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerSearchCountResponse _$CustomerSearchCountResponseFromJson(
    Map<String, dynamic> json) {
  return _CustomerSearchCountResponse.fromJson(json);
}

/// @nodoc
mixin _$CustomerSearchCountResponse {
  int get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'TotalNoOfPages')
  int get totalNoOfPages => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerSearchCountResponseCopyWith<CustomerSearchCountResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerSearchCountResponseCopyWith<$Res> {
  factory $CustomerSearchCountResponseCopyWith(
          CustomerSearchCountResponse value,
          $Res Function(CustomerSearchCountResponse) then) =
      _$CustomerSearchCountResponseCopyWithImpl<$Res,
          CustomerSearchCountResponse>;
  @useResult
  $Res call(
      {int data,
      @JsonKey(name: 'TotalNoOfPages') int totalNoOfPages,
      String? exception});
}

/// @nodoc
class _$CustomerSearchCountResponseCopyWithImpl<$Res,
        $Val extends CustomerSearchCountResponse>
    implements $CustomerSearchCountResponseCopyWith<$Res> {
  _$CustomerSearchCountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? totalNoOfPages = null,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int,
      totalNoOfPages: null == totalNoOfPages
          ? _value.totalNoOfPages
          : totalNoOfPages // ignore: cast_nullable_to_non_nullable
              as int,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerSearchCountResponseCopyWith<$Res>
    implements $CustomerSearchCountResponseCopyWith<$Res> {
  factory _$$_CustomerSearchCountResponseCopyWith(
          _$_CustomerSearchCountResponse value,
          $Res Function(_$_CustomerSearchCountResponse) then) =
      __$$_CustomerSearchCountResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int data,
      @JsonKey(name: 'TotalNoOfPages') int totalNoOfPages,
      String? exception});
}

/// @nodoc
class __$$_CustomerSearchCountResponseCopyWithImpl<$Res>
    extends _$CustomerSearchCountResponseCopyWithImpl<$Res,
        _$_CustomerSearchCountResponse>
    implements _$$_CustomerSearchCountResponseCopyWith<$Res> {
  __$$_CustomerSearchCountResponseCopyWithImpl(
      _$_CustomerSearchCountResponse _value,
      $Res Function(_$_CustomerSearchCountResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? totalNoOfPages = null,
    Object? exception = freezed,
  }) {
    return _then(_$_CustomerSearchCountResponse(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int,
      totalNoOfPages: null == totalNoOfPages
          ? _value.totalNoOfPages
          : totalNoOfPages // ignore: cast_nullable_to_non_nullable
              as int,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerSearchCountResponse
    with DiagnosticableTreeMixin
    implements _CustomerSearchCountResponse {
  const _$_CustomerSearchCountResponse(
      {required this.data,
      @JsonKey(name: 'TotalNoOfPages') required this.totalNoOfPages,
      this.exception});

  factory _$_CustomerSearchCountResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerSearchCountResponseFromJson(json);

  @override
  final int data;
  @override
  @JsonKey(name: 'TotalNoOfPages')
  final int totalNoOfPages;
  @override
  final String? exception;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CustomerSearchCountResponse(data: $data, totalNoOfPages: $totalNoOfPages, exception: $exception)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CustomerSearchCountResponse'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('totalNoOfPages', totalNoOfPages))
      ..add(DiagnosticsProperty('exception', exception));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerSearchCountResponse &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.totalNoOfPages, totalNoOfPages) ||
                other.totalNoOfPages == totalNoOfPages) &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, totalNoOfPages, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerSearchCountResponseCopyWith<_$_CustomerSearchCountResponse>
      get copyWith => __$$_CustomerSearchCountResponseCopyWithImpl<
          _$_CustomerSearchCountResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerSearchCountResponseToJson(
      this,
    );
  }
}

abstract class _CustomerSearchCountResponse
    implements CustomerSearchCountResponse {
  const factory _CustomerSearchCountResponse(
      {required final int data,
      @JsonKey(name: 'TotalNoOfPages') required final int totalNoOfPages,
      final String? exception}) = _$_CustomerSearchCountResponse;

  factory _CustomerSearchCountResponse.fromJson(Map<String, dynamic> json) =
      _$_CustomerSearchCountResponse.fromJson;

  @override
  int get data;
  @override
  @JsonKey(name: 'TotalNoOfPages')
  int get totalNoOfPages;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerSearchCountResponseCopyWith<_$_CustomerSearchCountResponse>
      get copyWith => throw _privateConstructorUsedError;
}
