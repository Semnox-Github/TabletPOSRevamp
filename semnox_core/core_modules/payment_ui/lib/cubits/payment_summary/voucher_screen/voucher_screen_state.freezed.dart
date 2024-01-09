// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VoucherScreenState _$VoucherScreenStateFromJson(Map<String, dynamic> json) {
  return _VoucherScreenState.fromJson(json);
}

/// @nodoc
mixin _$VoucherScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  TransactionResponse? get transactionResponse =>
      throw _privateConstructorUsedError;
  CouponDetailsResponse? get couponDetails =>
      throw _privateConstructorUsedError;
  bool get isTaxableSelected => throw _privateConstructorUsedError;
  String? get loadingMessage => throw _privateConstructorUsedError;
  String? get validationError => throw _privateConstructorUsedError;
  String? get apiError => throw _privateConstructorUsedError;
  String? get notificationMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoucherScreenStateCopyWith<VoucherScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoucherScreenStateCopyWith<$Res> {
  factory $VoucherScreenStateCopyWith(
          VoucherScreenState value, $Res Function(VoucherScreenState) then) =
      _$VoucherScreenStateCopyWithImpl<$Res, VoucherScreenState>;
  @useResult
  $Res call(
      {bool isLoading,
      TransactionResponse? transactionResponse,
      CouponDetailsResponse? couponDetails,
      bool isTaxableSelected,
      String? loadingMessage,
      String? validationError,
      String? apiError,
      String? notificationMessage});

  $TransactionResponseCopyWith<$Res>? get transactionResponse;
  $CouponDetailsResponseCopyWith<$Res>? get couponDetails;
}

/// @nodoc
class _$VoucherScreenStateCopyWithImpl<$Res, $Val extends VoucherScreenState>
    implements $VoucherScreenStateCopyWith<$Res> {
  _$VoucherScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? transactionResponse = freezed,
    Object? couponDetails = freezed,
    Object? isTaxableSelected = null,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
    Object? notificationMessage = freezed,
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
      couponDetails: freezed == couponDetails
          ? _value.couponDetails
          : couponDetails // ignore: cast_nullable_to_non_nullable
              as CouponDetailsResponse?,
      isTaxableSelected: null == isTaxableSelected
          ? _value.isTaxableSelected
          : isTaxableSelected // ignore: cast_nullable_to_non_nullable
              as bool,
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
      notificationMessage: freezed == notificationMessage
          ? _value.notificationMessage
          : notificationMessage // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $CouponDetailsResponseCopyWith<$Res>? get couponDetails {
    if (_value.couponDetails == null) {
      return null;
    }

    return $CouponDetailsResponseCopyWith<$Res>(_value.couponDetails!, (value) {
      return _then(_value.copyWith(couponDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VoucherScreenStateImplCopyWith<$Res>
    implements $VoucherScreenStateCopyWith<$Res> {
  factory _$$VoucherScreenStateImplCopyWith(_$VoucherScreenStateImpl value,
          $Res Function(_$VoucherScreenStateImpl) then) =
      __$$VoucherScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      TransactionResponse? transactionResponse,
      CouponDetailsResponse? couponDetails,
      bool isTaxableSelected,
      String? loadingMessage,
      String? validationError,
      String? apiError,
      String? notificationMessage});

  @override
  $TransactionResponseCopyWith<$Res>? get transactionResponse;
  @override
  $CouponDetailsResponseCopyWith<$Res>? get couponDetails;
}

/// @nodoc
class __$$VoucherScreenStateImplCopyWithImpl<$Res>
    extends _$VoucherScreenStateCopyWithImpl<$Res, _$VoucherScreenStateImpl>
    implements _$$VoucherScreenStateImplCopyWith<$Res> {
  __$$VoucherScreenStateImplCopyWithImpl(_$VoucherScreenStateImpl _value,
      $Res Function(_$VoucherScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? transactionResponse = freezed,
    Object? couponDetails = freezed,
    Object? isTaxableSelected = null,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
    Object? notificationMessage = freezed,
  }) {
    return _then(_$VoucherScreenStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      couponDetails: freezed == couponDetails
          ? _value.couponDetails
          : couponDetails // ignore: cast_nullable_to_non_nullable
              as CouponDetailsResponse?,
      isTaxableSelected: null == isTaxableSelected
          ? _value.isTaxableSelected
          : isTaxableSelected // ignore: cast_nullable_to_non_nullable
              as bool,
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
      notificationMessage: freezed == notificationMessage
          ? _value.notificationMessage
          : notificationMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoucherScreenStateImpl implements _VoucherScreenState {
  const _$VoucherScreenStateImpl(
      {this.isLoading = false,
      this.transactionResponse,
      this.couponDetails,
      this.isTaxableSelected = false,
      this.loadingMessage,
      this.validationError,
      this.apiError,
      this.notificationMessage});

  factory _$VoucherScreenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoucherScreenStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final TransactionResponse? transactionResponse;
  @override
  final CouponDetailsResponse? couponDetails;
  @override
  @JsonKey()
  final bool isTaxableSelected;
  @override
  final String? loadingMessage;
  @override
  final String? validationError;
  @override
  final String? apiError;
  @override
  final String? notificationMessage;

  @override
  String toString() {
    return 'VoucherScreenState(isLoading: $isLoading, transactionResponse: $transactionResponse, couponDetails: $couponDetails, isTaxableSelected: $isTaxableSelected, loadingMessage: $loadingMessage, validationError: $validationError, apiError: $apiError, notificationMessage: $notificationMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoucherScreenStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.transactionResponse, transactionResponse) ||
                other.transactionResponse == transactionResponse) &&
            (identical(other.couponDetails, couponDetails) ||
                other.couponDetails == couponDetails) &&
            (identical(other.isTaxableSelected, isTaxableSelected) ||
                other.isTaxableSelected == isTaxableSelected) &&
            (identical(other.loadingMessage, loadingMessage) ||
                other.loadingMessage == loadingMessage) &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError) &&
            (identical(other.apiError, apiError) ||
                other.apiError == apiError) &&
            (identical(other.notificationMessage, notificationMessage) ||
                other.notificationMessage == notificationMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      transactionResponse,
      couponDetails,
      isTaxableSelected,
      loadingMessage,
      validationError,
      apiError,
      notificationMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoucherScreenStateImplCopyWith<_$VoucherScreenStateImpl> get copyWith =>
      __$$VoucherScreenStateImplCopyWithImpl<_$VoucherScreenStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoucherScreenStateImplToJson(
      this,
    );
  }
}

abstract class _VoucherScreenState implements VoucherScreenState {
  const factory _VoucherScreenState(
      {final bool isLoading,
      final TransactionResponse? transactionResponse,
      final CouponDetailsResponse? couponDetails,
      final bool isTaxableSelected,
      final String? loadingMessage,
      final String? validationError,
      final String? apiError,
      final String? notificationMessage}) = _$VoucherScreenStateImpl;

  factory _VoucherScreenState.fromJson(Map<String, dynamic> json) =
      _$VoucherScreenStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  TransactionResponse? get transactionResponse;
  @override
  CouponDetailsResponse? get couponDetails;
  @override
  bool get isTaxableSelected;
  @override
  String? get loadingMessage;
  @override
  String? get validationError;
  @override
  String? get apiError;
  @override
  String? get notificationMessage;
  @override
  @JsonKey(ignore: true)
  _$$VoucherScreenStateImplCopyWith<_$VoucherScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
