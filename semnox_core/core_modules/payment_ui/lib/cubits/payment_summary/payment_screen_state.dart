import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

part 'payment_screen_state.freezed.dart';
part 'payment_screen_state.g.dart';

@freezed
class PaymentScreenState with _$PaymentScreenState {
  const factory PaymentScreenState({
    @Default(-1) int loadingStatus,
    @Default(0) int selectedPayModeIndex,
    @Default(true) bool isCashScreenSelected,
    @Default(true) bool shouldShowSideBar,
    @Default(false) bool isPaymentRefreshed,
    @Default(false) bool isNotificationError,
    @Default(false) bool isCurrentUserManager,
    @Default(false) bool isSettleCompleted,
    @Default(false) bool searchedForPayModes,
    PaymentModeContainerDTO? selectedPayMode,
    List<TransactionPaymentDTO>? appliedPayments,
    @Default([]) List<PaymentModeContainerDTO> searchedPaymentModes,
    TransactionResponse? transactionResponse,
    @Default(0) double tenderedAmount,
    String? loadingMessage,
    String? validationError,
    String? apiError,
    String? notificationMessage,
  }) = _PaymentScreenState;

  factory PaymentScreenState.fromJson(Map<String, dynamic> json) => _$PaymentScreenStateFromJson(json);
}