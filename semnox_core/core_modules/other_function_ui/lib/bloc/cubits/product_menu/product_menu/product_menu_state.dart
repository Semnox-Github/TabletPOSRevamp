import 'package:flutter/cupertino.dart';
import 'package:other_function_data/model/menu/menu_data.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:other_function_data/model/pos_machines/pos_machine_data.dart';
import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';

class ProductMenuState {
  ProductMenuState(
      {this.isLoading = false,
        this.isSuccess = false,
        this.isError = false,
        this.loaderMessage = '',
        this.statusMessage = '',
        this.isShowAll = false,
        this.menuPanelsDtoList = const [],
        this.filteredMenuPanelsDtoList = const [],
        this.selectedMenuPanelIndex,
        this.searchedValue = '',
        this.productContainerDtosMaps,
        this.productMenuResponse,
        this.searchTextController,
        this.searchTypesList = const [],
        this.selectedSearchType,
        this.searchCategoryList = const [],
        this.selectedSearchCategory,
        this.productContainerDtoList =  const[],
        this.filteredProductContainerDtoList = const[],
        this.categoryListStrings = const[],
        this.productTypeList = const[],
      this.menuDataList =const[],
      this.posMachineList =const[],
      this.filteredMenuDataList = const[],
      this.selectedMenuIndex,
      this.isSelectedPosMachineButton = false,
      this.selectedPosMachineIndex,
      this.menuPanelsCount,
      this.posMachineCount,
      this.defaultDateFormat = 'dd-MM-yyyy'});

  bool isLoading;
  bool isSuccess;
  bool isError;
  String loaderMessage;
  String statusMessage;
  List<MenuPanelsDto> menuPanelsDtoList;
  List<MenuPanelsDto> filteredMenuPanelsDtoList;
  int? selectedMenuPanelIndex;
  bool isShowAll;
  String? searchedValue;
  Map<int, ProductContainerDTO>? productContainerDtosMaps;
  ProductMenuResponse? productMenuResponse;
  TextEditingController? searchTextController;
  List<String> searchTypesList;
  String? selectedSearchType;
  List<String> searchCategoryList;
  String? selectedSearchCategory;
  List<ProductContainerDTO> productContainerDtoList;
  List<ProductContainerDTO> filteredProductContainerDtoList;
  List<String> categoryListStrings;
  List<String> productTypeList;
  List<PosMachineDate>? posMachineList;
  List<MenuDto>? menuDataList;
  List<MenuDto>? filteredMenuDataList;
  int? selectedMenuIndex;
  bool isSelectedPosMachineButton;
  int? selectedPosMachineIndex;
  int? posMachineCount;
  int? menuPanelsCount;
  String? defaultDateFormat;
      ProductMenuState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? loaderMessage,
    String? statusMessage,
    List<MenuPanelsDto>? menuPanelsDtoList,
    List<MenuPanelsDto>? filteredMenuPanelsDtoList,
    int? selectedMenuPanelIndex,
    bool? isShowAll,
    String? searchedValue,
    Map<int, ProductContainerDTO>? productContainerDtosMaps,
    ProductMenuResponse? productMenuResponse,
    TextEditingController? searchTextController,
    List<String>? searchTypesList,
    String? selectedSearchType,
    List<String>? searchCategoryList,
    String? selectedSearchCategory,
    List<ProductContainerDTO>? productContainerDtoList,
    List<ProductContainerDTO>? filteredProductContainerDtoList,
    List<String>? categoryListStrings,
    List<String>? productTypeList,
    List<PosMachineDate>? posMachineList,
    List<MenuDto>? menuDataList,
    List<MenuDto>? filteredMenuDataList,
    int? selectedMenuIndex,
    bool? isSelectedPosMachineButton,
    int? selectedPosMachineIndex,
        int? posMachineCount,
        int? menuPanelsCount,
    String? defaultDateFormat


  }) {
    return ProductMenuState(
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,
        loaderMessage: loaderMessage ?? this.loaderMessage,
        statusMessage: statusMessage ?? this.statusMessage,
        menuPanelsDtoList: menuPanelsDtoList ?? this.menuPanelsDtoList,
        filteredMenuPanelsDtoList:
        filteredMenuPanelsDtoList ?? this.filteredMenuPanelsDtoList,
        selectedMenuPanelIndex:
        selectedMenuPanelIndex ?? this.selectedMenuPanelIndex,
        isShowAll: isShowAll ?? this.isShowAll,
        searchedValue: searchedValue ?? this.searchedValue,
        productContainerDtosMaps:
        productContainerDtosMaps ?? this.productContainerDtosMaps,
        productMenuResponse: productMenuResponse ?? this.productMenuResponse,
        searchTextController:
        searchTextController ?? this.searchTextController,
        searchTypesList: searchTypesList ?? this.searchTypesList,
        selectedSearchType: selectedSearchType ?? this.selectedSearchType,
        searchCategoryList: searchCategoryList ?? this.searchCategoryList,
        selectedSearchCategory: selectedSearchCategory ?? this.selectedSearchCategory,
        productContainerDtoList: productContainerDtoList ?? this.productContainerDtoList,
        filteredProductContainerDtoList: filteredProductContainerDtoList ?? this.filteredProductContainerDtoList,
        categoryListStrings: categoryListStrings?? this.categoryListStrings,
        productTypeList: productTypeList ?? this.productTypeList,
        posMachineList: posMachineList?? this.posMachineList,
        menuDataList: menuDataList?? this.menuDataList,
        filteredMenuDataList: filteredMenuDataList?? this.filteredMenuDataList,
        selectedMenuIndex: selectedMenuIndex ?? this.selectedMenuIndex,
        isSelectedPosMachineButton: isSelectedPosMachineButton ?? this.isSelectedPosMachineButton,
        selectedPosMachineIndex: selectedPosMachineIndex ?? this.selectedPosMachineIndex,
        posMachineCount: posMachineCount ?? this.posMachineCount,
        menuPanelsCount: menuPanelsCount?? this.menuPanelsCount,
        defaultDateFormat: defaultDateFormat ?? this.defaultDateFormat
    );
  }
}
