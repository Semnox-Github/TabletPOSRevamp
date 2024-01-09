// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryContainerDTO _$CategoryContainerDTOFromJson(Map<String, dynamic> json) {
  return _CategoryContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$CategoryContainerDTO {
  @JsonKey(name: 'CategoryId')
  int? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'ChildCategoryIdList ')
  List<int>? get childCategoryIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'ParentCategoryIdList')
  List<int>? get parentCategoryIdList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryContainerDTOCopyWith<CategoryContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryContainerDTOCopyWith<$Res> {
  factory $CategoryContainerDTOCopyWith(CategoryContainerDTO value,
          $Res Function(CategoryContainerDTO) then) =
      _$CategoryContainerDTOCopyWithImpl<$Res, CategoryContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CategoryId') int? categoryId,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'ChildCategoryIdList ') List<int>? childCategoryIdList,
      @JsonKey(name: 'ParentCategoryIdList') List<int>? parentCategoryIdList});
}

/// @nodoc
class _$CategoryContainerDTOCopyWithImpl<$Res,
        $Val extends CategoryContainerDTO>
    implements $CategoryContainerDTOCopyWith<$Res> {
  _$CategoryContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? childCategoryIdList = freezed,
    Object? parentCategoryIdList = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      childCategoryIdList: freezed == childCategoryIdList
          ? _value.childCategoryIdList
          : childCategoryIdList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      parentCategoryIdList: freezed == parentCategoryIdList
          ? _value.parentCategoryIdList
          : parentCategoryIdList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryContainerDTOCopyWith<$Res>
    implements $CategoryContainerDTOCopyWith<$Res> {
  factory _$$_CategoryContainerDTOCopyWith(_$_CategoryContainerDTO value,
          $Res Function(_$_CategoryContainerDTO) then) =
      __$$_CategoryContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CategoryId') int? categoryId,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'ChildCategoryIdList ') List<int>? childCategoryIdList,
      @JsonKey(name: 'ParentCategoryIdList') List<int>? parentCategoryIdList});
}

/// @nodoc
class __$$_CategoryContainerDTOCopyWithImpl<$Res>
    extends _$CategoryContainerDTOCopyWithImpl<$Res, _$_CategoryContainerDTO>
    implements _$$_CategoryContainerDTOCopyWith<$Res> {
  __$$_CategoryContainerDTOCopyWithImpl(_$_CategoryContainerDTO _value,
      $Res Function(_$_CategoryContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
    Object? name = freezed,
    Object? childCategoryIdList = freezed,
    Object? parentCategoryIdList = freezed,
  }) {
    return _then(_$_CategoryContainerDTO(
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      childCategoryIdList: freezed == childCategoryIdList
          ? _value._childCategoryIdList
          : childCategoryIdList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      parentCategoryIdList: freezed == parentCategoryIdList
          ? _value._parentCategoryIdList
          : parentCategoryIdList // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryContainerDTO implements _CategoryContainerDTO {
  const _$_CategoryContainerDTO(
      {@JsonKey(name: 'CategoryId')
          this.categoryId,
      @JsonKey(name: 'Name')
          this.name,
      @JsonKey(name: 'ChildCategoryIdList ')
          final List<int>? childCategoryIdList,
      @JsonKey(name: 'ParentCategoryIdList')
          final List<int>? parentCategoryIdList})
      : _childCategoryIdList = childCategoryIdList,
        _parentCategoryIdList = parentCategoryIdList;

  factory _$_CategoryContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'CategoryId')
  final int? categoryId;
  @override
  @JsonKey(name: 'Name')
  final String? name;
  final List<int>? _childCategoryIdList;
  @override
  @JsonKey(name: 'ChildCategoryIdList ')
  List<int>? get childCategoryIdList {
    final value = _childCategoryIdList;
    if (value == null) return null;
    if (_childCategoryIdList is EqualUnmodifiableListView)
      return _childCategoryIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _parentCategoryIdList;
  @override
  @JsonKey(name: 'ParentCategoryIdList')
  List<int>? get parentCategoryIdList {
    final value = _parentCategoryIdList;
    if (value == null) return null;
    if (_parentCategoryIdList is EqualUnmodifiableListView)
      return _parentCategoryIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CategoryContainerDTO(categoryId: $categoryId, name: $name, childCategoryIdList: $childCategoryIdList, parentCategoryIdList: $parentCategoryIdList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryContainerDTO &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._childCategoryIdList, _childCategoryIdList) &&
            const DeepCollectionEquality()
                .equals(other._parentCategoryIdList, _parentCategoryIdList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      categoryId,
      name,
      const DeepCollectionEquality().hash(_childCategoryIdList),
      const DeepCollectionEquality().hash(_parentCategoryIdList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryContainerDTOCopyWith<_$_CategoryContainerDTO> get copyWith =>
      __$$_CategoryContainerDTOCopyWithImpl<_$_CategoryContainerDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryContainerDTOToJson(
      this,
    );
  }
}

abstract class _CategoryContainerDTO implements CategoryContainerDTO {
  const factory _CategoryContainerDTO(
      {@JsonKey(name: 'CategoryId')
          final int? categoryId,
      @JsonKey(name: 'Name')
          final String? name,
      @JsonKey(name: 'ChildCategoryIdList ')
          final List<int>? childCategoryIdList,
      @JsonKey(name: 'ParentCategoryIdList')
          final List<int>? parentCategoryIdList}) = _$_CategoryContainerDTO;

  factory _CategoryContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_CategoryContainerDTO.fromJson;

  @override
  @JsonKey(name: 'CategoryId')
  int? get categoryId;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'ChildCategoryIdList ')
  List<int>? get childCategoryIdList;
  @override
  @JsonKey(name: 'ParentCategoryIdList')
  List<int>? get parentCategoryIdList;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryContainerDTOCopyWith<_$_CategoryContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
