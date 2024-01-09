import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';
import 'package:payment_data/builder.dart';
import 'package:payment_data/models/employee_tip/employee_tip_data.dart';
import 'package:payment_ui/cubits/payment_settlement/tip_split/tip_split_state.dart';
import 'package:messages_data/builder.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_payment_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_data/models/user_container/user_container_dto.dart';

class TipSplitCubit extends Cubit<TipSplitState> {

  TipSplitCubit() : super(const TipSplitState());

  late List<UserContainerDto> originalUsers;
  late List<UserRoleContainerDTO> originalUserRoles;

  void setTransaction(TransactionResponse? response) {
    emit(state.copyWith(transactionResponse: response));
  }

  void setLoadingStatus({required int status, String? message}) {
    emit(state.copyWith(loadingStatus: status, loadingMessage: message));
  }

  void setValidationError(String? validationError) {
    emit(state.copyWith(validationError: validationError));
  }

  void setNotificationMessage(String? message) {
    emit(state.copyWith(notificationMessage: message));
  }

  void setApiError(String? apiError) {
    emit(state.copyWith(apiError: apiError));
  }

  void clear() {
    emit(const TipSplitState());
  }

  void setOriginalList(List<UserContainerDto> users, List<UserRoleContainerDTO> userRoles) {
    originalUsers = users;
    originalUserRoles = userRoles;
  }

  Future<void> toggleClockedInStatus() async {
    final isClockedIn = state.isClockedInUser;
    if(isClockedIn) {
      emit(state.copyWith(isClockedInUser: false, users: originalUsers, userRoles: originalUserRoles));
    } else {
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final transactionDataBL = await TransactionDataBuilder.build(execContext!);

      final userRoles = <UserRoleContainerDTO>[];
      try {
        emit(state.copyWith(loadingMessage: MessagesProvider.get('Fetching Users...'), loadingStatus: 1));
        final clockedInUserResp = await transactionDataBL.getClockedInUsers();
        clockedInUserResp.data?.forEach((element) {
          for (var orgRole in originalUserRoles) {
            if(orgRole.roleId == element.roleId) {
              if(!userRoles.contains(orgRole)) {
                userRoles.add(orgRole);
              }
            }
          }
        });

        if(userRoles.isNotEmpty) {
          emit(state.copyWith(userRoles: userRoles, loadingMessage: null, loadingStatus: 0, isClockedInUser: true));
        } else {
          emit(state.copyWith(loadingMessage: null, loadingStatus: 0, isClockedInUser: true));
        }
      } on DioError catch(error) {
        final errorString = error.response?.data['data'] as String?;
        emit(state.copyWith(apiError: errorString, loadingMessage: null, loadingStatus: 0));
      }
    }
  }

