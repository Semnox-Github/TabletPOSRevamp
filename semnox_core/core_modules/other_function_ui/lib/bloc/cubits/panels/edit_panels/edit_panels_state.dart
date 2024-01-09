import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:master_data/models/category_container/category_container_dto.dart';
import 'package:master_data/models/product_type_container/product_type_container_dto.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';

class EditPanelsState {
  EditPanelsState(
      {this.isLoading = false,
      this.nameTextController,
      this.rowsCount = 1,
      this.columnsCount = 1,
      this.displayOrder = 0,
      this.cellMarginLeft = 0,
      this.cellMarginRight = 0,
      this.cellMarginBottom = 0,
      this.cellMarginTop = 0,
      this.isActiveCell = true,
      this.menuPanelsDtoList = const [],
      this.filteredMenuPanelsDtoList = const [],
      this.productContainerDtosMaps =  const {},
      this.redeemProductContainerDtosMaps = const {},
      this.productMenuResponse,
      this.isButtonTappedMode = false,
      this.backColor,
      this.textColor,
      this.fontDataInString,
      this.menuPanelsDto,
      this.modifiedMenuPanelsDto,
      this.selectedRowIndex = -1,
      this.selectedColumnIndex = -1,
      this.isSuccess = false,
      this.isError = false,
      this.loaderMessage = '',
      this.statusMessage = '',
      this.selectedDropDownButtonSize = 'Half',
      this.panelImage,
      this.productImage,
      this.categoryContainerDtoList = const [],
      this.productContainerDtoList = const [],
        this.allProductsContainerDtoList = const [],
      this.redeemProductContainerDtoList = const[],
      this.recentAddedProductName = '',
      this.isSaveCLicked = false,
      this.defaultButtonWidth = 138,
      this.defaultButtonHeight = 68,
      this.productTypeContainerList = const[]});

  bool isLoading;
  TextEditingController? nameTextController;
  int rowsCount;
  int columnsCount;
  int displayOrder;
  int cellMarginLeft;
  int cellMarginRight;
  int cellMarginTop;
  int cellMarginBottom;
  bool isActiveCell;
  Map<int, ProductContainerDTO>? productContainerDtosMaps;
  Map<int, ProductContainerDTO>? redeemProductContainerDtosMaps;
  ProductMenuResponse? productMenuResponse;
  List<MenuPanelsDto>? menuPanelsDtoList;
  List<MenuPanelsDto>? filteredMenuPanelsDtoList;
  bool isButtonTappedMode;
  String? backColor;
  String? textColor;
  String? fontDataInString;
  MenuPanelsDto? menuPanelsDto;
  MenuPanelsDto? modifiedMenuPanelsDto;
  int? selectedRowIndex;
  int? selectedColumnIndex;
  bool isSuccess;
  bool isError;
  String loaderMessage;
  String statusMessage;
  String selectedDropDownButtonSize;
  XFile? panelImage;
  XFile? productImage;
  List<CategoryContainerDTO> categoryContainerDtoList;
  List<ProductContainerDTO> productContainerDtoList;
  List<ProductContainerDTO> allProductsContainerDtoList;
      List<ProductContainerDTO> redeemProductContainerDtoList;
  String? recentAddedProductName;
  bool isSaveCLicked;
  double defaultButtonWidth;
  double defaultButtonHeight;
  List<ProductTypeContainerDto> productTypeContainerList;



