// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segment_category_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SegmentCategoryContainerData _$SegmentCategoryContainerDataFromJson(
    Map<String, dynamic> json) {
  return _SegmentCategoryContainerData.fromJson(json);
}

/// @nodoc
mixin _$SegmentCategoryContainerData {
  @JsonKey(name: 'SegmentCategoryContainerDTOList')
  List<SegmentCategoryContainerDTO> get segmentCategoryContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SegmentCategoryContainerDataCopyWith<SegmentCategoryContainerData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SegmentCategoryContainerDataCopyWith<$Res> {
  factory $SegmentCategoryContainerDataCopyWith(
          SegmentCategoryContainerData value,
          $Res Function(SegmentCategoryContainerData) then) =
      _$SegmentCategoryContainerDataCopyWithImpl<$Res,
          SegmentCategoryContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'SegmentCategoryContainerDTOList')
          List<SegmentCategoryContainerDTO> segmentCategoryContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$SegmentCategoryContainerDataCopyWithImpl<$Res,
        $Val extends SegmentCategoryContainerData>
    implements $SegmentCategoryContainerDataCopyWith<$Res> {
  _$SegmentCategoryContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segmentCategoryContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      segmentCategoryContainerDTOList: null == segmentCategoryContainerDTOList
          ? _value.segmentCategoryContainerDTOList
          : segmentCategoryContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<SegmentCategoryContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SegmentCategoryContainerDataCopyWith<$Res>
    implements $SegmentCategoryContainerDataCopyWith<$Res> {
  factory _$$_SegmentCategoryContainerDataCopyWith(
          _$_SegmentCategoryContainerData value,
          $Res Function(_$_SegmentCategoryContainerData) then) =
      __$$_SegmentCategoryContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'SegmentCategoryContainerDTOList')
          List<SegmentCategoryContainerDTO> segmentCategoryContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_SegmentCategoryContainerDataCopyWithImpl<$Res>
    extends _$SegmentCategoryContainerDataCopyWithImpl<$Res,
        _$_SegmentCategoryContainerData>
    implements _$$_SegmentCategoryContainerDataCopyWith<$Res> {
  __$$_SegmentCategoryContainerDataCopyWithImpl(
      _$_SegmentCategoryContainerData _value,
      $Res Function(_$_SegmentCategoryContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? segmentCategoryContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_SegmentCategoryContainerData(
      segmentCategoryContainerDTOList: null == segmentCategoryContainerDTOList
          ? _value._segmentCategoryContainerDTOList
          : segmentCategoryContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<SegmentCategoryContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SegmentCategoryContainerData implements _SegmentCategoryContainerData {
  const _$_SegmentCategoryContainerData(
      {@JsonKey(name: 'SegmentCategoryContainerDTOList')
          required final List<SegmentCategoryContainerDTO>
              segmentCategoryContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _segmentCategoryContainerDTOList = segmentCategoryContainerDTOList;

  factory _$_SegmentCategoryContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_SegmentCategoryContainerDataFromJson(json);

  final List<SegmentCategoryContainerDTO> _segmentCategoryContainerDTOList;
  @override
  @JsonKey(name: 'SegmentCategoryContainerDTOList')
  List<SegmentCategoryContainerDTO> get segmentCategoryContainerDTOList {
    if (_segmentCategoryContainerDTOList is EqualUnmodifiableListView)
      return _segmentCategoryContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_segmentCategoryContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'SegmentCategoryContainerData(segmentCategoryContainerDTOList: $segmentCategoryContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SegmentCategoryContainerData &&
            const DeepCollectionEquality().equals(
                other._segmentCategoryContainerDTOList,
                _segmentCategoryContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_segmentCategoryContainerDTOList),
      hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SegmentCategoryContainerDataCopyWith<_$_SegmentCategoryContainerData>
      get copyWith => __$$_SegmentCategoryContainerDataCopyWithImpl<
          _$_SegmentCategoryContainerData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SegmentCategoryContainerDataToJson(
      this,
    );
  }
}

abstract class _SegmentCategoryContainerData
    implements SegmentCategoryContainerData {
  const factory _SegmentCategoryContainerData(
      {@JsonKey(name: 'SegmentCategoryContainerDTOList')
          required final List<SegmentCategoryContainerDTO>
              segmentCategoryContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_SegmentCategoryContainerData;

  factory _SegmentCategoryContainerData.fromJson(Map<String, dynamic> json) =
      _$_SegmentCategoryContainerData.fromJson;

  @override
  @JsonKey(name: 'SegmentCategoryContainerDTOList')
  List<SegmentCategoryContainerDTO> get segmentCategoryContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_SegmentCategoryContainerDataCopyWith<_$_SegmentCategoryContainerData>
      get copyWith => throw _privateConstructorUsedError;
}