  Future<void> fetchAllList() async {
    Log.printMethodStart("fetchAllList()", "Payment Settlements Screen -> Adjust Tip -> Tip Amount", "init");
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final transactionDataBL = await TransactionDataBuilder.build(execContext!);
    final masterDataBL = await MasterDataBuilder.build(execContext);
    final userRoles = await masterDataBL.getUserRoles();

    try {
      emit(state.copyWith(loadingMessage: MessagesProvider.get('Fetching Users...'), loadingStatus: 1));
      final userResponse = await transactionDataBL.getUserContainerList();
      final users = userResponse.data?.userContainerDtoList;
      if(users != null && userRoles != null) {
        setOriginalList(users, userRoles);
        emit(state.copyWith(userRoles: userRoles, users: users, loadingMessage: null, loadingStatus: 0));
      } else {
        emit(state.copyWith(loadingMessage: null, loadingStatus: 0));
      }
      Log.printMethodEnd("fetchAllList()", "Payment Settlements Screen -> Adjust Tip -> Tip Amount", "init");
      Log.printMethodReturn("fetchAllList() - Fetched user list.", "Payment Settlements Screen -> Adjust Tip -> Tip Amount", "init");
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(apiError: errorString, loadingMessage: null, loadingStatus: 0));
    }

  }

  Future<void> fetchAppliedTipList(TransactionPaymentDTO paymentDTO, double? tipReqAmt) async {
    Log.printMethodStart("fetchAppliedTipList()", "Payment Settlements Screen -> Adjust Tip -> Tip Amount", "init");
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final paymentDataBL = await PaymentDataBuilder.build(execContext!);
    try {
      emit(state.copyWith(loadingStatus: 1));
      final empTipResponse = await paymentDataBL.getEmployeeTipDetails(paymentId: paymentDTO.paymentId);
      final tips = empTipResponse.data;
      final employeeTips = <EmployeeTipData>[];
      if(tips != null) {
        await Future.forEach(tips, (tip) async {
          final employee = originalUsers.where((element) => element.userId == tip.userId).toList();
          final empName = employee.isEmpty ? '' : employee.first.userName;
          final tipAmount = ((tipReqAmt ?? paymentDTO.tipAmount) * (tip.splitByPercentage ?? 1)) / 100;
          final dto = tip.copyWith(userName: empName, tipAmount: tipAmount);
          employeeTips.add(dto);
        });
        emit(state.copyWith(employeeTips: employeeTips, loadingStatus: 0));
      }
      Log.printMethodEnd("fetchAppliedTipList()", "Payment Settlements Screen -> Adjust Tip -> Tip Amount", "init");
      Log.printMethodReturn("fetchAppliedTipList() - Fetched Employee Tip Details", "Payment Settlements Screen -> Adjust Tip -> Tip Amount", "init");
    } on DioError catch(error) {
      final errorString = error.response?.data['data'] as String?;
      debugPrint(errorString);
      emit(state.copyWith(loadingStatus: 0));
    }

  }

  void filterUserByRole(UserRoleContainerDTO? selectedUserRole) {
    Log.printMethodStart("filterUserByRole()", "Payment Settlements Screen -> Adjust Tip -> Tip Amount", "init");
    if(selectedUserRole != null) {
      final users = <UserContainerDto>[];
      for (var element in originalUsers) {
        if(element.roleId == selectedUserRole.roleId) {
          if(!users.contains(element)) {
            users.add(element);
          }
        }
      }
      emit(state.copyWith(users: users));
      Log.printMethodEnd("filterUserByRole()", "Payment Settlements Screen -> Adjust Tip -> Tip Amount", "init");
    }
  }

  void addEmployeeTip(
      UserRoleContainerDTO? selectedUserRole,
      UserContainerDto? selectedUser,
      int percentage) {
    final tip = (state.enteredAmount * percentage.toDouble()) / 100;
    final dto = EmployeeTipData(userName: selectedUser?.userName ?? '', userId: selectedUser?.userId ?? -1, splitByPercentage: percentage, tipAmount: tip);
    final list = state.employeeTips.toList(growable: true);
    list.add(dto);
    emit(state.copyWith(employeeTips: list));
  }

  void removeTipAtIndex(int currentIndex) {
    final list = state.employeeTips.toList(growable: true);
    final item = list[currentIndex];
    if(item.tipId != null) {
      list[currentIndex] = item.copyWith(shouldRemoveFromBackend: true);
    } else {
      list.removeAt(currentIndex);
    }
    emit(state.copyWith(employeeTips: list));
  }

  void removeAllTips() {
    final list = state.employeeTips.toList(growable: true);
    final size = list.length;
    for(var i = 0; i < size; i++) {
      final item = list[i];
      if(item.tipId != null) {
        list[i] = item.copyWith(shouldRemoveFromBackend: true);
      } else {
        list.remove(item);
      }
    }
    emit(state.copyWith(employeeTips: list));
  }

  void updateTipAmount(double amt)  {
    emit(state.copyWith(enteredAmount: amt));
  }

}