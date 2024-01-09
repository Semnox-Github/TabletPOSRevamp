// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'modifier_set_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModifierSetContainerDTO _$ModifierSetContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _ModifierSetContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$ModifierSetContainerDTO {
  @JsonKey(name: 'ModifierSetId')
  int get modifierSetId => throw _privateConstructorUsedError;
  @JsonKey(name: 'SetName')
  String get setName => throw _privateConstructorUsedError;
  @JsonKey(name: 'MinQuantity')
  int get minQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentModifierSetDTO')
  ModifierSetContainerDTO? get parentModifierSetDTO =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'MaxQuantity')
  int get maxQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'FreeQuantity')
  int get freeQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'ModifierSetDetailsContainerDTOList')
  List<ModifierSetDetailsContainerDTO> get modifierSetDetailsContainerDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModifierSetContainerDTOCopyWith<ModifierSetContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifierSetContainerDTOCopyWith<$Res> {
  factory $ModifierSetContainerDTOCopyWith(ModifierSetContainerDTO value,
          $Res Function(ModifierSetContainerDTO) then) =
      _$ModifierSetContainerDTOCopyWithImpl<$Res, ModifierSetContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ModifierSetId')
          int modifierSetId,
      @JsonKey(name: 'SetName')
          String setName,
      @JsonKey(name: 'MinQuantity')
          int minQuantity,
      @JsonKey(name: 'ParentModifierSetDTO')
          ModifierSetContainerDTO? parentModifierSetDTO,
      @JsonKey(name: 'MaxQuantity')
          int maxQuantity,
      @JsonKey(name: 'FreeQuantity')
          int freeQuantity,
      @JsonKey(name: 'ModifierSetDetailsContainerDTOList')
          List<ModifierSetDetailsContainerDTO>
              modifierSetDetailsContainerDTOList});

  $ModifierSetContainerDTOCopyWith<$Res>? get parentModifierSetDTO;
}

