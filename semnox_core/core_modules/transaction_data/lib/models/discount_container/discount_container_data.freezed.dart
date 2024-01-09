// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiscountContainerData _$DiscountContainerDataFromJson(
    Map<String, dynamic> json) {
  return _DiscountContainerData.fromJson(json);
}

/// @nodoc
mixin _$DiscountContainerData {
  @JsonKey(name: 'DiscountContainerDTOList')
  List<DiscountContainerDto> get discountContainerDtoList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscountContainerDataCopyWith<DiscountContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountContainerDataCopyWith<$Res> {
  factory $DiscountContainerDataCopyWith(DiscountContainerData value,
          $Res Function(DiscountContainerData) then) =
      _$DiscountContainerDataCopyWithImpl<$Res, DiscountContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'DiscountContainerDTOList')
          List<DiscountContainerDto> discountContainerDtoList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$DiscountContainerDataCopyWithImpl<$Res,
        $Val extends DiscountContainerData>
    implements $DiscountContainerDataCopyWith<$Res> {
  _$DiscountContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountContainerDtoList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      discountContainerDtoList: null == discountContainerDtoList
          ? _value.discountContainerDtoList
          : discountContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<DiscountContainerDto>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscountContainerDataCopyWith<$Res>
    implements $DiscountContainerDataCopyWith<$Res> {
  factory _$$_DiscountContainerDataCopyWith(_$_DiscountContainerData value,
          $Res Function(_$_DiscountContainerData) then) =
      __$$_DiscountContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'DiscountContainerDTOList')
          List<DiscountContainerDto> discountContainerDtoList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_DiscountContainerDataCopyWithImpl<$Res>
    extends _$DiscountContainerDataCopyWithImpl<$Res, _$_DiscountContainerData>
    implements _$$_DiscountContainerDataCopyWith<$Res> {
  __$$_DiscountContainerDataCopyWithImpl(_$_DiscountContainerData _value,
      $Res Function(_$_DiscountContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountContainerDtoList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_DiscountContainerData(
      discountContainerDtoList: null == discountContainerDtoList
          ? _value._discountContainerDtoList
          : discountContainerDtoList // ignore: cast_nullable_to_non_nullable
              as List<DiscountContainerDto>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiscountContainerData implements _DiscountContainerData {
  const _$_DiscountContainerData(
      {@JsonKey(name: 'DiscountContainerDTOList')
          required final List<DiscountContainerDto> discountContainerDtoList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _discountContainerDtoList = discountContainerDtoList;

  factory _$_DiscountContainerData.fromJson(Map<String, dynamic> json) =>
      _$$_DiscountContainerDataFromJson(json);

  final List<DiscountContainerDto> _discountContainerDtoList;
  @override
  @JsonKey(name: 'DiscountContainerDTOList')
  List<DiscountContainerDto> get discountContainerDtoList {
    if (_discountContainerDtoList is EqualUnmodifiableListView)
      return _discountContainerDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discountContainerDtoList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'DiscountContainerData(discountContainerDtoList: $discountContainerDtoList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscountContainerData &&
            const DeepCollectionEquality().equals(
                other._discountContainerDtoList, _discountContainerDtoList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_discountContainerDtoList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscountContainerDataCopyWith<_$_DiscountContainerData> get copyWith =>
      __$$_DiscountContainerDataCopyWithImpl<_$_DiscountContainerData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscountContainerDataToJson(
      this,
    );
  }
}

abstract class _DiscountContainerData implements DiscountContainerData {
  const factory _DiscountContainerData(
      {@JsonKey(name: 'DiscountContainerDTOList')
          required final List<DiscountContainerDto> discountContainerDtoList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_DiscountContainerData;

  factory _DiscountContainerData.fromJson(Map<String, dynamic> json) =
      _$_DiscountContainerData.fromJson;

  @override
  @JsonKey(name: 'DiscountContainerDTOList')
  List<DiscountContainerDto> get discountContainerDtoList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_DiscountContainerDataCopyWith<_$_DiscountContainerData> get copyWith =>
      throw _privateConstructorUsedError;
}
