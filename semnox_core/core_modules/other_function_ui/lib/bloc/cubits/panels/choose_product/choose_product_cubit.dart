import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_data/models/category_container/category_container_dto.dart';
import 'package:master_data/models/product_type_container/product_type_container_dto.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'choose_product_state.dart';

class ChooseProductCubit extends Cubit<ChooseProductState> {
  ChooseProductCubit()
      : super(
            ChooseProductState()); // here inside PanelsState class,  some of the fields are already initialized

  List<ProductContainerDTO>? _filteredProductContainerDtoList = [];
  List<String> _categoryLists = [];
  List<String> _productTypeList = [
    "LOYALTY",
    "LOCKER_RETURN",
    "MANUAL",
    "BOOKINGS",
    "EXCESSVOUCHERVALUE",
    "COMBO",
    "CASHREFUND",
    "GAMEPLAYTRXPRODUCT",
    "EXTERNAL POS",
    "RENTAL_RETURN",
    "RENTAL",
    "REFUND",
    "DESPOSIT",
    "INVENTORYINTERSTORE",
    "ATTRACTION",
    "GAMETIME",
    "CARDDEPOSIT",
    "ACHIEVEMENTS",
    "CARDSALE",
    "LOCKERDEPOSIT",
    "VARIABLECARD",
    "LOADTICKETS",
    "GAMEPLAYCREDITS",
    "CHECKIN",
    "CREDITCARDSURCHARGE",
    "VOUCHER",
    "NEW",
    "GENERICSALE",
    "REFUNDCARDDEPOSIT",
    "RECHARGE",
    "CHECK-OUT",
    "LOCKER",
    "SERVICECHARGE",
    "GRATUITY",
    "REDEEMLOYALTY"
  ];

  List<String> _mainProductType = [
    "ALL",
    "SELLABLE",
    "REDEEMABLE",
    "INVENTORY"
  ];

  void setInitialValues(
      {required List<ProductContainerDTO> sellableProductsContainerDtoList,
        required List<ProductContainerDTO> redeemableProductsContainerDtoList,
        required List<ProductContainerDTO> allProductsContainerDtoList,
      required List<CategoryContainerDTO> categoryLists, 
      required List<ProductTypeContainerDto> productTypeList}) {
    _categoryLists = categoryLists.map((e) => (e.name ?? '')).toList();
    final List<String> productTypeStringsList = productTypeList.map((e) => (e.productType??'')).toList();
    emit(state.copyWith(
        sellableProductsContainerDtoList: sellableProductsContainerDtoList,
        redeemProductsContainerDtoList: redeemableProductsContainerDtoList,
        allProductsContainerDtoList: allProductsContainerDtoList,
        filteredProductContainerDtoList: sellableProductsContainerDtoList,
        categoryListStrings: _categoryLists,
        productTypeList:productTypeStringsList.isNotEmpty? productTypeStringsList: _productTypeList,
    mainProductType: _mainProductType));
  }

  void resetValues() {
    emit(state.copyWith(
        isLoading: false, isError: false, isSuccess: false, loaderMessage: ''));
  }

  void onSelectProduct(newIndex) {
    emit(state.copyWith(selectedMenuPanelIndex: newIndex));
  }

  void onSelectSearchType(newState){
    emit(state.copyWith(selectedSearchType: newState));
  }

  void onSelectCategory(newState){
    emit(state.copyWith(selectedSearchCategory: newState));
  }

  void onProductTypeSelected(newState){
    emit(state.copyWith(selectedMainProductType: newState));
  }

  List<ProductContainerDTO> _productsByType(){
    switch(state.selectedMainProductType){
      case "ALL":
        return state.allProductsContainerDtoList;
      case "SELLABLE":
        return state.sellableProductsContainerDtoList;
      case "REDEEMABLE":
        return state.redeemProductsContainerDtoList;
      case "INVENTORY" :
        return state.allProductsContainerDtoList;
      default:
        return state.allProductsContainerDtoList;
    }
  }

  void onClickSearchButton({required String searchedValue,required List<CategoryContainerDTO> categoryContainerList}){
    if(searchedValue !=null || (searchedValue??'').isNotEmpty ){
      _filteredProductContainerDtoList = _productsByType()
          .where((element) => (element.productName?.toLowerCase() ?? '')
          .contains(searchedValue.toString().toLowerCase() ?? ''))
          .toList();
    }
    if(state.selectedSearchType != null ||(state.selectedSearchType??'').isNotEmpty){
      _filteredProductContainerDtoList = _filteredProductContainerDtoList?.where((element) => (element.productType.toLowerCase()??'') == state.selectedSearchType?.toLowerCase()).toList();

    }
    if(state.selectedSearchCategory != null ||(state.selectedSearchCategory??'').isNotEmpty) {
      _filteredProductContainerDtoList = _filteredProductContainerDtoList?.where((element) => (element.categoryId) ==getCategoryId(categoryName:state.selectedSearchCategory??'', categoryContainerList: categoryContainerList)).toList();
    }
    emit(state.copyWith(
      searchedValue: searchedValue??'',
      filteredProductContainerDtoList: _filteredProductContainerDtoList,
    ));
  }
  //
 int getCategoryId({required List<CategoryContainerDTO> categoryContainerList,required  String  categoryName}){
    categoryContainerList = categoryContainerList.where((element) => element.name == categoryName).toList();
    if(categoryContainerList.isNotEmpty){
      return categoryContainerList[0].categoryId??-1;
    }else{
      return -1;
    }
  }

  void onSearchClear(){

    emit(state.copyWith(
      filteredProductContainerDtoList: state.allProductsContainerDtoList??[],
    ));
  }


  void clearAllState() {
    emit(ChooseProductState());
    setInitialValues(sellableProductsContainerDtoList: [], categoryLists: [], productTypeList: [], redeemableProductsContainerDtoList: [], allProductsContainerDtoList: []);
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
