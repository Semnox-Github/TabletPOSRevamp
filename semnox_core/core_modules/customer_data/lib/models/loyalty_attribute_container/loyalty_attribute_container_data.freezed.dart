// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_attribute_container_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoyaltyAttributeContainerData _$LoyaltyAttributeContainerDataFromJson(
    Map<String, dynamic> json) {
  return _LoyaltyAttributeContainerData.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyAttributeContainerData {
  @JsonKey(name: 'LoyaltyAttributeContainerDTOList')
  List<LoyaltyAttributeContainerDTO> get loyaltyAttributeContainerDTO =>
      throw _privateConstructorUsedError;
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyAttributeContainerDataCopyWith<LoyaltyAttributeContainerData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyAttributeContainerDataCopyWith<$Res> {
  factory $LoyaltyAttributeContainerDataCopyWith(
          LoyaltyAttributeContainerData value,
          $Res Function(LoyaltyAttributeContainerData) then) =
      _$LoyaltyAttributeContainerDataCopyWithImpl<$Res,
          LoyaltyAttributeContainerData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'LoyaltyAttributeContainerDTOList')
          List<LoyaltyAttributeContainerDTO> loyaltyAttributeContainerDTO,
      String? hash});
}

/// @nodoc
class _$LoyaltyAttributeContainerDataCopyWithImpl<$Res,
        $Val extends LoyaltyAttributeContainerData>
    implements $LoyaltyAttributeContainerDataCopyWith<$Res> {
  _$LoyaltyAttributeContainerDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loyaltyAttributeContainerDTO = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      loyaltyAttributeContainerDTO: null == loyaltyAttributeContainerDTO
          ? _value.loyaltyAttributeContainerDTO
          : loyaltyAttributeContainerDTO // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyAttributeContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoyaltyAttributeContainerDataCopyWith<$Res>
    implements $LoyaltyAttributeContainerDataCopyWith<$Res> {
  factory _$$_LoyaltyAttributeContainerDataCopyWith(
          _$_LoyaltyAttributeContainerData value,
          $Res Function(_$_LoyaltyAttributeContainerData) then) =
      __$$_LoyaltyAttributeContainerDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'LoyaltyAttributeContainerDTOList')
          List<LoyaltyAttributeContainerDTO> loyaltyAttributeContainerDTO,
      String? hash});
}

/// @nodoc
class __$$_LoyaltyAttributeContainerDataCopyWithImpl<$Res>
    extends _$LoyaltyAttributeContainerDataCopyWithImpl<$Res,
        _$_LoyaltyAttributeContainerData>
    implements _$$_LoyaltyAttributeContainerDataCopyWith<$Res> {
  __$$_LoyaltyAttributeContainerDataCopyWithImpl(
      _$_LoyaltyAttributeContainerData _value,
      $Res Function(_$_LoyaltyAttributeContainerData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loyaltyAttributeContainerDTO = null,
    Object? hash = freezed,
  }) {
    return _then(_$_LoyaltyAttributeContainerData(
      loyaltyAttributeContainerDTO: null == loyaltyAttributeContainerDTO
          ? _value._loyaltyAttributeContainerDTO
          : loyaltyAttributeContainerDTO // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyAttributeContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyAttributeContainerData
    implements _LoyaltyAttributeContainerData {
  const _$_LoyaltyAttributeContainerData(
      {@JsonKey(name: 'LoyaltyAttributeContainerDTOList')
          required final List<LoyaltyAttributeContainerDTO>
              loyaltyAttributeContainerDTO,
      this.hash})
      : _loyaltyAttributeContainerDTO = loyaltyAttributeContainerDTO;

  factory _$_LoyaltyAttributeContainerData.fromJson(
          Map<String, dynamic> json) =>
      _$$_LoyaltyAttributeContainerDataFromJson(json);

  final List<LoyaltyAttributeContainerDTO> _loyaltyAttributeContainerDTO;
  @override
  @JsonKey(name: 'LoyaltyAttributeContainerDTOList')
  List<LoyaltyAttributeContainerDTO> get loyaltyAttributeContainerDTO {
    if (_loyaltyAttributeContainerDTO is EqualUnmodifiableListView)
      return _loyaltyAttributeContainerDTO;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loyaltyAttributeContainerDTO);
  }

  @override
  final String? hash;

  @override
  String toString() {
    return 'LoyaltyAttributeContainerData(loyaltyAttributeContainerDTO: $loyaltyAttributeContainerDTO, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyAttributeContainerData &&
            const DeepCollectionEquality().equals(
                other._loyaltyAttributeContainerDTO,
                _loyaltyAttributeContainerDTO) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_loyaltyAttributeContainerDTO), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyAttributeContainerDataCopyWith<_$_LoyaltyAttributeContainerData>
      get copyWith => __$$_LoyaltyAttributeContainerDataCopyWithImpl<
          _$_LoyaltyAttributeContainerData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyAttributeContainerDataToJson(
      this,
    );
  }
}

abstract class _LoyaltyAttributeContainerData
    implements LoyaltyAttributeContainerData {
  const factory _LoyaltyAttributeContainerData(
      {@JsonKey(name: 'LoyaltyAttributeContainerDTOList')
          required final List<LoyaltyAttributeContainerDTO>
              loyaltyAttributeContainerDTO,
      final String? hash}) = _$_LoyaltyAttributeContainerData;

  factory _LoyaltyAttributeContainerData.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyAttributeContainerData.fromJson;

  @override
  @JsonKey(name: 'LoyaltyAttributeContainerDTOList')
  List<LoyaltyAttributeContainerDTO> get loyaltyAttributeContainerDTO;
  @override
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyAttributeContainerDataCopyWith<_$_LoyaltyAttributeContainerData>
      get copyWith => throw _privateConstructorUsedError;
}
