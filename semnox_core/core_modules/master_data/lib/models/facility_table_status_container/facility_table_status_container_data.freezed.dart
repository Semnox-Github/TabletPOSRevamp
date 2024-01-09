// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_table_status_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityTableStatusContainerData _$FacilityTableStatusContainerDataFromJson(
    Map<String, dynamic> json) {
  return _FacilityTableStatusContainerData.fromJson(json);
}

/// @nodoc
mixin _$FacilityTableStatusContainerData {
  @JsonKey(name: 'FacilityTableStatusContainerDTOList')
  List<FacilityTableStatusContainerDTO>
      get facilityTableStatusContainerDTOList =>
          throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityTableStatusContainerDataCopyWith<FacilityTableStatusContainerData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityTableStatusContainerDataCopyWith<$Res> {
  factory $FacilityTableStatusContainerDataCopyWith(
          FacilityTableStatusContainerData value,
          $Res Function(FacilityTableStatusContainerData) then) =
      _$FacilityTableStatusContainerDataCopyWithImpl<$Res,
          FacilityTableStatusContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'FacilityTableStatusContainerDTOList')
          List<FacilityTableStatusContainerDTO>
              facilityTableStatusContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$FacilityTableStatusContainerDataCopyWithImpl<$Res,
        $Val extends FacilityTableStatusContainerData>
    implements $FacilityTableStatusContainerDataCopyWith<$Res> {
  _$FacilityTableStatusContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilityTableStatusContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      facilityTableStatusContainerDTOList: null ==
              facilityTableStatusContainerDTOList
          ? _value.facilityTableStatusContainerDTOList
          : facilityTableStatusContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<FacilityTableStatusContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FacilityTableStatusContainerDataCopyWith<$Res>
    implements $FacilityTableStatusContainerDataCopyWith<$Res> {
  factory _$$_FacilityTableStatusContainerDataCopyWith(
          _$_FacilityTableStatusContainerData value,
          $Res Function(_$_FacilityTableStatusContainerData) then) =
      __$$_FacilityTableStatusContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'FacilityTableStatusContainerDTOList')
          List<FacilityTableStatusContainerDTO>
              facilityTableStatusContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_FacilityTableStatusContainerDataCopyWithImpl<$Res>
    extends _$FacilityTableStatusContainerDataCopyWithImpl<$Res,
        _$_FacilityTableStatusContainerData>
    implements _$$_FacilityTableStatusContainerDataCopyWith<$Res> {
  __$$_FacilityTableStatusContainerDataCopyWithImpl(
      _$_FacilityTableStatusContainerData _value,
      $Res Function(_$_FacilityTableStatusContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilityTableStatusContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_FacilityTableStatusContainerData(
      facilityTableStatusContainerDTOList: null ==
              facilityTableStatusContainerDTOList
          ? _value._facilityTableStatusContainerDTOList
          : facilityTableStatusContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<FacilityTableStatusContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FacilityTableStatusContainerData
    implements _FacilityTableStatusContainerData {
  const _$_FacilityTableStatusContainerData(
      {@JsonKey(name: 'FacilityTableStatusContainerDTOList')
          required final List<FacilityTableStatusContainerDTO>
              facilityTableStatusContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _facilityTableStatusContainerDTOList =
            facilityTableStatusContainerDTOList;

  factory _$_FacilityTableStatusContainerData.fromJson(
          Map<String, dynamic> json) =>
      _$$_FacilityTableStatusContainerDataFromJson(json);

  final List<FacilityTableStatusContainerDTO>
      _facilityTableStatusContainerDTOList;
  @override
  @JsonKey(name: 'FacilityTableStatusContainerDTOList')
  List<FacilityTableStatusContainerDTO>
      get facilityTableStatusContainerDTOList {
    if (_facilityTableStatusContainerDTOList is EqualUnmodifiableListView)
      return _facilityTableStatusContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilityTableStatusContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'FacilityTableStatusContainerData(facilityTableStatusContainerDTOList: $facilityTableStatusContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FacilityTableStatusContainerData &&
            const DeepCollectionEquality().equals(
                other._facilityTableStatusContainerDTOList,
                _facilityTableStatusContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_facilityTableStatusContainerDTOList),
      hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FacilityTableStatusContainerDataCopyWith<
          _$_FacilityTableStatusContainerData>
      get copyWith => __$$_FacilityTableStatusContainerDataCopyWithImpl<
          _$_FacilityTableStatusContainerData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacilityTableStatusContainerDataToJson(
      this,
    );
  }
}

abstract class _FacilityTableStatusContainerData
    implements FacilityTableStatusContainerData {
  const factory _FacilityTableStatusContainerData(
      {@JsonKey(name: 'FacilityTableStatusContainerDTOList')
          required final List<FacilityTableStatusContainerDTO>
              facilityTableStatusContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_FacilityTableStatusContainerData;

  factory _FacilityTableStatusContainerData.fromJson(
      Map<String, dynamic> json) = _$_FacilityTableStatusContainerData.fromJson;

  @override
  @JsonKey(name: 'FacilityTableStatusContainerDTOList')
  List<FacilityTableStatusContainerDTO> get facilityTableStatusContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_FacilityTableStatusContainerDataCopyWith<
          _$_FacilityTableStatusContainerData>
      get copyWith => throw _privateConstructorUsedError;
}
