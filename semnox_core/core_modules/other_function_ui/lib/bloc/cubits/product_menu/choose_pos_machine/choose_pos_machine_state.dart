import 'package:flutter/cupertino.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:other_function_data/model/pos_machines/pos_machine_data.dart';
import 'package:product_menu_data/models/product_menu_response.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';

class ChoosePosMachineState {
  ChoosePosMachineState(
      {this.isLoading = false,
        this.isSuccess = false,
        this.isError = false,
        this.loaderMessage = '',
        this.statusMessage = '',
        this.posMachineList = const [],
        this.filteredPosMachineList = const [],
        this.selectedPosMachine ,
        this.searchedValue = '',
        this.searchTextController,
      this.selectedMenuId});

  bool isLoading;
  bool isSuccess;
  bool isError;
  String loaderMessage;
  String statusMessage;
  List<PosMachineDate> posMachineList;
  List<PosMachineDate> filteredPosMachineList;
  int? selectedPosMachine;
  String? searchedValue;
  TextEditingController? searchTextController;
  int? selectedMenuId;

  ChoosePosMachineState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
    String? loaderMessage,
    String? statusMessage,
    List<PosMachineDate>? posMachineList,
    List<PosMachineDate>? filteredPosMachineList,
    int? selectedPosMachine,
    String? searchedValue,
    TextEditingController? searchTextController,
    int? selectedMenuId
  }) {
    return ChoosePosMachineState(
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        isError: isError ?? this.isError,
        loaderMessage: loaderMessage ?? this.loaderMessage,
        statusMessage: statusMessage ?? this.statusMessage,
      posMachineList: posMachineList ?? this.posMachineList,
        filteredPosMachineList:
        filteredPosMachineList ?? this.filteredPosMachineList,
        selectedPosMachine:
        selectedPosMachine ?? this.selectedPosMachine,
        searchedValue: searchedValue ?? this.searchedValue,
        searchTextController:
        searchTextController ?? this.searchTextController,
        selectedMenuId:selectedMenuId ?? this.selectedMenuId
    );
  }
}