      EditPanelsState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? loaderMessage,
    String? statusMessage,
    TextEditingController? nameTextController,
    int? rowsCount,
    int? displayOrder,
    int? columnsCount,
    int? cellMarginLeft,
    int? cellMarginRight,
    int? cellMarginTop,
    int? cellMarginBottom,
    bool? isActiveCell,
    Map<int, ProductContainerDTO>? productContainerDtosMaps,
        Map<int, ProductContainerDTO>? redeemProductContainerDtosMaps,
        ProductMenuResponse? productMenuResponse,
    List<MenuPanelsDto>? menuPanelsDtoList,
    List<MenuPanelsDto>? filteredMenuPanelsDtoList,
    bool? isButtonTappedMode,
    String? backColor,
    String? textColor,
    String? fontDataInString,
    MenuPanelsDto? menuPanelsDto,
    MenuPanelsDto? modifiedMenuPanelsDto,
    int? selectedRowIndex,
    int? selectedColumnIndex,
    String? selectedDropDownButtonSize,
    XFile? panelImage,
    XFile? productImage,
    List<CategoryContainerDTO>? categoryContainerDtoList,
    List<ProductContainerDTO>? productContainerDtoList,
        List<ProductContainerDTO>? redeemProductContainerDtoList,
        List<ProductContainerDTO>? allProductsContainerDtoList,
        String? recentAddedProductName,
    bool? isSaveCLicked,
    double? defaultButtonWidth,
    double? defaultButtonHeight,
        List<ProductTypeContainerDto>? productTypeContainerList,

      }) {
    return EditPanelsState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      loaderMessage: loaderMessage ?? this.loaderMessage,
      statusMessage: statusMessage ?? this.statusMessage,
      nameTextController: nameTextController ?? this.nameTextController,
      rowsCount: rowsCount ?? this.rowsCount,
      displayOrder: displayOrder ?? this.displayOrder,
      columnsCount: columnsCount ?? this.columnsCount,
      cellMarginLeft: cellMarginLeft ?? this.cellMarginLeft,
      cellMarginRight: cellMarginRight ?? this.cellMarginRight,
      cellMarginTop: cellMarginTop ?? this.cellMarginTop,
      cellMarginBottom: cellMarginBottom ?? this.cellMarginBottom,
      isActiveCell: isActiveCell ?? this.isActiveCell,
      menuPanelsDtoList: menuPanelsDtoList ?? this.menuPanelsDtoList,
      filteredMenuPanelsDtoList:
          filteredMenuPanelsDtoList ?? this.filteredMenuPanelsDtoList,
      productContainerDtosMaps:
          productContainerDtosMaps ?? this.productContainerDtosMaps,
        redeemProductContainerDtosMaps:
        redeemProductContainerDtosMaps ?? this.redeemProductContainerDtosMaps,
      productMenuResponse: productMenuResponse ?? this.productMenuResponse,
      isButtonTappedMode: isButtonTappedMode ?? this.isButtonTappedMode,
      backColor: backColor ?? this.backColor,
      textColor: textColor ?? this.textColor,
      fontDataInString: fontDataInString ?? this.fontDataInString,
      menuPanelsDto: menuPanelsDto ?? this.menuPanelsDto,
      modifiedMenuPanelsDto:
          modifiedMenuPanelsDto ?? this.modifiedMenuPanelsDto,
      selectedColumnIndex: selectedColumnIndex ?? this.selectedColumnIndex,
      selectedRowIndex: selectedRowIndex ?? this.selectedRowIndex,
      selectedDropDownButtonSize:
          selectedDropDownButtonSize ?? this.selectedDropDownButtonSize,
      panelImage: panelImage,
      productImage: productImage,
      categoryContainerDtoList:
          categoryContainerDtoList ?? this.categoryContainerDtoList,
      recentAddedProductName:
          recentAddedProductName ?? this.recentAddedProductName,
      productContainerDtoList:
          productContainerDtoList ?? this.productContainerDtoList,
        allProductsContainerDtoList: allProductsContainerDtoList ?? this.allProductsContainerDtoList,
        redeemProductContainerDtoList : redeemProductContainerDtoList ?? this.redeemProductContainerDtoList,
        isSaveCLicked: isSaveCLicked ?? this.isSaveCLicked,
        defaultButtonWidth: defaultButtonWidth?? this.defaultButtonWidth,
        defaultButtonHeight: defaultButtonHeight ?? this.defaultButtonHeight,
        productTypeContainerList: productTypeContainerList ?? this.productTypeContainerList
    );
  }
}
