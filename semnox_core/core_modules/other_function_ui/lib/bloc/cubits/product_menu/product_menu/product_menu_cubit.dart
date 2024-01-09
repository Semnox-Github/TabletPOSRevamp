import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_data/builder.dart';
import 'package:other_function_data/model/menu/menu_data.dart';
import 'package:other_function_data/model/menu/menu_response.dart';
import 'package:other_function_data/model/menu/product_menu_panel_mapping_dto.dart';
import 'package:other_function_data/model/pos_machines/pos_machine_data.dart';
import 'package:other_function_data/model/pos_machines/pos_machine_reponse.dart';
import 'package:other_function_data/model/pos_machines/product_menu_pos_machine_map_dto.dart';
import 'package:other_function_ui/bloc/cubits/product_menu/product_menu/product_menu_state.dart';
import 'package:messages_data/builder.dart';

class ProductMenuCubit extends Cubit<ProductMenuState> {
  ProductMenuCubit()
      : super(
            ProductMenuState()); // here inside ProductsState class,  some of the fields are already initialized
  MenuResponse? _menuResponse;
  POSMachineResponse? _posMachineResponse;
  List<MenuDto> _filteredMenuDtoLists = [];
  var _execContextBL;
  var _execContext;
  var _otherFunctionBL;
  List<PosMachineDate> _posMachineList  = [];
  List<ProductMenuPanelMappingDto> _productMenuPanelMappingDtoList = [];
  MenuDto? _menuDto ;
  List<ProductMenuPosMachineMapDto> _productMenuPosMachineMapList = [];
  var _masterDataBl;
  String _defaultDateFormat = 'dd-MM-yyyy';
  ProductMenuPanelMappingDto _productMenuPanelMappingDto = const  ProductMenuPanelMappingDto(
        id: -1,
        panelId: -1,
        menuId: -1,
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

  void setInitialValues() {}

  void resetValues() {
    emit(state.copyWith(
        isLoading: false, isError: false, isSuccess: false, loaderMessage: ''));
  }

  Future<bool> getInitialAPIs() async {
    try {
      _startLoading(MessagesProvider.get("Fetching product menu"));
       _execContextBL = await ExecutionContextBuilder.build();
       _execContext = _execContextBL.getExecutionContext();
       _masterDataBl = await MasterDataBuilder.build(_execContext);
       _otherFunctionBL =
          await OtherFunctionDataBuilder.build(_execContext!);
       Log.printMethodStart('getInitialAPIs()', 'Product Menu screen','init');
       _menuResponse = await _otherFunctionBL.getMenuDataList();
       Log.printMethodEnd('getInitialAPIs()', 'Product Menu screen','init');
       Log.printMethodReturn('getInitialAPIs() - done!', 'Product Menu screen','init');

       Log.printMethodStart('getPOSMachineList()', 'Product Menu screen','init');
      _posMachineResponse = await _otherFunctionBL.getPOSMachineList();
      Log.printMethodEnd('getPOSMachineList()', 'Product Menu screen','init');
      Log.printMethodReturn('getPOSMachineList() - done!', 'Product Menu screen','init');
      _filteredMenuDtoLists = (_menuResponse?.data??[]).where((element) => (element.isActive??false)).toList();
      _defaultDateFormat = await _masterDataBl.getDefaultValuesByName(
          defaultValueName: "DATE_FORMAT");

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        isError: false,
        defaultDateFormat: _defaultDateFormat,
        statusMessage: MessagesProvider.get("Successfully fetched product menu list."),
        posMachineList: _posMachineResponse?.data??[],
        menuDataList: _menuResponse?.data??[],
          filteredMenuDataList: _filteredMenuDtoLists
      ));
     try{ if(_filteredMenuDtoLists.isNotEmpty){
       _posMachineList=[];
       for ( PosMachineDate element in (state.posMachineList??[])) {
         for (ProductMenuPosMachineMapDto element2 in (element.productMenuPosMachineMapDto??[])) {
           if(state.filteredMenuDataList?[0].menuId == element2.menuId ){
             _posMachineList.add(element);
             break;
           }
         }
       }
       emit(state.copyWith(selectedMenuIndex: 0,posMachineCount: _posMachineList.length, menuPanelsCount: state.filteredMenuDataList?[0].productMenuPanelMappingDtoList?.length??0));

     }}catch(err){

     }
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

  void onSelectedMenu(newIndex){
    _posMachineList=[];
    if(newIndex != null){
      for ( PosMachineDate element in (state.posMachineList??[])) {
        for (ProductMenuPosMachineMapDto element2 in (element.productMenuPosMachineMapDto??[])) {
          if(state.filteredMenuDataList?[(newIndex??0)].menuId == element2.menuId ){
            _posMachineList.add(element);
            break;
          }
        }
      }
    }
    emit(state.copyWith(selectedMenuIndex: newIndex, posMachineCount: _posMachineList.length, menuPanelsCount: state.filteredMenuDataList?[newIndex].productMenuPanelMappingDtoList?.length??0));
  }

  void clickNextMenu(){
    // 12-1>11
    // print('${state.menuPanelsDtoList.length-1}, ${state.selectedMenuPanelIndex}' );
    if((state.filteredMenuDataList??[]).length-1 > (state.selectedMenuIndex??0)){
      emit(state.copyWith(selectedMenuIndex:(state.selectedMenuIndex??0)+1));
    }
  }

  void onSelectedMenuPanelUpdateIndex(newIndex){
    emit(state.copyWith(selectedMenuPanelIndex: newIndex));
  }

  void onSelectedPosMachineUpdateIndex(newIndex){
    emit(state.copyWith(selectedPosMachineIndex:newIndex));
  }

  void clickPrevMenu(){
    if((state.selectedMenuIndex??0) >0){
      emit(state.copyWith(selectedMenuIndex:(state.selectedMenuIndex??0)-1));
    }
  }

  void onSelectedShowAll() {
    if (!state.isShowAll) {
      emit(state.copyWith(
          filteredMenuDataList: state.menuDataList,
          isShowAll: true));
    } else {
      _filteredMenuDtoLists = (state.menuDataList ??[])
          .where((element) => element.isActive ?? false)
          .toList();
      emit(state.copyWith(
          filteredMenuDataList: _filteredMenuDtoLists,
          isShowAll: false));
    }
  }

  void onSelectPosMachineButton(){
    emit(state.copyWith(isSelectedPosMachineButton: true));
  }

  void onSelectPanelButton(){
    emit(state.copyWith(isSelectedPosMachineButton: false));
  }

  void _startLoading(String? loaderMessage) {
    emit(state.copyWith(
        isLoading: true,
        isSuccess: false,
        isError: false,
        loaderMessage: loaderMessage));
  }

  Future<bool> addMenuPanel(
      {required int panelId}) async {
    try {
      _startLoading(MessagesProvider.get("Please wait while we saving Menu..."));
      _execContextBL = await ExecutionContextBuilder.build();
      _execContext = _execContextBL.getExecutionContext();
      _otherFunctionBL = await OtherFunctionDataBuilder.build(_execContext!);
      _menuDto = state.filteredMenuDataList?[state.selectedMenuIndex??0];
      _productMenuPanelMappingDtoList = (_menuDto?.productMenuPanelMappingDtoList??[]).toList(growable: true);
      _productMenuPanelMappingDtoList.add(_productMenuPanelMappingDto.copyWith(
        menuId:_menuDto?.menuId??-1,
        panelId: panelId
      ));
      await _otherFunctionBL.updateProductMenu(listOfMenuDto: [_menuDto!.copyWith(productMenuPanelMappingDtoList: _productMenuPanelMappingDtoList)]);
      Log.printMethodStart('getMenuDataList()', 'Product Menu screen','add panel');
      _menuResponse = await _otherFunctionBL.getMenuDataList();
      Log.printMethodEnd('getMenuDataList()', 'Product Menu screen','add panel');
      Log.printMethodReturn('getMenuDataList() - done!', 'Product Menu screen','add panel');

      Log.printMethodStart('getPOSMachineList()', 'Product Menu screen','add panel');
      _posMachineResponse = await _otherFunctionBL.getPOSMachineList();
      Log.printMethodEnd('getPOSMachineList()', 'Product Menu screen','add panel');
      Log.printMethodReturn('getPOSMachineList() - done', 'Product Menu screen','add panel');
      _filteredMenuDtoLists = (_menuResponse?.data??[]).where((element) => (element.isActive??false)).toList();
      emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          isError: false,
          statusMessage: MessagesProvider.get("Successfully added menu panel"),
          posMachineList: _posMachineResponse?.data??[],
          menuDataList: _menuResponse?.data??[],
          filteredMenuDataList: _filteredMenuDtoLists
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

  Future<bool> deleteMenuPanel(
      {required int panelId}) async {
    try {
      _startLoading(MessagesProvider.get("Please wait while we deleting Menu Panel..."));
      _execContextBL = await ExecutionContextBuilder.build();
      _execContext = _execContextBL.getExecutionContext();
      _otherFunctionBL = await OtherFunctionDataBuilder.build(_execContext!);
      _menuDto = state.filteredMenuDataList?[state.selectedMenuIndex??0];
      _productMenuPanelMappingDtoList = (_menuDto?.productMenuPanelMappingDtoList??[]).toList(growable: true);
      _productMenuPanelMappingDtoList[_productMenuPanelMappingDtoList.indexWhere((element) => element.panelId == panelId)] = _productMenuPanelMappingDtoList[_productMenuPanelMappingDtoList.indexWhere((element) => element.panelId == panelId)].copyWith(
        isChanged: true,
        isActive: false
      );
      _menuResponse =
      await _otherFunctionBL.updateProductMenu(listOfMenuDto: [_menuDto!.copyWith(productMenuPanelMappingDtoList: _productMenuPanelMappingDtoList)]);
      Log.printMethodStart('getMenuDataList()', 'Product Menu screen','delete icon');
      _menuResponse = await _otherFunctionBL.getMenuDataList();
      Log.printMethodEnd('getMenuDataList()', 'Product Menu screen','delete icon');
      Log.printMethodReturn('getMenuDataList() - done!', 'Product Menu screen','delete icon');

      Log.printMethodStart('getPOSMachineList()', 'Product Menu screen','delete icon');
      _posMachineResponse = await _otherFunctionBL.getPOSMachineList();
      Log.printMethodEnd('getPOSMachineList()', 'Product Menu screen','delete icon');
      Log.printMethodReturn('getPOSMachineList() - done!', 'Product Menu screen','delete icon');
      _filteredMenuDtoLists = (_menuResponse?.data??[]).where((element) => (element.isActive??false)).toList();

      emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          isError: false,
          statusMessage: MessagesProvider.get("Successfully deleted menu panel"),
          posMachineList: _posMachineResponse?.data??[],
          menuDataList: _menuResponse?.data??[],
          filteredMenuDataList: _filteredMenuDtoLists
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

  Future<bool> deleteMenu() async {
    try {
      _startLoading(MessagesProvider.get("Please wait while we deactivating Menu..."));
      _execContextBL = await ExecutionContextBuilder.build();
      _execContext = _execContextBL.getExecutionContext();
      _otherFunctionBL = await OtherFunctionDataBuilder.build(_execContext!);
      _menuDto = state.filteredMenuDataList?[state.selectedMenuIndex??0];
      _menuResponse =
      await _otherFunctionBL.updateProductMenu(listOfMenuDto: [_menuDto!.copyWith(isActive: false, isChanged: true)]);
      Log.printMethodStart('getMenuDataList()', 'Product Menu screen','delete');
      _menuResponse = await _otherFunctionBL.getMenuDataList();
      Log.printMethodEnd('getMenuDataList()', 'Product Menu screen','delete');
      Log.printMethodReturn('getMenuDataList() - done!', 'Product Menu screen','delete');

      Log.printMethodStart('getPOSMachineList()', 'Product Menu screen','delete');
      _posMachineResponse = await _otherFunctionBL.getPOSMachineList();
      Log.printMethodEnd('getPOSMachineList()', 'Product Menu screen','delete');
      Log.printMethodReturn('getPOSMachineList() - done!', 'Product Menu screen','delete');
      _filteredMenuDtoLists = (_menuResponse?.data??[]).where((element) => (element.isActive??false)).toList();

      emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          isError: false,
          statusMessage: MessagesProvider.get("Successfully deactivated menu"),
          posMachineList: _posMachineResponse?.data??[],
          menuDataList: _menuResponse?.data??[],
          filteredMenuDataList: _filteredMenuDtoLists
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

  Future<bool> deletePosMachine({required PosMachineDate posMachineData}) async {
    try {
      _startLoading(MessagesProvider.get("Please wait while we deleting POS Machine..."));
      _execContextBL = await ExecutionContextBuilder.build();
      _execContext = _execContextBL.getExecutionContext();
       _otherFunctionBL = await OtherFunctionDataBuilder.build(_execContext!);
        _productMenuPosMachineMapList = (posMachineData.productMenuPosMachineMapDto??[]).toList(growable: true);
        _productMenuPosMachineMapList[_productMenuPosMachineMapList.indexWhere((element) => element.menuId == state.filteredMenuDataList?[state.selectedMenuIndex??0].menuId)] = _productMenuPosMachineMapList[_productMenuPosMachineMapList.indexWhere((element) => element.menuId == state.filteredMenuDataList?[state.selectedMenuIndex??0].menuId)].copyWith(
          isChanged: true,
          isActive: false
        );

        await _otherFunctionBL.updatePosMachine(posMachineList: [posMachineData.copyWith(productMenuPosMachineMapDto: _productMenuPosMachineMapList)]);


      Log.printMethodStart('getMenuDataList()', 'Product Menu screen','delete');
      _menuResponse = await _otherFunctionBL.getMenuDataList();
      Log.printMethodEnd('getMenuDataList()', 'Product Menu screen','delete');
      Log.printMethodReturn('getMenuDataList() - done', 'Product Menu screen','delete');

      Log.printMethodStart('getPOSMachineList()', 'Product Menu screen','delete');
      _posMachineResponse = await _otherFunctionBL.getPOSMachineList();
      Log.printMethodEnd('getPOSMachineList()', 'Product Menu screen','delete');
      Log.printMethodReturn('getPOSMachineList() - done', 'Product Menu screen','delete');
      _filteredMenuDtoLists = (_menuResponse?.data??[]).where((element) => (element.isActive??false)).toList();

      emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          isError: false,
          statusMessage: MessagesProvider.get('Successfully deleted POS Machine'),
          posMachineList: _posMachineResponse?.data??[],
          menuDataList: _menuResponse?.data??[],
          filteredMenuDataList: _filteredMenuDtoLists
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

  void _onErrorState(String? statusMessage) {
    emit(state.copyWith(
      isLoading: false,
      isSuccess: false,
      isError: true,
      statusMessage: statusMessage,
    ));
  }

  void clearAllState() {
    emit(ProductMenuState());
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
