// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_cash_drawer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

POSCashDrawerContainerDTO _$POSCashDrawerContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _POSCashDrawerContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$POSCashDrawerContainerDTO {
  @JsonKey(name: 'POSCashdrawerId')
  int get posCashdrawerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSMachineId')
  int get posMachineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CashdrawerId')
  int get cashdrawerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $POSCashDrawerContainerDTOCopyWith<POSCashDrawerContainerDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $POSCashDrawerContainerDTOCopyWith<$Res> {
  factory $POSCashDrawerContainerDTOCopyWith(POSCashDrawerContainerDTO value,
          $Res Function(POSCashDrawerContainerDTO) then) =
      _$POSCashDrawerContainerDTOCopyWithImpl<$Res, POSCashDrawerContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'POSCashdrawerId') int posCashdrawerId,
      @JsonKey(name: 'POSMachineId') int posMachineId,
      @JsonKey(name: 'CashdrawerId') int cashdrawerId,
      @JsonKey(name: 'IsActive') bool isActive});
}

/// @nodoc
class _$POSCashDrawerContainerDTOCopyWithImpl<$Res,
        $Val extends POSCashDrawerContainerDTO>
    implements $POSCashDrawerContainerDTOCopyWith<$Res> {
  _$POSCashDrawerContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posCashdrawerId = null,
    Object? posMachineId = null,
    Object? cashdrawerId = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      posCashdrawerId: null == posCashdrawerId
          ? _value.posCashdrawerId
          : posCashdrawerId // ignore: cast_nullable_to_non_nullable
              as int,
      posMachineId: null == posMachineId
          ? _value.posMachineId
          : posMachineId // ignore: cast_nullable_to_non_nullable
              as int,
      cashdrawerId: null == cashdrawerId
          ? _value.cashdrawerId
          : cashdrawerId // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_POSCashDrawerContainerDTOCopyWith<$Res>
    implements $POSCashDrawerContainerDTOCopyWith<$Res> {
  factory _$$_POSCashDrawerContainerDTOCopyWith(
          _$_POSCashDrawerContainerDTO value,
          $Res Function(_$_POSCashDrawerContainerDTO) then) =
      __$$_POSCashDrawerContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'POSCashdrawerId') int posCashdrawerId,
      @JsonKey(name: 'POSMachineId') int posMachineId,
      @JsonKey(name: 'CashdrawerId') int cashdrawerId,
      @JsonKey(name: 'IsActive') bool isActive});
}

/// @nodoc
class __$$_POSCashDrawerContainerDTOCopyWithImpl<$Res>
    extends _$POSCashDrawerContainerDTOCopyWithImpl<$Res,
        _$_POSCashDrawerContainerDTO>
    implements _$$_POSCashDrawerContainerDTOCopyWith<$Res> {
  __$$_POSCashDrawerContainerDTOCopyWithImpl(
      _$_POSCashDrawerContainerDTO _value,
      $Res Function(_$_POSCashDrawerContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posCashdrawerId = null,
    Object? posMachineId = null,
    Object? cashdrawerId = null,
    Object? isActive = null,
  }) {
    return _then(_$_POSCashDrawerContainerDTO(
      posCashdrawerId: null == posCashdrawerId
          ? _value.posCashdrawerId
          : posCashdrawerId // ignore: cast_nullable_to_non_nullable
              as int,
      posMachineId: null == posMachineId
          ? _value.posMachineId
          : posMachineId // ignore: cast_nullable_to_non_nullable
              as int,
      cashdrawerId: null == cashdrawerId
          ? _value.cashdrawerId
          : cashdrawerId // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_POSCashDrawerContainerDTO implements _POSCashDrawerContainerDTO {
  const _$_POSCashDrawerContainerDTO(
      {@JsonKey(name: 'POSCashdrawerId') required this.posCashdrawerId,
      @JsonKey(name: 'POSMachineId') required this.posMachineId,
      @JsonKey(name: 'CashdrawerId') required this.cashdrawerId,
      @JsonKey(name: 'IsActive') required this.isActive});

  factory _$_POSCashDrawerContainerDTO.fromJson(Map<String, dynamic> json) =>
      _$$_POSCashDrawerContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'POSCashdrawerId')
  final int posCashdrawerId;
  @override
  @JsonKey(name: 'POSMachineId')
  final int posMachineId;
  @override
  @JsonKey(name: 'CashdrawerId')
  final int cashdrawerId;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;

  @override
  String toString() {
    return 'POSCashDrawerContainerDTO(posCashdrawerId: $posCashdrawerId, posMachineId: $posMachineId, cashdrawerId: $cashdrawerId, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_POSCashDrawerContainerDTO &&
            (identical(other.posCashdrawerId, posCashdrawerId) ||
                other.posCashdrawerId == posCashdrawerId) &&
            (identical(other.posMachineId, posMachineId) ||
                other.posMachineId == posMachineId) &&
            (identical(other.cashdrawerId, cashdrawerId) ||
                other.cashdrawerId == cashdrawerId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, posCashdrawerId, posMachineId, cashdrawerId, isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_POSCashDrawerContainerDTOCopyWith<_$_POSCashDrawerContainerDTO>
      get copyWith => __$$_POSCashDrawerContainerDTOCopyWithImpl<
          _$_POSCashDrawerContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_POSCashDrawerContainerDTOToJson(
      this,
    );
  }
}

abstract class _POSCashDrawerContainerDTO implements POSCashDrawerContainerDTO {
  const factory _POSCashDrawerContainerDTO(
          {@JsonKey(name: 'POSCashdrawerId') required final int posCashdrawerId,
          @JsonKey(name: 'POSMachineId') required final int posMachineId,
          @JsonKey(name: 'CashdrawerId') required final int cashdrawerId,
          @JsonKey(name: 'IsActive') required final bool isActive}) =
      _$_POSCashDrawerContainerDTO;

  factory _POSCashDrawerContainerDTO.fromJson(Map<String, dynamic> json) =
      _$_POSCashDrawerContainerDTO.fromJson;

  @override
  @JsonKey(name: 'POSCashdrawerId')
  int get posCashdrawerId;
  @override
  @JsonKey(name: 'POSMachineId')
  int get posMachineId;
  @override
  @JsonKey(name: 'CashdrawerId')
  int get cashdrawerId;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_POSCashDrawerContainerDTOCopyWith<_$_POSCashDrawerContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
