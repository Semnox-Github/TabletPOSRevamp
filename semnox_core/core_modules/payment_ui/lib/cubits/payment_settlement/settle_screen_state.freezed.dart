// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settle_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettleScreenState _$SettleScreenStateFromJson(Map<String, dynamic> json) {
  return _SettleScreenState.fromJson(json);
}

/// @nodoc
mixin _$SettleScreenState {
  int get loadingStatus => throw _privateConstructorUsedError;
  int get settleScreenIndex => throw _privateConstructorUsedError;
  int get maxLimitTipPC => throw _privateConstructorUsedError;
  bool get showSideBar => throw _privateConstructorUsedError;
  bool get showFilterSection => throw _privateConstructorUsedError;
  bool get authPaymentsSwitchStatus => throw _privateConstructorUsedError;
  bool get tipSwitchStatus => throw _privateConstructorUsedError;
  bool get editPaySwitchStatus => throw _privateConstructorUsedError;
  bool get isSettleCompleted => throw _privateConstructorUsedError;
  bool get isTipAdded => throw _privateConstructorUsedError;
  bool get isTipSplitAdded => throw _privateConstructorUsedError;
  bool get searchedForSettleModes => throw _privateConstructorUsedError;
  TransactionResponse? get transactionResponse =>
      throw _privateConstructorUsedError;
  String? get selectedSettleMode => throw _privateConstructorUsedError;
  List<PaymentModeContainerDTO> get payModes =>
      throw _privateConstructorUsedError;
  List<TransactionPaymentDTO> get authorizedPayments =>
      throw _privateConstructorUsedError;
  List<TransactionPaymentDTO> get settledPayments =>
      throw _privateConstructorUsedError;
  List<TransactionPaymentDTO> get editablePayments =>
      throw _privateConstructorUsedError;
  List<TransactionPaymentDTO> get exemptedPayments =>
      throw _privateConstructorUsedError;
  List<String> get searchedSettlementModes =>
      throw _privateConstructorUsedError;
  Map<int, List<EmployeeTipData>>? get employeeTips =>
      throw _privateConstructorUsedError;
  String? get loadingMessage => throw _privateConstructorUsedError;
  String? get validationError => throw _privateConstructorUsedError;
  String? get apiError => throw _privateConstructorUsedError;
  String? get notificationMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettleScreenStateCopyWith<SettleScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettleScreenStateCopyWith<$Res> {
  factory $SettleScreenStateCopyWith(
          SettleScreenState value, $Res Function(SettleScreenState) then) =
      _$SettleScreenStateCopyWithImpl<$Res, SettleScreenState>;
  @useResult
  $Res call(
      {int loadingStatus,
      int settleScreenIndex,
      int maxLimitTipPC,
      bool showSideBar,
      bool showFilterSection,
      bool authPaymentsSwitchStatus,
      bool tipSwitchStatus,
      bool editPaySwitchStatus,
      bool isSettleCompleted,
      bool isTipAdded,
      bool isTipSplitAdded,
      bool searchedForSettleModes,
      TransactionResponse? transactionResponse,
      String? selectedSettleMode,
      List<PaymentModeContainerDTO> payModes,
      List<TransactionPaymentDTO> authorizedPayments,
      List<TransactionPaymentDTO> settledPayments,
      List<TransactionPaymentDTO> editablePayments,
      List<TransactionPaymentDTO> exemptedPayments,
      List<String> searchedSettlementModes,
      Map<int, List<EmployeeTipData>>? employeeTips,
      String? loadingMessage,
      String? validationError,
      String? apiError,
      String? notificationMessage});

  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class _$SettleScreenStateCopyWithImpl<$Res, $Val extends SettleScreenState>
    implements $SettleScreenStateCopyWith<$Res> {
  _$SettleScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? settleScreenIndex = null,
    Object? maxLimitTipPC = null,
    Object? showSideBar = null,
    Object? showFilterSection = null,
    Object? authPaymentsSwitchStatus = null,
    Object? tipSwitchStatus = null,
    Object? editPaySwitchStatus = null,
    Object? isSettleCompleted = null,
    Object? isTipAdded = null,
    Object? isTipSplitAdded = null,
    Object? searchedForSettleModes = null,
    Object? transactionResponse = freezed,
    Object? selectedSettleMode = freezed,
    Object? payModes = null,
    Object? authorizedPayments = null,
    Object? settledPayments = null,
    Object? editablePayments = null,
    Object? exemptedPayments = null,
    Object? searchedSettlementModes = null,
    Object? employeeTips = freezed,
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
      settleScreenIndex: null == settleScreenIndex
          ? _value.settleScreenIndex
          : settleScreenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      maxLimitTipPC: null == maxLimitTipPC
          ? _value.maxLimitTipPC
          : maxLimitTipPC // ignore: cast_nullable_to_non_nullable
              as int,
      showSideBar: null == showSideBar
          ? _value.showSideBar
          : showSideBar // ignore: cast_nullable_to_non_nullable
              as bool,
      showFilterSection: null == showFilterSection
          ? _value.showFilterSection
          : showFilterSection // ignore: cast_nullable_to_non_nullable
              as bool,
      authPaymentsSwitchStatus: null == authPaymentsSwitchStatus
          ? _value.authPaymentsSwitchStatus
          : authPaymentsSwitchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      tipSwitchStatus: null == tipSwitchStatus
          ? _value.tipSwitchStatus
          : tipSwitchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      editPaySwitchStatus: null == editPaySwitchStatus
          ? _value.editPaySwitchStatus
          : editPaySwitchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isSettleCompleted: null == isSettleCompleted
          ? _value.isSettleCompleted
          : isSettleCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isTipAdded: null == isTipAdded
          ? _value.isTipAdded
          : isTipAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      isTipSplitAdded: null == isTipSplitAdded
          ? _value.isTipSplitAdded
          : isTipSplitAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedForSettleModes: null == searchedForSettleModes
          ? _value.searchedForSettleModes
          : searchedForSettleModes // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      selectedSettleMode: freezed == selectedSettleMode
          ? _value.selectedSettleMode
          : selectedSettleMode // ignore: cast_nullable_to_non_nullable
              as String?,
      payModes: null == payModes
          ? _value.payModes
          : payModes // ignore: cast_nullable_to_non_nullable
              as List<PaymentModeContainerDTO>,
      authorizedPayments: null == authorizedPayments
          ? _value.authorizedPayments
          : authorizedPayments // ignore: cast_nullable_to_non_nullable
              as List<TransactionPaymentDTO>,
      settledPayments: null == settledPayments
          ? _value.settledPayments
          : settledPayments // ignore: cast_nullable_to_non_nullable
              as List<TransactionPaymentDTO>,
      editablePayments: null == editablePayments
          ? _value.editablePayments
          : editablePayments // ignore: cast_nullable_to_non_nullable
              as List<TransactionPaymentDTO>,
      exemptedPayments: null == exemptedPayments
          ? _value.exemptedPayments
          : exemptedPayments // ignore: cast_nullable_to_non_nullable
              as List<TransactionPaymentDTO>,
      searchedSettlementModes: null == searchedSettlementModes
          ? _value.searchedSettlementModes
          : searchedSettlementModes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      employeeTips: freezed == employeeTips
          ? _value.employeeTips
          : employeeTips // ignore: cast_nullable_to_non_nullable
              as Map<int, List<EmployeeTipData>>?,
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
}

/// @nodoc
abstract class _$$SettleScreenStateImplCopyWith<$Res>
    implements $SettleScreenStateCopyWith<$Res> {
  factory _$$SettleScreenStateImplCopyWith(_$SettleScreenStateImpl value,
          $Res Function(_$SettleScreenStateImpl) then) =
      __$$SettleScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int loadingStatus,
      int settleScreenIndex,
      int maxLimitTipPC,
      bool showSideBar,
      bool showFilterSection,
      bool authPaymentsSwitchStatus,
      bool tipSwitchStatus,
      bool editPaySwitchStatus,
      bool isSettleCompleted,
      bool isTipAdded,
      bool isTipSplitAdded,
      bool searchedForSettleModes,
      TransactionResponse? transactionResponse,
      String? selectedSettleMode,
      List<PaymentModeContainerDTO> payModes,
      List<TransactionPaymentDTO> authorizedPayments,
      List<TransactionPaymentDTO> settledPayments,
      List<TransactionPaymentDTO> editablePayments,
      List<TransactionPaymentDTO> exemptedPayments,
      List<String> searchedSettlementModes,
      Map<int, List<EmployeeTipData>>? employeeTips,
      String? loadingMessage,
      String? validationError,
      String? apiError,
      String? notificationMessage});

  @override
  $TransactionResponseCopyWith<$Res>? get transactionResponse;
}

