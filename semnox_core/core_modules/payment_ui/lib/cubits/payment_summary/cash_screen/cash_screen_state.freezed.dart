// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CashScreenState _$CashScreenStateFromJson(Map<String, dynamic> json) {
  return _CashScreenState.fromJson(json);
}

/// @nodoc
mixin _$CashScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  TransactionResponse? get transactionResponse =>
      throw _privateConstructorUsedError;
  String get tenderedAmount => throw _privateConstructorUsedError;
  int get selectedDenomination => throw _privateConstructorUsedError;
  int get hundredDenominationCount => throw _privateConstructorUsedError;
  int get fiftyDenominationCount => throw _privateConstructorUsedError;
  int get twentyDenominationCount => throw _privateConstructorUsedError;
  int get tenDenominationCount => throw _privateConstructorUsedError;
  int get fiveDenominationCount => throw _privateConstructorUsedError;
  int get oneDenominationCount => throw _privateConstructorUsedError;
  String? get loadingMessage => throw _privateConstructorUsedError;
  bool get shouldShowTenderButton => throw _privateConstructorUsedError;
  String? get validationError => throw _privateConstructorUsedError;
  String? get apiError => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CashScreenStateCopyWith<CashScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashScreenStateCopyWith<$Res> {
  factory $CashScreenStateCopyWith(
          CashScreenState value, $Res Function(CashScreenState) then) =
      _$CashScreenStateCopyWithImpl<$Res, CashScreenState>;
  @useResult
  $Res call(
      {bool isLoading,
      TransactionResponse? transactionResponse,
      String tenderedAmount,
      int selectedDenomination,
      int hundredDenominationCount,
      int fiftyDenominationCount,
      int twentyDenominationCount,
      int tenDenominationCount,
      int fiveDenominationCount,
      int oneDenominationCount,
      String? loadingMessage,
      bool shouldShowTenderButton,
      String? validationError,
      String? apiError});

  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class _$CashScreenStateCopyWithImpl<$Res, $Val extends CashScreenState>
    implements $CashScreenStateCopyWith<$Res> {
  _$CashScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? transactionResponse = freezed,
    Object? tenderedAmount = null,
    Object? selectedDenomination = null,
    Object? hundredDenominationCount = null,
    Object? fiftyDenominationCount = null,
    Object? twentyDenominationCount = null,
    Object? tenDenominationCount = null,
    Object? fiveDenominationCount = null,
    Object? oneDenominationCount = null,
    Object? loadingMessage = freezed,
    Object? shouldShowTenderButton = null,
    Object? validationError = freezed,
    Object? apiError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      tenderedAmount: null == tenderedAmount
          ? _value.tenderedAmount
          : tenderedAmount // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDenomination: null == selectedDenomination
          ? _value.selectedDenomination
          : selectedDenomination // ignore: cast_nullable_to_non_nullable
              as int,
      hundredDenominationCount: null == hundredDenominationCount
          ? _value.hundredDenominationCount
          : hundredDenominationCount // ignore: cast_nullable_to_non_nullable
              as int,
      fiftyDenominationCount: null == fiftyDenominationCount
          ? _value.fiftyDenominationCount
          : fiftyDenominationCount // ignore: cast_nullable_to_non_nullable
              as int,
      twentyDenominationCount: null == twentyDenominationCount
          ? _value.twentyDenominationCount
          : twentyDenominationCount // ignore: cast_nullable_to_non_nullable
              as int,
      tenDenominationCount: null == tenDenominationCount
          ? _value.tenDenominationCount
          : tenDenominationCount // ignore: cast_nullable_to_non_nullable
              as int,
      fiveDenominationCount: null == fiveDenominationCount
          ? _value.fiveDenominationCount
          : fiveDenominationCount // ignore: cast_nullable_to_non_nullable
              as int,
      oneDenominationCount: null == oneDenominationCount
          ? _value.oneDenominationCount
          : oneDenominationCount // ignore: cast_nullable_to_non_nullable
              as int,
      loadingMessage: freezed == loadingMessage
          ? _value.loadingMessage
          : loadingMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      shouldShowTenderButton: null == shouldShowTenderButton
          ? _value.shouldShowTenderButton
          : shouldShowTenderButton // ignore: cast_nullable_to_non_nullable
              as bool,
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
abstract class _$$CashScreenStateImplCopyWith<$Res>
    implements $CashScreenStateCopyWith<$Res> {
  factory _$$CashScreenStateImplCopyWith(_$CashScreenStateImpl value,
          $Res Function(_$CashScreenStateImpl) then) =
      __$$CashScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      TransactionResponse? transactionResponse,
      String tenderedAmount,
      int selectedDenomination,
      int hundredDenominationCount,
      int fiftyDenominationCount,
      int twentyDenominationCount,
      int tenDenominationCount,
      int fiveDenominationCount,
      int oneDenominationCount,
      String? loadingMessage,
      bool shouldShowTenderButton,
      String? validationError,
      String? apiError});

  @override
  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class __$$CashScreenStateImplCopyWithImpl<$Res>
    extends _$CashScreenStateCopyWithImpl<$Res, _$CashScreenStateImpl>
    implements _$$CashScreenStateImplCopyWith<$Res> {
  __$$CashScreenStateImplCopyWithImpl(
      _$CashScreenStateImpl _value, $Res Function(_$CashScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? transactionResponse = freezed,
    Object? tenderedAmount = null,
    Object? selectedDenomination = null,
    Object? hundredDenominationCount = null,
    Object? fiftyDenominationCount = null,
    Object? twentyDenominationCount = null,
    Object? tenDenominationCount = null,
    Object? fiveDenominationCount = null,
    Object? oneDenominationCount = null,
    Object? loadingMessage = freezed,
    Object? shouldShowTenderButton = null,
    Object? validationError = freezed,
    Object? apiError = freezed,
  }) {
    return _then(_$CashScreenStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      tenderedAmount: null == tenderedAmount
          ? _value.tenderedAmount
          : tenderedAmount // ignore: cast_nullable_to_non_nullable
              as String,
      selectedDenomination: null == selectedDenomination
          ? _value.selectedDenomination
          : selectedDenomination // ignore: cast_nullable_to_non_nullable
              as int,
      hundredDenominationCount: null == hundredDenominationCount
          ? _value.hundredDenominationCount
          : hundredDenominationCount // ignore: cast_nullable_to_non_nullable
              as int,
      fiftyDenominationCount: null == fiftyDenominationCount
          ? _value.fiftyDenominationCount
          : fiftyDenominationCount // ignore: cast_nullable_to_non_nullable
              as int,
      twentyDenominationCount: null == twentyDenominationCount
          ? _value.twentyDenominationCount
          : twentyDenominationCount // ignore: cast_nullable_to_non_nullable
              as int,
      tenDenominationCount: null == tenDenominationCount
          ? _value.tenDenominationCount
          : tenDenominationCount // ignore: cast_nullable_to_non_nullable
              as int,
      fiveDenominationCount: null == fiveDenominationCount
          ? _value.fiveDenominationCount
          : fiveDenominationCount // ignore: cast_nullable_to_non_nullable
              as int,
      oneDenominationCount: null == oneDenominationCount
          ? _value.oneDenominationCount
          : oneDenominationCount // ignore: cast_nullable_to_non_nullable
              as int,
      loadingMessage: freezed == loadingMessage
          ? _value.loadingMessage
          : loadingMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      shouldShowTenderButton: null == shouldShowTenderButton
          ? _value.shouldShowTenderButton
          : shouldShowTenderButton // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$CashScreenStateImpl implements _CashScreenState {
  const _$CashScreenStateImpl(
      {this.isLoading = false,
      this.transactionResponse,
      this.tenderedAmount = '0.00',
      this.selectedDenomination = 100,
      this.hundredDenominationCount = 0,
      this.fiftyDenominationCount = 0,
      this.twentyDenominationCount = 0,
      this.tenDenominationCount = 0,
      this.fiveDenominationCount = 0,
      this.oneDenominationCount = 0,
      this.loadingMessage,
      this.shouldShowTenderButton = false,
      this.validationError,
      this.apiError});

  factory _$CashScreenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashScreenStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final TransactionResponse? transactionResponse;
  @override
  @JsonKey()
  final String tenderedAmount;
  @override
  @JsonKey()
  final int selectedDenomination;
  @override
  @JsonKey()
  final int hundredDenominationCount;
  @override
  @JsonKey()
  final int fiftyDenominationCount;
  @override
  @JsonKey()
  final int twentyDenominationCount;
  @override
  @JsonKey()
  final int tenDenominationCount;
  @override
  @JsonKey()
  final int fiveDenominationCount;
  @override
  @JsonKey()
  final int oneDenominationCount;
  @override
  final String? loadingMessage;
  @override
  @JsonKey()
  final bool shouldShowTenderButton;
  @override
  final String? validationError;
  @override
  final String? apiError;

  @override
  String toString() {
    return 'CashScreenState(isLoading: $isLoading, transactionResponse: $transactionResponse, tenderedAmount: $tenderedAmount, selectedDenomination: $selectedDenomination, hundredDenominationCount: $hundredDenominationCount, fiftyDenominationCount: $fiftyDenominationCount, twentyDenominationCount: $twentyDenominationCount, tenDenominationCount: $tenDenominationCount, fiveDenominationCount: $fiveDenominationCount, oneDenominationCount: $oneDenominationCount, loadingMessage: $loadingMessage, shouldShowTenderButton: $shouldShowTenderButton, validationError: $validationError, apiError: $apiError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashScreenStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.transactionResponse, transactionResponse) ||
                other.transactionResponse == transactionResponse) &&
            (identical(other.tenderedAmount, tenderedAmount) ||
                other.tenderedAmount == tenderedAmount) &&
            (identical(other.selectedDenomination, selectedDenomination) ||
                other.selectedDenomination == selectedDenomination) &&
            (identical(
                    other.hundredDenominationCount, hundredDenominationCount) ||
                other.hundredDenominationCount == hundredDenominationCount) &&
            (identical(other.fiftyDenominationCount, fiftyDenominationCount) ||
                other.fiftyDenominationCount == fiftyDenominationCount) &&
            (identical(
                    other.twentyDenominationCount, twentyDenominationCount) ||
                other.twentyDenominationCount == twentyDenominationCount) &&
            (identical(other.tenDenominationCount, tenDenominationCount) ||
                other.tenDenominationCount == tenDenominationCount) &&
            (identical(other.fiveDenominationCount, fiveDenominationCount) ||
                other.fiveDenominationCount == fiveDenominationCount) &&
            (identical(other.oneDenominationCount, oneDenominationCount) ||
                other.oneDenominationCount == oneDenominationCount) &&
            (identical(other.loadingMessage, loadingMessage) ||
                other.loadingMessage == loadingMessage) &&
            (identical(other.shouldShowTenderButton, shouldShowTenderButton) ||
                other.shouldShowTenderButton == shouldShowTenderButton) &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError) &&
            (identical(other.apiError, apiError) ||
                other.apiError == apiError));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      transactionResponse,
      tenderedAmount,
      selectedDenomination,
      hundredDenominationCount,
      fiftyDenominationCount,
      twentyDenominationCount,
      tenDenominationCount,
      fiveDenominationCount,
      oneDenominationCount,
      loadingMessage,
      shouldShowTenderButton,
      validationError,
      apiError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CashScreenStateImplCopyWith<_$CashScreenStateImpl> get copyWith =>
      __$$CashScreenStateImplCopyWithImpl<_$CashScreenStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashScreenStateImplToJson(
      this,
    );
  }
}

