import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:product_menu_data/models/product_menu_panel_content_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/product_price_data.dart';
import 'package:sprintf/sprintf.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_discount_applicable_line_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_data/models/request/add_modifier_product/add_modifier_product_request.dart';
import 'package:transaction_data/models/request/add_modifier_product/transaction_line_request.dart';
import 'package:transaction_data/models/transaction_receipt/transaction_print_receipt_dto.dart';
import 'package:transaction_data/models/transaction_receipt/transaction_print_receipt_response.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:transaction_ui/models/transaction_line_discount_dto.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';
import '../models/modifier_transaction_lines_group.dart';

class TransactionCubit extends Cubit<TransactionCubitState> {
  TransactionCubit() : super(const TransactionCubitState());

  TransactionResponse? transactionResponse;
  var execContextBL;
  var sysExecContext;
  var transactionDataBl;

  Map<String, List<TransactionLinesGroup>> buildTransactionLinesGroups(TransactionData? transactionData) {
    Map<int, TransactionLinesGroup> transactionLinesGroups = {};
    transactionData?.transactionLineDTOList.forEach((transactionLine) {
      if (transactionLine.lineStatus != "CANCELLED") {
        int viewGroupingNumber = transactionLine.viewGroupingNumber;
        //List<TransactionLineDTO>? transactionLinesGroup = transactionLinesGroups[viewGroupingNumber];
        TransactionLinesGroup? transactionLinesGroup = transactionLinesGroups[viewGroupingNumber];
        transactionLinesGroup ??= TransactionLinesGroup(
          transactionLine.productName,
          transactionLine.seatName ?? '',
          transactionLine.remarks,
          transactionLine.amount,
          [],
          transactionLine.productId,
          transactionLine.seatNumber ?? 0,
          transactionLine.courseName ?? '',
          transactionLine.transactionProfileId,
          [],
          transactionLine.additionalLineInformation,
          transactionLine.lineStatus ?? '',
          [],
        );
        transactionLinesGroup.transactionLines.add(transactionLine);

        Map<int, ModifierTransactionLinesGroup> modifierTransactionLinesGroups = {};
        Map<int, ModifierTransactionLinesGroup> parentModifierTransactionLinesGroups = {};
        transactionLine.transactionLineDTOList.forEach((modifierList) {
          int modifierViewGroupingNumber = modifierList.viewGroupingNumber;
          ModifierTransactionLinesGroup? modifierTransactionLinesGroup = modifierTransactionLinesGroups[modifierViewGroupingNumber];
          modifierTransactionLinesGroup ??= ModifierTransactionLinesGroup(
              modifierList.productName,
              modifierList.productId,
              modifierList.modifierSetId,
              modifierList.modifierSetDetailId,
              modifierList.amount,
              [],
              parentModifiersDtoList: []);
          modifierTransactionLinesGroup.transactionLineDtoList.add(modifierList);

          createGroupRecursively(parentModifierTransactionLinesGroups, modifierTransactionLinesGroup, modifierList);

          modifierTransactionLinesGroups[modifierViewGroupingNumber] = modifierTransactionLinesGroup;
        });

        modifierTransactionLinesGroups.entries.forEach((modifier) {
          transactionLinesGroup?.modifierTransactionLinesGroup.add(modifier.value);
        });

        transactionLinesGroups[viewGroupingNumber] = transactionLinesGroup;
      }
    });

    ///
    /// Grouping the Discounts to relevant Transaction line view groups.
    ///
    for (var transactionLinesGroupEntry in transactionLinesGroups. entries) {
      Map<int?, TransactionLineDiscountDto> transactionLineDiscountMap = {};
      Set<TransactionDiscountApplicableLineDto> transactionLinesDiscountList = {};

      transactionData?.transactionDiscountDTOList.forEach((discountDto) {
        int? discountId = discountDto.discountId;
        TransactionLineDiscountDto? transactionLineDiscountDto = transactionLineDiscountMap[discountId];
        transactionLineDiscountDto ??= TransactionLineDiscountDto(
          discountName: discountDto.discountName,
          discountAmount: 0.0,
          transactionDiscountDTOList: []
        );

        discountDto.transactionDiscountApplicableLineDTOList?.forEach((discountData) {
          transactionLinesGroupEntry.value.transactionLines.forEach((transactionLine) {
            if (transactionLine.transactionLineId == discountData.transactionLineId) {
              transactionLineDiscountDto?.discountAmount = discountData.discountAmount;
              transactionLinesDiscountList.add(discountData);
            }
          });
        });

        if(transactionLinesDiscountList.toList().isNotEmpty == true) {
          transactionLineDiscountDto.transactionDiscountDTOList = transactionLinesDiscountList.toList();
          transactionLineDiscountMap[discountId] = transactionLineDiscountDto;
        }
      });

      for( var entry in transactionLineDiscountMap.entries) {
        ///Automatic Discount -> Discount Id is 405
        ///If discount name or discount id matches, will not be adding them to the transactionLineDiscountDto list.
        if(/*entry.key != 405 || */!(entry.value.discountName?.contains("Automatic Discount") == true)) {
          transactionLinesGroupEntry.value.transactionLineDiscountDto.add(entry.value);
        }
      }
    }

    Map<String, List<TransactionLinesGroup>> transactionLinesGroupsBySeat = {};
    if(state.isSeatBased) {
      for (var transactionLinesGroupEntry in transactionLinesGroups.entries) {
        TransactionLinesGroup transactionLinesGroup = transactionLinesGroupEntry.value;
        String seatName = transactionLinesGroup.seatName;
        if(seatName.isEmpty) {
          seatName = "Shared Order";
        }
        List<TransactionLinesGroup>? transactionLinesGroups = transactionLinesGroupsBySeat[seatName];
        transactionLinesGroups ??= [];
        transactionLinesGroups.add(transactionLinesGroup);
        transactionLinesGroupsBySeat[seatName] = transactionLinesGroups;
      }
    } else {
      for (var transactionLinesGroupEntry in transactionLinesGroups.entries) {
        TransactionLinesGroup transactionLinesGroup = transactionLinesGroupEntry.value;
        /// add empty seat name for non-seat based trx (so all lines will group together)
        transactionLinesGroup.seatName = "";
        List<TransactionLinesGroup>? transactionLinesGroups = transactionLinesGroupsBySeat[""];
        transactionLinesGroups ??= [];
        transactionLinesGroups.add(transactionLinesGroup);
        transactionLinesGroupsBySeat[""] = transactionLinesGroups;
      }
    }

    return transactionLinesGroupsBySeat;
  }

