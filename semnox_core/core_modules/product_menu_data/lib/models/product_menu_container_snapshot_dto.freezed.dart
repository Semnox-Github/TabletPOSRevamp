// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_menu_container_snapshot_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductMenuContainerSnapshotDTO _$ProductMenuContainerSnapshotDTOFromJson(
    Map<String, dynamic> json) {
  return _ProductMenuContainerSnapshotDTO.fromJson(json);
}

/// @nodoc
mixin _$ProductMenuContainerSnapshotDTO {
  @JsonKey(name: 'StartDateTime')
  String get startDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'EndDateTime')
  String get endDateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductMenuPanelContainerDTOList')
  List<ProductMenuPanelContainerDTO> get productMenuPanelContainerDTOList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductMenuContainerSnapshotDTOCopyWith<ProductMenuContainerSnapshotDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMenuContainerSnapshotDTOCopyWith<$Res> {
  factory $ProductMenuContainerSnapshotDTOCopyWith(
          ProductMenuContainerSnapshotDTO value,
          $Res Function(ProductMenuContainerSnapshotDTO) then) =
      _$ProductMenuContainerSnapshotDTOCopyWithImpl<$Res,
          ProductMenuContainerSnapshotDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'StartDateTime')
          String startDateTime,
      @JsonKey(name: 'EndDateTime')
          String endDateTime,
      @JsonKey(name: 'ProductMenuPanelContainerDTOList')
          List<ProductMenuPanelContainerDTO> productMenuPanelContainerDTOList});
}

/// @nodoc
class _$ProductMenuContainerSnapshotDTOCopyWithImpl<$Res,
        $Val extends ProductMenuContainerSnapshotDTO>
    implements $ProductMenuContainerSnapshotDTOCopyWith<$Res> {
  _$ProductMenuContainerSnapshotDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDateTime = null,
    Object? endDateTime = null,
    Object? productMenuPanelContainerDTOList = null,
  }) {
    return _then(_value.copyWith(
      startDateTime: null == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      endDateTime: null == endDateTime
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      productMenuPanelContainerDTOList: null == productMenuPanelContainerDTOList
          ? _value.productMenuPanelContainerDTOList
          : productMenuPanelContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ProductMenuPanelContainerDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductMenuContainerSnapshotDTOCopyWith<$Res>
    implements $ProductMenuContainerSnapshotDTOCopyWith<$Res> {
  factory _$$_ProductMenuContainerSnapshotDTOCopyWith(
          _$_ProductMenuContainerSnapshotDTO value,
          $Res Function(_$_ProductMenuContainerSnapshotDTO) then) =
      __$$_ProductMenuContainerSnapshotDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'StartDateTime')
          String startDateTime,
      @JsonKey(name: 'EndDateTime')
          String endDateTime,
      @JsonKey(name: 'ProductMenuPanelContainerDTOList')
          List<ProductMenuPanelContainerDTO> productMenuPanelContainerDTOList});
}

