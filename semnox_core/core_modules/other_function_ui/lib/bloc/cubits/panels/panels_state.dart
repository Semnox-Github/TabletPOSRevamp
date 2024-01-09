import 'package:master_data/models/category_container/category_container_dto.dart';
import 'package:master_data/models/product_type_container/product_type_container_dto.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';

class PanelsState {
  PanelsState(
      {this.isLoading = false,
      this.isSuccess = false,
      this.isPrimaryCardApplied = false,
      this.isError = false,
      this.loaderMessage = '',
      this.statusMessage = '',
      this.isShowAll = false,
      this.menuPanelsDtoList = const [],
      this.filteredMenuPanelsDtoList = const [],
      this.selectedMenuPanelIndex = 0,
      this.searchedValue = '',
      this.productContainerDtosMaps = const{},
      this.redeemProductContainerDtosMaps = const{},
      this.productMenuResponse,
        this.categoryContainerList = const[],
      this.productTypeContainerList = const[]});

  bool isLoading;

  bool isSuccess;

  bool isError;

  String loaderMessage;
  bool isPrimaryCardApplied;
  String statusMessage;
  List<MenuPanelsDto> menuPanelsDtoList;
  List<MenuPanelsDto> filteredMenuPanelsDtoList;
  int selectedMenuPanelIndex;
  bool isShowAll;
  String? searchedValue;
  Map<int, ProductContainerDTO> productContainerDtosMaps;
  Map<int, ProductContainerDTO> redeemProductContainerDtosMaps;
  ProductMenuResponse? productMenuResponse;
  List<CategoryContainerDTO> categoryContainerList;
  List<ProductTypeContainerDto> productTypeContainerList;

  PanelsState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? loaderMessage,
    bool? isPrimaryCardApplied,
    String? statusMessage,
    List<MenuPanelsDto>? menuPanelsDtoList,
    List<MenuPanelsDto>? filteredMenuPanelsDtoList,
    int? selectedMenuPanelIndex,
    bool? isShowAll,
    String? searchedValue,
    Map<int, ProductContainerDTO>? productContainerDtosMaps,
    Map<int, ProductContainerDTO>? redeemProductContainerDtosMaps,
    ProductMenuResponse? productMenuResponse,
    List<CategoryContainerDTO>? categoryContainerList,
    List<ProductTypeContainerDto>? productTypeContainerList,

  }) {
    return PanelsState(
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,
        loaderMessage: loaderMessage ?? this.loaderMessage,
        isPrimaryCardApplied: isPrimaryCardApplied ?? this.isPrimaryCardApplied,
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
        redeemProductContainerDtosMaps: redeemProductContainerDtosMaps ?? this.redeemProductContainerDtosMaps,
        productMenuResponse: productMenuResponse ?? this.productMenuResponse,
        categoryContainerList: categoryContainerList ?? this.categoryContainerList,
        productTypeContainerList: productTypeContainerList ?? this.productTypeContainerList);
  }
}