/// @nodoc
class _$ModifierSetContainerDTOCopyWithImpl<$Res,
        $Val extends ModifierSetContainerDTO>
    implements $ModifierSetContainerDTOCopyWith<$Res> {
  _$ModifierSetContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modifierSetId = null,
    Object? setName = null,
    Object? minQuantity = null,
    Object? parentModifierSetDTO = freezed,
    Object? maxQuantity = null,
    Object? freeQuantity = null,
    Object? modifierSetDetailsContainerDTOList = null,
  }) {
    return _then(_value.copyWith(
      modifierSetId: null == modifierSetId
          ? _value.modifierSetId
          : modifierSetId // ignore: cast_nullable_to_non_nullable
              as int,
      setName: null == setName
          ? _value.setName
          : setName // ignore: cast_nullable_to_non_nullable
              as String,
      minQuantity: null == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      parentModifierSetDTO: freezed == parentModifierSetDTO
          ? _value.parentModifierSetDTO
          : parentModifierSetDTO // ignore: cast_nullable_to_non_nullable
              as ModifierSetContainerDTO?,
      maxQuantity: null == maxQuantity
          ? _value.maxQuantity
          : maxQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      freeQuantity: null == freeQuantity
          ? _value.freeQuantity
          : freeQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      modifierSetDetailsContainerDTOList: null ==
              modifierSetDetailsContainerDTOList
          ? _value.modifierSetDetailsContainerDTOList
          : modifierSetDetailsContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ModifierSetDetailsContainerDTO>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ModifierSetContainerDTOCopyWith<$Res>? get parentModifierSetDTO {
    if (_value.parentModifierSetDTO == null) {
      return null;
    }

    return $ModifierSetContainerDTOCopyWith<$Res>(_value.parentModifierSetDTO!,
        (value) {
      return _then(_value.copyWith(parentModifierSetDTO: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ModifierSetContainerDTOCopyWith<$Res>
    implements $ModifierSetContainerDTOCopyWith<$Res> {
  factory _$$_ModifierSetContainerDTOCopyWith(_$_ModifierSetContainerDTO value,
          $Res Function(_$_ModifierSetContainerDTO) then) =
      __$$_ModifierSetContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ModifierSetId')
          int modifierSetId,
      @JsonKey(name: 'SetName')
          String setName,
      @JsonKey(name: 'MinQuantity')
          int minQuantity,
      @JsonKey(name: 'ParentModifierSetDTO')
          ModifierSetContainerDTO? parentModifierSetDTO,
      @JsonKey(name: 'MaxQuantity')
          int maxQuantity,
      @JsonKey(name: 'FreeQuantity')
          int freeQuantity,
      @JsonKey(name: 'ModifierSetDetailsContainerDTOList')
          List<ModifierSetDetailsContainerDTO>
              modifierSetDetailsContainerDTOList});

  @override
  $ModifierSetContainerDTOCopyWith<$Res>? get parentModifierSetDTO;
}

/// @nodoc
class __$$_ModifierSetContainerDTOCopyWithImpl<$Res>
    extends _$ModifierSetContainerDTOCopyWithImpl<$Res,
        _$_ModifierSetContainerDTO>
    implements _$$_ModifierSetContainerDTOCopyWith<$Res> {
  __$$_ModifierSetContainerDTOCopyWithImpl(_$_ModifierSetContainerDTO _value,
      $Res Function(_$_ModifierSetContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modifierSetId = null,
    Object? setName = null,
    Object? minQuantity = null,
    Object? parentModifierSetDTO = freezed,
    Object? maxQuantity = null,
    Object? freeQuantity = null,
    Object? modifierSetDetailsContainerDTOList = null,
  }) {
    return _then(_$_ModifierSetContainerDTO(
      modifierSetId: null == modifierSetId
          ? _value.modifierSetId
          : modifierSetId // ignore: cast_nullable_to_non_nullable
              as int,
      setName: null == setName
          ? _value.setName
          : setName // ignore: cast_nullable_to_non_nullable
              as String,
      minQuantity: null == minQuantity
          ? _value.minQuantity
          : minQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      parentModifierSetDTO: freezed == parentModifierSetDTO
          ? _value.parentModifierSetDTO
          : parentModifierSetDTO // ignore: cast_nullable_to_non_nullable
              as ModifierSetContainerDTO?,
      maxQuantity: null == maxQuantity
          ? _value.maxQuantity
          : maxQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      freeQuantity: null == freeQuantity
          ? _value.freeQuantity
          : freeQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      modifierSetDetailsContainerDTOList: null ==
              modifierSetDetailsContainerDTOList
          ? _value._modifierSetDetailsContainerDTOList
          : modifierSetDetailsContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ModifierSetDetailsContainerDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModifierSetContainerDTO implements _ModifierSetContainerDTO {
  const _$_ModifierSetContainerDTO(
      {@JsonKey(name: 'ModifierSetId')
          required this.modifierSetId,
      @JsonKey(name: 'SetName')
          required this.setName,
      @JsonKey(name: 'MinQuantity')
          required this.minQuantity,
      @JsonKey(name: 'ParentModifierSetDTO')
          this.parentModifierSetDTO,
      @JsonKey(name: 'MaxQuantity')
          required this.maxQuantity,
      @JsonKey(name: 'FreeQuantity')
          required this.freeQuantity,
      @JsonKey(name: 'ModifierSetDetailsContainerDTOList')
          required final List<ModifierSetDetailsContainerDTO>
              modifierSetDetailsContainerDTOList})
      : _modifierSetDetailsContainerDTOList =
            modifierSetDetailsContainerDTOList;

  factory _$_ModifierSetContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_ModifierSetContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'ModifierSetId')
  final int modifierSetId;
  @override
  @JsonKey(name: 'SetName')
  final String setName;
  @override
  @JsonKey(name: 'MinQuantity')
  final int minQuantity;
  @override
  @JsonKey(name: 'ParentModifierSetDTO')
  final ModifierSetContainerDTO? parentModifierSetDTO;
  @override
  @JsonKey(name: 'MaxQuantity')
  final int maxQuantity;
  @override
  @JsonKey(name: 'FreeQuantity')
  final int freeQuantity;
  final List<ModifierSetDetailsContainerDTO>
      _modifierSetDetailsContainerDTOList;
  @override
  @JsonKey(name: 'ModifierSetDetailsContainerDTOList')
  List<ModifierSetDetailsContainerDTO> get modifierSetDetailsContainerDTOList {
    if (_modifierSetDetailsContainerDTOList is EqualUnmodifiableListView)
      return _modifierSetDetailsContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modifierSetDetailsContainerDTOList);
  }

  @override
  String toString() {
    return 'ModifierSetContainerDTO(modifierSetId: $modifierSetId, setName: $setName, minQuantity: $minQuantity, parentModifierSetDTO: $parentModifierSetDTO, maxQuantity: $maxQuantity, freeQuantity: $freeQuantity, modifierSetDetailsContainerDTOList: $modifierSetDetailsContainerDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModifierSetContainerDTO &&
            (identical(other.modifierSetId, modifierSetId) ||
                other.modifierSetId == modifierSetId) &&
            (identical(other.setName, setName) || other.setName == setName) &&
            (identical(other.minQuantity, minQuantity) ||
                other.minQuantity == minQuantity) &&
            (identical(other.parentModifierSetDTO, parentModifierSetDTO) ||
                other.parentModifierSetDTO == parentModifierSetDTO) &&
            (identical(other.maxQuantity, maxQuantity) ||
                other.maxQuantity == maxQuantity) &&
            (identical(other.freeQuantity, freeQuantity) ||
                other.freeQuantity == freeQuantity) &&
            const DeepCollectionEquality().equals(
                other._modifierSetDetailsContainerDTOList,
                _modifierSetDetailsContainerDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      modifierSetId,
      setName,
      minQuantity,
      parentModifierSetDTO,
      maxQuantity,
      freeQuantity,
      const DeepCollectionEquality().hash(_modifierSetDetailsContainerDTOList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModifierSetContainerDTOCopyWith<_$_ModifierSetContainerDTO>
      get copyWith =>
          __$$_ModifierSetContainerDTOCopyWithImpl<_$_ModifierSetContainerDTO>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModifierSetContainerDTOToJson(
      this,
    );
  }
}

abstract class _ModifierSetContainerDTO implements ModifierSetContainerDTO {
  const factory _ModifierSetContainerDTO(
      {@JsonKey(name: 'ModifierSetId')
          required final int modifierSetId,
      @JsonKey(name: 'SetName')
          required final String setName,
      @JsonKey(name: 'MinQuantity')
          required final int minQuantity,
      @JsonKey(name: 'ParentModifierSetDTO')
          final ModifierSetContainerDTO? parentModifierSetDTO,
      @JsonKey(name: 'MaxQuantity')
          required final int maxQuantity,
      @JsonKey(name: 'FreeQuantity')
          required final int freeQuantity,
      @JsonKey(name: 'ModifierSetDetailsContainerDTOList')
          required final List<ModifierSetDetailsContainerDTO>
              modifierSetDetailsContainerDTOList}) = _$_ModifierSetContainerDTO;

  factory _ModifierSetContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_ModifierSetContainerDTO.fromJson;

  @override
  @JsonKey(name: 'ModifierSetId')
  int get modifierSetId;
  @override
  @JsonKey(name: 'SetName')
  String get setName;
  @override
  @JsonKey(name: 'MinQuantity')
  int get minQuantity;
  @override
  @JsonKey(name: 'ParentModifierSetDTO')
  ModifierSetContainerDTO? get parentModifierSetDTO;
  @override
  @JsonKey(name: 'MaxQuantity')
  int get maxQuantity;
  @override
  @JsonKey(name: 'FreeQuantity')
  int get freeQuantity;
  @override
  @JsonKey(name: 'ModifierSetDetailsContainerDTOList')
  List<ModifierSetDetailsContainerDTO> get modifierSetDetailsContainerDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_ModifierSetContainerDTOCopyWith<_$_ModifierSetContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
