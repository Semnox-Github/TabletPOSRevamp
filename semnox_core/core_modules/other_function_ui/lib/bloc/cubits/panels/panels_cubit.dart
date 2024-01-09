import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/category_container/category_container_dto.dart';
import 'package:master_data/models/category_container/category_container_response.dart';
import 'package:master_data/models/product_type_container/product_type_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_data/builder.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_response.dart';
import 'package:other_function_ui/bloc/cubits/panels/panels_state.dart';
import 'package:product_menu_data/builder.dart';
import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:messages_data/builder.dart';

class PanelsCubit extends Cubit<PanelsState> {
  PanelsCubit()
      : super(
            PanelsState()); // here inside PanelsState class,  some of the fields are already initialized

  MenuPanelsResponse? _menuPanelsResponse;
  List<CategoryContainerDTO> _categoryContainerDtoList = [];
  List<MenuPanelsDto> _filteredMenuPanelsDtoList = [];
  List<ProductTypeContainerDto> _productContainerDtoList = [];

  void setInitialValues() {
    emit(state.copyWith(
        isLoading: false,
        isError: false,
        isSuccess: false,
        loaderMessage: '',
        menuPanelsDtoList: [],
        selectedMenuPanelIndex:0,
        filteredMenuPanelsDtoList: [],
        isShowAll: false,
        searchedValue: ''));
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

  void onSelectedPanel(newIndex) {
    emit(state.copyWith(selectedMenuPanelIndex: newIndex));
  }



  void clickNextMenu(){
    // 12-1>11
    // print('${state.menuPanelsDtoList.length-1}, ${state.selectedMenuPanelIndex}' );
    if(state.filteredMenuPanelsDtoList.length-1 > state.selectedMenuPanelIndex){
      emit(state.copyWith(selectedMenuPanelIndex:state.selectedMenuPanelIndex+1));
    }
  }

  void clickPrevMenu(){
    if(state.selectedMenuPanelIndex >0){
      emit(state.copyWith(selectedMenuPanelIndex:state.selectedMenuPanelIndex-1));
    }
  }

  Future<bool> deleteMenuPanel() async{
    {
      try {
        _startLoading(MessagesProvider.get("Please wait while we deactivating panel..."));
        final execContextBL = await ExecutionContextBuilder.build();
        final execContext = execContextBL.getExecutionContext();
        final otherFunctionBL =
            await OtherFunctionDataBuilder.build(execContext!);
        Log.printMethodStart('updateMenuPanels()', 'Panel screen','delete');
        _menuPanelsResponse =
            await otherFunctionBL.updateMenuPanels(listOfMenuPanelsDto: [
              state.filteredMenuPanelsDtoList[state.selectedMenuPanelIndex].copyWith(isActive:false)
        ]);
        Log.printMethodEnd('updateMenuPanels()', 'Panel screen','delete');
        Log.printMethodReturn('updateMenuPanels() - done!', 'Panel screen','delete');
        _menuPanelsResponse = await otherFunctionBL.getMenuPanelsData();
        if(!state.isShowAll){
          _filteredMenuPanelsDtoList = (_menuPanelsResponse?.data ?? [])
              .where((element) => element.isActive ?? false)
              .toList();
        }

        emit(state.copyWith(
            menuPanelsDtoList: _menuPanelsResponse?.data??[],
            isLoading: false,
            isSuccess: true,
            isError: false,
            selectedMenuPanelIndex: 0,
            filteredMenuPanelsDtoList:!state.isShowAll? _filteredMenuPanelsDtoList:_menuPanelsResponse?.data??[],
            statusMessage:
            "${state.filteredMenuPanelsDtoList[state.selectedMenuPanelIndex].name} ${MessagesProvider.get("Deactivated Successfully")}"));
        return true;
      } on DioError catch (error) {
        _onErrorState(_dioErrors(error));
        return false;
      } catch (err) {
        _onErrorState(
            "${MessagesProvider.get("Something went Wrong!")}: ${err
                .toString()}");
        return false;
      }
    }
  }

  void onSelectedShowAll() {
    if (!state.isShowAll) {
      emit(state.copyWith(
          filteredMenuPanelsDtoList: state.menuPanelsDtoList,
          isShowAll: true));
    } else {
      _filteredMenuPanelsDtoList = (_menuPanelsResponse?.data ?? [])
          .where((element) => element.isActive ?? false)
          .toList();
      emit(state.copyWith(
          filteredMenuPanelsDtoList: _filteredMenuPanelsDtoList,
          isShowAll: false));
    }
  }

  void searchMenuPanels(String? searchedValue) {
    _filteredMenuPanelsDtoList = (_menuPanelsResponse?.data ?? [])
        .where((element) => (element.name?.toLowerCase() ?? '')
            .contains(searchedValue?.toLowerCase() ?? ''))
        .toList();
    emit(state.copyWith(
      selectedMenuPanelIndex: 0,
      searchedValue: searchedValue,
      filteredMenuPanelsDtoList: _filteredMenuPanelsDtoList,
    ));
  }

  void clearSearchTextField() {
    emit(state.copyWith(
      searchedValue: '',
      filteredMenuPanelsDtoList: state.menuPanelsDtoList.where((element) => element.isActive ?? false)
          .toList(),
    ));
  }


  Future<bool> getMenuPanelsData() async {
    try {
      _startLoading(MessagesProvider.get("Fetching Menu Panels"));
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final otherFunctionBL =
          await OtherFunctionDataBuilder.build(execContext!);
      Log.printMethodStart('getMenuPanelsData()', 'Panel screen','init');
      _menuPanelsResponse = await otherFunctionBL.getMenuPanelsData();
      Log.printMethodEnd('getMenuPanelsData()', 'Panel screen','init');
      Log.printMethodReturn('getMenuPanelsData() - done!', 'Panel screen','init');
      try{
        _categoryContainerDtoList = await getCategoryContainerList() ;
        _productContainerDtoList = await getProductTypeContainerList();
      }catch(err){
        _onErrorState(
            "${MessagesProvider.get("Something went Wrong!")}: ${err.toString()}");
        return false;
      }
      _filteredMenuPanelsDtoList = (_menuPanelsResponse?.data ?? [])
          .where((element) => element.isActive ?? false)
          .toList();
      emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          isError: false,
          menuPanelsDtoList: _menuPanelsResponse?.data ?? [],
          filteredMenuPanelsDtoList: _filteredMenuPanelsDtoList,
        categoryContainerList: _categoryContainerDtoList,
          productTypeContainerList: _productContainerDtoList,
      ));
      return true;
    } on DioError catch (error) {
      _onErrorState(_dioErrors(error));
      return false;
    }
  catch (err) {
      _onErrorState(
          "${MessagesProvider.get("Something went Wrong!")}: ${err.toString()}");
      return false;
    }
  }


  Future<List<CategoryContainerDTO>> getCategoryContainerList() async {
      final execContextBL = await ExecutionContextBuilder.build();
      final execContext = execContextBL.getExecutionContext();
      final masterDataBl =
      await MasterDataBuilder.build(execContext!);
      final CategoryContainerResponse? getCategoryContainerResponse = await masterDataBl.getCategoryContainer();
      return getCategoryContainerResponse?.data?.categoryContainerDTOList??[];
  }


  Future<List<ProductTypeContainerDto>> getProductTypeContainerList() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final masterDataBl =
    await MasterDataBuilder.build(execContext!);
    final List<ProductTypeContainerDto> getProductTypeContainerList = await masterDataBl.getProductTypeContainerList();
    return getProductTypeContainerList;
  }

  Future<bool> getProductContainerDetails()async{
    try {
      _startLoading(MessagesProvider.get("Fetching Menu Panels"));
      var execContextBL = await ExecutionContextBuilder.build();
      var execContextDTO = execContextBL.getExecutionContext();
      var productMenuDataBl = await ProductMenuDataBuilder.build(
          execContextDTO!);
      Log.printMethodStart('getProductMenu()', 'Panel screen','init');
      final ProductMenuResponse? productMenuResponse = productMenuDataBl.getProductMenu();
      Log.printMethodEnd('getProductMenu()', 'Panel screen','init');
      Log.printMethodReturn('getProductMenu()', 'Panel screen','init');
      Map<int, ProductContainerDTO>? productListsMaps =
      await productMenuDataBl.getMapOfProductContainerDetails();
      Map<int, ProductContainerDTO>? redeemProductListsMap =
      await productMenuDataBl.getMapOfRedeemProductContainerDetails();
      emit(state.copyWith(productMenuResponse:productMenuResponse, productContainerDtosMaps: productListsMaps, redeemProductContainerDtosMaps: redeemProductListsMap));
      return true;
    } on DioError catch (error) {
      _onErrorState(_dioErrors(error));
      return false;
    } catch (err) {
      _onErrorState(
          "${MessagesProvider.get("Something went Wrong!")}: ${err.toString()}");
      return false;
    }
  }


  void clearAllState() {
    emit(PanelsState());
    setInitialValues();
  }

  String _dioErrors(DioError e) {
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
