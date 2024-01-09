// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lookup_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LookupData _$LookupDataFromJson(Map<String, dynamic> json) {
  return _LookupData.fromJson(json);
}

/// @nodoc
mixin _$LookupData {
  @JsonKey(name: 'LookupsContainerDTOList')
  List<LookupsContainerDTO> get lookupsContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LookupDataCopyWith<LookupData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LookupDataCopyWith<$Res> {
  factory $LookupDataCopyWith(
          LookupData value, $Res Function(LookupData) then) =
      _$LookupDataCopyWithImpl<$Res, LookupData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'LookupsContainerDTOList')
          List<LookupsContainerDTO> lookupsContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$LookupDataCopyWithImpl<$Res, $Val extends LookupData>
    implements $LookupDataCopyWith<$Res> {
  _$LookupDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lookupsContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      lookupsContainerDTOList: null == lookupsContainerDTOList
          ? _value.lookupsContainerDTOList
          : lookupsContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<LookupsContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LookupDataCopyWith<$Res>
    implements $LookupDataCopyWith<$Res> {
  factory _$$_LookupDataCopyWith(
          _$_LookupData value, $Res Function(_$_LookupData) then) =
      __$$_LookupDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'LookupsContainerDTOList')
          List<LookupsContainerDTO> lookupsContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_LookupDataCopyWithImpl<$Res>
    extends _$LookupDataCopyWithImpl<$Res, _$_LookupData>
    implements _$$_LookupDataCopyWith<$Res> {
  __$$_LookupDataCopyWithImpl(
      _$_LookupData _value, $Res Function(_$_LookupData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lookupsContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_LookupData(
      lookupsContainerDTOList: null == lookupsContainerDTOList
          ? _value._lookupsContainerDTOList
          : lookupsContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<LookupsContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LookupData implements _LookupData {
  const _$_LookupData(
      {@JsonKey(name: 'LookupsContainerDTOList')
          required final List<LookupsContainerDTO> lookupsContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _lookupsContainerDTOList = lookupsContainerDTOList;

  factory _$_LookupData.fromJson(Map<String, dynamic> json) =>
      _$$_LookupDataFromJson(json);

  final List<LookupsContainerDTO> _lookupsContainerDTOList;
  @override
  @JsonKey(name: 'LookupsContainerDTOList')
  List<LookupsContainerDTO> get lookupsContainerDTOList {
    if (_lookupsContainerDTOList is EqualUnmodifiableListView)
      return _lookupsContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lookupsContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'LookupData(lookupsContainerDTOList: $lookupsContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LookupData &&
            const DeepCollectionEquality().equals(
                other._lookupsContainerDTOList, _lookupsContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_lookupsContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LookupDataCopyWith<_$_LookupData> get copyWith =>
      __$$_LookupDataCopyWithImpl<_$_LookupData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LookupDataToJson(
      this,
    );
  }
}

abstract class _LookupData implements LookupData {
  const factory _LookupData(
      {@JsonKey(name: 'LookupsContainerDTOList')
          required final List<LookupsContainerDTO> lookupsContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_LookupData;

  factory _LookupData.fromJson(Map<String, dynamic> json) =
      _$_LookupData.fromJson;

  @override
  @JsonKey(name: 'LookupsContainerDTOList')
  List<LookupsContainerDTO> get lookupsContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_LookupDataCopyWith<_$_LookupData> get copyWith =>
      throw _privateConstructorUsedError;
}
