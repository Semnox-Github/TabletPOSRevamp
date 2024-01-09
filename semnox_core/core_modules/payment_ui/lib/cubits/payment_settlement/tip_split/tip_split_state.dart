import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';
import 'package:payment_data/models/employee_tip/employee_tip_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_data/models/user_container/user_container_dto.dart';

part 'tip_split_state.freezed.dart';
part 'tip_split_state.g.dart';

@freezed
class TipSplitState with _$TipSplitState {
  const factory TipSplitState({
    @Default(-1) int loadingStatus,
    @Default(false) bool isPercentageCompleted,
    @Default(false) bool isClockedInUser,
    @Default(0) double enteredAmount,
    @Default(0) double tipAmount,
    TransactionResponse? transactionResponse,
    @Default([]) List<UserRoleContainerDTO> userRoles,
    @Default([]) List<UserContainerDto> users,
    @Default([]) List<EmployeeTipData> employeeTips,
    String? loadingMessage,
    String? validationError,
    String? apiError,
    String? notificationMessage,
  }) = _TipSplitState;

  factory TipSplitState.fromJson(Map<String, dynamic> json) => _$TipSplitStateFromJson(json);
}