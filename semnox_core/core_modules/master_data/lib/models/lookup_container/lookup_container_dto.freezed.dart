// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lookup_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LookupsContainerDTO _$LookupsContainerDTOFromJson(Map<String, dynamic> json) {
  return _LookupsContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$LookupsContainerDTO {
  @JsonKey(name: 'LookupId')
  int get lookupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'LookupName')
  String get lookupName => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsProtected')
  String get isProtected => throw _privateConstructorUsedError;
  @JsonKey(name: 'LookupValuesContainerDTOList')
  List<LookupValuesContainerDTO> get lookupValuesContainerDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LookupsContainerDTOCopyWith<LookupsContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LookupsContainerDTOCopyWith<$Res> {
  factory $LookupsContainerDTOCopyWith(
          LookupsContainerDTO value, $Res Function(LookupsContainerDTO) then) =
      _$LookupsContainerDTOCopyWithImpl<$Res, LookupsContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'LookupId')
          int lookupId,
      @JsonKey(name: 'LookupName')
          String lookupName,
      @JsonKey(name: 'IsProtected')
          String isProtected,
      @JsonKey(name: 'LookupValuesContainerDTOList')
          List<LookupValuesContainerDTO> lookupValuesContainerDTOList});
}

/// @nodoc
class _$LookupsContainerDTOCopyWithImpl<$Res, $Val extends LookupsContainerDTO>
    implements $LookupsContainerDTOCopyWith<$Res> {
  _$LookupsContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lookupId = null,
    Object? lookupName = null,
    Object? isProtected = null,
    Object? lookupValuesContainerDTOList = null,
  }) {
    return _then(_value.copyWith(
      lookupId: null == lookupId
          ? _value.lookupId
          : lookupId // ignore: cast_nullable_to_non_nullable
              as int,
      lookupName: null == lookupName
          ? _value.lookupName
          : lookupName // ignore: cast_nullable_to_non_nullable
              as String,
      isProtected: null == isProtected
          ? _value.isProtected
          : isProtected // ignore: cast_nullable_to_non_nullable
              as String,
      lookupValuesContainerDTOList: null == lookupValuesContainerDTOList
          ? _value.lookupValuesContainerDTOList
          : lookupValuesContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<LookupValuesContainerDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LookupsContainerDTOCopyWith<$Res>
    implements $LookupsContainerDTOCopyWith<$Res> {
  factory _$$_LookupsContainerDTOCopyWith(_$_LookupsContainerDTO value,
          $Res Function(_$_LookupsContainerDTO) then) =
      __$$_LookupsContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'LookupId')
          int lookupId,
      @JsonKey(name: 'LookupName')
          String lookupName,
      @JsonKey(name: 'IsProtected')
          String isProtected,
      @JsonKey(name: 'LookupValuesContainerDTOList')
          List<LookupValuesContainerDTO> lookupValuesContainerDTOList});
}

/// @nodoc
class __$$_LookupsContainerDTOCopyWithImpl<$Res>
    extends _$LookupsContainerDTOCopyWithImpl<$Res, _$_LookupsContainerDTO>
    implements _$$_LookupsContainerDTOCopyWith<$Res> {
  __$$_LookupsContainerDTOCopyWithImpl(_$_LookupsContainerDTO _value,
      $Res Function(_$_LookupsContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lookupId = null,
    Object? lookupName = null,
    Object? isProtected = null,
    Object? lookupValuesContainerDTOList = null,
  }) {
    return _then(_$_LookupsContainerDTO(
      lookupId: null == lookupId
          ? _value.lookupId
          : lookupId // ignore: cast_nullable_to_non_nullable
              as int,
      lookupName: null == lookupName
          ? _value.lookupName
          : lookupName // ignore: cast_nullable_to_non_nullable
              as String,
      isProtected: null == isProtected
          ? _value.isProtected
          : isProtected // ignore: cast_nullable_to_non_nullable
              as String,
      lookupValuesContainerDTOList: null == lookupValuesContainerDTOList
          ? _value._lookupValuesContainerDTOList
          : lookupValuesContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<LookupValuesContainerDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LookupsContainerDTO implements _LookupsContainerDTO {
  const _$_LookupsContainerDTO(
      {@JsonKey(name: 'LookupId')
          required this.lookupId,
      @JsonKey(name: 'LookupName')
          required this.lookupName,
      @JsonKey(name: 'IsProtected')
          required this.isProtected,
      @JsonKey(name: 'LookupValuesContainerDTOList')
          required final List<LookupValuesContainerDTO>
              lookupValuesContainerDTOList})
      : _lookupValuesContainerDTOList = lookupValuesContainerDTOList;

  factory _$_LookupsContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_LookupsContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'LookupId')
  final int lookupId;
  @override
  @JsonKey(name: 'LookupName')
  final String lookupName;
  @override
  @JsonKey(name: 'IsProtected')
  final String isProtected;
  final List<LookupValuesContainerDTO> _lookupValuesContainerDTOList;
  @override
  @JsonKey(name: 'LookupValuesContainerDTOList')
  List<LookupValuesContainerDTO> get lookupValuesContainerDTOList {
    if (_lookupValuesContainerDTOList is EqualUnmodifiableListView)
      return _lookupValuesContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lookupValuesContainerDTOList);
  }

  @override
  String toString() {
    return 'LookupsContainerDTO(lookupId: $lookupId, lookupName: $lookupName, isProtected: $isProtected, lookupValuesContainerDTOList: $lookupValuesContainerDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LookupsContainerDTO &&
            (identical(other.lookupId, lookupId) ||
                other.lookupId == lookupId) &&
            (identical(other.lookupName, lookupName) ||
                other.lookupName == lookupName) &&
            (identical(other.isProtected, isProtected) ||
                other.isProtected == isProtected) &&
            const DeepCollectionEquality().equals(
                other._lookupValuesContainerDTOList,
                _lookupValuesContainerDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lookupId,
      lookupName,
      isProtected,
      const DeepCollectionEquality().hash(_lookupValuesContainerDTOList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LookupsContainerDTOCopyWith<_$_LookupsContainerDTO> get copyWith =>
      __$$_LookupsContainerDTOCopyWithImpl<_$_LookupsContainerDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LookupsContainerDTOToJson(
      this,
    );
  }
}

abstract class _LookupsContainerDTO implements LookupsContainerDTO {
  const factory _LookupsContainerDTO(
      {@JsonKey(name: 'LookupId')
          required final int lookupId,
      @JsonKey(name: 'LookupName')
          required final String lookupName,
      @JsonKey(name: 'IsProtected')
          required final String isProtected,
      @JsonKey(name: 'LookupValuesContainerDTOList')
          required final List<LookupValuesContainerDTO>
              lookupValuesContainerDTOList}) = _$_LookupsContainerDTO;

  factory _LookupsContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_LookupsContainerDTO.fromJson;

  @override
  @JsonKey(name: 'LookupId')
  int get lookupId;
  @override
  @JsonKey(name: 'LookupName')
  String get lookupName;
  @override
  @JsonKey(name: 'IsProtected')
  String get isProtected;
  @override
  @JsonKey(name: 'LookupValuesContainerDTOList')
  List<LookupValuesContainerDTO> get lookupValuesContainerDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_LookupsContainerDTOCopyWith<_$_LookupsContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
