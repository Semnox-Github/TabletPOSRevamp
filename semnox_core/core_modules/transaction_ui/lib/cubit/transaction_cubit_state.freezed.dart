// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_cubit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionCubitState _$TransactionCubitStateFromJson(
    Map<String, dynamic> json) {
  return _TransactionCubitState.fromJson(json);
}

/// @nodoc
mixin _$TransactionCubitState {
  int get selectedSeat => throw _privateConstructorUsedError;
  TransactionData? get transactionData => throw _privateConstructorUsedError;
  bool get isSeatBased => throw _privateConstructorUsedError;
  bool get showOrderDetailsWhileInitiatingOrder =>
      throw _privateConstructorUsedError;
  String get selectedSeatName => throw _privateConstructorUsedError;
  Map<String, List<TransactionLinesGroup>>? get transactionLinesGroupsBySeat =>
      throw _privateConstructorUsedError;
  List<String>? get seatNames => throw _privateConstructorUsedError;
  List<int>? get seatNumbers => throw _privateConstructorUsedError;
  int? get isTransactionLineGroupSelected => throw _privateConstructorUsedError;
  LoaderStatus? get loaderStatus => throw _privateConstructorUsedError;
  bool? get isRemarksUpdated => throw _privateConstructorUsedError;
  bool? get isProfileUpdatedToTransactionLine =>
      throw _privateConstructorUsedError;
  bool? get isNewTransactionInitiated => throw _privateConstructorUsedError;
  String? get remarksUpdateErrorString =>
      throw _privateConstructorUsedError; //transactionCommonLoadingBarState
  TransactionUpdateStatusEnum? get transactionUpdateStatusEnum =>
      throw _privateConstructorUsedError;
  String get transactionErrorString =>
      throw _privateConstructorUsedError; //transactionDetailsUpdateSectionState
  TransactionDetailsUpdateStatusEnum? get transactionDetailsUpdateStatusEnum =>
      throw _privateConstructorUsedError;
  String get transactionDetailsUpdateErrorString =>
      throw _privateConstructorUsedError;
  Status? get status => throw _privateConstructorUsedError;
  String? get linkCustomerToTransactionError =>
      throw _privateConstructorUsedError;
  String? get deLinkCustomerFromTransactionError =>
      throw _privateConstructorUsedError;
  bool? get hasCustomerDelinkedFromTransaction =>
      throw _privateConstructorUsedError;
  TransactionStatus? get completeTransactionStatus =>
      throw _privateConstructorUsedError;
  bool get isInSearchMode => throw _privateConstructorUsedError;
  List<TransactionLinesGroup>? get searchResultsTransactionLineGroups =>
      throw _privateConstructorUsedError;
  bool? get isRemarksMandatoryProductAdded =>
      throw _privateConstructorUsedError;
  String? get remarksMandatoryProductErrorString =>
      throw _privateConstructorUsedError;
  bool? get isTransactionLinesSeatUpdated => throw _privateConstructorUsedError;
  Map<int, String>? get seats => throw _privateConstructorUsedError;
  int? get isTransactionLineRepeated => throw _privateConstructorUsedError;
  bool get shouldPopAfterSave => throw _privateConstructorUsedError;
  TransactionPrintReceiptResponse? get transactionPrintReceipt =>
      throw _privateConstructorUsedError;
  bool? get shouldTriggerPopAfterSave => throw _privateConstructorUsedError;
  bool? get isBluetoothConnectivitySession =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String? get messageString => throw _privateConstructorUsedError;
  bool get isPrintReceiptReceived => throw _privateConstructorUsedError;
  bool? get updatedTransactionProfile => throw _privateConstructorUsedError;
  String? get updateTransactionProfileError =>
      throw _privateConstructorUsedError;
  String? get updateTransactionLineProfileError =>
      throw _privateConstructorUsedError;
  String? get updateTransactionLinesSeatError =>
      throw _privateConstructorUsedError;
  String? get transactionSeatNameUpdateError =>
      throw _privateConstructorUsedError;
  bool? get isInProductSearchMode => throw _privateConstructorUsedError;
  bool? get isCardFunctionalityDialogShown =>
      throw _privateConstructorUsedError;
  bool? get isCustomerIDDialogShown => throw _privateConstructorUsedError;
  String? get barcodeReadData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCubitStateCopyWith<TransactionCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCubitStateCopyWith<$Res> {
  factory $TransactionCubitStateCopyWith(TransactionCubitState value,
          $Res Function(TransactionCubitState) then) =
      _$TransactionCubitStateCopyWithImpl<$Res, TransactionCubitState>;
  @useResult
  $Res call(
      {int selectedSeat,
      TransactionData? transactionData,
      bool isSeatBased,
      bool showOrderDetailsWhileInitiatingOrder,
      String selectedSeatName,
      Map<String, List<TransactionLinesGroup>>? transactionLinesGroupsBySeat,
      List<String>? seatNames,
      List<int>? seatNumbers,
      int? isTransactionLineGroupSelected,
      LoaderStatus? loaderStatus,
      bool? isRemarksUpdated,
      bool? isProfileUpdatedToTransactionLine,
      bool? isNewTransactionInitiated,
      String? remarksUpdateErrorString,
      TransactionUpdateStatusEnum? transactionUpdateStatusEnum,
      String transactionErrorString,
      TransactionDetailsUpdateStatusEnum? transactionDetailsUpdateStatusEnum,
      String transactionDetailsUpdateErrorString,
      Status? status,
      String? linkCustomerToTransactionError,
      String? deLinkCustomerFromTransactionError,
      bool? hasCustomerDelinkedFromTransaction,
      TransactionStatus? completeTransactionStatus,
      bool isInSearchMode,
      List<TransactionLinesGroup>? searchResultsTransactionLineGroups,
      bool? isRemarksMandatoryProductAdded,
      String? remarksMandatoryProductErrorString,
      bool? isTransactionLinesSeatUpdated,
      Map<int, String>? seats,
      int? isTransactionLineRepeated,
      bool shouldPopAfterSave,
      TransactionPrintReceiptResponse? transactionPrintReceipt,
      bool? shouldTriggerPopAfterSave,
      bool? isBluetoothConnectivitySession,
      bool isLoading,
      bool isSuccess,
      bool isError,
      String? messageString,
      bool isPrintReceiptReceived,
      bool? updatedTransactionProfile,
      String? updateTransactionProfileError,
      String? updateTransactionLineProfileError,
      String? updateTransactionLinesSeatError,
      String? transactionSeatNameUpdateError,
      bool? isInProductSearchMode,
      bool? isCardFunctionalityDialogShown,
      bool? isCustomerIDDialogShown,
      String? barcodeReadData});

  $TransactionDataCopyWith<$Res>? get transactionData;
  $TransactionPrintReceiptResponseCopyWith<$Res>? get transactionPrintReceipt;
}

/// @nodoc
class _$TransactionCubitStateCopyWithImpl<$Res,
        $Val extends TransactionCubitState>
    implements $TransactionCubitStateCopyWith<$Res> {
  _$TransactionCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSeat = null,
    Object? transactionData = freezed,
    Object? isSeatBased = null,
    Object? showOrderDetailsWhileInitiatingOrder = null,
    Object? selectedSeatName = null,
    Object? transactionLinesGroupsBySeat = freezed,
    Object? seatNames = freezed,
    Object? seatNumbers = freezed,
    Object? isTransactionLineGroupSelected = freezed,
    Object? loaderStatus = freezed,
    Object? isRemarksUpdated = freezed,
    Object? isProfileUpdatedToTransactionLine = freezed,
    Object? isNewTransactionInitiated = freezed,
    Object? remarksUpdateErrorString = freezed,
    Object? transactionUpdateStatusEnum = freezed,
    Object? transactionErrorString = null,
    Object? transactionDetailsUpdateStatusEnum = freezed,
    Object? transactionDetailsUpdateErrorString = null,
    Object? status = freezed,
    Object? linkCustomerToTransactionError = freezed,
    Object? deLinkCustomerFromTransactionError = freezed,
    Object? hasCustomerDelinkedFromTransaction = freezed,
    Object? completeTransactionStatus = freezed,
    Object? isInSearchMode = null,
    Object? searchResultsTransactionLineGroups = freezed,
    Object? isRemarksMandatoryProductAdded = freezed,
    Object? remarksMandatoryProductErrorString = freezed,
    Object? isTransactionLinesSeatUpdated = freezed,
    Object? seats = freezed,
    Object? isTransactionLineRepeated = freezed,
    Object? shouldPopAfterSave = null,
    Object? transactionPrintReceipt = freezed,
    Object? shouldTriggerPopAfterSave = freezed,
    Object? isBluetoothConnectivitySession = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isError = null,
    Object? messageString = freezed,
    Object? isPrintReceiptReceived = null,
    Object? updatedTransactionProfile = freezed,
    Object? updateTransactionProfileError = freezed,
    Object? updateTransactionLineProfileError = freezed,
    Object? updateTransactionLinesSeatError = freezed,
    Object? transactionSeatNameUpdateError = freezed,
    Object? isInProductSearchMode = freezed,
    Object? isCardFunctionalityDialogShown = freezed,
    Object? isCustomerIDDialogShown = freezed,
    Object? barcodeReadData = freezed,
  }) {
    return _then(_value.copyWith(
      selectedSeat: null == selectedSeat
          ? _value.selectedSeat
          : selectedSeat // ignore: cast_nullable_to_non_nullable
              as int,
      transactionData: freezed == transactionData
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as TransactionData?,
      isSeatBased: null == isSeatBased
          ? _value.isSeatBased
          : isSeatBased // ignore: cast_nullable_to_non_nullable
              as bool,
      showOrderDetailsWhileInitiatingOrder: null ==
              showOrderDetailsWhileInitiatingOrder
          ? _value.showOrderDetailsWhileInitiatingOrder
          : showOrderDetailsWhileInitiatingOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedSeatName: null == selectedSeatName
          ? _value.selectedSeatName
          : selectedSeatName // ignore: cast_nullable_to_non_nullable
              as String,
      transactionLinesGroupsBySeat: freezed == transactionLinesGroupsBySeat
          ? _value.transactionLinesGroupsBySeat
          : transactionLinesGroupsBySeat // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TransactionLinesGroup>>?,
      seatNames: freezed == seatNames
          ? _value.seatNames
          : seatNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      seatNumbers: freezed == seatNumbers
          ? _value.seatNumbers
          : seatNumbers // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      isTransactionLineGroupSelected: freezed == isTransactionLineGroupSelected
          ? _value.isTransactionLineGroupSelected
          : isTransactionLineGroupSelected // ignore: cast_nullable_to_non_nullable
              as int?,
      loaderStatus: freezed == loaderStatus
          ? _value.loaderStatus
          : loaderStatus // ignore: cast_nullable_to_non_nullable
              as LoaderStatus?,
      isRemarksUpdated: freezed == isRemarksUpdated
          ? _value.isRemarksUpdated
          : isRemarksUpdated // ignore: cast_nullable_to_non_nullable
              as bool?,
      isProfileUpdatedToTransactionLine: freezed ==
              isProfileUpdatedToTransactionLine
          ? _value.isProfileUpdatedToTransactionLine
          : isProfileUpdatedToTransactionLine // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNewTransactionInitiated: freezed == isNewTransactionInitiated
          ? _value.isNewTransactionInitiated
          : isNewTransactionInitiated // ignore: cast_nullable_to_non_nullable
              as bool?,
      remarksUpdateErrorString: freezed == remarksUpdateErrorString
          ? _value.remarksUpdateErrorString
          : remarksUpdateErrorString // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionUpdateStatusEnum: freezed == transactionUpdateStatusEnum
          ? _value.transactionUpdateStatusEnum
          : transactionUpdateStatusEnum // ignore: cast_nullable_to_non_nullable
              as TransactionUpdateStatusEnum?,
      transactionErrorString: null == transactionErrorString
          ? _value.transactionErrorString
          : transactionErrorString // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDetailsUpdateStatusEnum: freezed ==
              transactionDetailsUpdateStatusEnum
          ? _value.transactionDetailsUpdateStatusEnum
          : transactionDetailsUpdateStatusEnum // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsUpdateStatusEnum?,
      transactionDetailsUpdateErrorString: null ==
              transactionDetailsUpdateErrorString
          ? _value.transactionDetailsUpdateErrorString
          : transactionDetailsUpdateErrorString // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      linkCustomerToTransactionError: freezed == linkCustomerToTransactionError
          ? _value.linkCustomerToTransactionError
          : linkCustomerToTransactionError // ignore: cast_nullable_to_non_nullable
              as String?,
      deLinkCustomerFromTransactionError: freezed ==
              deLinkCustomerFromTransactionError
          ? _value.deLinkCustomerFromTransactionError
          : deLinkCustomerFromTransactionError // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCustomerDelinkedFromTransaction: freezed ==
              hasCustomerDelinkedFromTransaction
          ? _value.hasCustomerDelinkedFromTransaction
          : hasCustomerDelinkedFromTransaction // ignore: cast_nullable_to_non_nullable
              as bool?,
      completeTransactionStatus: freezed == completeTransactionStatus
          ? _value.completeTransactionStatus
          : completeTransactionStatus // ignore: cast_nullable_to_non_nullable
              as TransactionStatus?,
      isInSearchMode: null == isInSearchMode
          ? _value.isInSearchMode
          : isInSearchMode // ignore: cast_nullable_to_non_nullable
              as bool,
      searchResultsTransactionLineGroups: freezed ==
              searchResultsTransactionLineGroups
          ? _value.searchResultsTransactionLineGroups
          : searchResultsTransactionLineGroups // ignore: cast_nullable_to_non_nullable
              as List<TransactionLinesGroup>?,
      isRemarksMandatoryProductAdded: freezed == isRemarksMandatoryProductAdded
          ? _value.isRemarksMandatoryProductAdded
          : isRemarksMandatoryProductAdded // ignore: cast_nullable_to_non_nullable
              as bool?,
      remarksMandatoryProductErrorString: freezed ==
              remarksMandatoryProductErrorString
          ? _value.remarksMandatoryProductErrorString
          : remarksMandatoryProductErrorString // ignore: cast_nullable_to_non_nullable
              as String?,
      isTransactionLinesSeatUpdated: freezed == isTransactionLinesSeatUpdated
          ? _value.isTransactionLinesSeatUpdated
          : isTransactionLinesSeatUpdated // ignore: cast_nullable_to_non_nullable
              as bool?,
      seats: freezed == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as Map<int, String>?,
      isTransactionLineRepeated: freezed == isTransactionLineRepeated
          ? _value.isTransactionLineRepeated
          : isTransactionLineRepeated // ignore: cast_nullable_to_non_nullable
              as int?,
      shouldPopAfterSave: null == shouldPopAfterSave
          ? _value.shouldPopAfterSave
          : shouldPopAfterSave // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionPrintReceipt: freezed == transactionPrintReceipt
          ? _value.transactionPrintReceipt
          : transactionPrintReceipt // ignore: cast_nullable_to_non_nullable
              as TransactionPrintReceiptResponse?,
      shouldTriggerPopAfterSave: freezed == shouldTriggerPopAfterSave
          ? _value.shouldTriggerPopAfterSave
          : shouldTriggerPopAfterSave // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBluetoothConnectivitySession: freezed == isBluetoothConnectivitySession
          ? _value.isBluetoothConnectivitySession
          : isBluetoothConnectivitySession // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      messageString: freezed == messageString
          ? _value.messageString
          : messageString // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrintReceiptReceived: null == isPrintReceiptReceived
          ? _value.isPrintReceiptReceived
          : isPrintReceiptReceived // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedTransactionProfile: freezed == updatedTransactionProfile
          ? _value.updatedTransactionProfile
          : updatedTransactionProfile // ignore: cast_nullable_to_non_nullable
              as bool?,
      updateTransactionProfileError: freezed == updateTransactionProfileError
          ? _value.updateTransactionProfileError
          : updateTransactionProfileError // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTransactionLineProfileError: freezed ==
              updateTransactionLineProfileError
          ? _value.updateTransactionLineProfileError
          : updateTransactionLineProfileError // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTransactionLinesSeatError: freezed ==
              updateTransactionLinesSeatError
          ? _value.updateTransactionLinesSeatError
          : updateTransactionLinesSeatError // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionSeatNameUpdateError: freezed == transactionSeatNameUpdateError
          ? _value.transactionSeatNameUpdateError
          : transactionSeatNameUpdateError // ignore: cast_nullable_to_non_nullable
              as String?,
      isInProductSearchMode: freezed == isInProductSearchMode
          ? _value.isInProductSearchMode
          : isInProductSearchMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCardFunctionalityDialogShown: freezed == isCardFunctionalityDialogShown
          ? _value.isCardFunctionalityDialogShown
          : isCardFunctionalityDialogShown // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCustomerIDDialogShown: freezed == isCustomerIDDialogShown
          ? _value.isCustomerIDDialogShown
          : isCustomerIDDialogShown // ignore: cast_nullable_to_non_nullable
              as bool?,
      barcodeReadData: freezed == barcodeReadData
          ? _value.barcodeReadData
          : barcodeReadData // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionDataCopyWith<$Res>? get transactionData {
    if (_value.transactionData == null) {
      return null;
    }

    return $TransactionDataCopyWith<$Res>(_value.transactionData!, (value) {
      return _then(_value.copyWith(transactionData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionPrintReceiptResponseCopyWith<$Res>? get transactionPrintReceipt {
    if (_value.transactionPrintReceipt == null) {
      return null;
    }

    return $TransactionPrintReceiptResponseCopyWith<$Res>(
        _value.transactionPrintReceipt!, (value) {
      return _then(_value.copyWith(transactionPrintReceipt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionCubitStateCopyWith<$Res>
    implements $TransactionCubitStateCopyWith<$Res> {
  factory _$$_TransactionCubitStateCopyWith(_$_TransactionCubitState value,
          $Res Function(_$_TransactionCubitState) then) =
      __$$_TransactionCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int selectedSeat,
      TransactionData? transactionData,
      bool isSeatBased,
      bool showOrderDetailsWhileInitiatingOrder,
      String selectedSeatName,
      Map<String, List<TransactionLinesGroup>>? transactionLinesGroupsBySeat,
      List<String>? seatNames,
      List<int>? seatNumbers,
      int? isTransactionLineGroupSelected,
      LoaderStatus? loaderStatus,
      bool? isRemarksUpdated,
      bool? isProfileUpdatedToTransactionLine,
      bool? isNewTransactionInitiated,
      String? remarksUpdateErrorString,
      TransactionUpdateStatusEnum? transactionUpdateStatusEnum,
      String transactionErrorString,
      TransactionDetailsUpdateStatusEnum? transactionDetailsUpdateStatusEnum,
      String transactionDetailsUpdateErrorString,
      Status? status,
      String? linkCustomerToTransactionError,
      String? deLinkCustomerFromTransactionError,
      bool? hasCustomerDelinkedFromTransaction,
      TransactionStatus? completeTransactionStatus,
      bool isInSearchMode,
      List<TransactionLinesGroup>? searchResultsTransactionLineGroups,
      bool? isRemarksMandatoryProductAdded,
      String? remarksMandatoryProductErrorString,
      bool? isTransactionLinesSeatUpdated,
      Map<int, String>? seats,
      int? isTransactionLineRepeated,
      bool shouldPopAfterSave,
      TransactionPrintReceiptResponse? transactionPrintReceipt,
      bool? shouldTriggerPopAfterSave,
      bool? isBluetoothConnectivitySession,
      bool isLoading,
      bool isSuccess,
      bool isError,
      String? messageString,
      bool isPrintReceiptReceived,
      bool? updatedTransactionProfile,
      String? updateTransactionProfileError,
      String? updateTransactionLineProfileError,
      String? updateTransactionLinesSeatError,
      String? transactionSeatNameUpdateError,
      bool? isInProductSearchMode,
      bool? isCardFunctionalityDialogShown,
      bool? isCustomerIDDialogShown,
      String? barcodeReadData});

  @override
  $TransactionDataCopyWith<$Res>? get transactionData;
  @override
  $TransactionPrintReceiptResponseCopyWith<$Res>? get transactionPrintReceipt;
}

/// @nodoc
class __$$_TransactionCubitStateCopyWithImpl<$Res>
    extends _$TransactionCubitStateCopyWithImpl<$Res, _$_TransactionCubitState>
    implements _$$_TransactionCubitStateCopyWith<$Res> {
  __$$_TransactionCubitStateCopyWithImpl(_$_TransactionCubitState _value,
      $Res Function(_$_TransactionCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSeat = null,
    Object? transactionData = freezed,
    Object? isSeatBased = null,
    Object? showOrderDetailsWhileInitiatingOrder = null,
    Object? selectedSeatName = null,
    Object? transactionLinesGroupsBySeat = freezed,
    Object? seatNames = freezed,
    Object? seatNumbers = freezed,
    Object? isTransactionLineGroupSelected = freezed,
    Object? loaderStatus = freezed,
    Object? isRemarksUpdated = freezed,
    Object? isProfileUpdatedToTransactionLine = freezed,
    Object? isNewTransactionInitiated = freezed,
    Object? remarksUpdateErrorString = freezed,
    Object? transactionUpdateStatusEnum = freezed,
    Object? transactionErrorString = null,
    Object? transactionDetailsUpdateStatusEnum = freezed,
    Object? transactionDetailsUpdateErrorString = null,
    Object? status = freezed,
    Object? linkCustomerToTransactionError = freezed,
    Object? deLinkCustomerFromTransactionError = freezed,
    Object? hasCustomerDelinkedFromTransaction = freezed,
    Object? completeTransactionStatus = freezed,
    Object? isInSearchMode = null,
    Object? searchResultsTransactionLineGroups = freezed,
    Object? isRemarksMandatoryProductAdded = freezed,
    Object? remarksMandatoryProductErrorString = freezed,
    Object? isTransactionLinesSeatUpdated = freezed,
    Object? seats = freezed,
    Object? isTransactionLineRepeated = freezed,
    Object? shouldPopAfterSave = null,
    Object? transactionPrintReceipt = freezed,
    Object? shouldTriggerPopAfterSave = freezed,
    Object? isBluetoothConnectivitySession = freezed,
    Object? isLoading = null,
    Object? isSuccess = null,
    Object? isError = null,
    Object? messageString = freezed,
    Object? isPrintReceiptReceived = null,
    Object? updatedTransactionProfile = freezed,
    Object? updateTransactionProfileError = freezed,
    Object? updateTransactionLineProfileError = freezed,
    Object? updateTransactionLinesSeatError = freezed,
    Object? transactionSeatNameUpdateError = freezed,
    Object? isInProductSearchMode = freezed,
    Object? isCardFunctionalityDialogShown = freezed,
    Object? isCustomerIDDialogShown = freezed,
    Object? barcodeReadData = freezed,
  }) {
    return _then(_$_TransactionCubitState(
      selectedSeat: null == selectedSeat
          ? _value.selectedSeat
          : selectedSeat // ignore: cast_nullable_to_non_nullable
              as int,
      transactionData: freezed == transactionData
          ? _value.transactionData
          : transactionData // ignore: cast_nullable_to_non_nullable
              as TransactionData?,
      isSeatBased: null == isSeatBased
          ? _value.isSeatBased
          : isSeatBased // ignore: cast_nullable_to_non_nullable
              as bool,
      showOrderDetailsWhileInitiatingOrder: null ==
              showOrderDetailsWhileInitiatingOrder
          ? _value.showOrderDetailsWhileInitiatingOrder
          : showOrderDetailsWhileInitiatingOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedSeatName: null == selectedSeatName
          ? _value.selectedSeatName
          : selectedSeatName // ignore: cast_nullable_to_non_nullable
              as String,
      transactionLinesGroupsBySeat: freezed == transactionLinesGroupsBySeat
          ? _value._transactionLinesGroupsBySeat
          : transactionLinesGroupsBySeat // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TransactionLinesGroup>>?,
      seatNames: freezed == seatNames
          ? _value._seatNames
          : seatNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      seatNumbers: freezed == seatNumbers
          ? _value._seatNumbers
          : seatNumbers // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      isTransactionLineGroupSelected: freezed == isTransactionLineGroupSelected
          ? _value.isTransactionLineGroupSelected
          : isTransactionLineGroupSelected // ignore: cast_nullable_to_non_nullable
              as int?,
      loaderStatus: freezed == loaderStatus
          ? _value.loaderStatus
          : loaderStatus // ignore: cast_nullable_to_non_nullable
              as LoaderStatus?,
      isRemarksUpdated: freezed == isRemarksUpdated
          ? _value.isRemarksUpdated
          : isRemarksUpdated // ignore: cast_nullable_to_non_nullable
              as bool?,
      isProfileUpdatedToTransactionLine: freezed ==
              isProfileUpdatedToTransactionLine
          ? _value.isProfileUpdatedToTransactionLine
          : isProfileUpdatedToTransactionLine // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNewTransactionInitiated: freezed == isNewTransactionInitiated
          ? _value.isNewTransactionInitiated
          : isNewTransactionInitiated // ignore: cast_nullable_to_non_nullable
              as bool?,
      remarksUpdateErrorString: freezed == remarksUpdateErrorString
          ? _value.remarksUpdateErrorString
          : remarksUpdateErrorString // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionUpdateStatusEnum: freezed == transactionUpdateStatusEnum
          ? _value.transactionUpdateStatusEnum
          : transactionUpdateStatusEnum // ignore: cast_nullable_to_non_nullable
              as TransactionUpdateStatusEnum?,
      transactionErrorString: null == transactionErrorString
          ? _value.transactionErrorString
          : transactionErrorString // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDetailsUpdateStatusEnum: freezed ==
              transactionDetailsUpdateStatusEnum
          ? _value.transactionDetailsUpdateStatusEnum
          : transactionDetailsUpdateStatusEnum // ignore: cast_nullable_to_non_nullable
              as TransactionDetailsUpdateStatusEnum?,
      transactionDetailsUpdateErrorString: null ==
              transactionDetailsUpdateErrorString
          ? _value.transactionDetailsUpdateErrorString
          : transactionDetailsUpdateErrorString // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      linkCustomerToTransactionError: freezed == linkCustomerToTransactionError
          ? _value.linkCustomerToTransactionError
          : linkCustomerToTransactionError // ignore: cast_nullable_to_non_nullable
              as String?,
      deLinkCustomerFromTransactionError: freezed ==
              deLinkCustomerFromTransactionError
          ? _value.deLinkCustomerFromTransactionError
          : deLinkCustomerFromTransactionError // ignore: cast_nullable_to_non_nullable
              as String?,
      hasCustomerDelinkedFromTransaction: freezed ==
              hasCustomerDelinkedFromTransaction
          ? _value.hasCustomerDelinkedFromTransaction
          : hasCustomerDelinkedFromTransaction // ignore: cast_nullable_to_non_nullable
              as bool?,
      completeTransactionStatus: freezed == completeTransactionStatus
          ? _value.completeTransactionStatus
          : completeTransactionStatus // ignore: cast_nullable_to_non_nullable
              as TransactionStatus?,
      isInSearchMode: null == isInSearchMode
          ? _value.isInSearchMode
          : isInSearchMode // ignore: cast_nullable_to_non_nullable
              as bool,
      searchResultsTransactionLineGroups: freezed ==
              searchResultsTransactionLineGroups
          ? _value._searchResultsTransactionLineGroups
          : searchResultsTransactionLineGroups // ignore: cast_nullable_to_non_nullable
              as List<TransactionLinesGroup>?,
      isRemarksMandatoryProductAdded: freezed == isRemarksMandatoryProductAdded
          ? _value.isRemarksMandatoryProductAdded
          : isRemarksMandatoryProductAdded // ignore: cast_nullable_to_non_nullable
              as bool?,
      remarksMandatoryProductErrorString: freezed ==
              remarksMandatoryProductErrorString
          ? _value.remarksMandatoryProductErrorString
          : remarksMandatoryProductErrorString // ignore: cast_nullable_to_non_nullable
              as String?,
      isTransactionLinesSeatUpdated: freezed == isTransactionLinesSeatUpdated
          ? _value.isTransactionLinesSeatUpdated
          : isTransactionLinesSeatUpdated // ignore: cast_nullable_to_non_nullable
              as bool?,
      seats: freezed == seats
          ? _value._seats
          : seats // ignore: cast_nullable_to_non_nullable
              as Map<int, String>?,
      isTransactionLineRepeated: freezed == isTransactionLineRepeated
          ? _value.isTransactionLineRepeated
          : isTransactionLineRepeated // ignore: cast_nullable_to_non_nullable
              as int?,
      shouldPopAfterSave: null == shouldPopAfterSave
          ? _value.shouldPopAfterSave
          : shouldPopAfterSave // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionPrintReceipt: freezed == transactionPrintReceipt
          ? _value.transactionPrintReceipt
          : transactionPrintReceipt // ignore: cast_nullable_to_non_nullable
              as TransactionPrintReceiptResponse?,
      shouldTriggerPopAfterSave: freezed == shouldTriggerPopAfterSave
          ? _value.shouldTriggerPopAfterSave
          : shouldTriggerPopAfterSave // ignore: cast_nullable_to_non_nullable
              as bool?,
      isBluetoothConnectivitySession: freezed == isBluetoothConnectivitySession
          ? _value.isBluetoothConnectivitySession
          : isBluetoothConnectivitySession // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      messageString: freezed == messageString
          ? _value.messageString
          : messageString // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrintReceiptReceived: null == isPrintReceiptReceived
          ? _value.isPrintReceiptReceived
          : isPrintReceiptReceived // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedTransactionProfile: freezed == updatedTransactionProfile
          ? _value.updatedTransactionProfile
          : updatedTransactionProfile // ignore: cast_nullable_to_non_nullable
              as bool?,
      updateTransactionProfileError: freezed == updateTransactionProfileError
          ? _value.updateTransactionProfileError
          : updateTransactionProfileError // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTransactionLineProfileError: freezed ==
              updateTransactionLineProfileError
          ? _value.updateTransactionLineProfileError
          : updateTransactionLineProfileError // ignore: cast_nullable_to_non_nullable
              as String?,
      updateTransactionLinesSeatError: freezed ==
              updateTransactionLinesSeatError
          ? _value.updateTransactionLinesSeatError
          : updateTransactionLinesSeatError // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionSeatNameUpdateError: freezed == transactionSeatNameUpdateError
          ? _value.transactionSeatNameUpdateError
          : transactionSeatNameUpdateError // ignore: cast_nullable_to_non_nullable
              as String?,
      isInProductSearchMode: freezed == isInProductSearchMode
          ? _value.isInProductSearchMode
          : isInProductSearchMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCardFunctionalityDialogShown: freezed == isCardFunctionalityDialogShown
          ? _value.isCardFunctionalityDialogShown
          : isCardFunctionalityDialogShown // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCustomerIDDialogShown: freezed == isCustomerIDDialogShown
          ? _value.isCustomerIDDialogShown
          : isCustomerIDDialogShown // ignore: cast_nullable_to_non_nullable
              as bool?,
      barcodeReadData: freezed == barcodeReadData
          ? _value.barcodeReadData
          : barcodeReadData // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionCubitState implements _TransactionCubitState {
  const _$_TransactionCubitState(
      {this.selectedSeat = 0,
      this.transactionData,
      this.isSeatBased = false,
      this.showOrderDetailsWhileInitiatingOrder = false,
      this.selectedSeatName = "Shared Order",
      final Map<String, List<TransactionLinesGroup>>?
          transactionLinesGroupsBySeat,
      final List<String>? seatNames,
      final List<int>? seatNumbers,
      this.isTransactionLineGroupSelected,
      this.loaderStatus,
      this.isRemarksUpdated,
      this.isProfileUpdatedToTransactionLine,
      this.isNewTransactionInitiated,
      this.remarksUpdateErrorString,
      this.transactionUpdateStatusEnum,
      this.transactionErrorString = "",
      this.transactionDetailsUpdateStatusEnum,
      this.transactionDetailsUpdateErrorString = "",
      this.status,
      this.linkCustomerToTransactionError,
      this.deLinkCustomerFromTransactionError,
      this.hasCustomerDelinkedFromTransaction,
      this.completeTransactionStatus,
      this.isInSearchMode = false,
      final List<TransactionLinesGroup>? searchResultsTransactionLineGroups,
      this.isRemarksMandatoryProductAdded,
      this.remarksMandatoryProductErrorString,
      this.isTransactionLinesSeatUpdated,
      final Map<int, String>? seats,
      this.isTransactionLineRepeated,
      this.shouldPopAfterSave = false,
      this.transactionPrintReceipt,
      this.shouldTriggerPopAfterSave,
      this.isBluetoothConnectivitySession,
      this.isLoading = false,
      this.isSuccess = false,
      this.isError = false,
      this.messageString,
      this.isPrintReceiptReceived = false,
      this.updatedTransactionProfile,
      this.updateTransactionProfileError,
      this.updateTransactionLineProfileError,
      this.updateTransactionLinesSeatError,
      this.transactionSeatNameUpdateError,
      this.isInProductSearchMode,
      this.isCardFunctionalityDialogShown,
      this.isCustomerIDDialogShown,
      this.barcodeReadData})
      : _transactionLinesGroupsBySeat = transactionLinesGroupsBySeat,
        _seatNames = seatNames,
        _seatNumbers = seatNumbers,
        _searchResultsTransactionLineGroups =
            searchResultsTransactionLineGroups,
        _seats = seats;

  factory _$_TransactionCubitState.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionCubitStateFromJson(json);

  @override
  @JsonKey()
  final int selectedSeat;
  @override
  final TransactionData? transactionData;
  @override
  @JsonKey()
  final bool isSeatBased;
  @override
  @JsonKey()
  final bool showOrderDetailsWhileInitiatingOrder;
  @override
  @JsonKey()
  final String selectedSeatName;
  final Map<String, List<TransactionLinesGroup>>? _transactionLinesGroupsBySeat;
  @override
  Map<String, List<TransactionLinesGroup>>? get transactionLinesGroupsBySeat {
    final value = _transactionLinesGroupsBySeat;
    if (value == null) return null;
    if (_transactionLinesGroupsBySeat is EqualUnmodifiableMapView)
      return _transactionLinesGroupsBySeat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String>? _seatNames;
  @override
  List<String>? get seatNames {
    final value = _seatNames;
    if (value == null) return null;
    if (_seatNames is EqualUnmodifiableListView) return _seatNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _seatNumbers;
  @override
  List<int>? get seatNumbers {
    final value = _seatNumbers;
    if (value == null) return null;
    if (_seatNumbers is EqualUnmodifiableListView) return _seatNumbers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? isTransactionLineGroupSelected;
  @override
  final LoaderStatus? loaderStatus;
  @override
  final bool? isRemarksUpdated;
  @override
  final bool? isProfileUpdatedToTransactionLine;
  @override
  final bool? isNewTransactionInitiated;
  @override
  final String? remarksUpdateErrorString;
//transactionCommonLoadingBarState
  @override
  final TransactionUpdateStatusEnum? transactionUpdateStatusEnum;
  @override
  @JsonKey()
  final String transactionErrorString;
//transactionDetailsUpdateSectionState
  @override
  final TransactionDetailsUpdateStatusEnum? transactionDetailsUpdateStatusEnum;
  @override
  @JsonKey()
  final String transactionDetailsUpdateErrorString;
  @override
  final Status? status;
  @override
  final String? linkCustomerToTransactionError;
  @override
  final String? deLinkCustomerFromTransactionError;
  @override
  final bool? hasCustomerDelinkedFromTransaction;
  @override
  final TransactionStatus? completeTransactionStatus;
  @override
  @JsonKey()
  final bool isInSearchMode;
  final List<TransactionLinesGroup>? _searchResultsTransactionLineGroups;
  @override
  List<TransactionLinesGroup>? get searchResultsTransactionLineGroups {
    final value = _searchResultsTransactionLineGroups;
    if (value == null) return null;
    if (_searchResultsTransactionLineGroups is EqualUnmodifiableListView)
      return _searchResultsTransactionLineGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isRemarksMandatoryProductAdded;
  @override
  final String? remarksMandatoryProductErrorString;
  @override
  final bool? isTransactionLinesSeatUpdated;
  final Map<int, String>? _seats;
  @override
  Map<int, String>? get seats {
    final value = _seats;
    if (value == null) return null;
    if (_seats is EqualUnmodifiableMapView) return _seats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int? isTransactionLineRepeated;
  @override
  @JsonKey()
  final bool shouldPopAfterSave;
  @override
  final TransactionPrintReceiptResponse? transactionPrintReceipt;
  @override
  final bool? shouldTriggerPopAfterSave;
  @override
  final bool? isBluetoothConnectivitySession;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool isError;
  @override
  final String? messageString;
  @override
  @JsonKey()
  final bool isPrintReceiptReceived;
  @override
  final bool? updatedTransactionProfile;
  @override
  final String? updateTransactionProfileError;
  @override
  final String? updateTransactionLineProfileError;
  @override
  final String? updateTransactionLinesSeatError;
  @override
  final String? transactionSeatNameUpdateError;
  @override
  final bool? isInProductSearchMode;
  @override
  final bool? isCardFunctionalityDialogShown;
  @override
  final bool? isCustomerIDDialogShown;
  @override
  final String? barcodeReadData;

  @override
  String toString() {
    return 'TransactionCubitState(selectedSeat: $selectedSeat, transactionData: $transactionData, isSeatBased: $isSeatBased, showOrderDetailsWhileInitiatingOrder: $showOrderDetailsWhileInitiatingOrder, selectedSeatName: $selectedSeatName, transactionLinesGroupsBySeat: $transactionLinesGroupsBySeat, seatNames: $seatNames, seatNumbers: $seatNumbers, isTransactionLineGroupSelected: $isTransactionLineGroupSelected, loaderStatus: $loaderStatus, isRemarksUpdated: $isRemarksUpdated, isProfileUpdatedToTransactionLine: $isProfileUpdatedToTransactionLine, isNewTransactionInitiated: $isNewTransactionInitiated, remarksUpdateErrorString: $remarksUpdateErrorString, transactionUpdateStatusEnum: $transactionUpdateStatusEnum, transactionErrorString: $transactionErrorString, transactionDetailsUpdateStatusEnum: $transactionDetailsUpdateStatusEnum, transactionDetailsUpdateErrorString: $transactionDetailsUpdateErrorString, status: $status, linkCustomerToTransactionError: $linkCustomerToTransactionError, deLinkCustomerFromTransactionError: $deLinkCustomerFromTransactionError, hasCustomerDelinkedFromTransaction: $hasCustomerDelinkedFromTransaction, completeTransactionStatus: $completeTransactionStatus, isInSearchMode: $isInSearchMode, searchResultsTransactionLineGroups: $searchResultsTransactionLineGroups, isRemarksMandatoryProductAdded: $isRemarksMandatoryProductAdded, remarksMandatoryProductErrorString: $remarksMandatoryProductErrorString, isTransactionLinesSeatUpdated: $isTransactionLinesSeatUpdated, seats: $seats, isTransactionLineRepeated: $isTransactionLineRepeated, shouldPopAfterSave: $shouldPopAfterSave, transactionPrintReceipt: $transactionPrintReceipt, shouldTriggerPopAfterSave: $shouldTriggerPopAfterSave, isBluetoothConnectivitySession: $isBluetoothConnectivitySession, isLoading: $isLoading, isSuccess: $isSuccess, isError: $isError, messageString: $messageString, isPrintReceiptReceived: $isPrintReceiptReceived, updatedTransactionProfile: $updatedTransactionProfile, updateTransactionProfileError: $updateTransactionProfileError, updateTransactionLineProfileError: $updateTransactionLineProfileError, updateTransactionLinesSeatError: $updateTransactionLinesSeatError, transactionSeatNameUpdateError: $transactionSeatNameUpdateError, isInProductSearchMode: $isInProductSearchMode, isCardFunctionalityDialogShown: $isCardFunctionalityDialogShown, isCustomerIDDialogShown: $isCustomerIDDialogShown, barcodeReadData: $barcodeReadData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionCubitState &&
            (identical(other.selectedSeat, selectedSeat) ||
                other.selectedSeat == selectedSeat) &&
            (identical(other.transactionData, transactionData) ||
                other.transactionData == transactionData) &&
            (identical(other.isSeatBased, isSeatBased) ||
                other.isSeatBased == isSeatBased) &&
            (identical(other.showOrderDetailsWhileInitiatingOrder, showOrderDetailsWhileInitiatingOrder) ||
                other.showOrderDetailsWhileInitiatingOrder ==
                    showOrderDetailsWhileInitiatingOrder) &&
            (identical(other.selectedSeatName, selectedSeatName) ||
                other.selectedSeatName == selectedSeatName) &&
            const DeepCollectionEquality().equals(
                other._transactionLinesGroupsBySeat,
                _transactionLinesGroupsBySeat) &&
            const DeepCollectionEquality()
                .equals(other._seatNames, _seatNames) &&
            const DeepCollectionEquality()
                .equals(other._seatNumbers, _seatNumbers) &&
            (identical(other.isTransactionLineGroupSelected, isTransactionLineGroupSelected) ||
                other.isTransactionLineGroupSelected ==
                    isTransactionLineGroupSelected) &&
            (identical(other.loaderStatus, loaderStatus) ||
                other.loaderStatus == loaderStatus) &&
            (identical(other.isRemarksUpdated, isRemarksUpdated) ||
                other.isRemarksUpdated == isRemarksUpdated) &&
            (identical(other.isProfileUpdatedToTransactionLine, isProfileUpdatedToTransactionLine) ||
                other.isProfileUpdatedToTransactionLine ==
                    isProfileUpdatedToTransactionLine) &&
            (identical(other.isNewTransactionInitiated, isNewTransactionInitiated) ||
                other.isNewTransactionInitiated == isNewTransactionInitiated) &&
            (identical(other.remarksUpdateErrorString, remarksUpdateErrorString) ||
                other.remarksUpdateErrorString == remarksUpdateErrorString) &&
            (identical(other.transactionUpdateStatusEnum, transactionUpdateStatusEnum) ||
                other.transactionUpdateStatusEnum ==
                    transactionUpdateStatusEnum) &&
            (identical(other.transactionErrorString, transactionErrorString) ||
                other.transactionErrorString == transactionErrorString) &&
            (identical(other.transactionDetailsUpdateStatusEnum, transactionDetailsUpdateStatusEnum) ||
                other.transactionDetailsUpdateStatusEnum ==
                    transactionDetailsUpdateStatusEnum) &&
            (identical(other.transactionDetailsUpdateErrorString, transactionDetailsUpdateErrorString) ||
                other.transactionDetailsUpdateErrorString ==
                    transactionDetailsUpdateErrorString) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.linkCustomerToTransactionError, linkCustomerToTransactionError) ||
                other.linkCustomerToTransactionError ==
                    linkCustomerToTransactionError) &&
            (identical(other.deLinkCustomerFromTransactionError, deLinkCustomerFromTransactionError) ||
                other.deLinkCustomerFromTransactionError == deLinkCustomerFromTransactionError) &&
            (identical(other.hasCustomerDelinkedFromTransaction, hasCustomerDelinkedFromTransaction) || other.hasCustomerDelinkedFromTransaction == hasCustomerDelinkedFromTransaction) &&
            (identical(other.completeTransactionStatus, completeTransactionStatus) || other.completeTransactionStatus == completeTransactionStatus) &&
            (identical(other.isInSearchMode, isInSearchMode) || other.isInSearchMode == isInSearchMode) &&
            const DeepCollectionEquality().equals(other._searchResultsTransactionLineGroups, _searchResultsTransactionLineGroups) &&
            (identical(other.isRemarksMandatoryProductAdded, isRemarksMandatoryProductAdded) || other.isRemarksMandatoryProductAdded == isRemarksMandatoryProductAdded) &&
            (identical(other.remarksMandatoryProductErrorString, remarksMandatoryProductErrorString) || other.remarksMandatoryProductErrorString == remarksMandatoryProductErrorString) &&
            (identical(other.isTransactionLinesSeatUpdated, isTransactionLinesSeatUpdated) || other.isTransactionLinesSeatUpdated == isTransactionLinesSeatUpdated) &&
            const DeepCollectionEquality().equals(other._seats, _seats) &&
            (identical(other.isTransactionLineRepeated, isTransactionLineRepeated) || other.isTransactionLineRepeated == isTransactionLineRepeated) &&
            (identical(other.shouldPopAfterSave, shouldPopAfterSave) || other.shouldPopAfterSave == shouldPopAfterSave) &&
            (identical(other.transactionPrintReceipt, transactionPrintReceipt) || other.transactionPrintReceipt == transactionPrintReceipt) &&
            (identical(other.shouldTriggerPopAfterSave, shouldTriggerPopAfterSave) || other.shouldTriggerPopAfterSave == shouldTriggerPopAfterSave) &&
            (identical(other.isBluetoothConnectivitySession, isBluetoothConnectivitySession) || other.isBluetoothConnectivitySession == isBluetoothConnectivitySession) &&
            (identical(other.isLoading, isLoading) || other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.messageString, messageString) || other.messageString == messageString) &&
            (identical(other.isPrintReceiptReceived, isPrintReceiptReceived) || other.isPrintReceiptReceived == isPrintReceiptReceived) &&
            (identical(other.updatedTransactionProfile, updatedTransactionProfile) || other.updatedTransactionProfile == updatedTransactionProfile) &&
            (identical(other.updateTransactionProfileError, updateTransactionProfileError) || other.updateTransactionProfileError == updateTransactionProfileError) &&
            (identical(other.updateTransactionLineProfileError, updateTransactionLineProfileError) || other.updateTransactionLineProfileError == updateTransactionLineProfileError) &&
            (identical(other.updateTransactionLinesSeatError, updateTransactionLinesSeatError) || other.updateTransactionLinesSeatError == updateTransactionLinesSeatError) &&
            (identical(other.transactionSeatNameUpdateError, transactionSeatNameUpdateError) || other.transactionSeatNameUpdateError == transactionSeatNameUpdateError) &&
            (identical(other.isInProductSearchMode, isInProductSearchMode) || other.isInProductSearchMode == isInProductSearchMode) &&
            (identical(other.isCardFunctionalityDialogShown, isCardFunctionalityDialogShown) || other.isCardFunctionalityDialogShown == isCardFunctionalityDialogShown) &&
            (identical(other.isCustomerIDDialogShown, isCustomerIDDialogShown) || other.isCustomerIDDialogShown == isCustomerIDDialogShown) &&
            (identical(other.barcodeReadData, barcodeReadData) || other.barcodeReadData == barcodeReadData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        selectedSeat,
        transactionData,
        isSeatBased,
        showOrderDetailsWhileInitiatingOrder,
        selectedSeatName,
        const DeepCollectionEquality().hash(_transactionLinesGroupsBySeat),
        const DeepCollectionEquality().hash(_seatNames),
        const DeepCollectionEquality().hash(_seatNumbers),
        isTransactionLineGroupSelected,
        loaderStatus,
        isRemarksUpdated,
        isProfileUpdatedToTransactionLine,
        isNewTransactionInitiated,
        remarksUpdateErrorString,
        transactionUpdateStatusEnum,
        transactionErrorString,
        transactionDetailsUpdateStatusEnum,
        transactionDetailsUpdateErrorString,
        status,
        linkCustomerToTransactionError,
        deLinkCustomerFromTransactionError,
        hasCustomerDelinkedFromTransaction,
        completeTransactionStatus,
        isInSearchMode,
        const DeepCollectionEquality()
            .hash(_searchResultsTransactionLineGroups),
        isRemarksMandatoryProductAdded,
        remarksMandatoryProductErrorString,
        isTransactionLinesSeatUpdated,
        const DeepCollectionEquality().hash(_seats),
        isTransactionLineRepeated,
        shouldPopAfterSave,
        transactionPrintReceipt,
        shouldTriggerPopAfterSave,
        isBluetoothConnectivitySession,
        isLoading,
        isSuccess,
        isError,
        messageString,
        isPrintReceiptReceived,
        updatedTransactionProfile,
        updateTransactionProfileError,
        updateTransactionLineProfileError,
        updateTransactionLinesSeatError,
        transactionSeatNameUpdateError,
        isInProductSearchMode,
        isCardFunctionalityDialogShown,
        isCustomerIDDialogShown,
        barcodeReadData
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionCubitStateCopyWith<_$_TransactionCubitState> get copyWith =>
      __$$_TransactionCubitStateCopyWithImpl<_$_TransactionCubitState>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionCubitStateToJson(
      this,
    );
  }
}

abstract class _TransactionCubitState implements TransactionCubitState {
  const factory _TransactionCubitState(
      {final int selectedSeat,
      final TransactionData? transactionData,
      final bool isSeatBased,
      final bool showOrderDetailsWhileInitiatingOrder,
      final String selectedSeatName,
      final Map<String, List<TransactionLinesGroup>>?
          transactionLinesGroupsBySeat,
      final List<String>? seatNames,
      final List<int>? seatNumbers,
      final int? isTransactionLineGroupSelected,
      final LoaderStatus? loaderStatus,
      final bool? isRemarksUpdated,
      final bool? isProfileUpdatedToTransactionLine,
      final bool? isNewTransactionInitiated,
      final String? remarksUpdateErrorString,
      final TransactionUpdateStatusEnum? transactionUpdateStatusEnum,
      final String transactionErrorString,
      final TransactionDetailsUpdateStatusEnum?
          transactionDetailsUpdateStatusEnum,
      final String transactionDetailsUpdateErrorString,
      final Status? status,
      final String? linkCustomerToTransactionError,
      final String? deLinkCustomerFromTransactionError,
      final bool? hasCustomerDelinkedFromTransaction,
      final TransactionStatus? completeTransactionStatus,
      final bool isInSearchMode,
      final List<TransactionLinesGroup>? searchResultsTransactionLineGroups,
      final bool? isRemarksMandatoryProductAdded,
      final String? remarksMandatoryProductErrorString,
      final bool? isTransactionLinesSeatUpdated,
      final Map<int, String>? seats,
      final int? isTransactionLineRepeated,
      final bool shouldPopAfterSave,
      final TransactionPrintReceiptResponse? transactionPrintReceipt,
      final bool? shouldTriggerPopAfterSave,
      final bool? isBluetoothConnectivitySession,
      final bool isLoading,
      final bool isSuccess,
      final bool isError,
      final String? messageString,
      final bool isPrintReceiptReceived,
      final bool? updatedTransactionProfile,
      final String? updateTransactionProfileError,
      final String? updateTransactionLineProfileError,
      final String? updateTransactionLinesSeatError,
      final String? transactionSeatNameUpdateError,
      final bool? isInProductSearchMode,
      final bool? isCardFunctionalityDialogShown,
      final bool? isCustomerIDDialogShown,
      final String? barcodeReadData}) = _$_TransactionCubitState;

  factory _TransactionCubitState.fromJson(Map<String, dynamic> json) =
      _$_TransactionCubitState.fromJson;

  @override
  int get selectedSeat;
  @override
  TransactionData? get transactionData;
  @override
  bool get isSeatBased;
  @override
  bool get showOrderDetailsWhileInitiatingOrder;
  @override
  String get selectedSeatName;
  @override
  Map<String, List<TransactionLinesGroup>>? get transactionLinesGroupsBySeat;
  @override
  List<String>? get seatNames;
  @override
  List<int>? get seatNumbers;
  @override
  int? get isTransactionLineGroupSelected;
  @override
  LoaderStatus? get loaderStatus;
  @override
  bool? get isRemarksUpdated;
  @override
  bool? get isProfileUpdatedToTransactionLine;
  @override
  bool? get isNewTransactionInitiated;
  @override
  String? get remarksUpdateErrorString;
  @override //transactionCommonLoadingBarState
  TransactionUpdateStatusEnum? get transactionUpdateStatusEnum;
  @override
  String get transactionErrorString;
  @override //transactionDetailsUpdateSectionState
  TransactionDetailsUpdateStatusEnum? get transactionDetailsUpdateStatusEnum;
  @override
  String get transactionDetailsUpdateErrorString;
  @override
  Status? get status;
  @override
  String? get linkCustomerToTransactionError;
  @override
  String? get deLinkCustomerFromTransactionError;
  @override
  bool? get hasCustomerDelinkedFromTransaction;
  @override
  TransactionStatus? get completeTransactionStatus;
  @override
  bool get isInSearchMode;
  @override
  List<TransactionLinesGroup>? get searchResultsTransactionLineGroups;
  @override
  bool? get isRemarksMandatoryProductAdded;
  @override
  String? get remarksMandatoryProductErrorString;
  @override
  bool? get isTransactionLinesSeatUpdated;
  @override
  Map<int, String>? get seats;
  @override
  int? get isTransactionLineRepeated;
  @override
  bool get shouldPopAfterSave;
  @override
  TransactionPrintReceiptResponse? get transactionPrintReceipt;
  @override
  bool? get shouldTriggerPopAfterSave;
  @override
  bool? get isBluetoothConnectivitySession;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  bool get isError;
  @override
  String? get messageString;
  @override
  bool get isPrintReceiptReceived;
  @override
  bool? get updatedTransactionProfile;
  @override
  String? get updateTransactionProfileError;
  @override
  String? get updateTransactionLineProfileError;
  @override
  String? get updateTransactionLinesSeatError;
  @override
  String? get transactionSeatNameUpdateError;
  @override
  bool? get isInProductSearchMode;
  @override
  bool? get isCardFunctionalityDialogShown;
  @override
  bool? get isCustomerIDDialogShown;
  @override
  String? get barcodeReadData;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCubitStateCopyWith<_$_TransactionCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
