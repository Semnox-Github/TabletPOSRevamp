// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionAccountDto _$TransactionAccountDtoFromJson(
    Map<String, dynamic> json) {
  return _TransactionAccountDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionAccountDto {
  @JsonKey(name: 'TransactionAccountId')
  int? get transactionAccountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionId')
  int? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TransactionLineId')
  int? get transactionLineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'AccountId')
  int? get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'TagNumber')
  String get tagNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'SerialNumber')
  String? get serialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'ExistingAccount')
  bool get existingAccount => throw _privateConstructorUsedError;
  @JsonKey(name: 'IsActive')
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionAccountDtoCopyWith<TransactionAccountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionAccountDtoCopyWith<$Res> {
  factory $TransactionAccountDtoCopyWith(TransactionAccountDto value,
          $Res Function(TransactionAccountDto) then) =
      _$TransactionAccountDtoCopyWithImpl<$Res, TransactionAccountDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionAccountId') int? transactionAccountId,
      @JsonKey(name: 'TransactionId') int? transactionId,
      @JsonKey(name: 'TransactionLineId') int? transactionLineId,
      @JsonKey(name: 'AccountId') int? accountId,
      @JsonKey(name: 'TagNumber') String tagNumber,
      @JsonKey(name: 'SerialNumber') String? serialNumber,
      @JsonKey(name: 'ExistingAccount') bool existingAccount,
      @JsonKey(name: 'IsActive') bool isActive});
}

/// @nodoc
class _$TransactionAccountDtoCopyWithImpl<$Res,
        $Val extends TransactionAccountDto>
    implements $TransactionAccountDtoCopyWith<$Res> {
  _$TransactionAccountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionAccountId = freezed,
    Object? transactionId = freezed,
    Object? transactionLineId = freezed,
    Object? accountId = freezed,
    Object? tagNumber = null,
    Object? serialNumber = freezed,
    Object? existingAccount = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      transactionAccountId: freezed == transactionAccountId
          ? _value.transactionAccountId
          : transactionAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionLineId: freezed == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      tagNumber: null == tagNumber
          ? _value.tagNumber
          : tagNumber // ignore: cast_nullable_to_non_nullable
              as String,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      existingAccount: null == existingAccount
          ? _value.existingAccount
          : existingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionAccountDtoCopyWith<$Res>
    implements $TransactionAccountDtoCopyWith<$Res> {
  factory _$$_TransactionAccountDtoCopyWith(_$_TransactionAccountDto value,
          $Res Function(_$_TransactionAccountDto) then) =
      __$$_TransactionAccountDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TransactionAccountId') int? transactionAccountId,
      @JsonKey(name: 'TransactionId') int? transactionId,
      @JsonKey(name: 'TransactionLineId') int? transactionLineId,
      @JsonKey(name: 'AccountId') int? accountId,
      @JsonKey(name: 'TagNumber') String tagNumber,
      @JsonKey(name: 'SerialNumber') String? serialNumber,
      @JsonKey(name: 'ExistingAccount') bool existingAccount,
      @JsonKey(name: 'IsActive') bool isActive});
}

