import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_data/builder.dart';
import 'package:other_function_data/model/menu/menu_data.dart';
import 'package:other_function_data/model/menu/menu_response.dart';
import 'package:messages_data/builder.dart';
import 'edit_product_menu_state.dart';

class EditProductMenuCubit extends Cubit<EditProductMenuState> {
  EditProductMenuCubit()
      : super(
            EditProductMenuState()); // here inside PanelsState class,  some of the fields are already initialized

  MenuResponse? _menuResponse;
  var _execContextBL;

  var _execContext;

  var _otherFunctionBL;
  MenuDto? _selectedMenuDto;

  void setInitialValues({bool? isActive}) {
    emit(state.copyWith(
        isLoading: false, isError: false, isSuccess: false, loaderMessage: '', isActive: isActive??false));
  }

  void resetValues() {
    emit(state.copyWith(
        isLoading: false, isError: false, isSuccess: false, loaderMessage: ''));
  }

  void _startLoading(String? loaderMessage) {
    emit(state.copyWith(
        isLoading: true,
        isSuccess: false,
        isError: false,
        loaderMessage: loaderMessage));
  }

  void _onErrorState(String? statusMessage) {
    emit(state.copyWith(
      isLoading: false,
      isSuccess: false,
      isError: true,
      statusMessage: statusMessage,
    ));
  }

  void resetLoaderStatus(){
    emit(state.copyWith(isLoading: false,isSuccess: false,isError: false));
  }

  // ["Order Sale", "Reservation", "Redemption"];
  // O,B,R ,
  String _getMenuType(String selectedDropDown) {
    switch (selectedDropDown) {
      case "Order Sale":
        return "O";
      case "Reservation":
        return "B";
      case "Redemption":
        return "R";
      default:
        return "O";
    }
  }

  Future<bool> saveProductMenuData(
      {required bool isNew, required MenuDto menuDto}) async {
    try {
      _startLoading(MessagesProvider.get("Please wait while we saving Menu..."));
      _execContextBL = await ExecutionContextBuilder.build();
      _execContext = _execContextBL.getExecutionContext();
      _otherFunctionBL = await OtherFunctionDataBuilder.build(_execContext!);
      Log.printMethodStart('saveProductMenuData()', 'Product menu Screen','ok');
      _menuResponse =
          await _otherFunctionBL.updateProductMenu(listOfMenuDto: [menuDto.copyWith(lastUpdatedBy: _execContext.userId)]);
      Log.printMethodEnd('saveProductMenuData()', 'Product menu Screen','ok');
      Log.printMethodReturn('saveProductMenuData() - done', 'Product menu Screen','ok');
      emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          isError: false,
          statusMessage: ''));
      return true;
    } on DioError catch (error) {
      _onErrorState(dioErrors(error));
      return false;
    } catch (err) {
      _onErrorState(
          "${MessagesProvider.get("Something went Wrong!")}: ${err.toString()}");
      return false;
    }
  }

  void clearAllState() {
    emit(EditProductMenuState());
  }

  void onClickActiveButton() {
    emit(state.copyWith(isActive: state.isActive = !state.isActive));
  }

  String dioErrors(DioError e) {
    switch (e.type) {
      case DioErrorType.cancel:
        return "Request cancelled";

      case DioErrorType.connectTimeout:
        return "Connection time out";

      case DioErrorType.receiveTimeout:
        return "Connection time out";

      case DioErrorType.response:
        return e.response?.data['data'] as String ?? '';

      case DioErrorType.sendTimeout:
        return "Connection time out";

      default:
        return "Please check your connection";
    }
  }
}
