// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_clocked_in_users_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetClockedInUsersResponse _$GetClockedInUsersResponseFromJson(
    Map<String, dynamic> json) {
  return _GetClockedInUsersResponse.fromJson(json);
}

/// @nodoc
mixin _$GetClockedInUsersResponse {
  List<GetClockedInUsersData>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetClockedInUsersResponseCopyWith<GetClockedInUsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetClockedInUsersResponseCopyWith<$Res> {
  factory $GetClockedInUsersResponseCopyWith(GetClockedInUsersResponse value,
          $Res Function(GetClockedInUsersResponse) then) =
      _$GetClockedInUsersResponseCopyWithImpl<$Res, GetClockedInUsersResponse>;
  @useResult
  $Res call({List<GetClockedInUsersData>? data, String? exception});
}

/// @nodoc
class _$GetClockedInUsersResponseCopyWithImpl<$Res,
        $Val extends GetClockedInUsersResponse>
    implements $GetClockedInUsersResponseCopyWith<$Res> {
  _$GetClockedInUsersResponseCopyWithImpl(this._value, this._then);

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
              as List<GetClockedInUsersData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetClockedInUsersResponseCopyWith<$Res>
    implements $GetClockedInUsersResponseCopyWith<$Res> {
  factory _$$_GetClockedInUsersResponseCopyWith(
          _$_GetClockedInUsersResponse value,
          $Res Function(_$_GetClockedInUsersResponse) then) =
      __$$_GetClockedInUsersResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GetClockedInUsersData>? data, String? exception});
}

/// @nodoc
class __$$_GetClockedInUsersResponseCopyWithImpl<$Res>
    extends _$GetClockedInUsersResponseCopyWithImpl<$Res,
        _$_GetClockedInUsersResponse>
    implements _$$_GetClockedInUsersResponseCopyWith<$Res> {
  __$$_GetClockedInUsersResponseCopyWithImpl(
      _$_GetClockedInUsersResponse _value,
      $Res Function(_$_GetClockedInUsersResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_GetClockedInUsersResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GetClockedInUsersData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetClockedInUsersResponse implements _GetClockedInUsersResponse {
  const _$_GetClockedInUsersResponse(
      {final List<GetClockedInUsersData>? data, this.exception})
      : _data = data;

  factory _$_GetClockedInUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetClockedInUsersResponseFromJson(json);

  final List<GetClockedInUsersData>? _data;
  @override
  List<GetClockedInUsersData>? get data {
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
    return 'GetClockedInUsersResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetClockedInUsersResponse &&
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
  _$$_GetClockedInUsersResponseCopyWith<_$_GetClockedInUsersResponse>
      get copyWith => __$$_GetClockedInUsersResponseCopyWithImpl<
          _$_GetClockedInUsersResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetClockedInUsersResponseToJson(
      this,
    );
  }
}

abstract class _GetClockedInUsersResponse implements GetClockedInUsersResponse {
  const factory _GetClockedInUsersResponse(
      {final List<GetClockedInUsersData>? data,
      final String? exception}) = _$_GetClockedInUsersResponse;

  factory _GetClockedInUsersResponse.fromJson(Map<String, dynamic> json) =
      _$_GetClockedInUsersResponse.fromJson;

  @override
  List<GetClockedInUsersData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_GetClockedInUsersResponseCopyWith<_$_GetClockedInUsersResponse>
      get copyWith => throw _privateConstructorUsedError;
}
