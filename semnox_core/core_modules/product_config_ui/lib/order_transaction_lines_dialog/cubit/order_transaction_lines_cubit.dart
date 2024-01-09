import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';
import 'package:transaction_ui/models/transaction_lines_group.dart';
import 'order_transaction_lines_state.dart';

class OrderTransactionLinesCubit extends Cubit<OrderTransactionLinesState> {
  OrderTransactionLinesCubit() : super(const OrderTransactionLinesState());

  void shouldClearSearchFilter() {
    emit(state.copyWith(shouldClearSearchFilter: true));
  }

  void resetShouldClearSearchFilter() {
    emit(state.copyWith(shouldClearSearchFilter: false));
  }

  Future<void> initData(
      Map<String, List<TransactionLinesGroup>>?transactionLinesGroupsBySeat,
      {bool isClear = false}) async {
    try {
      List<String> seatNames = [];
      List<TransactionLinesGroup> transactionLinesGroup = [];
      Set<String> courses = {};
      Set<String> products = {};

      seatNames.add('All');
      transactionLinesGroupsBySeat?.keys.forEach((seatName) {
        seatNames.add(seatName);
      });

      courses.add('All');
      products.add('All');
      transactionLinesGroupsBySeat?.values.forEach((transactionLines) {
        for (var transactionLine in transactionLines) {
          if (transactionLine.lineStatus != "FULFILLED") {
            if (transactionLine.courseName != "") {
              courses.add(transactionLine.courseName);
            }
            products.add(transactionLine.productName);
            transactionLinesGroup.add(transactionLine);
          }
        }
      });

      if(isClear) {
        emit(state.copyWith(
            seats: [],
            course: [],
            products:[]));
      }

      emit(state.copyWith(
          seats: seatNames,
          course: courses.toList(),
          products: products.toList(),
          transactionLinesGroup: transactionLinesGroup));
    } catch (e) {}
  }

  Future<void> orderTransactionLines(List<TransactionLineDTO> transactionLines,{int?approverID}) async {
    try {
      var execContextBL = await ExecutionContextBuilder.build();
      var sysExecContext = execContextBL.getExecutionContext();
      var transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      var transactionResponse = await transactionDataBl.orderTransactionLines(transactionLines,approverID:approverID);
      emit(state.copyWith(
        transactionResponse: transactionResponse,
        isSuccess: true,
      ));
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
        statusMessage: errorString,
        loadingStatus: 0,
      ));
    } catch (error) {
      emit(state.copyWith(
        statusMessage: error.toString(),
        loadingStatus: 0,
      ));
    }
  }

  Future<void> filterTransactionData(
      Map<String, List<TransactionLinesGroup>> transactionLinesGroupsBySeat,
      String selectedSeatName,
      String selectedCourseName,
      String selectedProductName) async {
    List<TransactionLinesGroup>? transactionLinesGroup = [];
    List<TransactionLinesGroup>? selectedSeatGroup = [];
    List<TransactionLinesGroup>? selectedCourseGroup = [];
    List<TransactionLinesGroup>? selectedProductGroup = [];

    if (selectedSeatName == "All" && selectedCourseName == "All" && selectedProductName == "All") {
      initData(transactionLinesGroupsBySeat);
    } else {
      transactionLinesGroupsBySeat.values.forEach((transactionLines) {
        if (selectedSeatName != "All") {
          selectedSeatGroup.addAll(transactionLines.where((element) => selectedSeatName == element.seatName).toList());
        } else {
          selectedSeatGroup.addAll(transactionLines);
        }
      });

      selectedSeatGroup.forEach((element) {
        if (selectedProductName != 'All') {
          selectedProductGroup = selectedSeatGroup.where((element) => selectedProductName == element.productName).toList();
          if (selectedCourseName != 'All') {
            selectedCourseGroup = selectedProductGroup?.where((element) => selectedCourseName == element.courseName).toList();
          } else {
            selectedCourseGroup = selectedProductGroup;
          }
        } else {
          selectedProductGroup = selectedSeatGroup;
          if (selectedCourseName != 'All') {
            selectedCourseGroup = selectedProductGroup?.where((element) => selectedCourseName == element.courseName).toList();
          } else {
            selectedCourseGroup = selectedProductGroup;
          }
        }
      });

      transactionLinesGroup = selectedCourseGroup;
      emit(state.copyWith(transactionLinesGroup: transactionLinesGroup));
    }
  }

  Future<void> filterByProducts(
      Map<String, List<TransactionLinesGroup>> transactionLinesGroupsBySeat,
      String? selectedProductName) async {
    List<TransactionLinesGroup>? transactionLinesGroup = [];
    transactionLinesGroupsBySeat.values.forEach((transactionLines) {
      transactionLinesGroup.addAll(transactionLines.where((element) =>
          selectedProductName == element.productName));
    });
    emit(state.copyWith(transactionLinesGroup: transactionLinesGroup));
  }

  Future<void> filterBySeatNames(
      Map<String, List<TransactionLinesGroup>> transactionLinesGroupsBySeat,
      String? selectedSeatName) async {
    List<TransactionLinesGroup>? transactionLinesGroup = [];
    transactionLinesGroupsBySeat.values.forEach((transactionLines) {
      transactionLinesGroup.addAll(transactionLines.where((element) =>
      selectedSeatName == element.seatName));
    });
    emit(state.copyWith(transactionLinesGroup: transactionLinesGroup));
  }

  Future<void> filterByProductAndSeatNames(
      Map<String, List<TransactionLinesGroup>> transactionLinesGroupsBySeat,
      String? selectedProductName,
      String? selectedSeatName,) async {
    List<TransactionLinesGroup>? transactionLinesGroup = [];
    transactionLinesGroupsBySeat.values.forEach((transactionLines) {
      transactionLinesGroup.addAll(transactionLines.where((element) =>
      selectedProductName == element.productName ||
          selectedSeatName == element.seatName));
    });
    emit(state.copyWith(transactionLinesGroup: transactionLinesGroup));
  }

  Future<void> sortTransactionLines(int sortBy, bool isAscending) async {
    List<TransactionLinesGroup>? transactionLinesGroup = state.transactionLinesGroup;
    switch (sortBy) {
      case 1:
        transactionLinesGroup?.sort((a, b) => a.seatName.compareTo(b.seatName));
        break;
      case 2:
        transactionLinesGroup?.sort((a, b) => a.seatNumber.compareTo(b.seatNumber));
        break;
      case 3:
        transactionLinesGroup?.sort((a, b) => a.courseName.compareTo(b.courseName));
        break;
      case 4:
        transactionLinesGroup?.sort((a, b) => a.productName.compareTo(b.productName));
        break;
      case 5:
        transactionLinesGroup?.sort((a, b) => a.transactionLines.length.compareTo(b.transactionLines.length));
        break;
      case 6:
        transactionLinesGroup?.sort((a, b) => a.remarks.compareTo(b.remarks));
        break;
    }

    if (!isAscending) {
      transactionLinesGroup?.reversed.toList();
    }

    emit(state.copyWith(transactionLinesGroup: transactionLinesGroup));
  }

  void clear() {
    emit(state.copyWith(
      loadingStatus: -1,
      statusMessage: null,
      isSuccess: false,
      isError: false,
    ));
  }
}
