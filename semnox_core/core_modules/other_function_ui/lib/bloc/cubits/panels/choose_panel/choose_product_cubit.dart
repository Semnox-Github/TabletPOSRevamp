import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_response.dart';
import 'choose_product_state.dart';

class ChoosePanelCubit extends Cubit<ChoosePanelState> {
  ChoosePanelCubit()
      : super(
      ChoosePanelState()); // here inside PanelsState class,  some of the fields are already initialized

  MenuPanelsResponse? _menuPanelsResponse;
  List<MenuPanelsDto> _filteredMenuPanelsDtoList = [];

  void setInitialValues({required List<MenuPanelsDto> menuPanelsDtoList}) {
    emit(state.copyWith(
        isLoading: false,
        isError: false,
        isSuccess: false,
        loaderMessage: '',
        menuPanelsDtoList: menuPanelsDtoList,
        selectedMenuPanelIndex:0,
        filteredMenuPanelsDtoList: menuPanelsDtoList,
        isShowAll: false,
        searchedValue: ''));
  }

  void searchPanels(String? searchedValue) {
    _filteredMenuPanelsDtoList = (state.menuPanelsDtoList ?? [])
        .where((element) => (element.name?.toLowerCase() ?? '')
        .contains(searchedValue?.toLowerCase() ?? ''))
        .toList();
    emit(state.copyWith(
      searchedValue: searchedValue,
      filteredMenuPanelsDtoList: _filteredMenuPanelsDtoList,
    ));
  }

  void onSearchClear(){

    emit(state.copyWith(
      filteredMenuPanelsDtoList: state.menuPanelsDtoList??[],
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



  void clearAllState() {
    emit(ChoosePanelState());
    setInitialValues(menuPanelsDtoList: []);
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