/// @nodoc
class __$$SettleScreenStateImplCopyWithImpl<$Res>
    extends _$SettleScreenStateCopyWithImpl<$Res, _$SettleScreenStateImpl>
    implements _$$SettleScreenStateImplCopyWith<$Res> {
  __$$SettleScreenStateImplCopyWithImpl(_$SettleScreenStateImpl _value,
      $Res Function(_$SettleScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingStatus = null,
    Object? settleScreenIndex = null,
    Object? maxLimitTipPC = null,
    Object? showSideBar = null,
    Object? showFilterSection = null,
    Object? authPaymentsSwitchStatus = null,
    Object? tipSwitchStatus = null,
    Object? editPaySwitchStatus = null,
    Object? isSettleCompleted = null,
    Object? isTipAdded = null,
    Object? isTipSplitAdded = null,
    Object? searchedForSettleModes = null,
    Object? transactionResponse = freezed,
    Object? selectedSettleMode = freezed,
    Object? payModes = null,
    Object? authorizedPayments = null,
    Object? settledPayments = null,
    Object? editablePayments = null,
    Object? exemptedPayments = null,
    Object? searchedSettlementModes = null,
    Object? employeeTips = freezed,
    Object? loadingMessage = freezed,
    Object? validationError = freezed,
    Object? apiError = freezed,
    Object? notificationMessage = freezed,
  }) {
    return _then(_$SettleScreenStateImpl(
      loadingStatus: null == loadingStatus
          ? _value.loadingStatus
          : loadingStatus // ignore: cast_nullable_to_non_nullable
              as int,
      settleScreenIndex: null == settleScreenIndex
          ? _value.settleScreenIndex
          : settleScreenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      maxLimitTipPC: null == maxLimitTipPC
          ? _value.maxLimitTipPC
          : maxLimitTipPC // ignore: cast_nullable_to_non_nullable
              as int,
      showSideBar: null == showSideBar
          ? _value.showSideBar
          : showSideBar // ignore: cast_nullable_to_non_nullable
              as bool,
      showFilterSection: null == showFilterSection
          ? _value.showFilterSection
          : showFilterSection // ignore: cast_nullable_to_non_nullable
              as bool,
      authPaymentsSwitchStatus: null == authPaymentsSwitchStatus
          ? _value.authPaymentsSwitchStatus
          : authPaymentsSwitchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      tipSwitchStatus: null == tipSwitchStatus
          ? _value.tipSwitchStatus
          : tipSwitchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      editPaySwitchStatus: null == editPaySwitchStatus
          ? _value.editPaySwitchStatus
          : editPaySwitchStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isSettleCompleted: null == isSettleCompleted
          ? _value.isSettleCompleted
          : isSettleCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isTipAdded: null == isTipAdded
          ? _value.isTipAdded
          : isTipAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      isTipSplitAdded: null == isTipSplitAdded
          ? _value.isTipSplitAdded
          : isTipSplitAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedForSettleModes: null == searchedForSettleModes
          ? _value.searchedForSettleModes
          : searchedForSettleModes // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionResponse: freezed == transactionResponse
          ? _value.transactionResponse
          : transactionResponse // ignore: cast_nullable_to_non_nullable
              as TransactionResponse?,
      selectedSettleMode: freezed == selectedSettleMode
          ? _value.selectedSettleMode
          : selectedSettleMode // ignore: cast_nullable_to_non_nullable
              as String?,
      payModes: null == payModes
          ? _value._payModes
          : payModes // ignore: cast_nullable_to_non_nullable
              as List<PaymentModeContainerDTO>,
      authorizedPayments: null == authorizedPayments
          ? _value._authorizedPayments
          : authorizedPayments // ignore: cast_nullable_to_non_nullable
              as List<TransactionPaymentDTO>,
      settledPayments: null == settledPayments
          ? _value._settledPayments
          : settledPayments // ignore: cast_nullable_to_non_nullable
              as List<TransactionPaymentDTO>,
      editablePayments: null == editablePayments
          ? _value._editablePayments
          : editablePayments // ignore: cast_nullable_to_non_nullable
              as List<TransactionPaymentDTO>,
      exemptedPayments: null == exemptedPayments
          ? _value._exemptedPayments
          : exemptedPayments // ignore: cast_nullable_to_non_nullable
              as List<TransactionPaymentDTO>,
      searchedSettlementModes: null == searchedSettlementModes
          ? _value._searchedSettlementModes
          : searchedSettlementModes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      employeeTips: freezed == employeeTips
          ? _value._employeeTips
          : employeeTips // ignore: cast_nullable_to_non_nullable
              as Map<int, List<EmployeeTipData>>?,
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
class _$SettleScreenStateImpl implements _SettleScreenState {
  const _$SettleScreenStateImpl(
      {this.loadingStatus = -1,
      this.settleScreenIndex = 1,
      this.maxLimitTipPC = 0,
      this.showSideBar = true,
      this.showFilterSection = true,
      this.authPaymentsSwitchStatus = false,
      this.tipSwitchStatus = false,
      this.editPaySwitchStatus = false,
      this.isSettleCompleted = false,
      this.isTipAdded = false,
      this.isTipSplitAdded = false,
      this.searchedForSettleModes = false,
      this.transactionResponse,
      this.selectedSettleMode,
      final List<PaymentModeContainerDTO> payModes = const [],
      final List<TransactionPaymentDTO> authorizedPayments = const [],
      final List<TransactionPaymentDTO> settledPayments = const [],
      final List<TransactionPaymentDTO> editablePayments = const [],
      final List<TransactionPaymentDTO> exemptedPayments = const [],
      final List<String> searchedSettlementModes = const [],
      final Map<int, List<EmployeeTipData>>? employeeTips,
      this.loadingMessage,
      this.validationError,
      this.apiError,
      this.notificationMessage})
      : _payModes = payModes,
        _authorizedPayments = authorizedPayments,
        _settledPayments = settledPayments,
        _editablePayments = editablePayments,
        _exemptedPayments = exemptedPayments,
        _searchedSettlementModes = searchedSettlementModes,
        _employeeTips = employeeTips;

  factory _$SettleScreenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettleScreenStateImplFromJson(json);

  @override
  @JsonKey()
  final int loadingStatus;
  @override
  @JsonKey()
  final int settleScreenIndex;
  @override
  @JsonKey()
  final int maxLimitTipPC;
  @override
  @JsonKey()
  final bool showSideBar;
  @override
  @JsonKey()
  final bool showFilterSection;
  @override
  @JsonKey()
  final bool authPaymentsSwitchStatus;
  @override
  @JsonKey()
  final bool tipSwitchStatus;
  @override
  @JsonKey()
  final bool editPaySwitchStatus;
  @override
  @JsonKey()
  final bool isSettleCompleted;
  @override
  @JsonKey()
  final bool isTipAdded;
  @override
  @JsonKey()
  final bool isTipSplitAdded;
  @override
  @JsonKey()
  final bool searchedForSettleModes;
  @override
  final TransactionResponse? transactionResponse;
  @override
  final String? selectedSettleMode;
  final List<PaymentModeContainerDTO> _payModes;
  @override
  @JsonKey()
  List<PaymentModeContainerDTO> get payModes {
    if (_payModes is EqualUnmodifiableListView) return _payModes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payModes);
  }

  final List<TransactionPaymentDTO> _authorizedPayments;
  @override
  @JsonKey()
  List<TransactionPaymentDTO> get authorizedPayments {
    if (_authorizedPayments is EqualUnmodifiableListView)
      return _authorizedPayments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorizedPayments);
  }

  final List<TransactionPaymentDTO> _settledPayments;
  @override
  @JsonKey()
  List<TransactionPaymentDTO> get settledPayments {
    if (_settledPayments is EqualUnmodifiableListView) return _settledPayments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_settledPayments);
  }

  final List<TransactionPaymentDTO> _editablePayments;
  @override
  @JsonKey()
  List<TransactionPaymentDTO> get editablePayments {
    if (_editablePayments is EqualUnmodifiableListView)
      return _editablePayments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_editablePayments);
  }

  final List<TransactionPaymentDTO> _exemptedPayments;
  @override
  @JsonKey()
  List<TransactionPaymentDTO> get exemptedPayments {
    if (_exemptedPayments is EqualUnmodifiableListView)
      return _exemptedPayments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exemptedPayments);
  }

  final List<String> _searchedSettlementModes;
  @override
  @JsonKey()
  List<String> get searchedSettlementModes {
    if (_searchedSettlementModes is EqualUnmodifiableListView)
      return _searchedSettlementModes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedSettlementModes);
  }

  final Map<int, List<EmployeeTipData>>? _employeeTips;
  @override
  Map<int, List<EmployeeTipData>>? get employeeTips {
    final value = _employeeTips;
    if (value == null) return null;
    if (_employeeTips is EqualUnmodifiableMapView) return _employeeTips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

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
    return 'SettleScreenState(loadingStatus: $loadingStatus, settleScreenIndex: $settleScreenIndex, maxLimitTipPC: $maxLimitTipPC, showSideBar: $showSideBar, showFilterSection: $showFilterSection, authPaymentsSwitchStatus: $authPaymentsSwitchStatus, tipSwitchStatus: $tipSwitchStatus, editPaySwitchStatus: $editPaySwitchStatus, isSettleCompleted: $isSettleCompleted, isTipAdded: $isTipAdded, isTipSplitAdded: $isTipSplitAdded, searchedForSettleModes: $searchedForSettleModes, transactionResponse: $transactionResponse, selectedSettleMode: $selectedSettleMode, payModes: $payModes, authorizedPayments: $authorizedPayments, settledPayments: $settledPayments, editablePayments: $editablePayments, exemptedPayments: $exemptedPayments, searchedSettlementModes: $searchedSettlementModes, employeeTips: $employeeTips, loadingMessage: $loadingMessage, validationError: $validationError, apiError: $apiError, notificationMessage: $notificationMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettleScreenStateImpl &&
            (identical(other.loadingStatus, loadingStatus) ||
                other.loadingStatus == loadingStatus) &&
            (identical(other.settleScreenIndex, settleScreenIndex) ||
                other.settleScreenIndex == settleScreenIndex) &&
            (identical(other.maxLimitTipPC, maxLimitTipPC) ||
                other.maxLimitTipPC == maxLimitTipPC) &&
            (identical(other.showSideBar, showSideBar) ||
                other.showSideBar == showSideBar) &&
            (identical(other.showFilterSection, showFilterSection) ||
                other.showFilterSection == showFilterSection) &&
            (identical(
                    other.authPaymentsSwitchStatus, authPaymentsSwitchStatus) ||
                other.authPaymentsSwitchStatus == authPaymentsSwitchStatus) &&
            (identical(other.tipSwitchStatus, tipSwitchStatus) ||
                other.tipSwitchStatus == tipSwitchStatus) &&
            (identical(other.editPaySwitchStatus, editPaySwitchStatus) ||
                other.editPaySwitchStatus == editPaySwitchStatus) &&
            (identical(other.isSettleCompleted, isSettleCompleted) ||
                other.isSettleCompleted == isSettleCompleted) &&
            (identical(other.isTipAdded, isTipAdded) ||
                other.isTipAdded == isTipAdded) &&
            (identical(other.isTipSplitAdded, isTipSplitAdded) ||
                other.isTipSplitAdded == isTipSplitAdded) &&
            (identical(other.searchedForSettleModes, searchedForSettleModes) ||
                other.searchedForSettleModes == searchedForSettleModes) &&
            (identical(other.transactionResponse, transactionResponse) ||
                other.transactionResponse == transactionResponse) &&
            (identical(other.selectedSettleMode, selectedSettleMode) ||
                other.selectedSettleMode == selectedSettleMode) &&
            const DeepCollectionEquality().equals(other._payModes, _payModes) &&
            const DeepCollectionEquality()
                .equals(other._authorizedPayments, _authorizedPayments) &&
            const DeepCollectionEquality()
                .equals(other._settledPayments, _settledPayments) &&
            const DeepCollectionEquality()
                .equals(other._editablePayments, _editablePayments) &&
            const DeepCollectionEquality()
                .equals(other._exemptedPayments, _exemptedPayments) &&
            const DeepCollectionEquality().equals(
                other._searchedSettlementModes, _searchedSettlementModes) &&
            const DeepCollectionEquality()
                .equals(other._employeeTips, _employeeTips) &&
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
  int get hashCode => Object.hashAll([
        runtimeType,
        loadingStatus,
        settleScreenIndex,
        maxLimitTipPC,
        showSideBar,
        showFilterSection,
        authPaymentsSwitchStatus,
        tipSwitchStatus,
        editPaySwitchStatus,
        isSettleCompleted,
        isTipAdded,
        isTipSplitAdded,
        searchedForSettleModes,
        transactionResponse,
        selectedSettleMode,
        const DeepCollectionEquality().hash(_payModes),
        const DeepCollectionEquality().hash(_authorizedPayments),
        const DeepCollectionEquality().hash(_settledPayments),
        const DeepCollectionEquality().hash(_editablePayments),
        const DeepCollectionEquality().hash(_exemptedPayments),
        const DeepCollectionEquality().hash(_searchedSettlementModes),
        const DeepCollectionEquality().hash(_employeeTips),
        loadingMessage,
        validationError,
        apiError,
        notificationMessage
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettleScreenStateImplCopyWith<_$SettleScreenStateImpl> get copyWith =>
      __$$SettleScreenStateImplCopyWithImpl<_$SettleScreenStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettleScreenStateImplToJson(
      this,
    );
  }
}

abstract class _SettleScreenState implements SettleScreenState {
  const factory _SettleScreenState(
      {final int loadingStatus,
      final int settleScreenIndex,
      final int maxLimitTipPC,
      final bool showSideBar,
      final bool showFilterSection,
      final bool authPaymentsSwitchStatus,
      final bool tipSwitchStatus,
      final bool editPaySwitchStatus,
      final bool isSettleCompleted,
      final bool isTipAdded,
      final bool isTipSplitAdded,
      final bool searchedForSettleModes,
      final TransactionResponse? transactionResponse,
      final String? selectedSettleMode,
      final List<PaymentModeContainerDTO> payModes,
      final List<TransactionPaymentDTO> authorizedPayments,
      final List<TransactionPaymentDTO> settledPayments,
      final List<TransactionPaymentDTO> editablePayments,
      final List<TransactionPaymentDTO> exemptedPayments,
      final List<String> searchedSettlementModes,
      final Map<int, List<EmployeeTipData>>? employeeTips,
      final String? loadingMessage,
      final String? validationError,
      final String? apiError,
      final String? notificationMessage}) = _$SettleScreenStateImpl;

  factory _SettleScreenState.fromJson(Map<String, dynamic> json) =
      _$SettleScreenStateImpl.fromJson;

  @override
  int get loadingStatus;
  @override
  int get settleScreenIndex;
  @override
  int get maxLimitTipPC;
  @override
  bool get showSideBar;
  @override
  bool get showFilterSection;
  @override
  bool get authPaymentsSwitchStatus;
  @override
  bool get tipSwitchStatus;
  @override
  bool get editPaySwitchStatus;
  @override
  bool get isSettleCompleted;
  @override
  bool get isTipAdded;
  @override
  bool get isTipSplitAdded;
  @override
  bool get searchedForSettleModes;
  @override
  TransactionResponse? get transactionResponse;
  @override
  String? get selectedSettleMode;
  @override
  List<PaymentModeContainerDTO> get payModes;
  @override
  List<TransactionPaymentDTO> get authorizedPayments;
  @override
  List<TransactionPaymentDTO> get settledPayments;
  @override
  List<TransactionPaymentDTO> get editablePayments;
  @override
  List<TransactionPaymentDTO> get exemptedPayments;
  @override
  List<String> get searchedSettlementModes;
  @override
  Map<int, List<EmployeeTipData>>? get employeeTips;
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
  _$$SettleScreenStateImplCopyWith<_$SettleScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
