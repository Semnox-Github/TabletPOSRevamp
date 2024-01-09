// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_table_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityTableContainerData _$FacilityTableContainerDataFromJson(
    Map<String, dynamic> json) {
  return _FacilityTableContainerData.fromJson(json);
}

/// @nodoc
mixin _$FacilityTableContainerData {
  @JsonKey(name: 'FacilityTablesContainerDTOList')
  List<FacilityTableContainerDTO> get facilityTablesContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityTableContainerDataCopyWith<FacilityTableContainerData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityTableContainerDataCopyWith<$Res> {
  factory $FacilityTableContainerDataCopyWith(FacilityTableContainerData value,
          $Res Function(FacilityTableContainerData) then) =
      _$FacilityTableContainerDataCopyWithImpl<$Res,
          FacilityTableContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'FacilityTablesContainerDTOList')
          List<FacilityTableContainerDTO> facilityTablesContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$FacilityTableContainerDataCopyWithImpl<$Res,
        $Val extends FacilityTableContainerData>
    implements $FacilityTableContainerDataCopyWith<$Res> {
  _$FacilityTableContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilityTablesContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      facilityTablesContainerDTOList: null == facilityTablesContainerDTOList
          ? _value.facilityTablesContainerDTOList
          : facilityTablesContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<FacilityTableContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FacilityTableContainerDataCopyWith<$Res>
    implements $FacilityTableContainerDataCopyWith<$Res> {
  factory _$$_FacilityTableContainerDataCopyWith(
          _$_FacilityTableContainerData value,
          $Res Function(_$_FacilityTableContainerData) then) =
      __$$_FacilityTableContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'FacilityTablesContainerDTOList')
          List<FacilityTableContainerDTO> facilityTablesContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_FacilityTableContainerDataCopyWithImpl<$Res>
    extends _$FacilityTableContainerDataCopyWithImpl<$Res,
        _$_FacilityTableContainerData>
    implements _$$_FacilityTableContainerDataCopyWith<$Res> {
  __$$_FacilityTableContainerDataCopyWithImpl(
      _$_FacilityTableContainerData _value,
      $Res Function(_$_FacilityTableContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilityTablesContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_FacilityTableContainerData(
      facilityTablesContainerDTOList: null == facilityTablesContainerDTOList
          ? _value._facilityTablesContainerDTOList
          : facilityTablesContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<FacilityTableContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilityTableContainerData implements _FacilityTableContainerData {
  const _$_FacilityTableContainerData(
      {@JsonKey(name: 'FacilityTablesContainerDTOList')
          required final List<FacilityTableContainerDTO>
              facilityTablesContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _facilityTablesContainerDTOList = facilityTablesContainerDTOList;

  factory _$_FacilityTableContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_FacilityTableContainerDataFromJson(json);

  final List<FacilityTableContainerDTO> _facilityTablesContainerDTOList;
  @override
  @JsonKey(name: 'FacilityTablesContainerDTOList')
  List<FacilityTableContainerDTO> get facilityTablesContainerDTOList {
    if (_facilityTablesContainerDTOList is EqualUnmodifiableListView)
      return _facilityTablesContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilityTablesContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'FacilityTableContainerData(facilityTablesContainerDTOList: $facilityTablesContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilityTableContainerData &&
            const DeepCollectionEquality().equals(
                other._facilityTablesContainerDTOList,
                _facilityTablesContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_facilityTablesContainerDTOList),
      hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FacilityTableContainerDataCopyWith<_$_FacilityTableContainerData>
      get copyWith => __$$_FacilityTableContainerDataCopyWithImpl<
          _$_FacilityTableContainerData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityTableContainerDataToJson(
      this,
    );
  }
}

abstract class _FacilityTableContainerData
    implements FacilityTableContainerData {
  const factory _FacilityTableContainerData(
      {@JsonKey(name: 'FacilityTablesContainerDTOList')
          required final List<FacilityTableContainerDTO>
              facilityTablesContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_FacilityTableContainerData;

  factory _FacilityTableContainerData.fromJson(Map<String, dynamic> json) =
      _$_FacilityTableContainerData.fromJson;

  @override
  @JsonKey(name: 'FacilityTablesContainerDTOList')
  List<FacilityTableContainerDTO> get facilityTablesContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityTableContainerDataCopyWith<_$_FacilityTableContainerData>
      get copyWith => throw _privateConstructorUsedError;
}
