import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_data/builder.dart';
import 'package:other_function_data/model/pos_machines/pos_machine_data.dart';
import 'package:other_function_data/model/pos_machines/product_menu_pos_machine_map_dto.dart';
import 'package:messages_data/builder.dart';
import 'choose_pos_machine_state.dart';

class ChoosePosMachineCubit extends Cubit<ChoosePosMachineState> {
  ChoosePosMachineCubit()
      : super(
      ChoosePosMachineState()); // here inside ChoosePosMachineState class,  some of the fields are already initialized

  List<PosMachineDate> _filteredPosMachineList = [];
  var _execContextBL;
  var _execContext;
  var _otherFunctionBL;
  List<ProductMenuPosMachineMapDto> _productMenuPosMachineMapList = [];
  ProductMenuPosMachineMapDto _defaultProductMenuPosMachineMapDto = ProductMenuPosMachineMapDto(
        id: -1,
        menuId: -1,
        pOSMachineId: -1,
        isActive: true,
        createdBy: null,
        creationDate: "0001-01-01T00:00:00",
        lastUpdatedBy: null,
        lastUpdatedDate: "0001-01-01T00:00:00",
        siteId: -1,
        masterEntityId: -1,
        synchStatus: false,
        guid: null,
        isChanged: true
  );

  void setInitialValues({required List<PosMachineDate> posMachineList,required int menuId}) {
    emit(state.copyWith(
        isLoading: false,
        isError: false,
        isSuccess: false,
        loaderMessage: '',
        posMachineList: posMachineList,
        selectedPosMachine:0,
        filteredPosMachineList: posMachineList,
        searchedValue: '',
    selectedMenuId: menuId));
  }

  void searchPos(String? searchedValue) {
    _filteredPosMachineList = (state.posMachineList ?? [])
        .where((element) => (element.pOSName?.toLowerCase() ?? '')
        .contains(searchedValue?.toLowerCase() ?? '') || (element.computerName?.toLowerCase() ?? '')
        .contains(searchedValue?.toLowerCase() ?? ''))
        .toList();
    emit(state.copyWith(
      searchedValue: searchedValue,
      filteredPosMachineList: _filteredPosMachineList,
    ));
  }

  void onSelectIndex(newState){
    emit(state.copyWith(
      selectedPosMachine: newState
    ));
  }

  void onSearchClear(){
    emit(state.copyWith(
      filteredPosMachineList: state.posMachineList??[],
    ));
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

Future<bool> addPosMachine() async {
  try {
    _startLoading(MessagesProvider.get("Please wait while we Adding POS Machine..."));
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL.getExecutionContext();
    _otherFunctionBL = await OtherFunctionDataBuilder.build(_execContext!);
   if(state.selectedPosMachine !=null){
     _productMenuPosMachineMapList = (state.filteredPosMachineList[state.selectedPosMachine??0].productMenuPosMachineMapDto??[]).toList(growable: true);
     _productMenuPosMachineMapList.add(_defaultProductMenuPosMachineMapDto.copyWith(
       menuId: state.selectedMenuId,
       pOSMachineId: state.filteredPosMachineList[state.selectedPosMachine??0].pOSMachineId??-1,
     ));
     await _otherFunctionBL.updatePosMachine(posMachineList: [state.filteredPosMachineList[state.selectedPosMachine??0].copyWith(productMenuPosMachineMapDto: _productMenuPosMachineMapList)]);
     emit(state.copyWith(
         isLoading: false,
         isSuccess: true,
         isError: false,
         statusMessage: ''));
     return true;
   }else{
     _onErrorState(
         "${MessagesProvider.get("Something went Wrong!")}");
     return false;
   }
  } on DioError catch (error) {
    _onErrorState(dioErrors(error));
    return false;
  }
  catch (err) {
    _onErrorState(
        "${MessagesProvider.get("Something went Wrong!")}: ${err.toString()}");
    return false;
  }
}

  void clearAllState() {
    emit(ChoosePosMachineState());
    setInitialValues(posMachineList: [], menuId: -1);
  }

  void resetLoaderStatus(){
    emit(state.copyWith(isLoading: false,isSuccess: false,isError: false));
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
