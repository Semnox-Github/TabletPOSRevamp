// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_machine_reponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

POSMachineResponse _$POSMachineResponseFromJson(Map<String, dynamic> json) {
  return _POSMachineResponse.fromJson(json);
}

/// @nodoc
mixin _$POSMachineResponse {
  List<PosMachineDate>? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $POSMachineResponseCopyWith<POSMachineResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $POSMachineResponseCopyWith<$Res> {
  factory $POSMachineResponseCopyWith(
          POSMachineResponse value, $Res Function(POSMachineResponse) then) =
      _$POSMachineResponseCopyWithImpl<$Res, POSMachineResponse>;
  @useResult
  $Res call({List<PosMachineDate>? data, String? exception});
}

/// @nodoc
class _$POSMachineResponseCopyWithImpl<$Res, $Val extends POSMachineResponse>
    implements $POSMachineResponseCopyWith<$Res> {
  _$POSMachineResponseCopyWithImpl(this._value, this._then);

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
              as List<PosMachineDate>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_POSMachineResponseCopyWith<$Res>
    implements $POSMachineResponseCopyWith<$Res> {
  factory _$$_POSMachineResponseCopyWith(_$_POSMachineResponse value,
          $Res Function(_$_POSMachineResponse) then) =
      __$$_POSMachineResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PosMachineDate>? data, String? exception});
}

/// @nodoc
class __$$_POSMachineResponseCopyWithImpl<$Res>
    extends _$POSMachineResponseCopyWithImpl<$Res, _$_POSMachineResponse>
    implements _$$_POSMachineResponseCopyWith<$Res> {
  __$$_POSMachineResponseCopyWithImpl(
      _$_POSMachineResponse _value, $Res Function(_$_POSMachineResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_POSMachineResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PosMachineDate>?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_POSMachineResponse implements _POSMachineResponse {
  const _$_POSMachineResponse(
      {final List<PosMachineDate>? data, this.exception})
      : _data = data;

  factory _$_POSMachineResponse.fromJson(Map<String, dynamic> json) =>
      _$$_POSMachineResponseFromJson(json);

  final List<PosMachineDate>? _data;
  @override
  List<PosMachineDate>? get data {
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
    return 'POSMachineResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_POSMachineResponse &&
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
  _$$_POSMachineResponseCopyWith<_$_POSMachineResponse> get copyWith =>
      __$$_POSMachineResponseCopyWithImpl<_$_POSMachineResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_POSMachineResponseToJson(
      this,
    );
  }
}

abstract class _POSMachineResponse implements POSMachineResponse {
  const factory _POSMachineResponse(
      {final List<PosMachineDate>? data,
      final String? exception}) = _$_POSMachineResponse;

  factory _POSMachineResponse.fromJson(Map<String, dynamic> json) =
      _$_POSMachineResponse.fromJson;

  @override
  List<PosMachineDate>? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_POSMachineResponseCopyWith<_$_POSMachineResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
