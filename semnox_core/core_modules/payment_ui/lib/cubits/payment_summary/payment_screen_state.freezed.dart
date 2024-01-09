// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentScreenState _$PaymentScreenStateFromJson(Map<String, dynamic> json) {
  return _PaymentScreenState.fromJson(json);
}

/// @nodoc
mixin _$PaymentScreenState {
  int get loadingStatus => throw _privateConstructorUsedError;
  int get selectedPayModeIndex => throw _privateConstructorUsedError;
  bool get isCashScreenSelected => throw _privateConstructorUsedError;
  bool get shouldShowSideBar => throw _privateConstructorUsedError;
  bool get isPaymentRefreshed => throw _privateConstructorUsedError;
  bool get isNotificationError => throw _privateConstructorUsedError;
  bool get isCurrentUserManager => throw _privateConstructorUsedError;
  bool get isSettleCompleted => throw _privateConstructorUsedError;
  bool get searchedForPayModes => throw _privateConstructorUsedError;
  PaymentModeContainerDTO? get selectedPayMode =>
      throw _privateConstructorUsedError;
  List<TransactionPaymentDTO>? get appliedPayments =>
      throw _privateConstructorUsedError;
  List<PaymentModeContainerDTO> get searchedPaymentModes =>
      throw _privateConstructorUsedError;
  TransactionResponse? get transactionResponse =>
      throw _privateConstructorUsedError;
  double get tenderedAmount => throw _privateConstructorUsedError;
  String? get loadingMessage => throw _privateConstructorUsedError;
  String? get validationError => throw _privateConstructorUsedError;
  String? get apiError => throw _privateConstructorUsedError;
  String? get notificationMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentScreenStateCopyWith<PaymentScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentScreenStateCopyWith<$Res> {
  factory $PaymentScreenStateCopyWith(
          PaymentScreenState value, $Res Function(PaymentScreenState) then) =
      _$PaymentScreenStateCopyWithImpl<$Res, PaymentScreenState>;
  @useResult
  $Res call(
      {int loadingStatus,
      int selectedPayModeIndex,
      bool isCashScreenSelected,
      bool shouldShowSideBar,
      bool isPaymentRefreshed,
      bool isNotificationError,
      bool isCurrentUserManager,
      bool isSettleCompleted,
      bool searchedForPayModes,
      PaymentModeContainerDTO? selectedPayMode,
      List<TransactionPaymentDTO>? appliedPayments,
      List<PaymentModeContainerDTO> searchedPaymentModes,
      TransactionResponse? transactionResponse,
      double tenderedAmount,
      String? loadingMessage,
      String? validationError,
      String? apiError,
      String? notificationMessage});

  $PaymentModeContainerDTOCopyWith<$Res>? get selectedPayMode;
  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class _$PaymentScreenStateCopyWithImpl<$Res, $Val extends PaymentScreenState>
    implements $PaymentScreenStateCopyWith<$Res> {
  _$PaymentScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? selectedPayModeIndex = null,
    Object? isCashScreenSelected = null,
    Object? shouldShowSideBar = null,
    Object? isPaymentRefreshed = null,
    Object? isNotificationError = null,
    Object? isCurrentUserManager = null,
    Object? isSettleCompleted = null,
    Object? searchedForPayModes = null,
    Object? selectedPayMode = freezed,
    Object? appliedPayments = freezed,
    Object? searchedPaymentModes = null,
    Object? transactionResponse = freezed,
    Object? tenderedAmount = null,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
    Object? notificationMessage = freezed,
  }) {
    return _then(_value.copyWith(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as int,
      selectedPayModeIndex: null == selectedPayModeIndex
          ? _value.selectedPayModeIndex
          : selectedPayModeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isCashScreenSelected: null == isCashScreenSelected
          ? _value.isCashScreenSelected
          : isCashScreenSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldShowSideBar: null == shouldShowSideBar
          ? _value.shouldShowSideBar
          : shouldShowSideBar // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentRefreshed: null == isPaymentRefreshed
          ? _value.isPaymentRefreshed
          : isPaymentRefreshed // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotificationError: null == isNotificationError
          ? _value.isNotificationError
          : isNotificationError // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrentUserManager: null == isCurrentUserManager
          ? _value.isCurrentUserManager
          : isCurrentUserManager // ignore: cast_nullable_to_non_nullable
              as bool,
      isSettleCompleted: null == isSettleCompleted
          ? _value.isSettleCompleted
          : isSettleCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedForPayModes: null == searchedForPayModes
          ? _value.searchedForPayModes
          : searchedForPayModes // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPayMode: freezed == selectedPayMode
          ? _value.selectedPayMode
          : selectedPayMode // ignore: cast_nullable_to_non_nullable
              as PaymentModeContainerDTO?,
      appliedPayments: freezed == appliedPayments
          ? _value.appliedPayments
          : appliedPayments // ignore: cast_nullable_to_non_nullable
              as List<TransactionPaymentDTO>?,
      searchedPaymentModes: null == searchedPaymentModes
          ? _value.searchedPaymentModes
          : searchedPaymentModes // ignore: cast_nullable_to_non_nullable
              as List<PaymentModeContainerDTO>,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      tenderedAmount: null == tenderedAmount
          ? _value.tenderedAmount
          : tenderedAmount // ignore: cast_nullable_to_non_nullable
              as double,
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
  $PaymentModeContainerDTOCopyWith<$Res>? get selectedPayMode {
    if (_value.selectedPayMode == null) {
      return null;
    }

    return $PaymentModeContainerDTOCopyWith<$Res>(_value.selectedPayMode!,
        (value) {
      return _then(_value.copyWith(selectedPayMode: value) as $Val);
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
abstract class _$$PaymentScreenStateImplCopyWith<$Res>
    implements $PaymentScreenStateCopyWith<$Res> {
  factory _$$PaymentScreenStateImplCopyWith(_$PaymentScreenStateImpl value,
          $Res Function(_$PaymentScreenStateImpl) then) =
      __$$PaymentScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int loadingStatus,
      int selectedPayModeIndex,
      bool isCashScreenSelected,
      bool shouldShowSideBar,
      bool isPaymentRefreshed,
      bool isNotificationError,
      bool isCurrentUserManager,
      bool isSettleCompleted,
      bool searchedForPayModes,
      PaymentModeContainerDTO? selectedPayMode,
      List<TransactionPaymentDTO>? appliedPayments,
      List<PaymentModeContainerDTO> searchedPaymentModes,
      TransactionResponse? transactionResponse,
      double tenderedAmount,
      String? loadingMessage,
      String? validationError,
      String? apiError,
      String? notificationMessage});

  @override
  $PaymentModeContainerDTOCopyWith<$Res>? get selectedPayMode;
  @override
  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class __$$PaymentScreenStateImplCopyWithImpl<$Res>
    extends _$PaymentScreenStateCopyWithImpl<$Res, _$PaymentScreenStateImpl>
    implements _$$PaymentScreenStateImplCopyWith<$Res> {
  __$$PaymentScreenStateImplCopyWithImpl(_$PaymentScreenStateImpl _value,
      $Res Function(_$PaymentScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? selectedPayModeIndex = null,
    Object? isCashScreenSelected = null,
    Object? shouldShowSideBar = null,
    Object? isPaymentRefreshed = null,
    Object? isNotificationError = null,
    Object? isCurrentUserManager = null,
    Object? isSettleCompleted = null,
    Object? searchedForPayModes = null,
    Object? selectedPayMode = freezed,
    Object? appliedPayments = freezed,
    Object? searchedPaymentModes = null,
    Object? transactionResponse = freezed,
    Object? tenderedAmount = null,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
    Object? notificationMessage = freezed,
  }) {
    return _then(_$PaymentScreenStateImpl(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as int,
      selectedPayModeIndex: null == selectedPayModeIndex
          ? _value.selectedPayModeIndex
          : selectedPayModeIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isCashScreenSelected: null == isCashScreenSelected
          ? _value.isCashScreenSelected
          : isCashScreenSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      shouldShowSideBar: null == shouldShowSideBar
          ? _value.shouldShowSideBar
          : shouldShowSideBar // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentRefreshed: null == isPaymentRefreshed
          ? _value.isPaymentRefreshed
          : isPaymentRefreshed // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotificationError: null == isNotificationError
          ? _value.isNotificationError
          : isNotificationError // ignore: cast_nullable_to_non_nullable
              as bool,
      isCurrentUserManager: null == isCurrentUserManager
          ? _value.isCurrentUserManager
          : isCurrentUserManager // ignore: cast_nullable_to_non_nullable
              as bool,
      isSettleCompleted: null == isSettleCompleted
          ? _value.isSettleCompleted
          : isSettleCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedForPayModes: null == searchedForPayModes
          ? _value.searchedForPayModes
          : searchedForPayModes // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedPayMode: freezed == selectedPayMode
          ? _value.selectedPayMode
          : selectedPayMode // ignore: cast_nullable_to_non_nullable
              as PaymentModeContainerDTO?,
      appliedPayments: freezed == appliedPayments
          ? _value._appliedPayments
          : appliedPayments // ignore: cast_nullable_to_non_nullable
              as List<TransactionPaymentDTO>?,
      searchedPaymentModes: null == searchedPaymentModes
          ? _value._searchedPaymentModes
          : searchedPaymentModes // ignore: cast_nullable_to_non_nullable
              as List<PaymentModeContainerDTO>,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      tenderedAmount: null == tenderedAmount
          ? _value.tenderedAmount
          : tenderedAmount // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$PaymentScreenStateImpl implements _PaymentScreenState {
  const _$PaymentScreenStateImpl(
      {this.loadingStatus = -1,
      this.selectedPayModeIndex = 0,
      this.isCashScreenSelected = true,
      this.shouldShowSideBar = true,
      this.isPaymentRefreshed = false,
      this.isNotificationError = false,
      this.isCurrentUserManager = false,
      this.isSettleCompleted = false,
      this.searchedForPayModes = false,
      this.selectedPayMode,
      final List<TransactionPaymentDTO>? appliedPayments,
      final List<PaymentModeContainerDTO> searchedPaymentModes = const [],
      this.transactionResponse,
      this.tenderedAmount = 0,
      this.loadingMessage,
      this.validationError,
      this.apiError,
      this.notificationMessage})
      : _appliedPayments = appliedPayments,
        _searchedPaymentModes = searchedPaymentModes;

  factory _$PaymentScreenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentScreenStateImplFromJson(json);

  @override
  @JsonKey()
  final int loadingStatus;
  @override
  @JsonKey()
  final int selectedPayModeIndex;
  @override
  @JsonKey()
  final bool isCashScreenSelected;
  @override
  @JsonKey()
  final bool shouldShowSideBar;
  @override
  @JsonKey()
  final bool isPaymentRefreshed;
  @override
  @JsonKey()
  final bool isNotificationError;
  @override
  @JsonKey()
  final bool isCurrentUserManager;
  @override
  @JsonKey()
  final bool isSettleCompleted;
  @override
  @JsonKey()
  final bool searchedForPayModes;
  @override
  final PaymentModeContainerDTO? selectedPayMode;
  final List<TransactionPaymentDTO>? _appliedPayments;
  @override
  List<TransactionPaymentDTO>? get appliedPayments {
    final value = _appliedPayments;
    if (value == null) return null;
    if (_appliedPayments is EqualUnmodifiableListView) return _appliedPayments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PaymentModeContainerDTO> _searchedPaymentModes;
  @override
  @JsonKey()
  List<PaymentModeContainerDTO> get searchedPaymentModes {
    if (_searchedPaymentModes is EqualUnmodifiableListView)
      return _searchedPaymentModes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedPaymentModes);
  }

  @override
  final TransactionResponse? transactionResponse;
  @override
  @JsonKey()
  final double tenderedAmount;
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
    return 'PaymentScreenState(loadingStatus: $loadingStatus, selectedPayModeIndex: $selectedPayModeIndex, isCashScreenSelected: $isCashScreenSelected, shouldShowSideBar: $shouldShowSideBar, isPaymentRefreshed: $isPaymentRefreshed, isNotificationError: $isNotificationError, isCurrentUserManager: $isCurrentUserManager, isSettleCompleted: $isSettleCompleted, searchedForPayModes: $searchedForPayModes, selectedPayMode: $selectedPayMode, appliedPayments: $appliedPayments, searchedPaymentModes: $searchedPaymentModes, transactionResponse: $transactionResponse, tenderedAmount: $tenderedAmount, loadingMessage: $loadingMessage, validationError: $validationError, apiError: $apiError, notificationMessage: $notificationMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentScreenStateImpl &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.selectedPayModeIndex, selectedPayModeIndex) ||
                other.selectedPayModeIndex == selectedPayModeIndex) &&
            (identical(other.isCashScreenSelected, isCashScreenSelected) ||
                other.isCashScreenSelected == isCashScreenSelected) &&
            (identical(other.shouldShowSideBar, shouldShowSideBar) ||
                other.shouldShowSideBar == shouldShowSideBar) &&
            (identical(other.isPaymentRefreshed, isPaymentRefreshed) ||
                other.isPaymentRefreshed == isPaymentRefreshed) &&
            (identical(other.isNotificationError, isNotificationError) ||
                other.isNotificationError == isNotificationError) &&
            (identical(other.isCurrentUserManager, isCurrentUserManager) ||
                other.isCurrentUserManager == isCurrentUserManager) &&
            (identical(other.isSettleCompleted, isSettleCompleted) ||
                other.isSettleCompleted == isSettleCompleted) &&
            (identical(other.searchedForPayModes, searchedForPayModes) ||
                other.searchedForPayModes == searchedForPayModes) &&
            (identical(other.selectedPayMode, selectedPayMode) ||
                other.selectedPayMode == selectedPayMode) &&
            const DeepCollectionEquality()
                .equals(other._appliedPayments, _appliedPayments) &&
            const DeepCollectionEquality()
                .equals(other._searchedPaymentModes, _searchedPaymentModes) &&
            (identical(other.transactionResponse, transactionResponse) ||
                other.transactionResponse == transactionResponse) &&
            (identical(other.tenderedAmount, tenderedAmount) ||
                other.tenderedAmount == tenderedAmount) &&
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
      loadingStatus,
      selectedPayModeIndex,
      isCashScreenSelected,
      shouldShowSideBar,
      isPaymentRefreshed,
      isNotificationError,
      isCurrentUserManager,
      isSettleCompleted,
      searchedForPayModes,
      selectedPayMode,
      const DeepCollectionEquality().hash(_appliedPayments),
      const DeepCollectionEquality().hash(_searchedPaymentModes),
      transactionResponse,
      tenderedAmount,
      loadingMessage,
      validationError,
      apiError,
      notificationMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentScreenStateImplCopyWith<_$PaymentScreenStateImpl> get copyWith =>
      __$$PaymentScreenStateImplCopyWithImpl<_$PaymentScreenStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentScreenStateImplToJson(
      this,
    );
  }
}

abstract class _PaymentScreenState implements PaymentScreenState {
  const factory _PaymentScreenState(
      {final int loadingStatus,
      final int selectedPayModeIndex,
      final bool isCashScreenSelected,
      final bool shouldShowSideBar,
      final bool isPaymentRefreshed,
      final bool isNotificationError,
      final bool isCurrentUserManager,
      final bool isSettleCompleted,
      final bool searchedForPayModes,
      final PaymentModeContainerDTO? selectedPayMode,
      final List<TransactionPaymentDTO>? appliedPayments,
      final List<PaymentModeContainerDTO> searchedPaymentModes,
      final TransactionResponse? transactionResponse,
      final double tenderedAmount,
      final String? loadingMessage,
      final String? validationError,
      final String? apiError,
      final String? notificationMessage}) = _$PaymentScreenStateImpl;

  factory _PaymentScreenState.fromJson(Map<String, dynamic> json) =
      _$PaymentScreenStateImpl.fromJson;

  @override
  int get loadingStatus;
  @override
  int get selectedPayModeIndex;
  @override
  bool get isCashScreenSelected;
  @override
  bool get shouldShowSideBar;
  @override
  bool get isPaymentRefreshed;
  @override
  bool get isNotificationError;
  @override
  bool get isCurrentUserManager;
  @override
  bool get isSettleCompleted;
  @override
  bool get searchedForPayModes;
  @override
  PaymentModeContainerDTO? get selectedPayMode;
  @override
  List<TransactionPaymentDTO>? get appliedPayments;
  @override
  List<PaymentModeContainerDTO> get searchedPaymentModes;
  @override
  TransactionResponse? get transactionResponse;
  @override
  double get tenderedAmount;
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
  _$$PaymentScreenStateImplCopyWith<_$PaymentScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
