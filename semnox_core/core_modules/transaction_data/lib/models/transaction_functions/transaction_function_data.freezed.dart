// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_function_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionFunctionData _$TransactionFunctionDataFromJson(
    Map<String, dynamic> json) {
  return _TransactionFunctionData.fromJson(json);
}

/// @nodoc
mixin _$TransactionFunctionData {
  @JsonKey(name: 'TaskTypesContainerDTOList')
  List<TaskTypesContainerDTO> get taskTypesContainerDTOList =>
      throw _privateConstructorUsedError;
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionFunctionDataCopyWith<TransactionFunctionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFunctionDataCopyWith<$Res> {
  factory $TransactionFunctionDataCopyWith(TransactionFunctionData value,
          $Res Function(TransactionFunctionData) then) =
      _$TransactionFunctionDataCopyWithImpl<$Res, TransactionFunctionData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TaskTypesContainerDTOList')
          List<TaskTypesContainerDTO> taskTypesContainerDTOList,
      String? hash});
}

/// @nodoc
class _$TransactionFunctionDataCopyWithImpl<$Res,
        $Val extends TransactionFunctionData>
    implements $TransactionFunctionDataCopyWith<$Res> {
  _$TransactionFunctionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskTypesContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      taskTypesContainerDTOList: null == taskTypesContainerDTOList
          ? _value.taskTypesContainerDTOList
          : taskTypesContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<TaskTypesContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionFunctionDataCopyWith<$Res>
    implements $TransactionFunctionDataCopyWith<$Res> {
  factory _$$_TransactionFunctionDataCopyWith(_$_TransactionFunctionData value,
          $Res Function(_$_TransactionFunctionData) then) =
      __$$_TransactionFunctionDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TaskTypesContainerDTOList')
          List<TaskTypesContainerDTO> taskTypesContainerDTOList,
      String? hash});
}

/// @nodoc
class __$$_TransactionFunctionDataCopyWithImpl<$Res>
    extends _$TransactionFunctionDataCopyWithImpl<$Res,
        _$_TransactionFunctionData>
    implements _$$_TransactionFunctionDataCopyWith<$Res> {
  __$$_TransactionFunctionDataCopyWithImpl(_$_TransactionFunctionData _value,
      $Res Function(_$_TransactionFunctionData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskTypesContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_TransactionFunctionData(
      taskTypesContainerDTOList: null == taskTypesContainerDTOList
          ? _value._taskTypesContainerDTOList
          : taskTypesContainerDTOList // ignore: cast_nullable_to_non_nullable
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
class _$_TransactionFunctionData implements _TransactionFunctionData {
  const _$_TransactionFunctionData(
      {@JsonKey(name: 'TaskTypesContainerDTOList')
          required final List<TaskTypesContainerDTO> taskTypesContainerDTOList,
      this.hash})
      : _taskTypesContainerDTOList = taskTypesContainerDTOList;

  factory _$_TransactionFunctionData.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionFunctionDataFromJson(json);

  final List<TaskTypesContainerDTO> _taskTypesContainerDTOList;
  @override
  @JsonKey(name: 'TaskTypesContainerDTOList')
  List<TaskTypesContainerDTO> get taskTypesContainerDTOList {
    if (_taskTypesContainerDTOList is EqualUnmodifiableListView)
      return _taskTypesContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskTypesContainerDTOList);
  }

  @override
  final String? hash;

  @override
  String toString() {
    return 'TransactionFunctionData(taskTypesContainerDTOList: $taskTypesContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionFunctionData &&
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
  _$$_TransactionFunctionDataCopyWith<_$_TransactionFunctionData>
      get copyWith =>
          __$$_TransactionFunctionDataCopyWithImpl<_$_TransactionFunctionData>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionFunctionDataToJson(
      this,
    );
  }
}

abstract class _TransactionFunctionData implements TransactionFunctionData {
  const factory _TransactionFunctionData(
      {@JsonKey(name: 'TaskTypesContainerDTOList')
          required final List<TaskTypesContainerDTO> taskTypesContainerDTOList,
      final String? hash}) = _$_TransactionFunctionData;

  factory _TransactionFunctionData.fromJson(Map<String, dynamic> json) =
      _$_TransactionFunctionData.fromJson;

  @override
  @JsonKey(name: 'TaskTypesContainerDTOList')
  List<TaskTypesContainerDTO> get taskTypesContainerDTOList;
  @override
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionFunctionDataCopyWith<_$_TransactionFunctionData>
      get copyWith => throw _privateConstructorUsedError;
}