  void createGroupRecursively(
      Map<int, ModifierTransactionLinesGroup> parentModifierTransactionLinesGroups,
      ModifierTransactionLinesGroup? modifierTransactionLinesGroup,
      TransactionLineDTO modifierList) {
    if(modifierList.transactionLineDTOList.isNotEmpty) {
      for (var element in modifierList.transactionLineDTOList) {
        int parentModifierViewGroupingNumber = element.viewGroupingNumber;
        ModifierTransactionLinesGroup? parentModifierTransactionLinesGroup = parentModifierTransactionLinesGroups[parentModifierViewGroupingNumber];
        parentModifierTransactionLinesGroup ??= ModifierTransactionLinesGroup(
            element.productName,
            element.productId,
            element.modifierSetId,
            element.modifierSetDetailId,
            element.amount,
            []);
        parentModifierTransactionLinesGroup.transactionLineDtoList.add(element);
        parentModifierTransactionLinesGroups[parentModifierViewGroupingNumber] = parentModifierTransactionLinesGroup;
        modifierTransactionLinesGroup?.parentModifiersDtoList.removeWhere((element) => element.modifierProductId == parentModifierTransactionLinesGroup?.modifierProductId);
        modifierTransactionLinesGroup?.parentModifiersDtoList.add(parentModifierTransactionLinesGroup);
        createGroupRecursively(parentModifierTransactionLinesGroups, parentModifierTransactionLinesGroup, element);
      }
    } else {
    }
  }

  List<String>? initSeats(TransactionData? transactionData) {
    Set<String> seatNames = {};
    String sharedOrder = "Shared Order";
    Map<int, String> seats = {};
    Set<int>? seatNumbers = {};

    if(state.isSeatBased) {
      for (int seat = 0; seat <= (transactionData?.guestCount ?? 0); seat++) {
        String seatName = "Seat$seat";
        if (seat == 0) {
          seatName = sharedOrder;
          seats[-1] = seatName;
        } else {
          seats[seat] = seatName;
        }
      }
    } else {
      seats[0] = '';
    }

    if (transactionData?.transactionLineDTOList == null || (transactionData?.transactionLineDTOList)!.isEmpty) {
      var sortedSeatByKey = Map.fromEntries(seats.entries.toList()..sort((first, second) => first.key.compareTo(second.key)));
      seatNames.addAll(sortedSeatByKey.values);
      seatNumbers.addAll(sortedSeatByKey.keys);
    } else {
      transactionData?.transactionLineDTOList.forEach((transactionLine) {
        if(transactionLine.seatName?.isNotEmpty == true && transactionLine.seatName != 'Shared Order') {
          if (seats.keys.contains(transactionLine.seatNumber)) {
            seats[transactionLine.seatNumber ?? 0] = transactionLine.seatName ?? '';
          } else {
            seats[transactionLine.seatNumber ?? 0] = transactionLine.seatName ?? '';
          }
        }
      });
      var sortedSeatByKey = Map.fromEntries(seats.entries.toList()..sort((first, second) => first.key.compareTo(second.key)));
      seatNames.addAll(sortedSeatByKey.values);
      seatNumbers.addAll(sortedSeatByKey.keys);
    }
    emit(state.copyWith(seats: seats, seatNumbers: seatNumbers.toList()));
    return seatNames.toList();
  }

  void changeSeat(int seatNumber) {
    seatNumber = seatNumber == -1 ? 0 : seatNumber;
    String? selectedSeatName = state.seatNames?[seatNumber];
    emit(state.copyWith(selectedSeat: seatNumber, selectedSeatName: selectedSeatName ?? ''));
  }

