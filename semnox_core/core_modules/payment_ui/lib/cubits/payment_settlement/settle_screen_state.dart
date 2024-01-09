import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:payment_data/models/employee_tip/employee_tip_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

part 'settle_screen_state.freezed.dart';
part 'settle_screen_state.g.dart';

@freezed
class SettleScreenState with _$SettleScreenState {
  const factory SettleScreenState({
    @Default(-1) int loadingStatus,
    @Default(1) int settleScreenIndex,
    @Default(0) int maxLimitTipPC,
    @Default(true) bool showSideBar,
    @Default(true) bool showFilterSection,
    @Default(false) bool authPaymentsSwitchStatus,
    @Default(false) bool tipSwitchStatus,
    @Default(false) bool editPaySwitchStatus,
    @Default(false) bool isSettleCompleted,
    @Default(false) bool isTipAdded,
    @Default(false) bool isTipSplitAdded,
    @Default(false) bool searchedForSettleModes,
    TransactionResponse? transactionResponse,
    String? selectedSettleMode,
    @Default([]) List<PaymentModeContainerDTO> payModes,
    @Default([]) List<TransactionPaymentDTO> authorizedPayments,
    @Default([]) List<TransactionPaymentDTO> settledPayments,
    @Default([]) List<TransactionPaymentDTO> editablePayments,
    @Default([]) List<TransactionPaymentDTO> exemptedPayments,
    @Default([]) List<String> searchedSettlementModes,
    Map<int, List<EmployeeTipData>>? employeeTips,
    String? loadingMessage,
    String? validationError,
    String? apiError,
    String? notificationMessage,
  }) = _SettleScreenState;

  factory SettleScreenState.fromJson(Map<String, dynamic> json) => _$SettleScreenStateFromJson(json);
}