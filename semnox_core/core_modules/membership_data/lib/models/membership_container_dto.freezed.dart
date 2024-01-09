// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MembershipContainerDTO _$MembershipContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _MembershipContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$MembershipContainerDTO {
  @JsonKey(name: 'MembershipId')
  int get membershipId => throw _privateConstructorUsedError;
  @JsonKey(name: 'MembershipName')
  String get membershipName => throw _privateConstructorUsedError;
  @JsonKey(name: 'Description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'RedemptionDiscount')
  double get redemptionDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriceListId')
  int get priceListId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MembershipContainerDTOCopyWith<MembershipContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipContainerDTOCopyWith<$Res> {
  factory $MembershipContainerDTOCopyWith(MembershipContainerDTO value,
          $Res Function(MembershipContainerDTO) then) =
      _$MembershipContainerDTOCopyWithImpl<$Res, MembershipContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MembershipId') int membershipId,
      @JsonKey(name: 'MembershipName') String membershipName,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'RedemptionDiscount') double redemptionDiscount,
      @JsonKey(name: 'PriceListId') int priceListId});
}

/// @nodoc
class _$MembershipContainerDTOCopyWithImpl<$Res,
        $Val extends MembershipContainerDTO>
    implements $MembershipContainerDTOCopyWith<$Res> {
  _$MembershipContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? membershipId = null,
    Object? membershipName = null,
    Object? description = null,
    Object? redemptionDiscount = null,
    Object? priceListId = null,
  }) {
    return _then(_value.copyWith(
      membershipId: null == membershipId
          ? _value.membershipId
          : membershipId // ignore: cast_nullable_to_non_nullable
              as int,
      membershipName: null == membershipName
          ? _value.membershipName
          : membershipName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      redemptionDiscount: null == redemptionDiscount
          ? _value.redemptionDiscount
          : redemptionDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      priceListId: null == priceListId
          ? _value.priceListId
          : priceListId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MembershipContainerDTOCopyWith<$Res>
    implements $MembershipContainerDTOCopyWith<$Res> {
  factory _$$_MembershipContainerDTOCopyWith(_$_MembershipContainerDTO value,
          $Res Function(_$_MembershipContainerDTO) then) =
      __$$_MembershipContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MembershipId') int membershipId,
      @JsonKey(name: 'MembershipName') String membershipName,
      @JsonKey(name: 'Description') String description,
      @JsonKey(name: 'RedemptionDiscount') double redemptionDiscount,
      @JsonKey(name: 'PriceListId') int priceListId});
}

/// @nodoc
class __$$_MembershipContainerDTOCopyWithImpl<$Res>
    extends _$MembershipContainerDTOCopyWithImpl<$Res,
        _$_MembershipContainerDTO>
    implements _$$_MembershipContainerDTOCopyWith<$Res> {
  __$$_MembershipContainerDTOCopyWithImpl(_$_MembershipContainerDTO _value,
      $Res Function(_$_MembershipContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? membershipId = null,
    Object? membershipName = null,
    Object? description = null,
    Object? redemptionDiscount = null,
    Object? priceListId = null,
  }) {
    return _then(_$_MembershipContainerDTO(
      membershipId: null == membershipId
          ? _value.membershipId
          : membershipId // ignore: cast_nullable_to_non_nullable
              as int,
      membershipName: null == membershipName
          ? _value.membershipName
          : membershipName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      redemptionDiscount: null == redemptionDiscount
          ? _value.redemptionDiscount
          : redemptionDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      priceListId: null == priceListId
          ? _value.priceListId
          : priceListId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MembershipContainerDTO implements _MembershipContainerDTO {
  const _$_MembershipContainerDTO(
      {@JsonKey(name: 'MembershipId') required this.membershipId,
      @JsonKey(name: 'MembershipName') required this.membershipName,
      @JsonKey(name: 'Description') required this.description,
      @JsonKey(name: 'RedemptionDiscount') required this.redemptionDiscount,
      @JsonKey(name: 'PriceListId') required this.priceListId});

  factory _$_MembershipContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_MembershipContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'MembershipId')
  final int membershipId;
  @override
  @JsonKey(name: 'MembershipName')
  final String membershipName;
  @override
  @JsonKey(name: 'Description')
  final String description;
  @override
  @JsonKey(name: 'RedemptionDiscount')
  final double redemptionDiscount;
  @override
  @JsonKey(name: 'PriceListId')
  final int priceListId;

  @override
  String toString() {
    return 'MembershipContainerDTO(membershipId: $membershipId, membershipName: $membershipName, description: $description, redemptionDiscount: $redemptionDiscount, priceListId: $priceListId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MembershipContainerDTO &&
            (identical(other.membershipId, membershipId) ||
                other.membershipId == membershipId) &&
            (identical(other.membershipName, membershipName) ||
                other.membershipName == membershipName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.redemptionDiscount, redemptionDiscount) ||
                other.redemptionDiscount == redemptionDiscount) &&
            (identical(other.priceListId, priceListId) ||
                other.priceListId == priceListId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, membershipId, membershipName,
      description, redemptionDiscount, priceListId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MembershipContainerDTOCopyWith<_$_MembershipContainerDTO> get copyWith =>
      __$$_MembershipContainerDTOCopyWithImpl<_$_MembershipContainerDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MembershipContainerDTOToJson(
      this,
    );
  }
}

abstract class _MembershipContainerDTO implements MembershipContainerDTO {
  const factory _MembershipContainerDTO(
      {@JsonKey(name: 'MembershipId')
          required final int membershipId,
      @JsonKey(name: 'MembershipName')
          required final String membershipName,
      @JsonKey(name: 'Description')
          required final String description,
      @JsonKey(name: 'RedemptionDiscount')
          required final double redemptionDiscount,
      @JsonKey(name: 'PriceListId')
          required final int priceListId}) = _$_MembershipContainerDTO;

  factory _MembershipContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_MembershipContainerDTO.fromJson;

  @override
  @JsonKey(name: 'MembershipId')
  int get membershipId;
  @override
  @JsonKey(name: 'MembershipName')
  String get membershipName;
  @override
  @JsonKey(name: 'Description')
  String get description;
  @override
  @JsonKey(name: 'RedemptionDiscount')
  double get redemptionDiscount;
  @override
  @JsonKey(name: 'PriceListId')
  int get priceListId;
  @override
  @JsonKey(ignore: true)
  _$$_MembershipContainerDTOCopyWith<_$_MembershipContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
