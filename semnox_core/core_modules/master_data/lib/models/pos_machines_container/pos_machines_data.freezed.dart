// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_machines_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

POSMachinesData _$POSMachinesDataFromJson(Map<String, dynamic> json) {
  return _POSMachinesData.fromJson(json);
}

/// @nodoc
mixin _$POSMachinesData {
  @JsonKey(name: 'POSMachineContainerDTOList')
  List<POSMachineContainerDTO> get posMachineContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $POSMachinesDataCopyWith<POSMachinesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $POSMachinesDataCopyWith<$Res> {
  factory $POSMachinesDataCopyWith(
          POSMachinesData value, $Res Function(POSMachinesData) then) =
      _$POSMachinesDataCopyWithImpl<$Res, POSMachinesData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'POSMachineContainerDTOList')
          List<POSMachineContainerDTO> posMachineContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$POSMachinesDataCopyWithImpl<$Res, $Val extends POSMachinesData>
    implements $POSMachinesDataCopyWith<$Res> {
  _$POSMachinesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posMachineContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      posMachineContainerDTOList: null == posMachineContainerDTOList
          ? _value.posMachineContainerDTOList
          : posMachineContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<POSMachineContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_POSMachinesDataCopyWith<$Res>
    implements $POSMachinesDataCopyWith<$Res> {
  factory _$$_POSMachinesDataCopyWith(
          _$_POSMachinesData value, $Res Function(_$_POSMachinesData) then) =
      __$$_POSMachinesDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'POSMachineContainerDTOList')
          List<POSMachineContainerDTO> posMachineContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_POSMachinesDataCopyWithImpl<$Res>
    extends _$POSMachinesDataCopyWithImpl<$Res, _$_POSMachinesData>
    implements _$$_POSMachinesDataCopyWith<$Res> {
  __$$_POSMachinesDataCopyWithImpl(
      _$_POSMachinesData _value, $Res Function(_$_POSMachinesData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posMachineContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_POSMachinesData(
      posMachineContainerDTOList: null == posMachineContainerDTOList
          ? _value._posMachineContainerDTOList
          : posMachineContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<POSMachineContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_POSMachinesData implements _POSMachinesData {
  const _$_POSMachinesData(
      {@JsonKey(name: 'POSMachineContainerDTOList')
          required final List<POSMachineContainerDTO>
              posMachineContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _posMachineContainerDTOList = posMachineContainerDTOList;

  factory _$_POSMachinesData.fromJson(Map<String, dynamic> json) =>
      _$$_POSMachinesDataFromJson(json);

  final List<POSMachineContainerDTO> _posMachineContainerDTOList;
  @override
  @JsonKey(name: 'POSMachineContainerDTOList')
  List<POSMachineContainerDTO> get posMachineContainerDTOList {
    if (_posMachineContainerDTOList is EqualUnmodifiableListView)
      return _posMachineContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posMachineContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'POSMachinesData(posMachineContainerDTOList: $posMachineContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_POSMachinesData &&
            const DeepCollectionEquality().equals(
                other._posMachineContainerDTOList,
                _posMachineContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_posMachineContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_POSMachinesDataCopyWith<_$_POSMachinesData> get copyWith =>
      __$$_POSMachinesDataCopyWithImpl<_$_POSMachinesData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_POSMachinesDataToJson(
      this,
    );
  }
}

abstract class _POSMachinesData implements POSMachinesData {
  const factory _POSMachinesData(
      {@JsonKey(name: 'POSMachineContainerDTOList')
          required final List<POSMachineContainerDTO>
              posMachineContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_POSMachinesData;

  factory _POSMachinesData.fromJson(Map<String, dynamic> json) =
      _$_POSMachinesData.fromJson;

  @override
  @JsonKey(name: 'POSMachineContainerDTOList')
  List<POSMachineContainerDTO> get posMachineContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_POSMachinesDataCopyWith<_$_POSMachinesData> get copyWith =>
      throw _privateConstructorUsedError;
}
