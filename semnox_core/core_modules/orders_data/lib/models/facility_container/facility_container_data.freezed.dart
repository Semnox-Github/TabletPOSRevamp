// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityContainerData _$FacilityContainerDataFromJson(
    Map<String, dynamic> json) {
  return _FacilityContainerData.fromJson(json);
}

/// @nodoc
mixin _$FacilityContainerData {
  @JsonKey(name: 'FacilitysContainerDTOList')
  List<FacilityContainerDTO> get facilitysContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityContainerDataCopyWith<FacilityContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityContainerDataCopyWith<$Res> {
  factory $FacilityContainerDataCopyWith(FacilityContainerData value,
          $Res Function(FacilityContainerData) then) =
      _$FacilityContainerDataCopyWithImpl<$Res, FacilityContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'FacilitysContainerDTOList')
          List<FacilityContainerDTO> facilitysContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$FacilityContainerDataCopyWithImpl<$Res,
        $Val extends FacilityContainerData>
    implements $FacilityContainerDataCopyWith<$Res> {
  _$FacilityContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilitysContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      facilitysContainerDTOList: null == facilitysContainerDTOList
          ? _value.facilitysContainerDTOList
          : facilitysContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<FacilityContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FacilityContainerDataCopyWith<$Res>
    implements $FacilityContainerDataCopyWith<$Res> {
  factory _$$_FacilityContainerDataCopyWith(_$_FacilityContainerData value,
          $Res Function(_$_FacilityContainerData) then) =
      __$$_FacilityContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'FacilitysContainerDTOList')
          List<FacilityContainerDTO> facilitysContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_FacilityContainerDataCopyWithImpl<$Res>
    extends _$FacilityContainerDataCopyWithImpl<$Res, _$_FacilityContainerData>
    implements _$$_FacilityContainerDataCopyWith<$Res> {
  __$$_FacilityContainerDataCopyWithImpl(_$_FacilityContainerData _value,
      $Res Function(_$_FacilityContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilitysContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_FacilityContainerData(
      facilitysContainerDTOList: null == facilitysContainerDTOList
          ? _value._facilitysContainerDTOList
          : facilitysContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<FacilityContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilityContainerData implements _FacilityContainerData {
  const _$_FacilityContainerData(
      {@JsonKey(name: 'FacilitysContainerDTOList')
          required final List<FacilityContainerDTO> facilitysContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _facilitysContainerDTOList = facilitysContainerDTOList;

  factory _$_FacilityContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_FacilityContainerDataFromJson(json);

  final List<FacilityContainerDTO> _facilitysContainerDTOList;
  @override
  @JsonKey(name: 'FacilitysContainerDTOList')
  List<FacilityContainerDTO> get facilitysContainerDTOList {
    if (_facilitysContainerDTOList is EqualUnmodifiableListView)
      return _facilitysContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilitysContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'FacilityContainerData(facilitysContainerDTOList: $facilitysContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilityContainerData &&
            const DeepCollectionEquality().equals(
                other._facilitysContainerDTOList, _facilitysContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_facilitysContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FacilityContainerDataCopyWith<_$_FacilityContainerData> get copyWith =>
      __$$_FacilityContainerDataCopyWithImpl<_$_FacilityContainerData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityContainerDataToJson(
      this,
    );
  }
}

abstract class _FacilityContainerData implements FacilityContainerData {
  const factory _FacilityContainerData(
      {@JsonKey(name: 'FacilitysContainerDTOList')
          required final List<FacilityContainerDTO> facilitysContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_FacilityContainerData;

  factory _FacilityContainerData.fromJson(Map<String, dynamic> json) =
      _$_FacilityContainerData.fromJson;

  @override
  @JsonKey(name: 'FacilitysContainerDTOList')
  List<FacilityContainerDTO> get facilitysContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityContainerDataCopyWith<_$_FacilityContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}
