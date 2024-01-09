// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_display_group_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductsDisplayGroupContainerDTO _$ProductsDisplayGroupContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _ProductsDisplayGroupContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$ProductsDisplayGroupContainerDTO {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'DisplayGroupId')
  int get displayGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'DisplayGroup')
  String get displayGroup => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductsDisplayGroupContainerDTOCopyWith<ProductsDisplayGroupContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsDisplayGroupContainerDTOCopyWith<$Res> {
  factory $ProductsDisplayGroupContainerDTOCopyWith(
          ProductsDisplayGroupContainerDTO value,
          $Res Function(ProductsDisplayGroupContainerDTO) then) =
      _$ProductsDisplayGroupContainerDTOCopyWithImpl<$Res,
          ProductsDisplayGroupContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'DisplayGroupId') int displayGroupId,
      @JsonKey(name: 'DisplayGroup') String displayGroup});
}

/// @nodoc
class _$ProductsDisplayGroupContainerDTOCopyWithImpl<$Res,
        $Val extends ProductsDisplayGroupContainerDTO>
    implements $ProductsDisplayGroupContainerDTOCopyWith<$Res> {
  _$ProductsDisplayGroupContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayGroupId = null,
    Object? displayGroup = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayGroupId: null == displayGroupId
          ? _value.displayGroupId
          : displayGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      displayGroup: null == displayGroup
          ? _value.displayGroup
          : displayGroup // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductsDisplayGroupContainerDTOCopyWith<$Res>
    implements $ProductsDisplayGroupContainerDTOCopyWith<$Res> {
  factory _$$_ProductsDisplayGroupContainerDTOCopyWith(
          _$_ProductsDisplayGroupContainerDTO value,
          $Res Function(_$_ProductsDisplayGroupContainerDTO) then) =
      __$$_ProductsDisplayGroupContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'DisplayGroupId') int displayGroupId,
      @JsonKey(name: 'DisplayGroup') String displayGroup});
}

/// @nodoc
class __$$_ProductsDisplayGroupContainerDTOCopyWithImpl<$Res>
    extends _$ProductsDisplayGroupContainerDTOCopyWithImpl<$Res,
        _$_ProductsDisplayGroupContainerDTO>
    implements _$$_ProductsDisplayGroupContainerDTOCopyWith<$Res> {
  __$$_ProductsDisplayGroupContainerDTOCopyWithImpl(
      _$_ProductsDisplayGroupContainerDTO _value,
      $Res Function(_$_ProductsDisplayGroupContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayGroupId = null,
    Object? displayGroup = null,
  }) {
    return _then(_$_ProductsDisplayGroupContainerDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayGroupId: null == displayGroupId
          ? _value.displayGroupId
          : displayGroupId // ignore: cast_nullable_to_non_nullable
              as int,
      displayGroup: null == displayGroup
          ? _value.displayGroup
          : displayGroup // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductsDisplayGroupContainerDTO
    implements _ProductsDisplayGroupContainerDTO {
  const _$_ProductsDisplayGroupContainerDTO(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'DisplayGroupId') required this.displayGroupId,
      @JsonKey(name: 'DisplayGroup') required this.displayGroup});

  factory _$_ProductsDisplayGroupContainerDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_ProductsDisplayGroupContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'DisplayGroupId')
  final int displayGroupId;
  @override
  @JsonKey(name: 'DisplayGroup')
  final String displayGroup;

  @override
  String toString() {
    return 'ProductsDisplayGroupContainerDTO(id: $id, displayGroupId: $displayGroupId, displayGroup: $displayGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsDisplayGroupContainerDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayGroupId, displayGroupId) ||
                other.displayGroupId == displayGroupId) &&
            (identical(other.displayGroup, displayGroup) ||
                other.displayGroup == displayGroup));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, displayGroupId, displayGroup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductsDisplayGroupContainerDTOCopyWith<
          _$_ProductsDisplayGroupContainerDTO>
      get copyWith => __$$_ProductsDisplayGroupContainerDTOCopyWithImpl<
          _$_ProductsDisplayGroupContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductsDisplayGroupContainerDTOToJson(
      this,
    );
  }
}

abstract class _ProductsDisplayGroupContainerDTO
    implements ProductsDisplayGroupContainerDTO {
  const factory _ProductsDisplayGroupContainerDTO(
          {@JsonKey(name: 'Id') required final int id,
          @JsonKey(name: 'DisplayGroupId') required final int displayGroupId,
          @JsonKey(name: 'DisplayGroup') required final String displayGroup}) =
      _$_ProductsDisplayGroupContainerDTO;

  factory _ProductsDisplayGroupContainerDTO.fromJson(
      Map<String, dynamic> json) = _$_ProductsDisplayGroupContainerDTO.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'DisplayGroupId')
  int get displayGroupId;
  @override
  @JsonKey(name: 'DisplayGroup')
  String get displayGroup;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsDisplayGroupContainerDTOCopyWith<
          _$_ProductsDisplayGroupContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