/// @nodoc
class __$$_TransactionAccountDtoCopyWithImpl<$Res>
    extends _$TransactionAccountDtoCopyWithImpl<$Res, _$_TransactionAccountDto>
    implements _$$_TransactionAccountDtoCopyWith<$Res> {
  __$$_TransactionAccountDtoCopyWithImpl(_$_TransactionAccountDto _value,
      $Res Function(_$_TransactionAccountDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionAccountId = freezed,
    Object? transactionId = freezed,
    Object? transactionLineId = freezed,
    Object? accountId = freezed,
    Object? tagNumber = null,
    Object? serialNumber = freezed,
    Object? existingAccount = null,
    Object? isActive = null,
  }) {
    return _then(_$_TransactionAccountDto(
      transactionAccountId: freezed == transactionAccountId
          ? _value.transactionAccountId
          : transactionAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionLineId: freezed == transactionLineId
          ? _value.transactionLineId
          : transactionLineId // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      tagNumber: null == tagNumber
          ? _value.tagNumber
          : tagNumber // ignore: cast_nullable_to_non_nullable
              as String,
      serialNumber: freezed == serialNumber
          ? _value.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      existingAccount: null == existingAccount
          ? _value.existingAccount
          : existingAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionAccountDto implements _TransactionAccountDto {
  const _$_TransactionAccountDto(
      {@JsonKey(name: 'TransactionAccountId') this.transactionAccountId,
      @JsonKey(name: 'TransactionId') this.transactionId,
      @JsonKey(name: 'TransactionLineId') this.transactionLineId,
      @JsonKey(name: 'AccountId') this.accountId,
      @JsonKey(name: 'TagNumber') required this.tagNumber,
      @JsonKey(name: 'SerialNumber') this.serialNumber,
      @JsonKey(name: 'ExistingAccount') required this.existingAccount,
      @JsonKey(name: 'IsActive') required this.isActive});

  factory _$_TransactionAccountDto.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionAccountDtoFromJson(json);

  @override
  @JsonKey(name: 'TransactionAccountId')
  final int? transactionAccountId;
  @override
  @JsonKey(name: 'TransactionId')
  final int? transactionId;
  @override
  @JsonKey(name: 'TransactionLineId')
  final int? transactionLineId;
  @override
  @JsonKey(name: 'AccountId')
  final int? accountId;
  @override
  @JsonKey(name: 'TagNumber')
  final String tagNumber;
  @override
  @JsonKey(name: 'SerialNumber')
  final String? serialNumber;
  @override
  @JsonKey(name: 'ExistingAccount')
  final bool existingAccount;
  @override
  @JsonKey(name: 'IsActive')
  final bool isActive;

  @override
  String toString() {
    return 'TransactionAccountDto(transactionAccountId: $transactionAccountId, transactionId: $transactionId, transactionLineId: $transactionLineId, accountId: $accountId, tagNumber: $tagNumber, serialNumber: $serialNumber, existingAccount: $existingAccount, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionAccountDto &&
            (identical(other.transactionAccountId, transactionAccountId) ||
                other.transactionAccountId == transactionAccountId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.transactionLineId, transactionLineId) ||
                other.transactionLineId == transactionLineId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.tagNumber, tagNumber) ||
                other.tagNumber == tagNumber) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.existingAccount, existingAccount) ||
                other.existingAccount == existingAccount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionAccountId,
      transactionId,
      transactionLineId,
      accountId,
      tagNumber,
      serialNumber,
      existingAccount,
      isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionAccountDtoCopyWith<_$_TransactionAccountDto> get copyWith =>
      __$$_TransactionAccountDtoCopyWithImpl<_$_TransactionAccountDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionAccountDtoToJson(
      this,
    );
  }
}

abstract class _TransactionAccountDto implements TransactionAccountDto {
  const factory _TransactionAccountDto(
      {@JsonKey(name: 'TransactionAccountId')
          final int? transactionAccountId,
      @JsonKey(name: 'TransactionId')
          final int? transactionId,
      @JsonKey(name: 'TransactionLineId')
          final int? transactionLineId,
      @JsonKey(name: 'AccountId')
          final int? accountId,
      @JsonKey(name: 'TagNumber')
          required final String tagNumber,
      @JsonKey(name: 'SerialNumber')
          final String? serialNumber,
      @JsonKey(name: 'ExistingAccount')
          required final bool existingAccount,
      @JsonKey(name: 'IsActive')
          required final bool isActive}) = _$_TransactionAccountDto;

  factory _TransactionAccountDto.fromJson(Map<String, dynamic> json) =
      _$_TransactionAccountDto.fromJson;

  @override
  @JsonKey(name: 'TransactionAccountId')
  int? get transactionAccountId;
  @override
  @JsonKey(name: 'TransactionId')
  int? get transactionId;
  @override
  @JsonKey(name: 'TransactionLineId')
  int? get transactionLineId;
  @override
  @JsonKey(name: 'AccountId')
  int? get accountId;
  @override
  @JsonKey(name: 'TagNumber')
  String get tagNumber;
  @override
  @JsonKey(name: 'SerialNumber')
  String? get serialNumber;
  @override
  @JsonKey(name: 'ExistingAccount')
  bool get existingAccount;
  @override
  @JsonKey(name: 'IsActive')
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionAccountDtoCopyWith<_$_TransactionAccountDto> get copyWith =>
      throw _privateConstructorUsedError;
}