abstract class _CashScreenState implements CashScreenState {
  const factory _CashScreenState(
      {final bool isLoading,
      final TransactionResponse? transactionResponse,
      final String tenderedAmount,
      final int selectedDenomination,
      final int hundredDenominationCount,
      final int fiftyDenominationCount,
      final int twentyDenominationCount,
      final int tenDenominationCount,
      final int fiveDenominationCount,
      final int oneDenominationCount,
      final String? loadingMessage,
      final bool shouldShowTenderButton,
      final String? validationError,
      final String? apiError}) = _$CashScreenStateImpl;

  factory _CashScreenState.fromJson(Map<String, dynamic> json) =
      _$CashScreenStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  TransactionResponse? get transactionResponse;
  @override
  String get tenderedAmount;
  @override
  int get selectedDenomination;
  @override
  int get hundredDenominationCount;
  @override
  int get fiftyDenominationCount;
  @override
  int get twentyDenominationCount;
  @override
  int get tenDenominationCount;
  @override
  int get fiveDenominationCount;
  @override
  int get oneDenominationCount;
  @override
  String? get loadingMessage;
  @override
  bool get shouldShowTenderButton;
  @override
  String? get validationError;
  @override
  String? get apiError;
  @override
  @JsonKey(ignore: true)
  _$$CashScreenStateImplCopyWith<_$CashScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
