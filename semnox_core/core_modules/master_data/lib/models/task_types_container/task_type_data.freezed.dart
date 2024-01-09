// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_type_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskTypeData _$TaskTypeDataFromJson(Map<String, dynamic> json) {
  return _TaskTypeData.fromJson(json);
}

/// @nodoc
mixin _$TaskTypeData {
  @JsonKey(name: 'TaskTypesContainerDTOList')
  List<TaskTypeContainerDto>? get taskTypesContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskTypeDataCopyWith<TaskTypeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskTypeDataCopyWith<$Res> {
  factory $TaskTypeDataCopyWith(
          TaskTypeData value, $Res Function(TaskTypeData) then) =
      _$TaskTypeDataCopyWithImpl<$Res, TaskTypeData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TaskTypesContainerDTOList')
          List<TaskTypeContainerDto>? taskTypesContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$TaskTypeDataCopyWithImpl<$Res, $Val extends TaskTypeData>
    implements $TaskTypeDataCopyWith<$Res> {
  _$TaskTypeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskTypesContainerDTOList = freezed,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      taskTypesContainerDTOList: freezed == taskTypesContainerDTOList
          ? _value.taskTypesContainerDTOList
          : taskTypesContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<TaskTypeContainerDto>?,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskTypeDataCopyWith<$Res>
    implements $TaskTypeDataCopyWith<$Res> {
  factory _$$_TaskTypeDataCopyWith(
          _$_TaskTypeData value, $Res Function(_$_TaskTypeData) then) =
      __$$_TaskTypeDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TaskTypesContainerDTOList')
          List<TaskTypeContainerDto>? taskTypesContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_TaskTypeDataCopyWithImpl<$Res>
    extends _$TaskTypeDataCopyWithImpl<$Res, _$_TaskTypeData>
    implements _$$_TaskTypeDataCopyWith<$Res> {
  __$$_TaskTypeDataCopyWithImpl(
      _$_TaskTypeData _value, $Res Function(_$_TaskTypeData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskTypesContainerDTOList = freezed,
    Object? hash = freezed,
  }) {
    return _then(_$_TaskTypeData(
      taskTypesContainerDTOList: freezed == taskTypesContainerDTOList
          ? _value._taskTypesContainerDTOList
          : taskTypesContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<TaskTypeContainerDto>?,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskTypeData implements _TaskTypeData {
  const _$_TaskTypeData(
      {@JsonKey(name: 'TaskTypesContainerDTOList')
          final List<TaskTypeContainerDto>? taskTypesContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _taskTypesContainerDTOList = taskTypesContainerDTOList;

  factory _$_TaskTypeData.fromJson(Map<String, dynamic> json) =>
      _$$_TaskTypeDataFromJson(json);

  final List<TaskTypeContainerDto>? _taskTypesContainerDTOList;
  @override
  @JsonKey(name: 'TaskTypesContainerDTOList')
  List<TaskTypeContainerDto>? get taskTypesContainerDTOList {
    final value = _taskTypesContainerDTOList;
    if (value == null) return null;
    if (_taskTypesContainerDTOList is EqualUnmodifiableListView)
      return _taskTypesContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'TaskTypeData(taskTypesContainerDTOList: $taskTypesContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskTypeData &&
            const DeepCollectionEquality().equals(
                other._taskTypesContainerDTOList, _taskTypesContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_taskTypesContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskTypeDataCopyWith<_$_TaskTypeData> get copyWith =>
      __$$_TaskTypeDataCopyWithImpl<_$_TaskTypeData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskTypeDataToJson(
      this,
    );
  }
}

abstract class _TaskTypeData implements TaskTypeData {
  const factory _TaskTypeData(
      {@JsonKey(name: 'TaskTypesContainerDTOList')
          final List<TaskTypeContainerDto>? taskTypesContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_TaskTypeData;

  factory _TaskTypeData.fromJson(Map<String, dynamic> json) =
      _$_TaskTypeData.fromJson;

  @override
  @JsonKey(name: 'TaskTypesContainerDTOList')
  List<TaskTypeContainerDto>? get taskTypesContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_TaskTypeDataCopyWith<_$_TaskTypeData> get copyWith =>
      throw _privateConstructorUsedError;
}
