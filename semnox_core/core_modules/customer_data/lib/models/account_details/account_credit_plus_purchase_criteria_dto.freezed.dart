// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_credit_plus_purchase_criteria_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountCreditPlusPurchaseCriteriaDTO
    _$AccountCreditPlusPurchaseCriteriaDTOFromJson(Map<String, dynamic> json) {
  return _AccountCreditPlusPurchaseCriteriaDTO.fromJson(json);
}

/// @nodoc
mixin _$AccountCreditPlusPurchaseCriteriaDTO {
  @JsonKey(name: 'ProductId')
  int? get productId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCreditPlusPurchaseCriteriaDTOCopyWith<
          AccountCreditPlusPurchaseCriteriaDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCreditPlusPurchaseCriteriaDTOCopyWith<$Res> {
  factory $AccountCreditPlusPurchaseCriteriaDTOCopyWith(
          AccountCreditPlusPurchaseCriteriaDTO value,
          $Res Function(AccountCreditPlusPurchaseCriteriaDTO) then) =
      _$AccountCreditPlusPurchaseCriteriaDTOCopyWithImpl<$Res,
          AccountCreditPlusPurchaseCriteriaDTO>;
  @useResult
  $Res call({@JsonKey(name: 'ProductId') int? productId});
}

/// @nodoc
class _$AccountCreditPlusPurchaseCriteriaDTOCopyWithImpl<$Res,
        $Val extends AccountCreditPlusPurchaseCriteriaDTO>
    implements $AccountCreditPlusPurchaseCriteriaDTOCopyWith<$Res> {
  _$AccountCreditPlusPurchaseCriteriaDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
  }) {
    return _then(_value.copyWith(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountCreditPlusPurchaseCriteriaDTOCopyWith<$Res>
    implements $AccountCreditPlusPurchaseCriteriaDTOCopyWith<$Res> {
  factory _$$_AccountCreditPlusPurchaseCriteriaDTOCopyWith(
          _$_AccountCreditPlusPurchaseCriteriaDTO value,
          $Res Function(_$_AccountCreditPlusPurchaseCriteriaDTO) then) =
      __$$_AccountCreditPlusPurchaseCriteriaDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'ProductId') int? productId});
}

/// @nodoc
class __$$_AccountCreditPlusPurchaseCriteriaDTOCopyWithImpl<$Res>
    extends _$AccountCreditPlusPurchaseCriteriaDTOCopyWithImpl<$Res,
        _$_AccountCreditPlusPurchaseCriteriaDTO>
    implements _$$_AccountCreditPlusPurchaseCriteriaDTOCopyWith<$Res> {
  __$$_AccountCreditPlusPurchaseCriteriaDTOCopyWithImpl(
      _$_AccountCreditPlusPurchaseCriteriaDTO _value,
      $Res Function(_$_AccountCreditPlusPurchaseCriteriaDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = freezed,
  }) {
    return _then(_$_AccountCreditPlusPurchaseCriteriaDTO(
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountCreditPlusPurchaseCriteriaDTO
    implements _AccountCreditPlusPurchaseCriteriaDTO {
  const _$_AccountCreditPlusPurchaseCriteriaDTO(
      {@JsonKey(name: 'ProductId') required this.productId});

  factory _$_AccountCreditPlusPurchaseCriteriaDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_AccountCreditPlusPurchaseCriteriaDTOFromJson(json);

  @override
  @JsonKey(name: 'ProductId')
  final int? productId;

  @override
  String toString() {
    return 'AccountCreditPlusPurchaseCriteriaDTO(productId: $productId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountCreditPlusPurchaseCriteriaDTO &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountCreditPlusPurchaseCriteriaDTOCopyWith<
          _$_AccountCreditPlusPurchaseCriteriaDTO>
      get copyWith => __$$_AccountCreditPlusPurchaseCriteriaDTOCopyWithImpl<
          _$_AccountCreditPlusPurchaseCriteriaDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountCreditPlusPurchaseCriteriaDTOToJson(
      this,
    );
  }
}

abstract class _AccountCreditPlusPurchaseCriteriaDTO
    implements AccountCreditPlusPurchaseCriteriaDTO {
  const factory _AccountCreditPlusPurchaseCriteriaDTO(
          {@JsonKey(name: 'ProductId') required final int? productId}) =
      _$_AccountCreditPlusPurchaseCriteriaDTO;

  factory _AccountCreditPlusPurchaseCriteriaDTO.fromJson(
          Map<String, dynamic> json) =
      _$_AccountCreditPlusPurchaseCriteriaDTO.fromJson;

  @override
  @JsonKey(name: 'ProductId')
  int? get productId;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCreditPlusPurchaseCriteriaDTOCopyWith<
          _$_AccountCreditPlusPurchaseCriteriaDTO>
      get copyWith => throw _privateConstructorUsedError;
}
