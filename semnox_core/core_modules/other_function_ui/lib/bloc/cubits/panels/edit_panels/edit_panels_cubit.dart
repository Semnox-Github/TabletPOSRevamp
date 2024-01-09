import 'dart:io';

import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/category_container/category_container_dto.dart';
import 'package:master_data/models/product_type_container/product_type_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_data/builder.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_response.dart';
import 'package:other_function_data/model/menu_panel/product_menu_panel_content_dto.dart';
import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'edit_panels_state.dart';

class EditPanelsCubit extends Cubit<EditPanelsState> {
  EditPanelsCubit()
      : super(
            EditPanelsState()); // here inside Balance_transfer class,  some of the fields are already initialized
  int _quantity = 1;
  MenuPanelsDto? _modifiedMenuPanelsDto;
  MenuPanelsResponse? _menuPanelsResponse;
  ProductMenuPanelContentDto? _productMenuPanelContentDto;
  String _productName = '';
  var _execContextBL ;
  var _execContext ;
  var _otherFunctionBL;
  var _masterDataBl;

  List<ProductMenuPanelContentDto> _productMenuPanelContentDtoList = [];
  ProductMenuPanelContentDto _defaultProductMenuPanelContentDto =
      ProductMenuPanelContentDto(
          id: -1,
          panelId: -1,
          objectType: "",
          objectGuid: '',
          rowIndex: -1,
          columnIndex: -1,
          imageURL: '',
          buttonType: 'S',
          textColor: '',
          font: '',
          isActive: true,
          createdBy: '',
          creationDate: '',
          lastUpdatedBy: '',
          lastUpdatedDate: '',
          siteId: -1,
          masterEntityId: -1,
          synchStatus: false,
          guid: '',
          isChanged: true);

  void initialState() async{
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL.getExecutionContext();
    _masterDataBl = await MasterDataBuilder.build(_execContext!);
    print("buttonHeight pre");
    String? buttonHeight =  await _masterDataBl.getDefaultValuesByName(defaultValueName: "PRODUCT_MENU_BUTTON_HEIGHT");
    print("buttonHeight $buttonHeight");
    String? buttonWidth =  await _masterDataBl.getDefaultValuesByName(defaultValueName: "PRODUCT_MENU_BUTTON_WIDTH");
    emit(state.copyWith(
      isSaveCLicked: false,
        isButtonTappedMode: false,
        isLoading: false,
        cellMarginLeft: state.modifiedMenuPanelsDto?.cellMarginLeft ?? 2,
        cellMarginRight: state.modifiedMenuPanelsDto?.cellMarginRight ?? 2,
        cellMarginTop: state.modifiedMenuPanelsDto?.cellMarginTop ?? 2,
        cellMarginBottom: state.modifiedMenuPanelsDto?.cellMarginBottom ?? 2,
        rowsCount: state.modifiedMenuPanelsDto?.rowCount,
        columnsCount: state.modifiedMenuPanelsDto?.columnCount,
        displayOrder: state.modifiedMenuPanelsDto?.displayOrder,
        defaultButtonHeight: double.parse(buttonHeight??"68"),
        defaultButtonWidth: double.parse(buttonWidth??"138"),
        nameTextController: TextEditingController(
            text: state.modifiedMenuPanelsDto?.name ?? '')));
  }