/// @nodoc
class __$$_ProductMenuContainerSnapshotDTOCopyWithImpl<$Res>
    extends _$ProductMenuContainerSnapshotDTOCopyWithImpl<$Res,
        _$_ProductMenuContainerSnapshotDTO>
    implements _$$_ProductMenuContainerSnapshotDTOCopyWith<$Res> {
  __$$_ProductMenuContainerSnapshotDTOCopyWithImpl(
      _$_ProductMenuContainerSnapshotDTO _value,
      $Res Function(_$_ProductMenuContainerSnapshotDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDateTime = null,
    Object? endDateTime = null,
    Object? productMenuPanelContainerDTOList = null,
  }) {
    return _then(_$_ProductMenuContainerSnapshotDTO(
      startDateTime: null == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      endDateTime: null == endDateTime
          ? _value.endDateTime
          : endDateTime // ignore: cast_nullable_to_non_nullable
              as String,
      productMenuPanelContainerDTOList: null == productMenuPanelContainerDTOList
          ? _value._productMenuPanelContainerDTOList
          : productMenuPanelContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<ProductMenuPanelContainerDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductMenuContainerSnapshotDTO
    implements _ProductMenuContainerSnapshotDTO {
  const _$_ProductMenuContainerSnapshotDTO(
      {@JsonKey(name: 'StartDateTime')
          required this.startDateTime,
      @JsonKey(name: 'EndDateTime')
          required this.endDateTime,
      @JsonKey(name: 'ProductMenuPanelContainerDTOList')
          required final List<ProductMenuPanelContainerDTO>
              productMenuPanelContainerDTOList})
      : _productMenuPanelContainerDTOList = productMenuPanelContainerDTOList;

  factory _$_ProductMenuContainerSnapshotDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_ProductMenuContainerSnapshotDTOFromJson(json);

  @override
  @JsonKey(name: 'StartDateTime')
  final String startDateTime;
  @override
  @JsonKey(name: 'EndDateTime')
  final String endDateTime;
  final List<ProductMenuPanelContainerDTO> _productMenuPanelContainerDTOList;
  @override
  @JsonKey(name: 'ProductMenuPanelContainerDTOList')
  List<ProductMenuPanelContainerDTO> get productMenuPanelContainerDTOList {
    if (_productMenuPanelContainerDTOList is EqualUnmodifiableListView)
      return _productMenuPanelContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productMenuPanelContainerDTOList);
  }

  @override
  String toString() {
    return 'ProductMenuContainerSnapshotDTO(startDateTime: $startDateTime, endDateTime: $endDateTime, productMenuPanelContainerDTOList: $productMenuPanelContainerDTOList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductMenuContainerSnapshotDTO &&
            (identical(other.startDateTime, startDateTime) ||
                other.startDateTime == startDateTime) &&
            (identical(other.endDateTime, endDateTime) ||
                other.endDateTime == endDateTime) &&
            const DeepCollectionEquality().equals(
                other._productMenuPanelContainerDTOList,
                _productMenuPanelContainerDTOList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startDateTime, endDateTime,
      const DeepCollectionEquality().hash(_productMenuPanelContainerDTOList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductMenuContainerSnapshotDTOCopyWith<
          _$_ProductMenuContainerSnapshotDTO>
      get copyWith => __$$_ProductMenuContainerSnapshotDTOCopyWithImpl<
          _$_ProductMenuContainerSnapshotDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductMenuContainerSnapshotDTOToJson(
      this,
    );
  }
}

abstract class _ProductMenuContainerSnapshotDTO
    implements ProductMenuContainerSnapshotDTO {
  const factory _ProductMenuContainerSnapshotDTO(
          {@JsonKey(name: 'StartDateTime')
              required final String startDateTime,
          @JsonKey(name: 'EndDateTime')
              required final String endDateTime,
          @JsonKey(name: 'ProductMenuPanelContainerDTOList')
              required final List<ProductMenuPanelContainerDTO>
                  productMenuPanelContainerDTOList}) =
      _$_ProductMenuContainerSnapshotDTO;

  factory _ProductMenuContainerSnapshotDTO.fromJson(Map<String, dynamic> json) =
      _$_ProductMenuContainerSnapshotDTO.fromJson;

  @override
  @JsonKey(name: 'StartDateTime')
  String get startDateTime;
  @override
  @JsonKey(name: 'EndDateTime')
  String get endDateTime;
  @override
  @JsonKey(name: 'ProductMenuPanelContainerDTOList')
  List<ProductMenuPanelContainerDTO> get productMenuPanelContainerDTOList;
  @override
  @JsonKey(ignore: true)
  _$$_ProductMenuContainerSnapshotDTOCopyWith<
          _$_ProductMenuContainerSnapshotDTO>
      get copyWith => throw _privateConstructorUsedError;
}
