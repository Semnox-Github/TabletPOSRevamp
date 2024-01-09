// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_type_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskTypeContainerResponse _$TaskTypeContainerResponseFromJson(
    Map<String, dynamic> json) {
  return _TaskTypeContainerResponse.fromJson(json);
}

/// @nodoc
mixin _$TaskTypeContainerResponse {
  TaskTypeData? get data => throw _privateConstructorUsedError;
  String? get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskTypeContainerResponseCopyWith<TaskTypeContainerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskTypeContainerResponseCopyWith<$Res> {
  factory $TaskTypeContainerResponseCopyWith(TaskTypeContainerResponse value,
          $Res Function(TaskTypeContainerResponse) then) =
      _$TaskTypeContainerResponseCopyWithImpl<$Res, TaskTypeContainerResponse>;
  @useResult
  $Res call({TaskTypeData? data, String? exception});

  $TaskTypeDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$TaskTypeContainerResponseCopyWithImpl<$Res,
        $Val extends TaskTypeContainerResponse>
    implements $TaskTypeContainerResponseCopyWith<$Res> {
  _$TaskTypeContainerResponseCopyWithImpl(this._value, this._then);

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
              as TaskTypeData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskTypeDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $TaskTypeDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TaskTypeContainerResponseCopyWith<$Res>
    implements $TaskTypeContainerResponseCopyWith<$Res> {
  factory _$$_TaskTypeContainerResponseCopyWith(
          _$_TaskTypeContainerResponse value,
          $Res Function(_$_TaskTypeContainerResponse) then) =
      __$$_TaskTypeContainerResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TaskTypeData? data, String? exception});

  @override
  $TaskTypeDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_TaskTypeContainerResponseCopyWithImpl<$Res>
    extends _$TaskTypeContainerResponseCopyWithImpl<$Res,
        _$_TaskTypeContainerResponse>
    implements _$$_TaskTypeContainerResponseCopyWith<$Res> {
  __$$_TaskTypeContainerResponseCopyWithImpl(
      _$_TaskTypeContainerResponse _value,
      $Res Function(_$_TaskTypeContainerResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_TaskTypeContainerResponse(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TaskTypeData?,
      exception: freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskTypeContainerResponse implements _TaskTypeContainerResponse {
  const _$_TaskTypeContainerResponse({this.data, this.exception});

  factory _$_TaskTypeContainerResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TaskTypeContainerResponseFromJson(json);

  @override
  final TaskTypeData? data;
  @override
  final String? exception;

  @override
  String toString() {
    return 'TaskTypeContainerResponse(data: $data, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskTypeContainerResponse &&
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
  _$$_TaskTypeContainerResponseCopyWith<_$_TaskTypeContainerResponse>
      get copyWith => __$$_TaskTypeContainerResponseCopyWithImpl<
          _$_TaskTypeContainerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskTypeContainerResponseToJson(
      this,
    );
  }
}

abstract class _TaskTypeContainerResponse implements TaskTypeContainerResponse {
  const factory _TaskTypeContainerResponse(
      {final TaskTypeData? data,
      final String? exception}) = _$_TaskTypeContainerResponse;

  factory _TaskTypeContainerResponse.fromJson(Map<String, dynamic> json) =
      _$_TaskTypeContainerResponse.fromJson;

  @override
  TaskTypeData? get data;
  @override
  String? get exception;
  @override
  @JsonKey(ignore: true)
  _$$_TaskTypeContainerResponseCopyWith<_$_TaskTypeContainerResponse>
      get copyWith => throw _privateConstructorUsedError;
}
