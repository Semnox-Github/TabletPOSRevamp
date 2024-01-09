// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryContainerData _$CategoryContainerDataFromJson(
    Map<String, dynamic> json) {
  return _CategoryContainerData.fromJson(json);
}

/// @nodoc
mixin _$CategoryContainerData {
  @JsonKey(name: 'CategoryContainerDTOList')
  List<CategoryContainerDTO>? get categoryContainerDTOList =>
      throw _privateConstructorUsedError;
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryContainerDataCopyWith<CategoryContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryContainerDataCopyWith<$Res> {
  factory $CategoryContainerDataCopyWith(CategoryContainerData value,
          $Res Function(CategoryContainerData) then) =
      _$CategoryContainerDataCopyWithImpl<$Res, CategoryContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'CategoryContainerDTOList')
          List<CategoryContainerDTO>? categoryContainerDTOList,
      String? hash});
}

/// @nodoc
class _$CategoryContainerDataCopyWithImpl<$Res,
        $Val extends CategoryContainerData>
    implements $CategoryContainerDataCopyWith<$Res> {
  _$CategoryContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryContainerDTOList = freezed,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      categoryContainerDTOList: freezed == categoryContainerDTOList
          ? _value.categoryContainerDTOList
          : categoryContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<CategoryContainerDTO>?,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryContainerDataCopyWith<$Res>
    implements $CategoryContainerDataCopyWith<$Res> {
  factory _$$_CategoryContainerDataCopyWith(_$_CategoryContainerData value,
          $Res Function(_$_CategoryContainerData) then) =
      __$$_CategoryContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'CategoryContainerDTOList')
          List<CategoryContainerDTO>? categoryContainerDTOList,
      String? hash});
}

/// @nodoc
class __$$_CategoryContainerDataCopyWithImpl<$Res>
    extends _$CategoryContainerDataCopyWithImpl<$Res, _$_CategoryContainerData>
    implements _$$_CategoryContainerDataCopyWith<$Res> {
  __$$_CategoryContainerDataCopyWithImpl(_$_CategoryContainerData _value,
      $Res Function(_$_CategoryContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryContainerDTOList = freezed,
    Object? hash = freezed,
  }) {
    return _then(_$_CategoryContainerData(
      categoryContainerDTOList: freezed == categoryContainerDTOList
          ? _value._categoryContainerDTOList
          : categoryContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<CategoryContainerDTO>?,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryContainerData implements _CategoryContainerData {
  const _$_CategoryContainerData(
      {@JsonKey(name: 'CategoryContainerDTOList')
          final List<CategoryContainerDTO>? categoryContainerDTOList,
      this.hash})
      : _categoryContainerDTOList = categoryContainerDTOList;

  factory _$_CategoryContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryContainerDataFromJson(json);

  final List<CategoryContainerDTO>? _categoryContainerDTOList;
  @override
  @JsonKey(name: 'CategoryContainerDTOList')
  List<CategoryContainerDTO>? get categoryContainerDTOList {
    final value = _categoryContainerDTOList;
    if (value == null) return null;
    if (_categoryContainerDTOList is EqualUnmodifiableListView)
      return _categoryContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? hash;

  @override
  String toString() {
    return 'CategoryContainerData(categoryContainerDTOList: $categoryContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryContainerData &&
            const DeepCollectionEquality().equals(
                other._categoryContainerDTOList, _categoryContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_categoryContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryContainerDataCopyWith<_$_CategoryContainerData> get copyWith =>
      __$$_CategoryContainerDataCopyWithImpl<_$_CategoryContainerData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryContainerDataToJson(
      this,
    );
  }
}

abstract class _CategoryContainerData implements CategoryContainerData {
  const factory _CategoryContainerData(
      {@JsonKey(name: 'CategoryContainerDTOList')
          final List<CategoryContainerDTO>? categoryContainerDTOList,
      final String? hash}) = _$_CategoryContainerData;

  factory _CategoryContainerData.fromJson(Map<String, dynamic> json) =
      _$_CategoryContainerData.fromJson;

  @override
  @JsonKey(name: 'CategoryContainerDTOList')
  List<CategoryContainerDTO>? get categoryContainerDTOList;
  @override
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryContainerDataCopyWith<_$_CategoryContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}
