// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'semnox_debit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SemnoxDebitState _$SemnoxDebitStateFromJson(Map<String, dynamic> json) {
  return _SemnoxDebitState.fromJson(json);
}

/// @nodoc
mixin _$SemnoxDebitState {
  bool get isLoading => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  AccountDetailsData? get cardDetails => throw _privateConstructorUsedError;
  TransactionResponse? get transactionResponse =>
      throw _privateConstructorUsedError;
  String? get loadingMessage => throw _privateConstructorUsedError;
  String? get validationError => throw _privateConstructorUsedError;
  String? get apiError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SemnoxDebitStateCopyWith<SemnoxDebitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SemnoxDebitStateCopyWith<$Res> {
  factory $SemnoxDebitStateCopyWith(
          SemnoxDebitState value, $Res Function(SemnoxDebitState) then) =
      _$SemnoxDebitStateCopyWithImpl<$Res, SemnoxDebitState>;
  @useResult
  $Res call(
      {bool isLoading,
      double balance,
      AccountDetailsData? cardDetails,
      TransactionResponse? transactionResponse,
      String? loadingMessage,
      String? validationError,
      String? apiError});

  $AccountDetailsDataCopyWith<$Res>? get cardDetails;
  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class _$SemnoxDebitStateCopyWithImpl<$Res, $Val extends SemnoxDebitState>
    implements $SemnoxDebitStateCopyWith<$Res> {
  _$SemnoxDebitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? balance = null,
    Object? cardDetails = freezed,
    Object? transactionResponse = freezed,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      cardDetails: freezed == cardDetails
          ? _value.cardDetails
          : cardDetails // ignore: cast_nullable_to_non_nullable
              as AccountDetailsData?,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      loadingMessage: freezed == loadingMessage
          ? _value.loadingMessage
          : loadingMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      validationError: freezed == validationError
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as String?,
      apiError: freezed == apiError
          ? _value.apiError
          : apiError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountDetailsDataCopyWith<$Res>? get cardDetails {
    if (_value.cardDetails == null) {
      return null;
    }

    return $AccountDetailsDataCopyWith<$Res>(_value.cardDetails!, (value) {
      return _then(_value.copyWith(cardDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionResponseCopyWith<$Res>? get transactionResponse {
    if (_value.transactionResponse == null) {
      return null;
    }

    return $TransactionResponseCopyWith<$Res>(_value.transactionResponse!,
        (value) {
      return _then(_value.copyWith(transactionResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SemnoxDebitStateImplCopyWith<$Res>
    implements $SemnoxDebitStateCopyWith<$Res> {
  factory _$$SemnoxDebitStateImplCopyWith(_$SemnoxDebitStateImpl value,
          $Res Function(_$SemnoxDebitStateImpl) then) =
      __$$SemnoxDebitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      double balance,
      AccountDetailsData? cardDetails,
      TransactionResponse? transactionResponse,
      String? loadingMessage,
      String? validationError,
      String? apiError});

  @override
  $AccountDetailsDataCopyWith<$Res>? get cardDetails;
  @override
  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class __$$SemnoxDebitStateImplCopyWithImpl<$Res>
    extends _$SemnoxDebitStateCopyWithImpl<$Res, _$SemnoxDebitStateImpl>
    implements _$$SemnoxDebitStateImplCopyWith<$Res> {
  __$$SemnoxDebitStateImplCopyWithImpl(_$SemnoxDebitStateImpl _value,
      $Res Function(_$SemnoxDebitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? balance = null,
    Object? cardDetails = freezed,
    Object? transactionResponse = freezed,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
  }) {
    return _then(_$SemnoxDebitStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      cardDetails: freezed == cardDetails
          ? _value.cardDetails
          : cardDetails // ignore: cast_nullable_to_non_nullable
              as AccountDetailsData?,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      loadingMessage: freezed == loadingMessage
          ? _value.loadingMessage
          : loadingMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      validationError: freezed == validationError
          ? _value.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as String?,
      apiError: freezed == apiError
          ? _value.apiError
          : apiError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SemnoxDebitStateImpl implements _SemnoxDebitState {
  const _$SemnoxDebitStateImpl(
      {this.isLoading = false,
      this.balance = 0,
      this.cardDetails,
      this.transactionResponse,
      this.loadingMessage,
      this.validationError,
      this.apiError});

  factory _$SemnoxDebitStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SemnoxDebitStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final double balance;
  @override
  final AccountDetailsData? cardDetails;
  @override
  final TransactionResponse? transactionResponse;
  @override
  final String? loadingMessage;
  @override
  final String? validationError;
  @override
  final String? apiError;

  @override
  String toString() {
    return 'SemnoxDebitState(isLoading: $isLoading, balance: $balance, cardDetails: $cardDetails, transactionResponse: $transactionResponse, loadingMessage: $loadingMessage, validationError: $validationError, apiError: $apiError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SemnoxDebitStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.cardDetails, cardDetails) ||
                other.cardDetails == cardDetails) &&
            (identical(other.transactionResponse, transactionResponse) ||
                other.transactionResponse == transactionResponse) &&
            (identical(other.loadingMessage, loadingMessage) ||
                other.loadingMessage == loadingMessage) &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError) &&
            (identical(other.apiError, apiError) ||
                other.apiError == apiError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading, balance, cardDetails,
      transactionResponse, loadingMessage, validationError, apiError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SemnoxDebitStateImplCopyWith<_$SemnoxDebitStateImpl> get copyWith =>
      __$$SemnoxDebitStateImplCopyWithImpl<_$SemnoxDebitStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SemnoxDebitStateImplToJson(
      this,
    );
  }
}

abstract class _SemnoxDebitState implements SemnoxDebitState {
  const factory _SemnoxDebitState(
      {final bool isLoading,
      final double balance,
      final AccountDetailsData? cardDetails,
      final TransactionResponse? transactionResponse,
      final String? loadingMessage,
      final String? validationError,
      final String? apiError}) = _$SemnoxDebitStateImpl;

  factory _SemnoxDebitState.fromJson(Map<String, dynamic> json) =
      _$SemnoxDebitStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  double get balance;
  @override
  AccountDetailsData? get cardDetails;
  @override
  TransactionResponse? get transactionResponse;
  @override
  String? get loadingMessage;
  @override
  String? get validationError;
  @override
  String? get apiError;
  @override
  @JsonKey(ignore: true)
  _$$SemnoxDebitStateImplCopyWith<_$SemnoxDebitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
