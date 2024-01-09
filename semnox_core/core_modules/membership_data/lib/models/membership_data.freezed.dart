// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'membership_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberShipData _$MemberShipDataFromJson(Map<String, dynamic> json) {
  return _MemberShipData.fromJson(json);
}

/// @nodoc
mixin _$MemberShipData {
  @JsonKey(name: 'MembershipContainerDTOList')
  List<MembershipContainerDTO> get membershipContainerDTOList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Hash')
  String? get hash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberShipDataCopyWith<MemberShipData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberShipDataCopyWith<$Res> {
  factory $MemberShipDataCopyWith(
          MemberShipData value, $Res Function(MemberShipData) then) =
      _$MemberShipDataCopyWithImpl<$Res, MemberShipData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MembershipContainerDTOList')
          List<MembershipContainerDTO> membershipContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class _$MemberShipDataCopyWithImpl<$Res, $Val extends MemberShipData>
    implements $MemberShipDataCopyWith<$Res> {
  _$MemberShipDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? membershipContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_value.copyWith(
      membershipContainerDTOList: null == membershipContainerDTOList
          ? _value.membershipContainerDTOList
          : membershipContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<MembershipContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemberShipDataCopyWith<$Res>
    implements $MemberShipDataCopyWith<$Res> {
  factory _$$_MemberShipDataCopyWith(
          _$_MemberShipData value, $Res Function(_$_MemberShipData) then) =
      __$$_MemberShipDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MembershipContainerDTOList')
          List<MembershipContainerDTO> membershipContainerDTOList,
      @JsonKey(name: 'Hash')
          String? hash});
}

/// @nodoc
class __$$_MemberShipDataCopyWithImpl<$Res>
    extends _$MemberShipDataCopyWithImpl<$Res, _$_MemberShipData>
    implements _$$_MemberShipDataCopyWith<$Res> {
  __$$_MemberShipDataCopyWithImpl(
      _$_MemberShipData _value, $Res Function(_$_MemberShipData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? membershipContainerDTOList = null,
    Object? hash = freezed,
  }) {
    return _then(_$_MemberShipData(
      membershipContainerDTOList: null == membershipContainerDTOList
          ? _value._membershipContainerDTOList
          : membershipContainerDTOList // ignore: cast_nullable_to_non_nullable
              as List<MembershipContainerDTO>,
      hash: freezed == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemberShipData implements _MemberShipData {
  const _$_MemberShipData(
      {@JsonKey(name: 'MembershipContainerDTOList')
          required final List<MembershipContainerDTO>
              membershipContainerDTOList,
      @JsonKey(name: 'Hash')
          this.hash})
      : _membershipContainerDTOList = membershipContainerDTOList;

  factory _$_MemberShipData.fromJson(Map<String, dynamic> json) =>
      _$$_MemberShipDataFromJson(json);

  final List<MembershipContainerDTO> _membershipContainerDTOList;
  @override
  @JsonKey(name: 'MembershipContainerDTOList')
  List<MembershipContainerDTO> get membershipContainerDTOList {
    if (_membershipContainerDTOList is EqualUnmodifiableListView)
      return _membershipContainerDTOList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_membershipContainerDTOList);
  }

  @override
  @JsonKey(name: 'Hash')
  final String? hash;

  @override
  String toString() {
    return 'MemberShipData(membershipContainerDTOList: $membershipContainerDTOList, hash: $hash)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberShipData &&
            const DeepCollectionEquality().equals(
                other._membershipContainerDTOList,
                _membershipContainerDTOList) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_membershipContainerDTOList), hash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberShipDataCopyWith<_$_MemberShipData> get copyWith =>
      __$$_MemberShipDataCopyWithImpl<_$_MemberShipData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberShipDataToJson(
      this,
    );
  }
}

abstract class _MemberShipData implements MemberShipData {
  const factory _MemberShipData(
      {@JsonKey(name: 'MembershipContainerDTOList')
          required final List<MembershipContainerDTO>
              membershipContainerDTOList,
      @JsonKey(name: 'Hash')
          final String? hash}) = _$_MemberShipData;

  factory _MemberShipData.fromJson(Map<String, dynamic> json) =
      _$_MemberShipData.fromJson;

  @override
  @JsonKey(name: 'MembershipContainerDTOList')
  List<MembershipContainerDTO> get membershipContainerDTOList;
  @override
  @JsonKey(name: 'Hash')
  String? get hash;
  @override
  @JsonKey(ignore: true)
  _$$_MemberShipDataCopyWith<_$_MemberShipData> get copyWith =>
      throw _privateConstructorUsedError;
}
