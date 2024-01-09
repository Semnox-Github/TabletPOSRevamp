import 'package:flutter/cupertino.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';

class ChoosePanelState {
  ChoosePanelState(
      {this.isLoading = false,
      this.isSuccess = false,
      this.isError = false,
      this.loaderMessage = '',
      this.statusMessage = '',
      this.isShowAll = false,
      this.menuPanelsDtoList = const [],
      this.filteredMenuPanelsDtoList = const [],
      this.selectedMenuPanelIndex = 0,
      this.searchedValue = '',
      this.productContainerDtosMaps,
      this.productMenuResponse,
      this.searchTextController,
      this.searchTypesList = const [],
      this.selectedSearchType,
      this.searchCategoryList = const [],
      this.selectedSearchCategory});

  bool isLoading;
  bool isSuccess;
  bool isError;
  String loaderMessage;
  String statusMessage;
  List<MenuPanelsDto> menuPanelsDtoList;
  List<MenuPanelsDto> filteredMenuPanelsDtoList;
  int selectedMenuPanelIndex;
  bool isShowAll;
  String? searchedValue;
  Map<int, ProductContainerDTO>? productContainerDtosMaps;
  ProductMenuResponse? productMenuResponse;
  TextEditingController? searchTextController;
  List<String> searchTypesList;
  String? selectedSearchType;
  List<String> searchCategoryList;
  String? selectedSearchCategory;

  ChoosePanelState copyWith({
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
  }) {
    return ChoosePanelState(
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
        selectedSearchCategory: selectedSearchCategory ?? this.selectedSearchCategory
    );
  }
}