  void updateRowsTextFieldState(int? newState) {
    try {
      bool isExistsRow = false;
      _quantity = newState??1;
      for (ProductMenuPanelContentDto element
          in (state.menuPanelsDto?.productMenuPanelContentDTOList ?? [])) {
        if ((element.rowIndex ?? 0) == (_quantity ?? 0)) {
          isExistsRow = true;
        }
      }
      if (!isExistsRow) {
        _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
        if(_quantity <=2){
          _quantity = 1;
        }
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          rowCount: _quantity,
        );
        emit(state.copyWith(
            rowsCount: _quantity,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
      }
    } catch (err) {}
  }

  void decrementRowsCount() {
    try {
      bool isExistsRow = false;
      for (ProductMenuPanelContentDto element
          in (state.menuPanelsDto?.productMenuPanelContentDTOList ?? [])) {
        if (element.rowIndex == state.rowsCount - 1) {
          isExistsRow = true;
        }
      }
      if (isExistsRow) {
        if(_quantity <=2){
          _quantity = 1;
        }
        emit(state.copyWith(rowsCount: state.rowsCount));
      } else {

        _quantity = state.rowsCount;
        _quantity--;
        _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
        if(_quantity <=2){
          _quantity = 1;
        }
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          rowCount: _quantity,
        );
        emit(state.copyWith(
            rowsCount: _quantity,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
      }
    } catch (err) {}
  }

  void incrementRowsCount() {
    try {
      _quantity = state.rowsCount;
      _quantity++;
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
        rowCount: _quantity,
      );
      emit(state.copyWith(
          rowsCount: _quantity, modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  void updateColumnsTextFieldState(int? newState) {
    try {
      bool isExistsColumn = false;
      _quantity = newState??1;
      for (ProductMenuPanelContentDto element
          in (state.menuPanelsDto?.productMenuPanelContentDTOList ?? [])) {
        if ((element.columnIndex ?? 0) == (_quantity ?? 0)) {
          isExistsColumn = true;
        }
      }
      if (!isExistsColumn) {
        _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
        if((_quantity??1) <=2){
          _quantity = 1;
        }
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          columnCount: _quantity,
        );
        emit(state.copyWith(
            columnsCount: _quantity,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
      }
    } catch (err) {}
  }

  void decrementColumnsCount() {
    try {
      bool isExistsColumn = false;
      for (ProductMenuPanelContentDto element
          in (state.menuPanelsDto?.productMenuPanelContentDTOList ?? [])) {
        if (element.columnIndex == state.columnsCount - 1) {
          isExistsColumn = true;
        }
      }
      if (isExistsColumn) {
        if(_quantity <=2){
          _quantity = 1;
        }
        emit(state.copyWith(columnsCount: state.columnsCount));
      } else {
        _quantity = state.columnsCount;
        _quantity--;
        _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
        if(_quantity <=2){
          _quantity = 1;
        }
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          columnCount: _quantity,
        );
        emit(state.copyWith(
            columnsCount: _quantity,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
      }
    } catch (err) {}
  }

  void incrementColumnsCount() {
    try {
      _quantity = state.columnsCount;
      _quantity++;
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
        columnCount: _quantity,
      );
      emit(state.copyWith(
          columnsCount: _quantity,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  void updateDisplayOrderTextFieldState(int? newState) {
    emit(state.copyWith(displayOrder: newState ?? 0));
    try {
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
        displayOrder: newState,
      );
      emit(state.copyWith(
          displayOrder: newState,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  void updateCellMarginLeftTextFieldState(int? newState) {
    try {
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
        cellMarginLeft: newState,
      );
      emit(state.copyWith(
          cellMarginLeft: newState,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  void decrementCellMarginLeftCount() {
    try {
      if (state.cellMarginLeft <= 0) {
        emit(state.copyWith(cellMarginLeft: 0));
      } else {
        _quantity = state.cellMarginLeft;
        _quantity--;
        _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          cellMarginLeft: _quantity,
        );
        emit(state.copyWith(
            cellMarginLeft: _quantity,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
      }
    } catch (err) {}
  }

  void incrementCellMarginLeftCount() {
    try {
      _quantity = state.cellMarginLeft;
      _quantity++;

      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
        cellMarginLeft: _quantity,
      );
      emit(state.copyWith(
          cellMarginLeft: _quantity,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  //
  void updateCellMarginRightTextFieldState(int? newState) {
    try {
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
        cellMarginRight: newState,
      );
      emit(state.copyWith(
          cellMarginRight: newState,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  void decrementCellMarginRightCount() {
    try {
      if (state.cellMarginRight <= 0) {
        emit(state.copyWith(cellMarginRight: 0));
      } else {
        _quantity = state.cellMarginRight;
        _quantity--;
        _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          cellMarginRight: _quantity,
        );
        emit(state.copyWith(
            cellMarginRight: _quantity,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
      }
    } catch (err) {}
  }

  void incrementCellMarginRightCount() {
    try {
      _quantity = state.cellMarginRight;
      _quantity++;
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
        cellMarginRight: _quantity,
      );
      emit(state.copyWith(
          cellMarginRight: _quantity,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  //CellMarginTop
  void updateCellMarginTopTextFieldState(int? newState) {
    try {
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
        cellMarginTop: newState,
      );
      emit(state.copyWith(
          cellMarginTop: newState,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  void decrementCellMarginTopCount() {
    try {
      if (state.cellMarginTop <= 0) {
        emit(state.copyWith(cellMarginTop: 0));
      } else {
        _quantity = state.cellMarginTop;
        _quantity--;
        _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          cellMarginTop: _quantity,
        );
        emit(state.copyWith(
            cellMarginTop: _quantity,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
      }
    } catch (err) {}
  }

  void incrementCellMarginTopCount() {
    try {
      _quantity = state.cellMarginTop;
      _quantity++;
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
        cellMarginTop: _quantity,
      );
      emit(state.copyWith(
          cellMarginTop: _quantity,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  //CellMarginBottom
  void updateCellMarginBottomTextFieldState(int? newState) {
    try {
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
        cellMarginBottom: newState,
      );
      emit(state.copyWith(
          cellMarginBottom: newState,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  void decrementCellMarginBottomCount() {
    try {
      if (state.cellMarginBottom <= 0) {
        emit(state.copyWith(cellMarginBottom: 0));
      } else {
        _quantity = state.cellMarginBottom;
        _quantity--;
        _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          cellMarginBottom: _quantity,
        );
        emit(state.copyWith(
            cellMarginBottom: _quantity,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
      }
    } catch (err) {}
  }

  void incrementCellMarginBottomCount() {
    try {
      _quantity = state.cellMarginBottom;
      _quantity++;
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
        cellMarginBottom: _quantity,
      );
      emit(state.copyWith(
          cellMarginBottom: _quantity,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  void onClickActive() {
    try {
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      if (_modifiedMenuPanelsDto?.isActive ?? false) {
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          isActive: false,
        );
      } else {
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          isActive: true,
        );
      }
      emit(state.copyWith(
          isActiveCell: state.isActiveCell = !state.isActiveCell,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  void getMapOfProductContainerDetails({required
  Map<int, ProductContainerDTO>? productListsMaps, required  Map<int, ProductContainerDTO>? redeemProductsMaps} ) {
    List<ProductContainerDTO> productContainerDtoList = [];
    (productListsMaps ?? {}).forEach((key, value) {
      productContainerDtoList.add(value);
    });
     List<ProductContainerDTO> redeemProductContainerDtoList = [];
    (redeemProductsMaps ?? {}).forEach((key, value) {
      redeemProductContainerDtoList.add(value);
    });

   final Map<int,ProductContainerDTO> allProductsMap =  {...(productListsMaps??{}), ...(redeemProductsMaps??{})};
    List<ProductContainerDTO> allProductsList = [];
    (allProductsMap ?? {}).forEach((key, value) {
      allProductsList.add(value);
    });

    emit(state.copyWith(
        productContainerDtosMaps: productListsMaps,
        redeemProductContainerDtosMaps: redeemProductsMaps,
        productContainerDtoList: productContainerDtoList,
        redeemProductContainerDtoList:redeemProductContainerDtoList,
        allProductsContainerDtoList: allProductsList
    ));
  }

  void getProductContainerDetails(ProductMenuResponse? productMenuResponse) {
    emit(state.copyWith(productMenuResponse: productMenuResponse));
  }

  void getMenuPanelsData(List<MenuPanelsDto>? menuPanelsData) {
    emit(state.copyWith(menuPanelsDtoList: menuPanelsData));
  }

  void onButtonTappedChangeMode(
      {required int rowIndex,
      required int columnIndex,
      String? backColor,
      String? textColor}) {
    _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
    _productMenuPanelContentDtoList =
        (_modifiedMenuPanelsDto?.productMenuPanelContentDTOList ?? [])
            .toList(growable: true);
    int indexOfSelected = _productMenuPanelContentDtoList.indexWhere(
        (element) =>
            element.rowIndex == rowIndex && element.columnIndex == columnIndex);
    if (indexOfSelected != -1) {
      _productMenuPanelContentDto =
          _productMenuPanelContentDtoList[indexOfSelected];
      if (rowIndex == state.selectedRowIndex &&
          columnIndex == state.selectedColumnIndex) {
        emit(state.copyWith(
            isButtonTappedMode: state.isButtonTappedMode =
                !state.isButtonTappedMode,
            selectedRowIndex: rowIndex,
            selectedColumnIndex: columnIndex,
            fontDataInString: _productMenuPanelContentDto?.font,
            backColor: _productMenuPanelContentDto?.backColor,
            textColor: _productMenuPanelContentDto?.textColor,
            selectedDropDownButtonSize:
                getButtonTypeString(_productMenuPanelContentDto?.buttonType)));
      } else if (!state.isButtonTappedMode) {
        emit(state.copyWith(
            isButtonTappedMode: state.isButtonTappedMode =
                !state.isButtonTappedMode,
            selectedRowIndex: rowIndex,
            selectedColumnIndex: columnIndex,
            fontDataInString: _productMenuPanelContentDto?.font,
            backColor: _productMenuPanelContentDto?.backColor,
            textColor: _productMenuPanelContentDto?.textColor,
            selectedDropDownButtonSize:
                getButtonTypeString(_productMenuPanelContentDto?.buttonType)));
      } else {
        emit(state.copyWith(
            selectedRowIndex: rowIndex,
            selectedColumnIndex: columnIndex,
            fontDataInString: _productMenuPanelContentDto?.font,
            backColor: _productMenuPanelContentDto?.backColor,
            textColor: _productMenuPanelContentDto?.textColor,
            selectedDropDownButtonSize:
                getButtonTypeString(_productMenuPanelContentDto?.buttonType)));
      }
    } else {
      if (rowIndex == state.selectedRowIndex &&
          columnIndex == state.selectedColumnIndex) {
        emit(state.copyWith(
          isButtonTappedMode: state.isButtonTappedMode =
              !state.isButtonTappedMode,
          selectedRowIndex: rowIndex,
          selectedColumnIndex: columnIndex,
        ));
      } else if (!state.isButtonTappedMode) {
        emit(state.copyWith(
          isButtonTappedMode: state.isButtonTappedMode =
              !state.isButtonTappedMode,
          selectedRowIndex: rowIndex,
          selectedColumnIndex: columnIndex,
        ));
      } else {
        emit(state.copyWith(
          selectedRowIndex: rowIndex,
          selectedColumnIndex: columnIndex,
        ));
      }
    }
  }

  void onUpdateBackColor(newColor) {
    _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
    _productMenuPanelContentDtoList =
        (_modifiedMenuPanelsDto?.productMenuPanelContentDTOList ?? [])
            .toList(growable: true);
    int indexOfSelected = _productMenuPanelContentDtoList.indexWhere(
        (element) =>
            element.rowIndex == state.selectedRowIndex &&
            element.columnIndex == state.selectedColumnIndex);
    if (indexOfSelected != -1) {
      _productMenuPanelContentDtoList[indexOfSelected] =
          _productMenuPanelContentDtoList[indexOfSelected]
              .copyWith(backColor: newColor);
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
      emit(state.copyWith(
          backColor: newColor, modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } else {
      _productMenuPanelContentDtoList
          .add(_defaultProductMenuPanelContentDto.copyWith(
        rowIndex: state.selectedRowIndex,
        columnIndex: state.selectedColumnIndex,
        backColor: newColor,
        isChanged: true,
      ));
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
      emit(state.copyWith(
          backColor: newColor, modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    }
  }

  void onUpdateTextColor(newColor) {
    _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
    _productMenuPanelContentDtoList =
        (_modifiedMenuPanelsDto?.productMenuPanelContentDTOList ?? [])
            .toList(growable: true);
    int indexOfSelected = _productMenuPanelContentDtoList.indexWhere(
        (element) =>
            element.rowIndex == state.selectedRowIndex &&
            element.columnIndex == state.selectedColumnIndex);
    if (indexOfSelected != -1) {
      _productMenuPanelContentDtoList[indexOfSelected] =
          _productMenuPanelContentDtoList[indexOfSelected]
              .copyWith(textColor: newColor);
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
      emit(state.copyWith(
          textColor: newColor, modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } else {
      _productMenuPanelContentDtoList
          .add(_defaultProductMenuPanelContentDto.copyWith(
        rowIndex: state.selectedRowIndex,
        columnIndex: state.selectedColumnIndex,
        textColor: newColor,
        isChanged: true,
      ));
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
      emit(state.copyWith(
          textColor: newColor, modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    }
  }

  void onSelectProduct({String? guidId, String? productType}) {
    _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
    _productMenuPanelContentDtoList =
        (_modifiedMenuPanelsDto?.productMenuPanelContentDTOList ?? [])
            .toList(growable: true);
    int indexOfSelected = _productMenuPanelContentDtoList.indexWhere(
        (element) =>
            element.rowIndex == state.selectedRowIndex &&
            element.columnIndex == state.selectedColumnIndex);
    if (indexOfSelected != -1) {
      _productMenuPanelContentDtoList[indexOfSelected] =
          _productMenuPanelContentDtoList[indexOfSelected]
              .copyWith(objectGuid: guidId ?? '', objectType: productType);
      _productName = getProductName(guidId);
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
      emit(state.copyWith(modifiedMenuPanelsDto: _modifiedMenuPanelsDto, recentAddedProductName: _productName));
    } else {
      _productMenuPanelContentDtoList
          .add(_defaultProductMenuPanelContentDto.copyWith(
        rowIndex: state.selectedRowIndex,
        columnIndex: state.selectedColumnIndex,
        objectGuid: guidId ?? '',
        objectType: productType,
        isChanged: true,
      ));
      _productName = getProductName(guidId);
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
      emit(state.copyWith(modifiedMenuPanelsDto: _modifiedMenuPanelsDto,recentAddedProductName: _productName));
    }
  }

  void onSelectPanel({String? guidId, String? productType}) {
    _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
    _productMenuPanelContentDtoList =
        (_modifiedMenuPanelsDto?.productMenuPanelContentDTOList ?? [])
            .toList(growable: true);
    int indexOfSelected = _productMenuPanelContentDtoList.indexWhere(
        (element) =>
            element.rowIndex == state.selectedRowIndex &&
            element.columnIndex == state.selectedColumnIndex);
    if (indexOfSelected != -1) {
      _productMenuPanelContentDtoList[indexOfSelected] =
          _productMenuPanelContentDtoList[indexOfSelected]
              .copyWith(objectGuid: guidId ?? '', objectType: productType);
      _productName =  getPanelName(guidId);
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
      emit(state.copyWith(modifiedMenuPanelsDto: _modifiedMenuPanelsDto, recentAddedProductName: _productName));
    } else {
      _productMenuPanelContentDtoList
          .add(_defaultProductMenuPanelContentDto.copyWith(
        rowIndex: state.selectedRowIndex,
        columnIndex: state.selectedColumnIndex,
        objectGuid: guidId ?? '',
        objectType: productType,
        isChanged: true,
      ));
      _productName =  getPanelName(guidId);

      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
      emit(state.copyWith(modifiedMenuPanelsDto: _modifiedMenuPanelsDto, recentAddedProductName: _productName));
    }
  }

  String getButtonType(buttonFormat) {
    switch (buttonFormat) {
      case "Half":
        return 'S';
      case "Normal":
        return 'N';
      case "Large":
        return 'L';
      default:
        return 'S';
    }
  }

  String getButtonTypeString(buttonFormat) {
    switch (buttonFormat) {
      case "S":
        return 'Half';
      case "N":
        return 'Normal';
      case "L":
        return 'Large';
      default:
        return 'Half';
    }
  }

  void onSelectButtonType({required String buttonString}) {
    String buttonType = getButtonType(buttonString);
    _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
    _productMenuPanelContentDtoList =
        (_modifiedMenuPanelsDto?.productMenuPanelContentDTOList ?? [])
            .toList(growable: true);
    List<String> mergedButtons = [];

    if (buttonString == "Normal") {
      mergedButtons.add(
          '${(state.selectedRowIndex ?? 0)}-${(state.selectedColumnIndex ?? 0) + 1}');
    } else if (buttonString == "Large") {
      mergedButtons.add(
          '${(state.selectedRowIndex ?? 0)}-${(state.selectedColumnIndex ?? 0) + 1}');
      mergedButtons.add(
          '${(state.selectedRowIndex ?? 0) + 1}-${(state.selectedColumnIndex ?? 0) + 0}');
      mergedButtons.add(
          '${(state.selectedRowIndex ?? 0) + 1}-${(state.selectedColumnIndex ?? 0) + 1}');
    }

    bool _isMergedOccupied = false;

    for (String element1 in mergedButtons) {
      bool isBrokeInnerLoop = false;
      for (ProductMenuPanelContentDto element2
          in _productMenuPanelContentDtoList) {
        if (int.parse(element1.split("-")[0]) == element2.rowIndex &&
            int.parse(element1.split("-")[1]) == element2.columnIndex) {
          // print("${int.parse(element1.split("-")[0])}, ${element2.rowIndex} && ,${int.parse(element1.split("-")[1])}, ${element2.columnIndex}");
          _isMergedOccupied = true;
          isBrokeInnerLoop = true;
          break;
        }
      }
      if (isBrokeInnerLoop) {
        break;
      }
    }
    if (!_isMergedOccupied) {
      int indexOfSelected = _productMenuPanelContentDtoList.indexWhere(
          (element) =>
              element.rowIndex == state.selectedRowIndex &&
              element.columnIndex == state.selectedColumnIndex);
      if (indexOfSelected != -1) {
        _productMenuPanelContentDtoList[indexOfSelected] =
            _productMenuPanelContentDtoList[indexOfSelected]
                .copyWith(buttonType: buttonType ?? '');
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
            productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
        emit(state.copyWith(
            selectedDropDownButtonSize: buttonString,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
      } else {
        _productMenuPanelContentDtoList
            .add(_defaultProductMenuPanelContentDto.copyWith(
          rowIndex: state.selectedRowIndex,
          columnIndex: state.selectedColumnIndex,
          buttonType: buttonType,
          isChanged: true,
        ));
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
            productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
        emit(state.copyWith(
            selectedDropDownButtonSize: buttonString,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
      }
    } else {
      //Todo: shownotification
    }
  }

  void onFontDataStringUpdate(String? newState) {
    if (newState != null || (newState ?? '').isNotEmpty) {
      String updatedString = '';
      List<String> splitString = newState!.split(",");
      List<String> styleString = [];
      styleString = splitString[2].split("=")[1].split(" ");
      updatedString =
          '${splitString[0]}, ${splitString[1]}, style=${styleString[0]}, ${styleString[2]}';
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _productMenuPanelContentDtoList =
          (_modifiedMenuPanelsDto?.productMenuPanelContentDTOList ?? [])
              .toList(growable: true);
      int indexOfSelected = _productMenuPanelContentDtoList.indexWhere(
          (element) =>
              element.rowIndex == state.selectedRowIndex &&
              element.columnIndex == state.selectedColumnIndex);
      if (indexOfSelected != -1) {
        _productMenuPanelContentDtoList[indexOfSelected] =
            _productMenuPanelContentDtoList[indexOfSelected].copyWith(
          font: updatedString ?? '',
        );
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
            productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
        emit(state.copyWith(
            fontDataInString: updatedString,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
      } else {
        _productMenuPanelContentDtoList
            .add(_defaultProductMenuPanelContentDto.copyWith(
          rowIndex: state.selectedRowIndex,
          columnIndex: state.selectedColumnIndex,
          font: updatedString ?? '',
          isChanged: true,
        ));
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
            productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
        emit(state.copyWith(
            fontDataInString: updatedString,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
      }
    }
  }

  void onSelectMenuPanelsData(MenuPanelsDto menuPanelDtoState) {
    emit(state.copyWith(
        menuPanelsDto: menuPanelDtoState,
        modifiedMenuPanelsDto: menuPanelDtoState));
  }

  void onViewEditPanel(String? guidId ) {
    try{if (guidId != null) {
      for (MenuPanelsDto element in (state.menuPanelsDtoList ?? [])) {
        if (element.guid.toString() ==guidId.toString()) {
          _modifiedMenuPanelsDto = element;
        }
      }
    }
    emit(state.copyWith(
        modifiedMenuPanelsDto: _modifiedMenuPanelsDto,
        menuPanelsDto: _modifiedMenuPanelsDto,
        isButtonTappedMode: false,
        isLoading: false,
        cellMarginLeft: _modifiedMenuPanelsDto?.cellMarginLeft ?? 2,
        cellMarginRight: _modifiedMenuPanelsDto?.cellMarginRight ?? 2,
        cellMarginTop: _modifiedMenuPanelsDto?.cellMarginTop ?? 2,
        cellMarginBottom: _modifiedMenuPanelsDto?.cellMarginBottom ?? 2,
        rowsCount: _modifiedMenuPanelsDto?.rowCount,
        columnsCount: _modifiedMenuPanelsDto?.columnCount,
        displayOrder: _modifiedMenuPanelsDto?.displayOrder,
        selectedRowIndex: -1,
        selectedColumnIndex: -2,
        nameTextController: TextEditingController(
            text: _modifiedMenuPanelsDto?.name ?? '')));}catch(err){

    }catch(err){

    }
  }

  void onClickNewPanel(MenuPanelsDto menuPanelsDto){
    try{
          _modifiedMenuPanelsDto = menuPanelsDto;

    emit(state.copyWith(
        modifiedMenuPanelsDto: _modifiedMenuPanelsDto,
        menuPanelsDto: _modifiedMenuPanelsDto,
        isButtonTappedMode: false,
        isLoading: false,
        cellMarginLeft: _modifiedMenuPanelsDto?.cellMarginLeft ?? 2,
        cellMarginRight: _modifiedMenuPanelsDto?.cellMarginRight ?? 2,
        cellMarginTop: _modifiedMenuPanelsDto?.cellMarginTop ?? 2,
        cellMarginBottom: _modifiedMenuPanelsDto?.cellMarginBottom ?? 2,
        rowsCount: _modifiedMenuPanelsDto?.rowCount,
        columnsCount: _modifiedMenuPanelsDto?.columnCount,
        displayOrder: _modifiedMenuPanelsDto?.displayOrder,
        selectedRowIndex: -1,
        selectedColumnIndex: -2,
        nameTextController: TextEditingController(
            text: _modifiedMenuPanelsDto?.name ?? '')));}catch(err){

    }catch(err){

    }
  }

  void onSelectEditPanelButton() {
    _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
    _productMenuPanelContentDtoList =
        _modifiedMenuPanelsDto?.productMenuPanelContentDTOList ?? [];
    int indexOfSelected = _productMenuPanelContentDtoList.indexWhere(
        (element) =>
            element.rowIndex == state.selectedRowIndex &&
            element.columnIndex == state.selectedColumnIndex);
    if (indexOfSelected != -1) {
      for (MenuPanelsDto element in (state.menuPanelsDtoList ?? [])) {
        if (element.guid.toString() ==
            _productMenuPanelContentDtoList[indexOfSelected]
                .objectGuid
                .toString()) {
          _modifiedMenuPanelsDto = element;
        }
      }
    }
    emit(state.copyWith(
        modifiedMenuPanelsDto: _modifiedMenuPanelsDto,
        menuPanelsDto: _modifiedMenuPanelsDto,
        isButtonTappedMode: false,
        isLoading: false,
        cellMarginLeft: _modifiedMenuPanelsDto?.cellMarginLeft ?? 2,
        cellMarginRight: _modifiedMenuPanelsDto?.cellMarginRight ?? 2,
        cellMarginTop: _modifiedMenuPanelsDto?.cellMarginTop ?? 2,
        cellMarginBottom: _modifiedMenuPanelsDto?.cellMarginBottom ?? 2,
        rowsCount: _modifiedMenuPanelsDto?.rowCount,
        columnsCount: _modifiedMenuPanelsDto?.columnCount,
        displayOrder: _modifiedMenuPanelsDto?.displayOrder,
        selectedRowIndex: -1,
        selectedColumnIndex: -2,
        nameTextController: TextEditingController(
            text: _modifiedMenuPanelsDto?.name ?? '')));
  }

  void onPanelImageSelect(
      {required XFile panelImage, required String fileName}) {
    try {
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
        imageURL: fileName,
      );
      emit(state.copyWith(
          panelImage: panelImage,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } catch (err) {}
  }

  void onProductImageSelect({required XFile productImage}) async {
    emit(state.copyWith(productImage: productImage));
    _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
    _productMenuPanelContentDtoList =
        (_modifiedMenuPanelsDto?.productMenuPanelContentDTOList ?? [])
            .toList(growable: true);
    int indexOfSelected = _productMenuPanelContentDtoList.indexWhere(
        (element) =>
            element.rowIndex == state.selectedRowIndex &&
            element.columnIndex == state.selectedColumnIndex);
     _execContextBL = await ExecutionContextBuilder.build();
     _execContext = _execContextBL.getExecutionContext();
     _masterDataBl = await MasterDataBuilder.build(_execContext!);
    final uploadimg = await _masterDataBl.uploadImage(
      binaryImage: File(productImage?.path ?? '').readAsBytesSync(),
      fileName:
          '${_productMenuPanelContentDtoList[indexOfSelected].objectGuid ?? ''}.png',
    );

    if (indexOfSelected != -1) {
      _productMenuPanelContentDtoList[indexOfSelected] =
          _productMenuPanelContentDtoList[indexOfSelected].copyWith(
              imageURL:
                  '${_productMenuPanelContentDtoList[indexOfSelected].objectGuid ?? ''}.png');
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
      emit(state.copyWith(
          productImage: productImage,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    } else {
      _productMenuPanelContentDtoList
          .add(_defaultProductMenuPanelContentDto.copyWith(
        rowIndex: state.selectedRowIndex,
        columnIndex: state.selectedColumnIndex,
        imageURL:
            '${_productMenuPanelContentDtoList[indexOfSelected].objectGuid ?? ''}.png',
        isChanged: true,
      ));
      _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
          productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
      emit(state.copyWith(
          productImage: productImage,
          modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    }
  }



  String getProductName(String? guidId) {
    try {
      _productName = '';
      for (ProductContainerDTO element in state.productContainerDtoList) {
        if (element.guid.toString() == guidId.toString()) {
          _productName = element.productName;
        }
      }

      return _productName ?? '';
    } catch (err) {
      return _productName ?? '';
    }
  }

  String getPanelName(String? guidId) {
    try {
      _productName = '';
      for (MenuPanelsDto element in (state.menuPanelsDtoList??[])) {
        if (element.guid.toString() == guidId.toString()) {
          _productName = element.name??'';
        }
      }

      return _productName ?? '';
    } catch (err) {
      return _productName ?? '';
    }
  }

  void onPanelImageClear() {
    emit(state.copyWith(panelImage: null));
  }

  void onProductImageClear() {
    emit(state.copyWith(productImage: null));
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

  Future<bool> saveMenuPanelsData() async {
    try {
      _startLoading(MessagesProvider.get("Please wait while we saving panel..."));
       _execContextBL = await ExecutionContextBuilder.build();
       _execContext = _execContextBL.getExecutionContext();
       _otherFunctionBL =
          await OtherFunctionDataBuilder.build(_execContext!);
      if( (state.nameTextController?.text??'').isNotEmpty){
        _menuPanelsResponse =
        await _otherFunctionBL.updateMenuPanels(listOfMenuPanelsDto: [
          state.modifiedMenuPanelsDto!
              .copyWith(name: state.nameTextController?.text ?? '')
        ]);
        _modifiedMenuPanelsDto = _menuPanelsResponse?.data?.first;
        _menuPanelsResponse = await _otherFunctionBL.getMenuPanelsData();
        emit(state.copyWith(
            menuPanelsDtoList: _menuPanelsResponse?.data,
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto,
            isLoading: false,
            isSuccess: true,
            isError: false,
            isSaveCLicked : true,
            statusMessage:(state.recentAddedProductName??'').isNotEmpty?'${state.recentAddedProductName} Added successfully': "Updated Successfully."));
        //         "${MessagesProvider.get("'&1' added to '&2' successfully.",['${state.recentAddedProductName}','${state.nameTextController?.text}'])}":
        // "${MessagesProvider.get("&1 updated successfully.",['${state.nameTextController??''}'])}"));
        return true;
      }else{
        emit(state.copyWith(
            menuPanelsDtoList: _menuPanelsResponse?.data,
            isLoading: false,
            isSuccess: false,
            isError: true,
            statusMessage:MessagesProvider.get('Please enter valid value for name')));
        return false;
      }

    } on DioError catch (error) {
      _onErrorState(dioErrors(error));
      return false;
    } catch (err) {
      _onErrorState(
          "${MessagesProvider.get("Something went Wrong!")}: ${err.toString()}");
      return false;
    }
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

  void updateCategoryAndProductTypeContainerList(List<CategoryContainerDTO> categoryList,List<ProductTypeContainerDto> productTypeList) {
    emit(state.copyWith(categoryContainerDtoList: categoryList,productTypeContainerList: productTypeList ));

  }

  void resetLoaderStatus(){
    emit(state.copyWith(isLoading: false,isSuccess: false,isError: false));
  }

  void onClickClearProduct()async {
    // _defaultProductMenuPanelContentDto
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL.getExecutionContext();
    try{
      _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
      _productMenuPanelContentDtoList =
          (_modifiedMenuPanelsDto?.productMenuPanelContentDTOList ?? [])
              .toList(growable: true);
      int indexOfSelected = _productMenuPanelContentDtoList.indexWhere(
              (element) =>
          element.rowIndex == state.selectedRowIndex &&
              element.columnIndex == state.selectedColumnIndex);
      if (indexOfSelected != -1) {
        _productMenuPanelContentDtoList[indexOfSelected] =
            _productMenuPanelContentDtoList[indexOfSelected].copyWith(
                    objectType: _productMenuPanelContentDtoList[indexOfSelected].objectType,
                    objectGuid: _productMenuPanelContentDtoList[indexOfSelected].guid,
                    imageURL: '',
                    buttonType: 'S',
                    textColor: '',
                    font: '',
                    isActive: true,
                    createdBy: _execContext.userId??'',
                    masterEntityId: -1,
                    synchStatus: false,
                   isChanged: true
            );
        _modifiedMenuPanelsDto = _modifiedMenuPanelsDto?.copyWith(
            productMenuPanelContentDTOList: _productMenuPanelContentDtoList);
        emit(state.copyWith(
            modifiedMenuPanelsDto: _modifiedMenuPanelsDto));
    }
  }catch(err){
    }
  }
}
