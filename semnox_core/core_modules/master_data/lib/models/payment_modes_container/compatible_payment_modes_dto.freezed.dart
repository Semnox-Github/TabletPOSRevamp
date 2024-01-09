// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compatible_payment_modes_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompatiblePaymentModesContainerDTO _$CompatiblePaymentModesContainerDTOFromJson(
    Map<String, dynamic> json) {
  return _CompatiblePaymentModesContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$CompatiblePaymentModesContainerDTO {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'PaymentModeId')
  int get paymentModeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'CompatiablePaymentModeId')
  int get compatiblePaymentModeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompatiblePaymentModesContainerDTOCopyWith<
          CompatiblePaymentModesContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompatiblePaymentModesContainerDTOCopyWith<$Res> {
  factory $CompatiblePaymentModesContainerDTOCopyWith(
          CompatiblePaymentModesContainerDTO value,
          $Res Function(CompatiblePaymentModesContainerDTO) then) =
      _$CompatiblePaymentModesContainerDTOCopyWithImpl<$Res,
          CompatiblePaymentModesContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'PaymentModeId') int paymentModeId,
      @JsonKey(name: 'CompatiablePaymentModeId') int compatiblePaymentModeId});
}

/// @nodoc
class _$CompatiblePaymentModesContainerDTOCopyWithImpl<$Res,
        $Val extends CompatiblePaymentModesContainerDTO>
    implements $CompatiblePaymentModesContainerDTOCopyWith<$Res> {
  _$CompatiblePaymentModesContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentModeId = null,
    Object? compatiblePaymentModeId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      paymentModeId: null == paymentModeId
          ? _value.paymentModeId
          : paymentModeId // ignore: cast_nullable_to_non_nullable
              as int,
      compatiblePaymentModeId: null == compatiblePaymentModeId
          ? _value.compatiblePaymentModeId
          : compatiblePaymentModeId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompatiblePaymentModesContainerDTOCopyWith<$Res>
    implements $CompatiblePaymentModesContainerDTOCopyWith<$Res> {
  factory _$$_CompatiblePaymentModesContainerDTOCopyWith(
          _$_CompatiblePaymentModesContainerDTO value,
          $Res Function(_$_CompatiblePaymentModesContainerDTO) then) =
      __$$_CompatiblePaymentModesContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'PaymentModeId') int paymentModeId,
      @JsonKey(name: 'CompatiablePaymentModeId') int compatiblePaymentModeId});
}

/// @nodoc
class __$$_CompatiblePaymentModesContainerDTOCopyWithImpl<$Res>
    extends _$CompatiblePaymentModesContainerDTOCopyWithImpl<$Res,
        _$_CompatiblePaymentModesContainerDTO>
    implements _$$_CompatiblePaymentModesContainerDTOCopyWith<$Res> {
  __$$_CompatiblePaymentModesContainerDTOCopyWithImpl(
      _$_CompatiblePaymentModesContainerDTO _value,
      $Res Function(_$_CompatiblePaymentModesContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? paymentModeId = null,
    Object? compatiblePaymentModeId = null,
  }) {
    return _then(_$_CompatiblePaymentModesContainerDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      paymentModeId: null == paymentModeId
          ? _value.paymentModeId
          : paymentModeId // ignore: cast_nullable_to_non_nullable
              as int,
      compatiblePaymentModeId: null == compatiblePaymentModeId
          ? _value.compatiblePaymentModeId
          : compatiblePaymentModeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompatiblePaymentModesContainerDTO
    implements _CompatiblePaymentModesContainerDTO {
  const _$_CompatiblePaymentModesContainerDTO(
      {@JsonKey(name: 'Id')
          required this.id,
      @JsonKey(name: 'PaymentModeId')
          required this.paymentModeId,
      @JsonKey(name: 'CompatiablePaymentModeId')
          required this.compatiblePaymentModeId});

  factory _$_CompatiblePaymentModesContainerDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_CompatiblePaymentModesContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'PaymentModeId')
  final int paymentModeId;
  @override
  @JsonKey(name: 'CompatiablePaymentModeId')
  final int compatiblePaymentModeId;

  @override
  String toString() {
    return 'CompatiblePaymentModesContainerDTO(id: $id, paymentModeId: $paymentModeId, compatiblePaymentModeId: $compatiblePaymentModeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompatiblePaymentModesContainerDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentModeId, paymentModeId) ||
                other.paymentModeId == paymentModeId) &&
            (identical(
                    other.compatiblePaymentModeId, compatiblePaymentModeId) ||
                other.compatiblePaymentModeId == compatiblePaymentModeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, paymentModeId, compatiblePaymentModeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompatiblePaymentModesContainerDTOCopyWith<
          _$_CompatiblePaymentModesContainerDTO>
      get copyWith => __$$_CompatiblePaymentModesContainerDTOCopyWithImpl<
          _$_CompatiblePaymentModesContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompatiblePaymentModesContainerDTOToJson(
      this,
    );
  }
}

abstract class _CompatiblePaymentModesContainerDTO
    implements CompatiblePaymentModesContainerDTO {
  const factory _CompatiblePaymentModesContainerDTO(
          {@JsonKey(name: 'Id')
              required final int id,
          @JsonKey(name: 'PaymentModeId')
              required final int paymentModeId,
          @JsonKey(name: 'CompatiablePaymentModeId')
              required final int compatiblePaymentModeId}) =
      _$_CompatiblePaymentModesContainerDTO;

  factory _CompatiblePaymentModesContainerDTO.fromJson(
          Map<String, dynamic> json) =
      _$_CompatiblePaymentModesContainerDTO.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'PaymentModeId')
  int get paymentModeId;
  @override
  @JsonKey(name: 'CompatiablePaymentModeId')
  int get compatiblePaymentModeId;
  @override
  @JsonKey(ignore: true)
  _$$_CompatiblePaymentModesContainerDTOCopyWith<
          _$_CompatiblePaymentModesContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
