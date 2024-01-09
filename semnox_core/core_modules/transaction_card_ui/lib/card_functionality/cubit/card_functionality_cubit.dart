import 'dart:convert';
import 'package:customer_data/builder.dart';
import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/card_serial_numbers/serial_number_data.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:product_menu_data/builder.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_account_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import '../cards_data_model.dart';
import 'card_functionality_state.dart';
import 'package:logs_data/logger.dart';

class CardFunctionalityCubit extends Cubit<CardFunctionalityState> {
  CardFunctionalityCubit()
      : super(
            CardFunctionalityState()); // here inside cardFunctionalityState class, some fields are already initialized

  TransactionResponse? _transactionResponse;
  AccountDetailsResponse? _accountDetailsResponse;
  var execContextBL;
  var sysExecContext;
  var transactionDataBl;
  var customerDataBl;
  var _productMenuDataBl;
  List<CardSerialNumberData>? _listCardSerialNoData;
  ProductContainerDTO?  _productContainerDto;
  List<CardsDataModel> _appliedCardList = [];
  List<String> _selectedSerialNos = [];
  List<CardSerialNumberData> _allSerialNoCardsData = [];
  List<String> _listOfAllAppliedCardsTagNumbers = [];
  List<CardSerialNumberData> _listSerialNumberCardsData = [];
  List<String> _listOfSelectedCards = [];
  List<AccountDetailsResponse> _accountDetailsResponses = [];
  List<AccountDetailsResponse>  _appliedAccountDetailsResponses =  [];
  Set<String> _productNameTypes = {};

  void changeAllSelectedStatus() {
    emit(state.copyWith(
        isSelectAllProducts: state.isSelectAllProducts =
            !state.isSelectAllProducts));
  }

  void changeAllSerailNoSelectedStatus() {
    emit(state.copyWith(
        isSelectedAllSerialNos: state.isSelectedAllSerialNos =
            !state.isSelectedAllSerialNos));
  }

  void resetLoaderAndMessage() {
    emit(state.copyWith(
        isCardFuctionlitySectionLoading: false,
        isError: false,
        isSuccess: false,
        statusMessage: ""));
  }

  void initialState({required int quantity, required String productName, required int productId}) async{
    emit(state.copyWith(
        isError: false,
        isCardFuctionlitySectionLoading: true,
        isSuccess: false,
        statusMessage: MessagesProvider.get("Loading...")
    ));
    execContextBL = await ExecutionContextBuilder.build();
    sysExecContext = execContextBL.getExecutionContext();
    _productMenuDataBl = await ProductMenuDataBuilder.build(sysExecContext);
   _productContainerDto = await _productMenuDataBl.getProductDetails(productId);
    _appliedCardList = [];
    for (var i = 0; i < quantity; i++) {
      _appliedCardList.add(CardsDataModel(
          tagNumber: '',
          productName: productName,
          isSelected: false,
          isApplied: false,
          productId:productId,
          productType: _productContainerDto?.productType??''
      ));
    }
    emit(state.copyWith(
        listOfAppliedCards: _appliedCardList,
        isSelectAllProducts: false,
        isSelectedAllSerialNos: false,
        appliedCardCount:0,
        isCardFuctionlitySectionLoading: false,
        listOfSerialNumberData: [],
        productNamesByType: {},
        listOfSelectedSerialNos: [],
        accountDetailsResponses:[]));
  }


