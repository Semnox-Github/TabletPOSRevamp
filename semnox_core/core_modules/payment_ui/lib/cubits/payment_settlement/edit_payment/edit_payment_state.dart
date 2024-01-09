import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';

part 'edit_payment_state.freezed.dart';
part 'edit_payment_state.g.dart';

@freezed
class EditPaymentState with _$EditPaymentState {
  const factory EditPaymentState({
    @Default(-1) int loadingStatus,
    @Default(false) bool editSwitchStatus,
    @Default(false) bool isEditCompleted,
    @Default([]) List<PaymentModeContainerDTO> compatiblePayModes,
    @Default([]) List<TransactionPaymentDTO> editablePayments,
    String? loadingMessage,
    String? validationError,
    String? apiError,
    String? notificationMessage,
  }) = _EditPaymentState;

  factory EditPaymentState.fromJson(Map<String, dynamic> json) => _$EditPaymentStateFromJson(json);
}