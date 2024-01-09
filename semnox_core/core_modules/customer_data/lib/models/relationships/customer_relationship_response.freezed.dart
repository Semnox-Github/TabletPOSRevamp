// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_relationship_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerRelationshipResponse _$CustomerRelationshipResponseFromJson(
    Map<String, dynamic> json) {
  return _CustomerRelationshipResponse.fromJson(json);
}

/// @nodoc
mixin _$CustomerRelationshipResponse {
  List<CustomerRelationshipData>? get data =>
      throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerRelationshipResponseCopyWith<CustomerRelationshipResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerRelationshipResponseCopyWith<$Res> {
  factory $CustomerRelationshipResponseCopyWith(
          CustomerRelationshipResponse value,
          $Res Function(CustomerRelationshipResponse) then) =
      _$CustomerRelationshipResponseCopyWithImpl<$Res,
          CustomerRelationshipResponse>;
  @useResult
  $Res call({List<CustomerRelationshipData>? data, String? exception});
}

/// @nodoc
class _$CustomerRelationshipResponseCopyWithImpl<$Res,
        $Val extends CustomerRelationshipResponse>
    implements $CustomerRelationshipResponseCopyWith<$Res> {
  _$CustomerRelationshipResponseCopyWithImpl(this._value, this._then);

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
              as List<CustomerRelationshipData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerRelationshipResponseCopyWith<$Res>
    implements $CustomerRelationshipResponseCopyWith<$Res> {
  factory _$$_CustomerRelationshipResponseCopyWith(
          _$_CustomerRelationshipResponse value,
          $Res Function(_$_CustomerRelationshipResponse) then) =
      __$$_CustomerRelationshipResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CustomerRelationshipData>? data, String? exception});
}

/// @nodoc
class __$$_CustomerRelationshipResponseCopyWithImpl<$Res>
    extends _$CustomerRelationshipResponseCopyWithImpl<$Res,
        _$_CustomerRelationshipResponse>
    implements _$$_CustomerRelationshipResponseCopyWith<$Res> {
  __$$_CustomerRelationshipResponseCopyWithImpl(
      _$_CustomerRelationshipResponse _value,
      $Res Function(_$_CustomerRelationshipResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_CustomerRelationshipResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CustomerRelationshipData>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerRelationshipResponse implements _CustomerRelationshipResponse {
  const _$_CustomerRelationshipResponse(
      {final List<CustomerRelationshipData>? data, this.exception})
      : _data = data;

  factory _$_CustomerRelationshipResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerRelationshipResponseFromJson(json);

  final List<CustomerRelationshipData>? _data;
  @override
  List<CustomerRelationshipData>? get data {
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
    return 'CustomerRelationshipResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerRelationshipResponse &&
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
  _$$_CustomerRelationshipResponseCopyWith<_$_CustomerRelationshipResponse>
      get copyWith => __$$_CustomerRelationshipResponseCopyWithImpl<
          _$_CustomerRelationshipResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerRelationshipResponseToJson(
      this,
    );
  }
}

abstract class _CustomerRelationshipResponse
    implements CustomerRelationshipResponse {
  const factory _CustomerRelationshipResponse(
      {final List<CustomerRelationshipData>? data,
      final String? exception}) = _$_CustomerRelationshipResponse;

  factory _CustomerRelationshipResponse.fromJson(Map<String, dynamic> json) =
      _$_CustomerRelationshipResponse.fromJson;

  @override
  List<CustomerRelationshipData>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerRelationshipResponseCopyWith<_$_CustomerRelationshipResponse>
      get copyWith => throw _privateConstructorUsedError;
}