  void initializeCard({required int quantity, required String productName,required List<TransactionLineDTO> transactionLines}) async {
    emit(state.copyWith(
        isError: false,
        isCardFuctionlitySectionLoading: true,
        isSuccess: false,
        statusMessage: MessagesProvider.get("Loading...")
    ));
   _appliedCardList = [];
     _accountDetailsResponses = [];
  execContextBL = await ExecutionContextBuilder.build();
  sysExecContext = execContextBL.getExecutionContext();
  _productMenuDataBl = await ProductMenuDataBuilder.build(sysExecContext);

if((transactionLines[0].transactionAccountDTOList?.length??0)>1){// splitCard
  for (var i = 0; i < (transactionLines[0].transactionAccountDTOList?.length??0); i++) {
    _productContainerDto = await _productMenuDataBl.getProductDetails(transactionLines[0].productId);
    _appliedCardList.add(CardsDataModel(
        tagNumber: transactionLines[0].transactionAccountDTOList?[i].tagNumber??'',
        productName: transactionLines[0].productName,
        isSelected: false,
        isApplied: true,
        productId:transactionLines[0].productId??-1,
        productType: _productContainerDto?.productType??''
    ));
    _accountDetailsResponses.add(AccountDetailsResponse(data: [
      AccountDetailsData(
          accountId: transactionLines[0].transactionAccountDTOList?[i].accountId ??-1,
          tagNumber: transactionLines[0].transactionAccountDTOList?[i].tagNumber ??'',
          isChanged: transactionLines[0].transactionAccountDTOList?[i].isChanged,
          isChangedRecursive: transactionLines[0].transactionAccountDTOList?[i].isChangedRecursive
      )
    ]));
}
}else{
  for (var i = 0; i < transactionLines.length; i++) {
    _productContainerDto = await _productMenuDataBl.getProductDetails(transactionLines[i].productId);

    _appliedCardList.add(CardsDataModel(
        tagNumber: transactionLines[i].tagNumber??'',
        productName: transactionLines[i].productName,
        isSelected: false,
        isApplied: true,
    productId: transactionLines[i].productId,
    productType: _productContainerDto?.productType??''));
    _accountDetailsResponses.add(AccountDetailsResponse(data: [
      AccountDetailsData(
          accountId: transactionLines[i].accountId ??-1,
          tagNumber: transactionLines[i].tagNumber ??'',
          isChanged: transactionLines[i].isChanged,
          isChangedRecursive: transactionLines[i].isChangedRecursive
      )
    ]));

  }
}

    _productNameTypes = {};
    for (CardsDataModel cardData in _appliedCardList) {
      _productNameTypes.add(cardData.productName??'');
    }
    _productNameTypes.add('ALL');
    _productNameTypes.remove('');
    emit(state.copyWith(
        listOfAppliedCards: _appliedCardList,
        appliedCardCount: _appliedCardList.where((element) => element.isApplied ==true).toList().length,
        isSelectAllProducts: false,
        isSelectedAllSerialNos: false,
        listOfSerialNumberData: [],
        listOfSelectedSerialNos: [],
        productNamesByType: _productNameTypes,
        selectedProductGroup: "ALL",
        isCardFuctionlitySectionLoading : false,
        accountDetailsResponses:_accountDetailsResponses));
  }

Future<bool> updateCardProductLine({required List<TransactionLineDTO>? transactionLineDTOs})async{
    try{
      emit(state.copyWith(
          isError: false,
          isCardFuctionlitySectionLoading: true,
          isSuccess: false,
          statusMessage: MessagesProvider.get("Applying card")));
      TransactionLineAccountDto? transactionLineAccountDto ;
      List<TransactionLineDTO> listTransactionDTOs = [];
       _accountDetailsResponses = state.accountDetailsResponses??[];
       _appliedAccountDetailsResponses =  [];
      for (AccountDetailsResponse element in _accountDetailsResponses) {
        for (CardsDataModel element1 in state.listOfAppliedCards!) {
          if( element.data![0].tagNumber == element1.tagNumber){
            _appliedAccountDetailsResponses.add(element);
          }
        }
      }
      if((transactionLineDTOs?[0].transactionAccountDTOList?.length??0)>1){//isSplitCard
        List<TransactionLineAccountDto>  transactionAccountsDtoList = [];
        for(var i=0;i<(transactionLineDTOs?[0].transactionAccountDTOList?.length??0);i++){
          transactionLineAccountDto = transactionLineDTOs?[0].transactionAccountDTOList?[i] ??const TransactionLineAccountDto();
          TransactionLineAccountDto  transactionAccountDTO=  transactionLineAccountDto.copyWith(
            accountId: _appliedAccountDetailsResponses.toSet().toList()[i].data?[0].accountId??-1,
            tagNumber: _appliedAccountDetailsResponses.toSet().toList()[i].data?[0].tagNumber??'',
            isChanged: _appliedAccountDetailsResponses.toSet().toList()[i].data?[0].isChanged??false,
            isChangedRecursive: _appliedAccountDetailsResponses.toSet().toList()[i].data?[0].isChangedRecursive??false,
          );
        transactionAccountsDtoList.add(transactionAccountDTO);
        }
        TransactionLineDTO transaction = transactionLineDTOs![0].copyWith(transactionAccountDTOList:transactionAccountsDtoList??[] );
        listTransactionDTOs.add(transaction);
      }

  else{
        for(var i=0;i<transactionLineDTOs!.length; i++){
          transactionLineAccountDto = transactionLineDTOs[i]?.transactionAccountDTOList?[0] ??const TransactionLineAccountDto();
          TransactionLineDTO transaction = transactionLineDTOs[i].copyWith(transactionAccountDTOList: [
            transactionLineAccountDto.copyWith(
              accountId: _appliedAccountDetailsResponses.toSet().toList()[i].data?[0].accountId??-1,
              tagNumber: _appliedAccountDetailsResponses.toSet().toList()[i].data?[0].tagNumber??'',
              isChanged: _appliedAccountDetailsResponses.toSet().toList()[i].data?[0].isChanged??false,
              isChangedRecursive: _appliedAccountDetailsResponses.toSet().toList()[i].data?[0].isChangedRecursive??false,
            )
          ]);

          listTransactionDTOs.add(transaction);
        }
      }

      //
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
       transactionDataBl =
      await TransactionDataBuilder.build(sysExecContext!);
        _transactionResponse = await transactionDataBl.updateProductToLine(
            listTransactionDTOs
        );

      emit(state.copyWith(
          transactionResponse: _transactionResponse,
          isCardFuctionlitySectionLoading: false,
          isError: false,
          isSuccess: true,
          statusMessage: MessagesProvider.get("Success")));

     return true;
    }on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: errorString ?? ''));
      return false;
    }
    catch (error) {
      Log.v("updateLineError: $error");
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: MessagesProvider.get("Something went Wrong!")));
      return false;
    }
}

  void onCardOperationError(String? errorMessage) {
    emit(state.copyWith(isError: true, statusMessage: errorMessage ?? ''));
  }

  void onSelectSerialNumber(String? tagNumber) async {
    List<String> selectedSerialNos = state.listOfSelectedSerialNos ?? [];
    selectedSerialNos.add(tagNumber!);
    emit(state.copyWith(listOfSelectedSerialNos: selectedSerialNos));
  }

  void onSelectedCardFunction(int index) {
    _appliedCardList = state.listOfAppliedCards ?? [];
    _appliedCardList[index] = _appliedCardList[index].copyWith(isSelected: true);
    emit(state.copyWith(
        listOfAppliedCards: _appliedCardList));
  }

  void onSelectCards(int index) {
    onSelectedCardFunction(index);
  }

  void onUnSelectSerialNos(String? tagNumber) {
    List<String> _selectedSerialNos = state.listOfSelectedSerialNos;
    _selectedSerialNos.removeWhere((element) => element == tagNumber);
    emit(state.copyWith(listOfSelectedSerialNos: _selectedSerialNos));
  }

  void onUnSelectAllSerialNos() {
    _selectedSerialNos = state.listOfSelectedSerialNos;
    _allSerialNoCardsData =
        state.listOfSerialNumberData ?? [];
    for (var serialCardData in _allSerialNoCardsData) {
      _selectedSerialNos
          .removeWhere((element) => element == serialCardData.tagNumber);
      emit(state.copyWith(
          listOfSelectedSerialNos: _selectedSerialNos,
          isSelectedAllSerialNos: false));
    }
  }

  void onSelectAllSerialNos() {
    _selectedSerialNos = state.listOfSelectedSerialNos;
    _allSerialNoCardsData =
        state.listOfSerialNumberData ?? [];
    for (var serialCardData in _allSerialNoCardsData) {
      _selectedSerialNos.add(serialCardData.tagNumber!);
      emit(state.copyWith(
          listOfSelectedSerialNos: _selectedSerialNos,
          isSelectedAllSerialNos: true));
    }
  }

  void onUnSelectCards(int index) {
    onUnSelectedCardsFunction(index);
  }

  void onUnSelectedCardsFunction(int index) {
     _appliedCardList = state.listOfAppliedCards ?? [];
     _appliedCardList[index] = _appliedCardList[index].copyWith(isSelected: false) ;
    emit(state.copyWith(
         listOfAppliedCards: _appliedCardList));
  }

  void selectAllCards() {
     _listOfAllAppliedCardsTagNumbers = [];
    _appliedCardList = state.listOfAppliedCards ?? [];
    for (CardsDataModel cardData in state.listOfAppliedCards ?? []) {
      if (cardData.tagNumber != null || cardData.tagNumber != '') {
        _listOfAllAppliedCardsTagNumbers.add(cardData.tagNumber!);
      }
      _appliedCardList[_appliedCardList.indexOf(cardData)] = _appliedCardList[_appliedCardList.indexOf(cardData)].copyWith(isSelected: true,);
    }
    Log.v("selectedCrds ${jsonEncode(_appliedCardList)}");
    emit(state.copyWith(
        isSelectAllProducts: true,
        listOfAppliedCards: _appliedCardList));
  }

  void unSelectAllCards() {
    _appliedCardList = state.listOfAppliedCards ?? [];
    for (CardsDataModel cardData in state.listOfAppliedCards ?? []) {
      _appliedCardList[_appliedCardList.indexOf(cardData)] =  _appliedCardList[_appliedCardList.indexOf(cardData)].copyWith(isSelected: false);
    }
    emit(state.copyWith(
        isSelectAllProducts: false,
        listOfAppliedCards: _appliedCardList));
  }

  void swapCards() {
    _appliedCardList = state.listOfAppliedCards ??[];
    List<int> listOfIndex = [];
    _appliedCardList.asMap().forEach((i, element) {
      if (element.isSelected ?? false) {
        listOfIndex.add(i);
      }
    });

    if (listOfIndex.length == 2) {
      final swapAppliedCards = _appliedCardList[listOfIndex[0]];
      _appliedCardList[listOfIndex[0]] = _appliedCardList[listOfIndex[1]];
      _appliedCardList[listOfIndex[1]] = swapAppliedCards;
      emit(state.copyWith(
          listOfAppliedCards: _appliedCardList,
          isSuccess: true,
          statusMessage: MessagesProvider.get("Swapped successfully")));
    } else {
      emit(state.copyWith(
          isError: true,
          statusMessage: MessagesProvider.get('Sorry cannot proceeed. Swap requires two card entries.')));
    }

    // Log.v(myList);
  }

  void removeSerialNumber() async {
    try {
      _selectedSerialNos = state.listOfSelectedSerialNos;
      _listSerialNumberCardsData =
          state.listOfSerialNumberData ?? [];
      Log.v("slNos:$_selectedSerialNos");
      await Future.forEach(_selectedSerialNos, (tagNumber) async {
        Log.v("tagNumber: $tagNumber");
        _listSerialNumberCardsData
            .removeWhere((element) => element.tagNumber == tagNumber);
        for(var i= 0;i<state.listOfAppliedCards!.length;i++){
          if (state.listOfAppliedCards![i].tagNumber == tagNumber) {
            onSelectedCardFunction(i);
          }
        }
      });

      emit(state.copyWith(
          isError: false,
          isCardFuctionlitySectionLoading: true,
          isSuccess: false,
          statusMessage: MessagesProvider.get("Clearing cards")));

      _appliedCardList = state.listOfAppliedCards??[];
       _listOfSelectedCards = state.listOfSelectedSerialNos;
      Log.v("selectedCards: ${jsonEncode(_appliedCardList)}");
      for (var element in _appliedCardList!) {
        if (element.isSelected == true) {
          _appliedCardList[_appliedCardList.indexOf(element)] = _appliedCardList[_appliedCardList.indexOf(element)].copyWith(isSelected: false, isApplied: false, tagNumber: '');
        }
        Log.v(
            "indexWHERE ${_appliedCardList.indexWhere((item) => item.isSelected == true)}");
        if (element.isSelected ?? false) {
          _listOfSelectedCards.remove(element.tagNumber);
        }
      }

      emit(state.copyWith(
          isCardFuctionlitySectionLoading: false,
          isError: false,
          isSuccess: true,
          listOfAppliedCards: _appliedCardList,
          appliedCardCount: _appliedCardList.where((element) => element.isApplied ==true).toList().length ,
          isSelectAllProducts: false,
          isSelectedAllSerialNos: false,
          listOfSelectedSerialNos: [],
          listOfSerialNumberData: _listSerialNumberCardsData,
          statusMessage: MessagesProvider.get("Cards cleared")));
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: errorString ?? ''));
    } catch (error) {
      Log.v("removeNumberErro $error");
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: MessagesProvider.get("Something went Wrong!")));
    }
  }

  onSelectedProductNameGroup(String? productName){
    emit(state.copyWith(selectedProductGroup: productName??''));
  }

  void cancelCard() async {
    try {
      emit(state.copyWith(
          isError: false,
          isCardFuctionlitySectionLoading: true,
          isSuccess: false,
          statusMessage: MessagesProvider.get("Clearing cards")));

     _appliedCardList = state.listOfAppliedCards??[];
      Log.v("selectedCards: ${jsonEncode(_appliedCardList)}");
      for (var element in _appliedCardList) {
        if (element.isSelected == true) {
          _appliedCardList[_appliedCardList.indexOf(element)] =  _appliedCardList[_appliedCardList.indexOf(element)].copyWith(isSelected: false, isApplied: false,tagNumber: '') ;
        }
        Log.v(
            "indexWHERE ${_appliedCardList.indexWhere((item) => item.isSelected == true)}");
      }

      emit(state.copyWith(
          isCardFuctionlitySectionLoading: false,
          isError: false,
          isSuccess: true,
          listOfAppliedCards: _appliedCardList,
          appliedCardCount: _appliedCardList.where((element) => element.isApplied ==true).toList().length ,
          isSelectAllProducts: false,
          isSelectedAllSerialNos: false,
          statusMessage: MessagesProvider.get("Cards cleared")));
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: errorString ?? ''));
    } catch (error) {
      Log.v("removeError $error");
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: MessagesProvider.get("Something went Wrong!")));
    }
  }

  Future<void> cancelAllCards(
      {required int quantity, required String productName}) async {
    try {
      emit(state.copyWith(
          isError: false,
          isCardFuctionlitySectionLoading: true,
          isSuccess: false,
          statusMessage: MessagesProvider.get("Clearing cards")));
      _appliedCardList = state.listOfAppliedCards!;
      Log.v("selectedCards ${jsonEncode(_appliedCardList)}");
      for(var i =0; i<state.listOfAppliedCards!.length;i++){
        _appliedCardList[i] = _appliedCardList[i].copyWith(tagNumber: '', isSelected: false, isApplied: false);
      }

      emit(state.copyWith(
          isCardFuctionlitySectionLoading: false,
          isError: false,
          isSuccess: true,
          isSelectAllProducts: false,
          isSelectedAllSerialNos: false,
          listOfAppliedCards: _appliedCardList,
          appliedCardCount:0,
          listOfSelectedSerialNos: [],
          listOfSerialNumberData: [],
          statusMessage: MessagesProvider.get("Cards cleared")));
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: errorString ?? ''));
    } catch (error) {
      Log.v("cancelAllCards: $error");
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: MessagesProvider.get("Something went Wrong!")));
    }
  }

  void applyCard({
    required int productId,
    required String tagNumber,
    required String productName,
    required bool isFullFill
  }) async {
    try {
      _productContainerDto = await _productMenuDataBl.getProductDetails(productId);
       _appliedCardList = [];
      emit(state.copyWith(
          isError: false,
          isCardFuctionlitySectionLoading: true,
          isSuccess: false,
          statusMessage: MessagesProvider.get("Applying card")));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
      customerDataBl = await CustomerDataBuilder.build(sysExecContext!);
      _accountDetailsResponse = await customerDataBl.getCustomerAccounts(
          customerId: -1, accountNumber: tagNumber);
      if (_accountDetailsResponse!.data!.isNotEmpty) {
       final bool isIssuedCard =
            _accountDetailsResponse?.data![0].accountId != -1 ? true : false;
        _appliedCardList = state.listOfAppliedCards??[];
        final int emptyIndex =isFullFill && state.selectedProductGroup != "ALL"?_appliedCardList.indexWhere((element) {
         final selectedGroupList = _appliedCardList.where((e)=>e.productName == state.selectedProductGroup).toList();
         final groupedProductIndex = selectedGroupList.indexWhere((h) => h.isApplied == false);
        // final int cardIndex =  _appliedCardList.indexWhere((g) => g.productName == selectedGroupList[groupedProductIndex].productName);
        return element.productName == selectedGroupList[groupedProductIndex].productName && element.isApplied == false;
        } ): _appliedCardList
            .indexWhere((element) => element.isApplied == false);
        if ((isIssuedCard && _appliedCardList[emptyIndex].productType == "RECHARGE") ||
            (!isIssuedCard && _appliedCardList[emptyIndex].productType == "NEW") ||
            _appliedCardList[emptyIndex].productType == "CARDSALE" || _appliedCardList[emptyIndex].productType == "VARIABLECARD" || _appliedCardList[emptyIndex].productType == "GAMETIME") {
          _appliedCardList[emptyIndex] =
              CardsDataModel(
                  tagNumber: tagNumber,productName:_appliedCardList[emptyIndex].productName,productId: _appliedCardList[emptyIndex].productId,productType: _appliedCardList[emptyIndex].productType, isApplied: true, isSelected: false);
          _accountDetailsResponses = state.accountDetailsResponses??[];
          _accountDetailsResponses.add(_accountDetailsResponse!);
         int countOfAppliedCards = _appliedCardList
              .where((element) => element.isApplied == true).toList().length;
         
          emit(state.copyWith(
              isCardFuctionlitySectionLoading: false,
              isError: false,
              isSuccess: true,
              accountDetailsResponses:_accountDetailsResponses,
              listOfAppliedCards: _appliedCardList,
              appliedCardCount: _appliedCardList.where((element) => element.isApplied ==true).toList().length ,
              statusMessage:countOfAppliedCards == _appliedCardList.length ?
                  MessagesProvider.get('All Cards entered. Press OK.'): MessagesProvider.get('Please tap card or enter serial number range')
                  ));
        } else if (isIssuedCard && _appliedCardList[emptyIndex].productType == "NEW") {
          emit(state.copyWith(
              isError: true,
              isSuccess: false,
              isCardFuctionlitySectionLoading: false,
              statusMessage: MessagesProvider.get(
                'Cannot have New Card products for existing cards'
                  )));
        } else if (!isIssuedCard && _appliedCardList[emptyIndex].productType == "RECHARGE") {
          emit(state.copyWith(
              isError: true,
              isSuccess: false,
              isCardFuctionlitySectionLoading: false,
              statusMessage: MessagesProvider.get("Please Tap an Issued Card...")));
        } else {
          emit(state.copyWith(
              isError: true,
              isSuccess: false,
              isCardFuctionlitySectionLoading: false,
              statusMessage: MessagesProvider.get('could_not_add_card')));
        }
      } else {
        emit(state.copyWith(
            isError: true,
            isSuccess: false,
            isCardFuctionlitySectionLoading: false,
            statusMessage: MessagesProvider.get("Something went Wrong!")));
      }
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: errorString ?? ''));
    }
    catch (error) {
      Log.v("Carderror $error");
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: MessagesProvider.get("Something went Wrong!")));
    }
  }

  void mapCards({int? serialNoIndex,int? cardsIndex, required bool isSplitCard}){
    try{
      List<CardSerialNumberData>? serialNos = state.listOfSerialNumberData;
       _appliedCardList = state.listOfAppliedCards??[];
      if(_appliedCardList.indexWhere((element) => element.isApplied == false) != -1){
        _appliedCardList[isSplitCard?_appliedCardList.indexWhere((element) => element.isApplied == false):cardsIndex??0] =
            _appliedCardList[isSplitCard?_appliedCardList.indexWhere((element) => element.isApplied == false):cardsIndex??0].copyWith( tagNumber: serialNos![serialNoIndex!].tagNumber, isApplied: true, isSelected: true);
      }
       _accountDetailsResponses = state.accountDetailsResponses??[];
      _accountDetailsResponses?.add(AccountDetailsResponse(data: [
          AccountDetailsData(
          accountId: -1,
          tagNumber: serialNos?[serialNoIndex??0].tagNumber ??'',
          isChanged: false,
          isChangedRecursive: false
      )]));
      emit(state.copyWith(
        listOfAppliedCards: _appliedCardList,
          isSuccess:true,
          accountDetailsResponses:_accountDetailsResponses,
          appliedCardCount: _appliedCardList.where((element) => element.isApplied ==true).toList().length ,
          statusMessage: MessagesProvider.get("Cards Added Successfully"),
      ));
    }catch(err){
      Log.v(err);
    }
  }

  Future<bool> addCardsToLine({
    int?approverID,
    required int productId,
    required int? seatNumber,
    required String? seatName,
    required String? cardType,
    double? variableAmount,
    String? remarks,
    required bool isSplitCard
  }) async {
    try {
      emit(state.copyWith(
          isError: false,
          isCardFuctionlitySectionLoading: true,
          isSuccess: false,
          statusMessage: MessagesProvider.get("Applying card")));
      List<String> tagNumbers = [];
      List<CardsDataModel>? listCards = state.listOfAppliedCards;
      for (var element in listCards!) {
        if(element.isApplied == true){
          tagNumbers.add(element.tagNumber!);
        }
      }
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
     var transactionDataBl =
          await TransactionDataBuilder.build(sysExecContext!);
      if(tagNumbers.isNotEmpty){

          _transactionResponse = await transactionDataBl.addCardToLine(
              seatName: seatName ?? "Shared Order",
              seatNumber: seatNumber ?? 0,
              tagNumbers: tagNumbers,
              productId: productId,
              isSplitCard:isSplitCard,
              remarks: remarks,
          userOverriddenPrice: cardType  == "VARIABLECARD" ?variableAmount:null);

        emit(state.copyWith(
            transactionResponse: _transactionResponse,
            isCardFuctionlitySectionLoading: false,
            isError: false,
            isSuccess: true,
            statusMessage: MessagesProvider.get("Success")));
        return true;
      }else{
        emit(state.copyWith(
            isError: true,
            isSuccess: false,
            isCardFuctionlitySectionLoading: false,
            statusMessage: MessagesProvider.get("Something went Wrong!")));
        return false;
      }

    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: errorString ?? ''));
      return false;
    }
    catch (error) {
      Log.v("addToLineError: $error");
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: MessagesProvider.get("Something went Wrong!")));
      return false;
    }
  }

  void clearAllData(){
    emit(CardFunctionalityState());
  }

  void getSerialNo(
      {required String fromNo,
      required String toNo,
      required String isAlreadyInUse,
      required int productId}) async {
    try {
      emit(state.copyWith(
          isError: false,
          isCardFuctionlitySectionLoading: true,
          isSuccess: false,
          statusMessage: MessagesProvider.get("Fetching Serial Numbers")));
      execContextBL = await ExecutionContextBuilder.build();
      sysExecContext = execContextBL.getExecutionContext();
     var customerDataBl = await CustomerDataBuilder.build(sysExecContext!);
      _listCardSerialNoData = await customerDataBl.getCardsSerialNumbers(
          fromSerialNumber: fromNo,
          toSerialNumber: toNo,
          alreadyIssued: isAlreadyInUse);
       _accountDetailsResponses = state.accountDetailsResponses??[];
      if (_listCardSerialNoData!.isNotEmpty) {
         _appliedCardList = state.listOfAppliedCards??[];
        List<CardsDataModel>? listOfAppliedCardds =
        _appliedCardList!.where((element) => element.isApplied == false).toList();
        await Future.forEach(
            _listCardSerialNoData!.toList().take(listOfAppliedCardds.length),
            (elem) async {});

        if (listOfAppliedCardds.isNotEmpty) {
          if (_listCardSerialNoData != null &&
              _listCardSerialNoData!.isNotEmpty) {
            _listCardSerialNoData!
                .toList()
                .take(listOfAppliedCardds.length)
                .forEach((slData) {
              _appliedCardList[_appliedCardList
                      .indexWhere((element) => element.isApplied == false)] =
              _appliedCardList[_appliedCardList
                  .indexWhere((element) => element.isApplied == false)].copyWith(
                  tagNumber: slData.tagNumber,
                  isApplied: true,
                  isSelected: false
              );

              _accountDetailsResponses?.add(AccountDetailsResponse(data: [
                AccountDetailsData(
                    accountId: -1,
                    tagNumber: slData.tagNumber ??'',
                    isChanged: false,
                    isChangedRecursive: false
                )
              ]));
            });
          }
        }

        emit(state.copyWith(
            listOfSerialNumberData: _listCardSerialNoData,
            isCardFuctionlitySectionLoading: false,
            isError: false,
            isSuccess: true,
            listOfAppliedCards: _appliedCardList,
            accountDetailsResponses: _accountDetailsResponses,
            appliedCardCount: _appliedCardList.where((element) => element.isApplied ==true).toList().length ,
            statusMessage: MessagesProvider.get("All Cards entered. Press OK.")));
        Log.v("error:Ser: ${jsonEncode(state.listOfAppliedCards)}");
      } else {
        emit(state.copyWith(
            listOfSerialNumberData: [],
            isCardFuctionlitySectionLoading: false,
            isError: true,
            isSuccess: false,
            statusMessage: MessagesProvider.get(
                "No serial-mapped cards found for the given series"
                )));
      }
    } on DioError catch (error) {
      var errorString = error.response?.data['data'] as String?;
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: errorString ?? ''));
    } catch (error) {
      Log.v("getSlNo:$error");
      emit(state.copyWith(
          isError: true,
          isSuccess: false,
          isCardFuctionlitySectionLoading: false,
          statusMessage: MessagesProvider.get("Something went Wrong!")));
    }
  }
}
