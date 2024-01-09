// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_profile_tax_rule_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionProfileTaxRuleContainerDTO
    _$TransactionProfileTaxRuleContainerDTOFromJson(Map<String, dynamic> json) {
  return _TransactionProfileTaxRuleContainerDTO.fromJson(json);
}

/// @nodoc
mixin _$TransactionProfileTaxRuleContainerDTO {
  @JsonKey(name: 'Id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'TrxProfileId')
  int get trxProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxId')
  int get taxId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TaxStructure')
  int get taxStructure => throw _privateConstructorUsedError;
  @JsonKey(name: 'Exempt')
  bool get exempt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionProfileTaxRuleContainerDTOCopyWith<
          TransactionProfileTaxRuleContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionProfileTaxRuleContainerDTOCopyWith<$Res> {
  factory $TransactionProfileTaxRuleContainerDTOCopyWith(
          TransactionProfileTaxRuleContainerDTO value,
          $Res Function(TransactionProfileTaxRuleContainerDTO) then) =
      _$TransactionProfileTaxRuleContainerDTOCopyWithImpl<$Res,
          TransactionProfileTaxRuleContainerDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'TrxProfileId') int trxProfileId,
      @JsonKey(name: 'TaxId') int taxId,
      @JsonKey(name: 'TaxStructure') int taxStructure,
      @JsonKey(name: 'Exempt') bool exempt});
}

/// @nodoc
class _$TransactionProfileTaxRuleContainerDTOCopyWithImpl<$Res,
        $Val extends TransactionProfileTaxRuleContainerDTO>
    implements $TransactionProfileTaxRuleContainerDTOCopyWith<$Res> {
  _$TransactionProfileTaxRuleContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trxProfileId = null,
    Object? taxId = null,
    Object? taxStructure = null,
    Object? exempt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      trxProfileId: null == trxProfileId
          ? _value.trxProfileId
          : trxProfileId // ignore: cast_nullable_to_non_nullable
              as int,
      taxId: null == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as int,
      taxStructure: null == taxStructure
          ? _value.taxStructure
          : taxStructure // ignore: cast_nullable_to_non_nullable
              as int,
      exempt: null == exempt
          ? _value.exempt
          : exempt // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionProfileTaxRuleContainerDTOCopyWith<$Res>
    implements $TransactionProfileTaxRuleContainerDTOCopyWith<$Res> {
  factory _$$_TransactionProfileTaxRuleContainerDTOCopyWith(
          _$_TransactionProfileTaxRuleContainerDTO value,
          $Res Function(_$_TransactionProfileTaxRuleContainerDTO) then) =
      __$$_TransactionProfileTaxRuleContainerDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id') int id,
      @JsonKey(name: 'TrxProfileId') int trxProfileId,
      @JsonKey(name: 'TaxId') int taxId,
      @JsonKey(name: 'TaxStructure') int taxStructure,
      @JsonKey(name: 'Exempt') bool exempt});
}

/// @nodoc
class __$$_TransactionProfileTaxRuleContainerDTOCopyWithImpl<$Res>
    extends _$TransactionProfileTaxRuleContainerDTOCopyWithImpl<$Res,
        _$_TransactionProfileTaxRuleContainerDTO>
    implements _$$_TransactionProfileTaxRuleContainerDTOCopyWith<$Res> {
  __$$_TransactionProfileTaxRuleContainerDTOCopyWithImpl(
      _$_TransactionProfileTaxRuleContainerDTO _value,
      $Res Function(_$_TransactionProfileTaxRuleContainerDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trxProfileId = null,
    Object? taxId = null,
    Object? taxStructure = null,
    Object? exempt = null,
  }) {
    return _then(_$_TransactionProfileTaxRuleContainerDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      trxProfileId: null == trxProfileId
          ? _value.trxProfileId
          : trxProfileId // ignore: cast_nullable_to_non_nullable
              as int,
      taxId: null == taxId
          ? _value.taxId
          : taxId // ignore: cast_nullable_to_non_nullable
              as int,
      taxStructure: null == taxStructure
          ? _value.taxStructure
          : taxStructure // ignore: cast_nullable_to_non_nullable
              as int,
      exempt: null == exempt
          ? _value.exempt
          : exempt // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionProfileTaxRuleContainerDTO
    implements _TransactionProfileTaxRuleContainerDTO {
  const _$_TransactionProfileTaxRuleContainerDTO(
      {@JsonKey(name: 'Id') required this.id,
      @JsonKey(name: 'TrxProfileId') required this.trxProfileId,
      @JsonKey(name: 'TaxId') required this.taxId,
      @JsonKey(name: 'TaxStructure') required this.taxStructure,
      @JsonKey(name: 'Exempt') required this.exempt});

  factory _$_TransactionProfileTaxRuleContainerDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_TransactionProfileTaxRuleContainerDTOFromJson(json);

  @override
  @JsonKey(name: 'Id')
  final int id;
  @override
  @JsonKey(name: 'TrxProfileId')
  final int trxProfileId;
  @override
  @JsonKey(name: 'TaxId')
  final int taxId;
  @override
  @JsonKey(name: 'TaxStructure')
  final int taxStructure;
  @override
  @JsonKey(name: 'Exempt')
  final bool exempt;

  @override
  String toString() {
    return 'TransactionProfileTaxRuleContainerDTO(id: $id, trxProfileId: $trxProfileId, taxId: $taxId, taxStructure: $taxStructure, exempt: $exempt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionProfileTaxRuleContainerDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.trxProfileId, trxProfileId) ||
                other.trxProfileId == trxProfileId) &&
            (identical(other.taxId, taxId) || other.taxId == taxId) &&
            (identical(other.taxStructure, taxStructure) ||
                other.taxStructure == taxStructure) &&
            (identical(other.exempt, exempt) || other.exempt == exempt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, trxProfileId, taxId, taxStructure, exempt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionProfileTaxRuleContainerDTOCopyWith<
          _$_TransactionProfileTaxRuleContainerDTO>
      get copyWith => __$$_TransactionProfileTaxRuleContainerDTOCopyWithImpl<
          _$_TransactionProfileTaxRuleContainerDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionProfileTaxRuleContainerDTOToJson(
      this,
    );
  }
}

abstract class _TransactionProfileTaxRuleContainerDTO
    implements TransactionProfileTaxRuleContainerDTO {
  const factory _TransactionProfileTaxRuleContainerDTO(
          {@JsonKey(name: 'Id') required final int id,
          @JsonKey(name: 'TrxProfileId') required final int trxProfileId,
          @JsonKey(name: 'TaxId') required final int taxId,
          @JsonKey(name: 'TaxStructure') required final int taxStructure,
          @JsonKey(name: 'Exempt') required final bool exempt}) =
      _$_TransactionProfileTaxRuleContainerDTO;

  factory _TransactionProfileTaxRuleContainerDTO.fromJson(
          Map<String, dynamic> json) =
      _$_TransactionProfileTaxRuleContainerDTO.fromJson;

  @override
  @JsonKey(name: 'Id')
  int get id;
  @override
  @JsonKey(name: 'TrxProfileId')
  int get trxProfileId;
  @override
  @JsonKey(name: 'TaxId')
  int get taxId;
  @override
  @JsonKey(name: 'TaxStructure')
  int get taxStructure;
  @override
  @JsonKey(name: 'Exempt')
  bool get exempt;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionProfileTaxRuleContainerDTOCopyWith<
          _$_TransactionProfileTaxRuleContainerDTO>
      get copyWith => throw _privateConstructorUsedError;
}