  void initTransaction(TransactionData? transactionData) async {
    List<String>? seatNames = initSeats(transactionData);
                emit(state.copyWith(
                transactionData: transactionData,
                seatNames: seatNames,
                selectedSeat: 0,
                transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionData),
                selectedSeatName: seatNames?[0] ?? ""));
  }

  void isSeatBased(bool isSeatBased, bool showOrderDetailsWhileInitiatingOrder) {
    emit(state.copyWith(
        isSeatBased: isSeatBased, showOrderDetailsWhileInitiatingOrder: showOrderDetailsWhileInitiatingOrder));
  }

  void onTransactionDetailsUpdated(TransactionData? transactionData) {
    List<String>? seatNames = initSeats(transactionData);
    emit(state.copyWith(
        transactionData: transactionData,
        seatNames: seatNames,
        transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionData)));
  }

  void onTransactionDataUpdated(TransactionData? transactionData) {
    emit(state.copyWith(
        transactionData: transactionData, transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionData)));
  }

  void onNewTransactionInitiated(TransactionData? transactionData) {
    initTransaction(transactionData);
  }

  void clearTransactionErrorString() {
    emit(state.copyWith(transactionErrorString: ''));
  }

  void resetTransactionLoadingStatus() {
    emit(state.copyWith(transactionUpdateStatusEnum: TransactionUpdateStatusEnum.initial));
  }

  void initUpdateTransactionOrderDetailsSection() {
    emit(state.copyWith(transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.initial));
  }

  void initTransactionOrderDetailsErrorString() {
    emit(state.copyWith(transactionDetailsUpdateErrorString: ''));
  }

  void clearStatus() {
    emit(state.copyWith(status: Status(LoadingStatus.none, "")));
  }

  clearTransactionFunctionsSelection() {
    emit(state.copyWith(isTransactionLineGroupSelected: -1));
  }

  clearCustomerMappingErrorValues() {
    emit(state.copyWith(
        linkCustomerToTransactionError: null,
        deLinkCustomerFromTransactionError: null,
        hasCustomerDelinkedFromTransaction: false));
  }

  clearCompleteTransactionStatus() => emit(state.copyWith(completeTransactionStatus: TransactionStatus(-1, '')));

  clearLoaderStatus() {
    emit(state.copyWith(loaderStatus: LoaderStatus(-1, '')));
  }

  Future<void> clearTransactionAPI({int?approverID}) async {
    Log.printMethodStart("clearTransactionAPI()", "Sales Screen", "Reset");
    try {
      emit(state.copyWith(status: Status(LoadingStatus.loading, MessagesProvider.get('Please wait while we clear the transaction...'))));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionResponse = await transactionDataBl.clearTransaction();
      emit(state.copyWith(
          transactionData: transactionResponse!.data,
          status: Status(LoadingStatus.success, MessagesProvider.get("Transaction Cleared")),
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data)));
      Log.printMethodEnd("clearTransactionAPI()", "Sales Screen", "Reset");
      Log.printMethodReturn("clearTransactionAPI() - Transaction reset successful.", "Sales Screen", "Reset");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(status: Status(LoadingStatus.error, errorString ?? '')));
      // notificationBar.showMessage(
      //     errorString.toString(), Colors.red);
    }
  }

  Future<void> updateTransactionOrderDetails(
      {required String guestName,
        int?approverID,
      required int guestCount,
      required String guestContact,
      required String transactionIdentifier}) async {
    try {
      Log.printMethodStart("updateTransactionOrderDetails()", "Sales Screen", "Update");
      emit(state.copyWith(transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.loading));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionResponse = await transactionDataBl.updateTransactionIdentifiers(
          guestName: guestName,
          guestContact: guestContact,
          guestCount: guestCount,
          transactionIdentifier: transactionIdentifier);
      emit(state.copyWith(
          transactionDetailsUpdateErrorString: '',
          transactionData: transactionResponse!.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
          transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.success));
      Log.printMethodEnd("updateTransactionOrderDetails()", "Sales Screen", "Update");
      Log.printMethodReturn("updateTransactionOrderDetails() - Transaction update successful.", "Sales Screen", "Update");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.error,
          transactionDetailsUpdateErrorString: errorString ?? ''));
    }
  }

  Future<void> saveAndHoldTransaction({bool shouldPopAfterSave = false,int?approverID}) async {
    Log.printMethodStart("saveAndHoldTransaction()", "Sales Screen", "Save And Hold");
    try {
      if (_isTransactionLineGroupsFulfilled()) {
        emit(state.copyWith(
            status: Status(LoadingStatus.conditionalError,
                MessagesProvider.get("All transaction lines are saved already. No lines are pending fulfillment."))));
      } else {
        emit(state.copyWith(
            status: Status(LoadingStatus.loading, "Please wait while we save and hold the transaction...")));
        if (_isTransactionLineGroupsFulfilled()) {
          emit(state.copyWith(
              status: Status(LoadingStatus.conditionalError,
                  MessagesProvider.get("All transaction lines are saved already. No lines are pending fulfillment."))));
        } else {
          execContextBL = await ExecutionContextBuilder.build();
          sysExecContext = execContextBL.getExecutionContext();
          transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
          transactionResponse = await transactionDataBl.saveAndHoldTransaction();
          if(shouldPopAfterSave == true){
            await unlockTransaction(shouldClearTransaction: true);
          }
          emit(state.copyWith(
              shouldPopAfterSave: shouldPopAfterSave,
              transactionData: transactionResponse?.data,
              transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
              status: Status(LoadingStatus.success,
                  MessagesProvider.get("Saved the transaction successfully. Fulfillment is on hold."))));
        }
      }
      Log.printMethodEnd("saveAndHoldTransaction()", "Sales Screen", "Save And Hold");
      Log.printMethodReturn("saveAndHoldTransaction() - Transaction save & hold successful.", "Sales Screen", "Save And Hold");
    } on DioError catch (error) {
      emit(state.copyWith(status: Status(LoadingStatus.error, error.message)));
    }
  }

  _isTransactionLineGroupsFulfilled() {
    bool isTransactionLineGroupsFulfilled = false;
    if (state.transactionData?.transactionLineDTOList.isNotEmpty == true) {
      for (var transactionLine in (state.transactionData?.transactionLineDTOList)!) {
        isTransactionLineGroupsFulfilled = (transactionLine.lineStatus == "FULFILLED");
      }
    }
    return isTransactionLineGroupsFulfilled;
  }

  Future<void> saveTransaction({bool shouldPopAfterSave = false,int?approverID}) async {
    Log.printMethodStart("saveTransaction()", "Sales Screen", "Save");
    try {
      emit(state.copyWith(status: Status(LoadingStatus.loading, "Please wait while we save the transaction......")));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionResponse = await transactionDataBl.saveTransaction();
      if(shouldPopAfterSave == true){
        await unlockTransaction(shouldClearTransaction: true);
      }
      emit(state.copyWith(
          transactionData: transactionResponse?.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
          status: Status(LoadingStatus.success, MessagesProvider.get("Saved the transaction successfully.")),
          shouldPopAfterSave: shouldPopAfterSave));
      Log.printMethodEnd("saveTransaction()", "Sales Screen", "Save");
      Log.printMethodReturn("saveTransaction() - Transaction save successful.", "Sales Screen", "Save");
    } on DioError catch (error) {
      emit(state.copyWith(status: Status(LoadingStatus.error, error.response?.data['data'] as String ?? '')));
    }
  }

  Future<void> removeProductFromLine(
      {int?approverID,required List<int> transactionLineIds, String? remarks, String? reason, required int reasonId,}) async {
    try {
      Log.printMethodStart("removeProductFromLine()", "Sales Screen", "Remove");
      emit(state.copyWith(transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.loading));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionResponse = await transactionDataBl.removeProductFromLine(
          transactionLineIds: transactionLineIds,
          lineRemarks: remarks ?? '',
          reason: reason ?? '',
          reasonId: reasonId ?? -1);
      emit(state.copyWith(
          transactionData: transactionResponse!.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
          isTransactionLineGroupSelected: 0,
          transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.success));
      Log.printMethodEnd("removeProductFromLine()", "Sales Screen", "Remove");
      Log.printMethodReturn("removeProductFromLine() - Remove line successful.", "Sales Screen", "Remove");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.error, remarksUpdateErrorString:errorString));
    }
  }

  Future<void> removeUnsavedProductFromLine(
      {int?approverID,required List<int> transactionLineIds, String? remarks, String? reason, required int reasonId}) async {
    try {
      Log.printMethodStart("removeUnsavedProductFromLine()", "Sales Screen", "Remove Unsaved");
      emit(state.copyWith(status: Status(LoadingStatus.loading, MessagesProvider.get("Please wait while we cancel the transaction line..."))));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionResponse = await transactionDataBl.removeProductFromLine(
          transactionLineIds: transactionLineIds,
          lineRemarks: remarks ?? '',
          reason: reason ?? '',
          reasonId: reasonId);
      emit(state.copyWith(
          transactionData: transactionResponse!.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
          status: Status(LoadingStatus.success, MessagesProvider.get('Transaction Line(s) Cancelled'))));
      Log.printMethodEnd("removeUnsavedProductFromLine()", "Sales Screen", "Remove Unsaved");
      Log.printMethodEnd("removeUnsavedProductFromLine() - Remove unsaved line successful.", "Sales Screen", "Remove Unsaved");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(status: Status(LoadingStatus.error, errorString ?? '')));
    }
  }

  Future<void> cancelTransactionAPI({int?approverID}) async {
    try {
      Log.printMethodStart("cancelTransactionAPI()", "Sales Screen", "Cancel");
      emit(state.copyWith(status: Status(LoadingStatus.loading, MessagesProvider.get("Please wait while we cancel the transaction ..."))));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionResponse = await transactionDataBl.cancelTransaction(approverID:approverID);
      emit(state.copyWith(
          transactionData: transactionResponse?.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
          status: Status(LoadingStatus.success, MessagesProvider.get('Cancelled the transaction successfully.'))));
      Log.printMethodEnd("cancelTransactionAPI()", "Sales Screen", "Cancel");
      Log.printMethodEnd("cancelTransactionAPI() - Transaction cancel successful.", "Sales Screen", "Cancel");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(status: Status(LoadingStatus.error, errorString ?? '')));
      // notificationBar.showMessage(
      //     errorString.toString(), Colors.red);
    }
  }

  Future<void> reopenTransaction({int? approverID}) async {
    try {
      Log.printMethodStart("reopenTransaction()", "Sales Screen", "Reopen");
      if (state.transactionData?.transactionStatus !=  "CLOSED") {
        emit(state.copyWith(
            status: Status(LoadingStatus.conditionalError,
                MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.",[state.transactionData?.transactionStatus,'REOPEN']))));
      } else {
        emit(state.copyWith(status: Status(LoadingStatus.loading,
            MessagesProvider.get("Please wait while we reopening the transaction..."))));
        execContextBL = await ExecutionContextBuilder.build();
        sysExecContext = execContextBL.getExecutionContext();
        transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
        transactionResponse = await transactionDataBl.reopenTransaction(approverID:approverID);
        emit(state.copyWith(
            transactionData: transactionResponse!.data,
            transactionLinesGroupsBySeat: buildTransactionLinesGroups(
                transactionResponse?.data),
            status: Status(LoadingStatus.success, MessagesProvider.get(
                'Reopened the transaction successfully.'))));
      }
      Log.printMethodEnd("reopenTransaction()", "Sales Screen", "Reopen");
      Log.printMethodEnd("reopenTransaction() - Transaction Reopen successful.", "Sales Screen", "Reopen");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(status: Status(LoadingStatus.error, errorString ?? '')));
      // notificationBar.showMessage(
      //     errorString.toString(), Colors.red);
    }
  }

  Future<void> repeatTransactionLine(
      TransactionLinesGroup selectedTransactionLinesGroup, int quantity, double? overriddenPrice,{int?approverID}) async {
    try {
      Log.printMethodStart("repeatTransactionLine()", "Sales Screen", "Repeat");
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      TransactionResponse? transactionResponse = await transactionDataBl.addProductToLine(
          seatName: selectedTransactionLinesGroup.seatName,
          seatNumber: selectedTransactionLinesGroup.seatNumber,
          quantity: quantity,
          productId: selectedTransactionLinesGroup.productId,
          userOverriddenPrice: overriddenPrice);
      emit(state.copyWith(
        transactionData: transactionResponse!.data,
        transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse.data),
        status: Status(
            LoadingStatus.success, "Product ${selectedTransactionLinesGroup.productName} reordered successfully."),
        isTransactionLineGroupSelected: 0,
      ));
      Log.printMethodEnd("repeatTransactionLine()", "Sales Screen", "Repeat");
      Log.printMethodReturn("repeatTransactionLine() - Repeat Trx Line successful.", "Sales Screen", "Repeat");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(status: Status(LoadingStatus.error, errorString!)));
    }
  }

  Future<void> repeatModifierTransactionLine(TransactionLinesGroup selectedTransactionLinesGroup, int quantity,{int?approverID}) async {
    Log.printMethodStart("repeatModifierTransactionLine()", "Sales Screen", "Repeat");
    try {
      List<AddModifierProductRequest> transactionLineList = [];
      List<TransactionLineDTORequest> modifiersList = [];
      AddModifierProductRequest request;

      var modifiers = selectedTransactionLinesGroup.modifierTransactionLinesGroup;

      modifiers.forEach((modifier) {
        List<TransactionLineDTORequest> parentModifiersList = [];
        if(modifier.parentModifiersDtoList.isNotEmpty == true) {
          modifier.parentModifiersDtoList.forEach((lines) {
            parentModifiersList.add(TransactionLineDTORequest(
                modifierSetId: lines.modifierSetId,
                modifierSetDetailId: lines.modifierSetDetailId,
                quantity: lines.transactionLineDtoList.length.toDouble(),
                transactionLineDTOList: getLinesRecursively(lines.parentModifiersDtoList),
                productId: lines.modifierProductId,
                productName: lines.modifierName));
          });
        }

        modifiersList.add(TransactionLineDTORequest(
          modifierSetId: modifier.modifierSetId,
          modifierSetDetailId: modifier.modifierSetDetailId,
          productId: modifier.modifierProductId,
          productName: modifier.modifierName,
          quantity: (modifier.transactionLineDtoList.length).toDouble() ?? 0.0,
          transactionLineDTOList: parentModifiersList ?? [],
        ));
      });

      request = AddModifierProductRequest(
          seatName: selectedTransactionLinesGroup.seatName,
          seatNumber: selectedTransactionLinesGroup.seatNumber,
          productId: selectedTransactionLinesGroup.productId,
          quantity: quantity.toDouble(),
          productName: selectedTransactionLinesGroup.productName,
          transactionLineDTOList: modifiersList);
      transactionLineList.add(request);

      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      TransactionResponse? transactionResponse = await transactionDataBl.addModifierProductsToLine(transactionLineList);

      emit(state.copyWith(
        transactionData: transactionResponse!.data,
        transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse.data),
        status: Status(LoadingStatus.success, "Product ${selectedTransactionLinesGroup.productName} reordered successfully."),
        isTransactionLineGroupSelected: 0,
      ));
      Log.printMethodEnd("repeatModifierTransactionLine()", "Sales Screen", "Repeat");
      Log.printMethodEnd("repeatModifierTransactionLine() - Modifier Lines Repeat successful.", "Sales Screen", "Repeat");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(status: Status(LoadingStatus.error, errorString!)));
    }
  }

  List<TransactionLineDTORequest> getLinesRecursively(List<ModifierTransactionLinesGroup> transactionLineDtoList) {
    return transactionLineDtoList.map<TransactionLineDTORequest>((e) {
      return TransactionLineDTORequest(
        modifierSetId: e.modifierSetId,
        modifierSetDetailId: e.modifierSetDetailId,
        transactionLineDTOList: getLinesRecursively(e.parentModifiersDtoList),
        productId: e.modifierProductId,
        productName: e.modifierName,
        quantity: e.transactionLineDtoList.length.toDouble()
    );
    }).toList();
  }

  Future<void> addProductToTransaction(ProductMenuPanelContentContainerDTO selectedProduct,
      ProductPriceContainerData? productPriceContainer, int quantity,{int?approverID}) async {
    Log.printMethodStart("addProductToTransaction()", "Sales Screen", "Add Product");
    try {
      emit(state.copyWith(
          status: Status(LoadingStatus.loading, MessagesProvider.get("Adding product to the transaction..."))));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      TransactionResponse? transactionResponse = await transactionDataBl.addProductToLine(
          seatName: state.selectedSeatName,
          seatNumber: state.selectedSeat,
          productId: (productPriceContainer?.productId)!,
          quantity: quantity);
      emit(state.copyWith(
          transactionData: transactionResponse?.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
          status: Status(LoadingStatus.success,
              sprintf(MessagesProvider.get("Newly added product %s, Quantity: %d"), [selectedProduct.name, quantity]))));
      Log.printMethodEnd("addProductToTransaction()", "Sales Screen", "Add Product");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(status: Status(LoadingStatus.error, error.message)));
    }
  }

  Future<bool> completeTransaction({bool shouldPopAfterSave = false,int?approverID, bool hasGoneToPaymentAfterComplete = false}) async {
    Log.printMethodStart("completeTransaction()", "Sales Screen", "Complete");
    try {
      if (state.transactionData?.transactionPaymentStatus == "SETTLED" || state.transactionData?.transactionStatus == "ORDERED" || state.transactionData?.transactionStatus == "PENDING_CLOSE"|| state.transactionData?.transactionStatus == "STARTED"
          || state.transactionData?.isNonChargeable == true || hasGoneToPaymentAfterComplete) {
        emit(state.copyWith(
          isLoading: true,
          messageString: MessagesProvider.get("Please wait while we complete the transaction.."),
          isSuccess: false,
          isError: false,
        ));
        execContextBL = await ExecutionContextBuilder.build();
        sysExecContext = execContextBL.getExecutionContext();
        transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
        transactionResponse = await transactionDataBl.completeTransaction(approverID:approverID);
        Log.printMethodEnd("completeTransaction()", "Sales Screen", "Complete");
        if (transactionResponse?.data?.transactionStatus == "CLOSED" ||
            transactionResponse?.data?.transactionStatus == "PENDING_CLOSE") {
          TransactionPrintReceiptResponse? receipt;
          if(state.transactionPrintReceipt == null) {
            Log.printMethodStart(
                'Started Transaction receipt generation', "Sales Screen",
                "Complete");
            receipt = await transactionDataBl
                .getTransactionPrintReceipt(format: "Image");
            Log.printMethodEnd(
                'End Transaction receipt generation', "Sales Screen",
                "Complete");
            if (receipt?.data != null) {
              Log.printMethodReturn(
                  'transactionPrintReceipt :- ${receipt?.data![0].data}',
                  "Sales Screen", "Complete");
            }
          }
          await unlockTransaction(shouldClearTransaction: false);
          emit(state.copyWith(
              shouldPopAfterSave: shouldPopAfterSave,
              // transactionData: null,
              // transactionLinesGroupsBySeat: {},
              transactionPrintReceipt: receipt ?? state.transactionPrintReceipt,
              isLoading: false,
              isSuccess: true,
              isError: false,
              completeTransactionStatus:
              TransactionStatus(1, MessagesProvider.get("Completed the transaction successfully."))));
          Log.printMethodReturn("completeTransaction() - true", "Sales Screen", "Complete");
          resetLoaderState();
        } else {
          Log.printMethodReturn("completeTransaction() - false", "Sales Screen", "Complete");
          emit(state.copyWith(
              transactionData: transactionResponse?.data,
              transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
              isLoading: false,
              isSuccess: false,
              isError: true,
              completeTransactionStatus:
              TransactionStatus(0, MessagesProvider.get("Payment incomplete. Cannot close transaction"))));
          resetLoaderState();
        }
        return true;
      } else {
        Log.printMethodReturn("completeTransaction() - false", "Sales Screen", "Complete");
        emit(state.copyWith(
            isLoading: false,
            isSuccess: false,
            isError: false,
            completeTransactionStatus:
            TransactionStatus(0, MessagesProvider.get("Payment incomplete. Cannot close transaction"))));
        return true;
      }
    } on DioError catch (error) {
      Log.printMethodReturn("completeTransaction() - false", "Sales Screen", "Complete");
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          isError: true,
          completeTransactionStatus: TransactionStatus(0, errorString!)));
      resetLoaderState();
      return false;
    } catch (error) {
      Log.printMethodReturn("completeTransaction() - false", "Sales Screen", "Complete");
      emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          isError: true,
          completeTransactionStatus: TransactionStatus(0, error.toString())));
      resetLoaderState();
      return false;
    }
  }

  void resetLoaderState() {
    emit(state.copyWith(
      isLoading: false,
      isSuccess: false,
      isError: false,
      messageString: null,
    ));
  }

  Future<void> addDiscountForTransaction(
      {required int discountId,
      required double discountAmount,
      required String couponNumber,
      required int transactionDiscountId,
        String? remarks = "",
        int?approverID}) async {
    Log.printMethodStart("addDiscountForTransaction()", "Sales Screen -> Apply Discount For Transaction", "OK");
    try {
      emit(state.copyWith(transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.loading));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
       transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionResponse = await transactionDataBl.addDiscountForTransaction(
        approverID:approverID,
        discountId: discountId,
        couponNumber: couponNumber,
        transactionDiscountId: transactionDiscountId,
        remarks: remarks,
        discountAmount: discountAmount,
      );
      emit(state.copyWith(
          transactionDetailsUpdateErrorString: '',
          transactionData: transactionResponse!.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
          transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.success));
      Log.printMethodEnd("addDiscountForTransaction()", "Sales Screen -> Apply Discount For Transaction", "OK");
      Log.printMethodReturn("addDiscountForTransaction() - Discount applied", "Sales Screen -> Apply Discount For Transaction", "OK");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.error,
          transactionDetailsUpdateErrorString: errorString ?? ''));
    }
  }

  Future<void> addDiscountForTransactionLine(
      {required int discountId,
      required double discountAmount,
      required String couponNumber,
      required int transactionLineId,
      required String remarks,
        int?approverID}) async {
    Log.printMethodStart("addDiscountForTransactionLine()", "Sales Screen -> Apply Discount", "OK");
    try {
      emit(state.copyWith(transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.loading));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
       transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionResponse = await transactionDataBl.addDiscountForTransactionLine(
        approverID:approverID,
        transactionLineId: transactionLineId,
        discountId: discountId,
        couponNumber: couponNumber,
        remarks: remarks,
        discountAmount: discountAmount,
      );
      emit(state.copyWith(
          transactionDetailsUpdateErrorString: '',
          transactionData: transactionResponse!.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
          transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.success));
      Log.printMethodEnd("addDiscountForTransactionLine()", "Sales Screen -> Apply Discount", "OK");
      Log.printMethodReturn("addDiscountForTransactionLine() - Discount Applied.", "Sales Screen -> Apply Discount", "OK");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.error,
          transactionDetailsUpdateErrorString: errorString ?? ''));
    }
  }

  Future<void> removeDiscountForTransaction(
      {required int discountId,
      required double discountAmount,
      required String couponNumber,
      required int transactionDiscountId,
        int?approverID}) async {
    Log.printMethodStart("removeDiscountForTransaction()", "Sales Screen", "Delete");
    try {
      emit(state.copyWith(transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.loading));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
       transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionResponse = await transactionDataBl.removeDiscountForTransaction(
        approverID:approverID,
        discountId: discountId,
        couponNumber: couponNumber,
        transactionDiscountId: transactionDiscountId,
        discountAmount: discountAmount,
      );
      emit(state.copyWith(
          transactionDetailsUpdateErrorString: '',
          transactionData: transactionResponse!.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
          transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.success));
      Log.printMethodEnd("removeDiscountForTransaction()", "Sales Screen", "Delete");
      Log.printMethodEnd("removeDiscountForTransaction() - Discount Removed.", "Sales Screen", "Delete");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.error,
          transactionDetailsUpdateErrorString: errorString ?? ''));
    }
  }

  // Future<void> removeDiscountForTransactionLine(
  //     {required int discountId,
  //     required double discountAmount,
  //     required String couponNumber,
  //     required int transactionLineId,
  //     required String remarks,
  //       int?approverID}) async {
  //   try {
  //     emit(state.copyWith(transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.loading));
  //     execContextBL = await ExecutionContextBuilder.build();
  //     sysExecContext = execContextBL.getExecutionContext();
  //     var transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
  //     transactionResponse = await transactionDataBl.removeDiscountForTransactionLine(
  //       transactionLineId: transactionLineId,
  //       approverID:approverID,
  //       discountId: discountId,
  //       couponNumber: couponNumber,
  //       remarks: remarks,
  //       discountAmount: discountAmount,
  //     );
  //     emit(state.copyWith(
  //         transactionDetailsUpdateErrorString: '',
  //         transactionData: transactionResponse!.data,
  //         transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
  //         transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.success));
  //   } on DioError catch (error) {
  //     var errorString = error.response?.data['data'] as String?;
  //     emit(state.copyWith(
  //         transactionDetailsUpdateStatusEnum: TransactionDetailsUpdateStatusEnum.error,
  //         transactionDetailsUpdateErrorString: errorString ?? ''));
  //   }
  // }

  Future<void> linkCustomerToTransaction(int customerId,{int?approverID}) async {
    Log.printMethodStart("linkCustomerToTransaction()", "Sales Screen", "Init");
    try {
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      var transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      if (state.transactionData?.customerId == -1) {
        TransactionResponse transactionResponse =
            await transactionDataBl.linkCustomerToTransaction(customerId: customerId);
        emit(state.copyWith(
          transactionData: transactionResponse.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse.data),
        ));
      } else {
        await transactionDataBl.deLinkCustomerFromTransaction();
        TransactionResponse transactionResponse =
            await transactionDataBl.linkCustomerToTransaction(customerId: customerId);
        emit(state.copyWith(
          transactionData: transactionResponse.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse.data),
        ));
      }
      Log.printMethodEnd("linkCustomerToTransaction()", "Sales Screen", "Init");
      Log.printMethodReturn("linkCustomerToTransaction() - Customer Link to transaction Successful.", "Sales Screen", "Init");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(linkCustomerToTransactionError: errorString));
    }
  }

  Future<void> deLinkCustomerFromTransaction({int?approverID}) async {
    Log.printMethodStart("deLinkCustomerFromTransaction()", "Sales Screen -> Change", "Remove Customer");
    try {
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      var transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      TransactionResponse transactionResponse = await transactionDataBl.deLinkCustomerFromTransaction();
      emit(state.copyWith(
        hasCustomerDelinkedFromTransaction: true,
        transactionData: transactionResponse.data,
        transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse.data),
      ));
      Log.printMethodEnd("deLinkCustomerFromTransaction()", "Sales Screen -> Change", "Remove Customer");
      Log.printMethodReturn("deLinkCustomerFromTransaction() - Delink customer successful.", "Sales Screen - Change", "Remove Customer");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(deLinkCustomerFromTransactionError: errorString));
    }
  }

  Future<void> addProfileToTransactionLinesGroup(int profileId, List<int> transactionLineIds, String? remarks,{int?approverID}) async {
    Log.printMethodStart("addProfileToTransactionLinesGroup()", "Sales Screen -> Transaction Profile", "OK");
    try {
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      TransactionResponse? transactionResponse = await transactionDataBl.applyProfileToTransactionLine(
          approverID:approverID,
          profileId: profileId, transactionLineIds: transactionLineIds, remarks: remarks);
      emit(state.copyWith(
        transactionData: transactionResponse?.data,
        transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
        isTransactionLineGroupSelected: 0,
        isProfileUpdatedToTransactionLine: true,
      ));
      Log.printMethodEnd("addProfileToTransactionLinesGroup()", "Sales Screen -> Transaction Profile", "OK");
      Log.printMethodReturn("addProfileToTransactionLinesGroup() - Profile added to selected lines.", "Sales Screen - Transaction Profile", "OK");
    } on DioError catch (error) {
      emit(state.copyWith(updateTransactionLineProfileError: error.response?.data['data'] as String?));
    } catch (error) {
      emit(state.copyWith(updateTransactionLineProfileError: error.toString()));
    }
  }

  Future<void> updateTransactionProfile(int profileId,{int?approverID}) async {
    Log.printMethodStart("updateTransactionProfile()", "Sales Screen -> Transaction Remarks", "OK");
    try {
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      TransactionResponse? transactionResponse =
          await transactionDataBl.setTransactionProfileId(transactionProfileId: profileId, approverID:approverID);
      emit(state.copyWith(
        transactionData: transactionResponse?.data,
        transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
        isTransactionLineGroupSelected: 0,
        updatedTransactionProfile: true,
      ));
      Log.printMethodEnd("updateTransactionProfile()", "Sales Screen -> Transaction Remarks", "OK");
      Log.printMethodReturn("updateTransactionProfile() - Transaction profile updated.", "Sales Screen -> Transaction Remarks", "OK");
    } on DioError catch (error) {
      emit(state.copyWith(updateTransactionProfileError: error.response?.data['data'] as String?));
    } catch (error) {
      emit(state.copyWith(updateTransactionProfileError: error.toString()));
    }
  }

  clearTransactionProfileStates() {
    emit(state.copyWith(updateTransactionProfileError: null, updatedTransactionProfile: false));
  }

  clearTransactionLineProfileStates() {
    emit(state.copyWith(updateTransactionLineProfileError: null, isProfileUpdatedToTransactionLine: false));
  }

  changeSearchResultsStatus(bool value) {
    emit(state.copyWith(isInSearchMode: value));
  }

  updateSearchListTransactionData(data) {
    emit(state.copyWith(searchResultsTransactionLineGroups: data));
  }

  ///
  /// Clearing the transaction data once the printing is done/not done.
  ///
  Future<void> clearTransactionData({bool isTransactionReceiptPrintError: false}) async {
    Log.printMethodStart("clearTransactionData()", "Sales Screen", "Init");
    execContextBL = await ExecutionContextBuilder.build();
    sysExecContext = execContextBL.getExecutionContext();
    transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
    if (transactionResponse?.data?.transactionStatus == "CLOSED" || transactionResponse?.data?.transactionStatus == "PENDING_CLOSE") {
      await transactionDataBl.clear();
      transactionResponse = null;
      var statusMessage = (isTransactionReceiptPrintError)
          ? MessagesProvider.get("Completed the transaction successfully. Unable to Print Transaction Receipt.")
          : MessagesProvider.get("Completed the transaction successfully.");
      emit(state.copyWith(
          shouldPopAfterSave: state.shouldTriggerPopAfterSave ?? false,
          transactionData: null,
          transactionLinesGroupsBySeat: {},
          completeTransactionStatus: TransactionStatus(-1, statusMessage)));
    }
    Log.printMethodEnd("clearTransactionData()", "Sales Screen", "Init");
    Log.printMethodReturn("clearTransactionData() - Cleared transaction data", "Sales Screen", "Init");
  }

  Future<void> addMandatoryProductToTransaction(int productId, int quantity, String remarks,{int?approverID}) async {
    Log.printMethodStart("addMandatoryProductToTransaction()", "Sales Screen -> Remarks", "OK");
    try {
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      TransactionResponse? transactionResponse = await transactionDataBl.addProductToLine(
          seatName: state.selectedSeatName,
          seatNumber: state.selectedSeat,
          productId: productId,
          quantity: quantity,
          remarks: remarks);
      emit(state.copyWith(
        transactionData: transactionResponse?.data,
        transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
        isTransactionLineGroupSelected: 0,
        isRemarksMandatoryProductAdded: true,
      ));
      Log.printMethodEnd("addMandatoryProductToTransaction()", "Sales Screen -> Remarks", "OK");
      Log.printMethodReturn("addMandatoryProductToTransaction() - Mandatory product added.", "Sales Screen -> Remarks", "OK");
    } on DioError catch (error) {
      emit(state.copyWith(remarksMandatoryProductErrorString: error.response?.data['data'] as String?));
    }
  }

  Future<void> updateTransactionLinesSeat(List<int> transactionLineIds, String seatName, String seatNumber,{int?approverID}) async {
    Log.printMethodStart("updateTransactionLinesSeat()", "Sales Screen -> Update Seat", "OK");
    try {
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      TransactionResponse? transactionResponse =
          await transactionDataBl.updateTransactionLinesSeat(transactionLineIds, seatName, seatNumber,approverID:approverID);
      List<String>? seatNames = initSeats(transactionResponse?.data);
      emit(state.copyWith(
        transactionData: transactionResponse?.data,
        seatNames: seatNames,
        transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
        isTransactionLinesSeatUpdated: true,
      ));
      Future.microtask(() => changeSeat(int.parse(seatNumber)));
      Log.printMethodEnd("updateTransactionLinesSeat()", "Sales Screen -> Update Seat", "OK");
      Log.printMethodReturn("updateTransactionLinesSeat() - Seats updated.", "Sales Screen -> Update Seat", "OK");
    } on DioError catch (error) {
      emit(state.copyWith(updateTransactionLinesSeatError: error.response?.data['data'] as String?));
    }
  }

  Future<TransactionResponse?> initiateTransaction(
      {required int guestCount,
      required String? guestContact,
      required String? guestName,
      required String? transactionIdentifier,
        int?approverID}) async {
    Log.printMethodStart("initiateTransaction()", "Sales Screen", "Init");
    try {
      emit(state.copyWith(status: Status(LoadingStatus.loading, MessagesProvider.get("Initiating Transaction..."))));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
       transactionResponse = await transactionDataBl.initiateTransaction(
          approverID:approverID,
          guestCount: guestCount,
          guestName: guestName,
          guestContact: guestContact,
          transactionIdentifier: transactionIdentifier);
       transactionResponse = await transactionDataBl.lockTransaction();
      emit(state.copyWith(
          status: Status(LoadingStatus.success, MessagesProvider.get("Created transaction successfully.")),
          isNewTransactionInitiated: true));
      initTransaction(transactionResponse?.data);
      Log.printMethodEnd("initiateTransaction()", "Sales Screen", "Init");
      Log.printMethodReturn("initiateTransaction() - Initiated a new transaction ${transactionResponse?.data?.transactionId ?? ''}", "Sales Screen", "Init");
      return transactionResponse;
    } on DioError catch (error) {
      emit(state.copyWith(
          status: Status(LoadingStatus.error, error.response?.data['data']), isNewTransactionInitiated: false));
    }
    return null;
  }

  Future<bool> getTransactionPrintReceipt({int?approverID}) async {
    Log.printMethodStart("getTransactionPrintReceipt()", "Sales Screen", "Print");
    try {
      emit(state.copyWith(
        isLoading: true,
        messageString: MessagesProvider.get("Please wait while we get the print receipt..."),
        isSuccess: false,
        isError: false,
      ));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);

      ///
      /// Available formats : PDF, DTO, Image, ""
      ///
      TransactionPrintReceiptResponse? receipt = await transactionDataBl.getTransactionPrintReceipt(format: "Image");
      emit(state.copyWith(
        transactionPrintReceipt: receipt,
        isPrintReceiptReceived: true,
        isLoading: false,
        isSuccess: true,
        isError: false,
      ));
      resetLoaderState();
      resetPrintReceiptReceivedState();
      Log.printMethodEnd("getTransactionPrintReceipt()", "Sales Screen", "Print");
      Log.printMethodReturn("getTransactionPrintReceipt() - Transaction receipt received.", "Sales Screen", "Print");
      return true;
    } on DioError catch (error) {
      emit(state.copyWith(
        isPrintReceiptReceived: false,
        messageString: error.toString(),
        isLoading: false,
        isSuccess: false,
        isError: true,
      ));
      resetLoaderState();
      return false;
    } catch (error) {
      emit(state.copyWith(isPrintReceiptReceived: false, isLoading: false, isSuccess: false, isError: true, messageString: error.toString()));
      resetLoaderState();
      return false;
    }
  }

  Future<bool> overrideTransactionLinePrice(
      String? productName, List<int> transactionLineIds, double overriddenPrice, String lineRemarks,{int?approverID}) async {
    Log.printMethodStart("overrideTransactionLinePrice()", "Sales Screen -> User Price", "OK");
    try {
      emit(state.copyWith(
        isLoading: true,
        messageString: MessagesProvider.get("Please wait while we override the price..."),
        isSuccess: false,
        isError: false,
      ));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      TransactionResponse? response =
          await transactionDataBl.overrideTransactionLinePrice(transactionLineIds, overriddenPrice, lineRemarks,approverID:approverID);
      emit(state.copyWith(
          transactionData: response?.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(response?.data),
          isLoading: false,
          isSuccess: true,
          isError: false,
          messageString: MessagesProvider.get("Price updated successfully for product &1.", [productName])));
      resetLoaderState();
      Log.printMethodEnd("overrideTransactionLinePrice()", "Sales Screen -> User Price", "OK");
      Log.printMethodReturn("overrideTransactionLinePrice() - Override price successful.", "Sales Screen -> User Price", "OK");
      return true;
    } on DioError catch (error) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        isError: true,
        messageString: error.message,
      ));
      resetLoaderState();
      return false;
    } catch (error) {
      emit(state.copyWith(isLoading: false, isSuccess: false, isError: true, messageString: error.toString()));
      resetLoaderState();
      return false;
    }
  }

  resetPrintReceiptReceivedState() => emit(state.copyWith(isPrintReceiptReceived: false));

  clearPrintReceiptData() => emit(state.copyWith(transactionPrintReceipt: null));

  updateReceiptData(TransactionPrintReceiptResponse data) => emit(state.copyWith(
      transactionPrintReceipt: data,
  ));

  Future<bool> orderTransactionLines(List<TransactionLineDTO> transactionLines,{int?approverID}) async {
    Log.printMethodStart("orderTransactionLines()", "Sales Screen", "Fulfill");
    try {
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      TransactionResponse? transactionResponse = await transactionDataBl.orderTransactionLines(transactionLines,approverID:approverID);
      emit(state.copyWith(
          transactionData: transactionResponse?.data,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data),
          isTransactionLineGroupSelected: 0,
          status: Status(LoadingStatus.success, MessagesProvider.get("Selected Line(s) are fulfilled successfully."))));
      Log.printMethodEnd("orderTransactionLines()", "Sales Screen", "Fulfill");
      Log.printMethodReturn("orderTransactionLines() - Transaction fulfill successful.", "Sales Screen", "Fulfill");
      return true;
    } on DioError catch (error) {
      emit(state.copyWith(
        status: Status(LoadingStatus.error, error.response?.data['data']),
      ));
      return false;
    }
  }

  Future<void> saveToTransactionResponse(TransactionData? transactionData,{int?approverID}) async {
    execContextBL = await ExecutionContextBuilder.build();
    sysExecContext = execContextBL.getExecutionContext();
    transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
    TransactionResponse? transactionResponse = await transactionDataBl.saveToTransactionResponse(transactionData);
    initTransaction(transactionResponse?.data);
  }

  Future<bool> updateTransactionSeatName(TransactionData? transactionData,{int?approverID}) async {
    try {
      List<String>? seatNames = initSeats(transactionData);
      emit(state.copyWith(
          transactionData: transactionData,
          seatNames: seatNames,
          transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionData)));
      return true;
    } on DioError catch (error) {
      emit(state.copyWith(transactionSeatNameUpdateError: error.response?.data['data'] as String?));
      return false;
    } catch (error) {
      emit(state.copyWith(transactionSeatNameUpdateError: error.toString()));
      return false;
    }
  }

  void clear() {
    emit(const TransactionCubitState());
  }

  void resetShouldPopAfterSave() {
    emit(state.copyWith(shouldPopAfterSave: false));
  }

  void setIsBluetoothConnectionSession(bool isConnection) {
    emit(state.copyWith(isBluetoothConnectivitySession: isConnection));
  }

  Future<TransactionResponse?> clearTransactionOnSalesScreenExit() async {
    try {
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionDataBl.clear();
      transactionResponse = null;
      emit(state.copyWith(transactionData: null,transactionLinesGroupsBySeat: {}, shouldPopAfterSave: false));
      return transactionResponse;
    } on DioError catch (error) {
      return transactionResponse;
    }
  }

  // Future<void> lockTransaction(TransactionData? transactionData,List<String>? seatNames) async {
  //   try {
  //     emit(state.copyWith(status: Status(LoadingStatus.loading, MessagesProvider.get('Please wait ...'))));
  //     execContextBL = await ExecutionContextBuilder.build();
  //     sysExecContext = execContextBL.getExecutionContext();
  //     transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
  //     transactionResponse = await transactionDataBl.lockTransaction();
  //     emit(state.copyWith(
  //         transactionData: transactionData,
  //         seatNames: seatNames,
  //         selectedSeat: 0,
  //         status: Status(LoadingStatus.success, MessagesProvider.get('')),
  //         transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionData),
  //         selectedSeatName: seatNames?[0] ?? ""));
  //    /* emit(state.copyWith(
  //         transactionData: transactionResponse!.data,
  //         status: Status(LoadingStatus.none, MessagesProvider.get('')),
  //         transactionLinesGroupsBySeat: buildTransactionLinesGroups(transactionResponse?.data)));*/
  //   } on DioError catch (error) {
  //     var errorString = error.response?.data['data'] as String?;
  //     emit(state.copyWith(status: Status(LoadingStatus.error, errorString ?? '')));
  //   }
  // }

  Future<void> unlockTransaction({bool shouldClearTransaction = true}) async {
    Log.printMethodStart("unlockTransaction()", "Sales Screen", "Init");
    try {
      //emit(state.copyWith(status: Status(LoadingStatus.loading, MessagesProvider.get('Please wait while we clear the transaction...'))));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      transactionResponse = await transactionDataBl.unlockTransaction();
      if(shouldClearTransaction) {
        await clearTransactionOnSalesScreenExit();
      }
      Log.printMethodEnd("unlockTransaction()", "Sales Screen", "Init");
      Log.printMethodReturn("unlockTransaction() - Transaction unlock successful.", "Sales Screen", "Init");
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(status: Status(LoadingStatus.error, errorString ?? '')));
    }
  }

  void setIsInProductSearchMode(bool isInProductSearchMode) {
    emit(state.copyWith(isInProductSearchMode: isInProductSearchMode));
    if(isInProductSearchMode == false) {
      setBarcodeReadData(null);
    }
  }

  void setBarcodeReadData(String? productId) {
    emit(state.copyWith(barcodeReadData: productId));
  }

  void setIsCardFunctionalityDialogShown(bool isCardFunctionalityDialogShown) {
    emit(state.copyWith(isCardFunctionalityDialogShown: isCardFunctionalityDialogShown));
    if(isCardFunctionalityDialogShown == false) {
      setBarcodeReadData(null);
    }
  }

  void setCustomerIDDialogStatus(bool status) {
    emit(state.copyWith(isCustomerIDDialogShown: status));
    if(status == false) {
      setBarcodeReadData(null);
    }
  }
}

enum TransactionDetailsUpdateStatusEnum { initial, loading, success, error }

enum TransactionUpdateStatusEnum { initial, loading, success, error }

class Status {
  LoadingStatus loadingStatus = LoadingStatus.none;
  late String message;

  Status(this.loadingStatus, this.message);

  Status.fromJson(Map<String, dynamic> json) {
    loadingStatus = json['loadingStatus'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loadingStatus'] = this.loadingStatus;
    data['message'] = this.message;
    return data;
  }
}

enum LoadingStatus { initial, loading, success, error, conditionalError, none }

class LoaderStatus {
  int? isLoading;
  String? message;

  LoaderStatus(this.isLoading, this.message);

  LoaderStatus.fromJson(Map<String, dynamic> json) {
    isLoading = json['isLoading'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isLoading'] = this.isLoading;
    data['message'] = this.message;
    return data;
  }
}

class TransactionStatus {
  int? status;
  String? message = '';

  TransactionStatus(this.status, this.message);

  TransactionStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }

}
