// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'context_menu_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContextMenuData _$ContextMenuDataFromJson(Map<String, dynamic> json) {
  return _ContextMenuResponse.fromJson(json);
}

/// @nodoc
mixin _$ContextMenuData {
  @JsonKey(name: 'TaskTypesContainerDTOList')
  List<TaskTypesContainerDTO> get taskTypesContainerDtoList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContextMenuDataCopyWith<ContextMenuData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextMenuDataCopyWith<$Res> {
  factory $ContextMenuDataCopyWith(
          ContextMenuData value, $Res Function(ContextMenuData) then) =
      _$ContextMenuDataCopyWithImpl<$Res, ContextMenuData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TaskTypesContainerDTOList')
          List<TaskTypesContainerDTO> taskTypesContainerDtoList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$ContextMenuDataCopyWithImpl<$Res, $Val extends ContextMenuData>
    implements $ContextMenuDataCopyWith<$Res> {
  _$ContextMenuDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskTypesContainerDtoList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      taskTypesContainerDtoList: null == taskTypesContainerDtoList
          ? _value.taskTypesContainerDtoList
          : taskTypesContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<TaskTypesContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContextMenuResponseCopyWith<$Res>
    implements $ContextMenuDataCopyWith<$Res> {
  factory _$$_ContextMenuResponseCopyWith(_$_ContextMenuResponse value,
          $Res Function(_$_ContextMenuResponse) then) =
      __$$_ContextMenuResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TaskTypesContainerDTOList')
          List<TaskTypesContainerDTO> taskTypesContainerDtoList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_ContextMenuResponseCopyWithImpl<$Res>
    extends _$ContextMenuDataCopyWithImpl<$Res, _$_ContextMenuResponse>
    implements _$$_ContextMenuResponseCopyWith<$Res> {
  __$$_ContextMenuResponseCopyWithImpl(_$_ContextMenuResponse _value,
      $Res Function(_$_ContextMenuResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskTypesContainerDtoList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_ContextMenuResponse(
      taskTypesContainerDtoList: null == taskTypesContainerDtoList
          ? _value._taskTypesContainerDtoList
          : taskTypesContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<TaskTypesContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContextMenuResponse implements _ContextMenuResponse {
  const _$_ContextMenuResponse(
      {@JsonKey(name: 'TaskTypesContainerDTOList')
          required final List<TaskTypesContainerDTO> taskTypesContainerDtoList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _taskTypesContainerDtoList = taskTypesContainerDtoList;

  factory _$_ContextMenuResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ContextMenuResponseFromJson(json);

  final List<TaskTypesContainerDTO> _taskTypesContainerDtoList;
  @override
  @JsonKey(name: 'TaskTypesContainerDTOList')
  List<TaskTypesContainerDTO> get taskTypesContainerDtoList {
    if (_taskTypesContainerDtoList is EqualUnmodifiableListView)
      return _taskTypesContainerDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskTypesContainerDtoList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'ContextMenuData(taskTypesContainerDtoList: $taskTypesContainerDtoList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContextMenuResponse &&
            const DeepCollectionEquality().equals(
                other._taskTypesContainerDtoList, _taskTypesContainerDtoList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_taskTypesContainerDtoList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContextMenuResponseCopyWith<_$_ContextMenuResponse> get copyWith =>
      __$$_ContextMenuResponseCopyWithImpl<_$_ContextMenuResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContextMenuResponseToJson(
      this,
    );
  }
}

abstract class _ContextMenuResponse implements ContextMenuData {
  const factory _ContextMenuResponse(
      {@JsonKey(name: 'TaskTypesContainerDTOList')
          required final List<TaskTypesContainerDTO> taskTypesContainerDtoList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_ContextMenuResponse;

  factory _ContextMenuResponse.fromJson(Map<String, dynamic> json) =
      _$_ContextMenuResponse.fromJson;

  @override
  @JsonKey(name: 'TaskTypesContainerDTOList')
  List<TaskTypesContainerDTO> get taskTypesContainerDtoList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_ContextMenuResponseCopyWith<_$_ContextMenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
