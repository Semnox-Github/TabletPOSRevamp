// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_discount_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionDiscountDTO _$TransactionDiscountDTOFromJson(
    Map<String, dynamic> json) {
  return _TransactionDiscountDTO.fromJson(json);
}

/// @nodoc
mixin _$TransactionDiscountDTO {
  @JsonKey(name: 'TransactionId')
  dynamic? get transactionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionDiscountDTOCopyWith<TransactionDiscountDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDiscountDTOCopyWith<$Res> {
  factory $TransactionDiscountDTOCopyWith(TransactionDiscountDTO value,
          $Res Function(TransactionDiscountDTO) then) =
      _$TransactionDiscountDTOCopyWithImpl<$Res, TransactionDiscountDTO>;
  @useResult
  $Res call({@JsonKey(name: 'TransactionId') dynamic? transactionId});
}

/// @nodoc
class _$TransactionDiscountDTOCopyWithImpl<$Res,
        $Val extends TransactionDiscountDTO>
    implements $TransactionDiscountDTOCopyWith<$Res> {
  _$TransactionDiscountDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionDiscountDTOCopyWith<$Res>
    implements $TransactionDiscountDTOCopyWith<$Res> {
  factory _$$_TransactionDiscountDTOCopyWith(_$_TransactionDiscountDTO value,
          $Res Function(_$_TransactionDiscountDTO) then) =
      __$$_TransactionDiscountDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'TransactionId') dynamic? transactionId});
}

/// @nodoc
class __$$_TransactionDiscountDTOCopyWithImpl<$Res>
    extends _$TransactionDiscountDTOCopyWithImpl<$Res,
        _$_TransactionDiscountDTO>
    implements _$$_TransactionDiscountDTOCopyWith<$Res> {
  __$$_TransactionDiscountDTOCopyWithImpl(_$_TransactionDiscountDTO _value,
      $Res Function(_$_TransactionDiscountDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
  }) {
    return _then(_$_TransactionDiscountDTO(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionDiscountDTO implements _TransactionDiscountDTO {
  const _$_TransactionDiscountDTO(
      {@JsonKey(name: 'TransactionId') this.transactionId});

  factory _$_TransactionDiscountDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionDiscountDTOFromJson(json);

  @override
  @JsonKey(name: 'TransactionId')
  final dynamic? transactionId;

  @override
  String toString() {
    return 'TransactionDiscountDTO(transactionId: $transactionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionDiscountDTO &&
            const DeepCollectionEquality()
                .equals(other.transactionId, transactionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(transactionId));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionDiscountDTOCopyWith<_$_TransactionDiscountDTO> get copyWith =>
      __$$_TransactionDiscountDTOCopyWithImpl<_$_TransactionDiscountDTO>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionDiscountDTOToJson(
      this,
    );
  }
}

abstract class _TransactionDiscountDTO implements TransactionDiscountDTO {
  const factory _TransactionDiscountDTO(
          {@JsonKey(name: 'TransactionId') final dynamic? transactionId}) =
      _$_TransactionDiscountDTO;

  factory _TransactionDiscountDTO.fromJson(Map<String, dynamic> json) =
      _$_TransactionDiscountDTO.fromJson;

  @override
  @JsonKey(name: 'TransactionId')
  dynamic? get transactionId;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionDiscountDTOCopyWith<_$_TransactionDiscountDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
