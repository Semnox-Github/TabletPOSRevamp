import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transaction_data/models/transaction_receipt/transaction_print_receipt_response.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import '../models/transaction_lines_group.dart';

part 'transaction_cubit_state.freezed.dart';

part 'transaction_cubit_state.g.dart';

@freezed
class TransactionCubitState with _$TransactionCubitState {
  const factory TransactionCubitState({
    @Default(0) int selectedSeat,
    TransactionData? transactionData,
    @Default(false) bool isSeatBased,
    @Default(false) bool showOrderDetailsWhileInitiatingOrder,
    @Default("Shared Order") String selectedSeatName,
    Map<String, List<TransactionLinesGroup>>? transactionLinesGroupsBySeat,
    List<String>? seatNames,
    List<int>? seatNumbers,
    int? isTransactionLineGroupSelected,
    LoaderStatus? loaderStatus,
    bool? isRemarksUpdated,
    bool? isProfileUpdatedToTransactionLine,
    bool? isNewTransactionInitiated,
    String? remarksUpdateErrorString,

    //transactionCommonLoadingBarState
    TransactionUpdateStatusEnum? transactionUpdateStatusEnum,
    @Default("") String transactionErrorString,

    //transactionDetailsUpdateSectionState
    TransactionDetailsUpdateStatusEnum? transactionDetailsUpdateStatusEnum,
    @Default("") String transactionDetailsUpdateErrorString,

    Status? status,
    String? linkCustomerToTransactionError,
    String? deLinkCustomerFromTransactionError,
    bool? hasCustomerDelinkedFromTransaction,
    TransactionStatus? completeTransactionStatus,
    @Default(false) bool isInSearchMode,
    List<TransactionLinesGroup>? searchResultsTransactionLineGroups,
    bool? isRemarksMandatoryProductAdded,
    String? remarksMandatoryProductErrorString,
    bool? isTransactionLinesSeatUpdated,
    Map<int, String>? seats,
    int? isTransactionLineRepeated,
    @Default(false) bool shouldPopAfterSave,
    TransactionPrintReceiptResponse? transactionPrintReceipt,
    bool? shouldTriggerPopAfterSave,
    bool? isBluetoothConnectivitySession,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    String? messageString,
    @Default(false) bool isPrintReceiptReceived,
    bool? updatedTransactionProfile,
    String? updateTransactionProfileError,
    String? updateTransactionLineProfileError,
    String? updateTransactionLinesSeatError,
    String? transactionSeatNameUpdateError,
    bool? isInProductSearchMode,
    bool? isCardFunctionalityDialogShown,
    bool? isCustomerIDDialogShown,
    String? barcodeReadData,
  }) = _TransactionCubitState;

  factory TransactionCubitState.fromJson(Map<String, dynamic> json) =>
      _$TransactionCubitStateFromJson(json);
}
