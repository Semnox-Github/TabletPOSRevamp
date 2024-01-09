import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/card_serial_numbers/serial_number_data.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';

import '../cards_data_model.dart';

class CardFunctionalityState {
  CardFunctionalityState(
      {this.tabIndex = 0,
      this.isSelectAllProducts = false,
      this.isCardFuctionlitySectionLoading = false,
      this.statusMessage,
      this.transactionResponse,
      this.isError = false,
      this.isSuccess = false,
      this.listOfAppliedCards = const [],
      this.listOfSerialNumberData = const [],
      this.isSelectedAllSerialNos = false,
      this.listOfSelectedSerialNos = const[],
      this.appliedCardCount = 0,
      this.accountDetailsResponses = const[],
      this.productNamesByType = const{},
      this.selectedProductGroup });

  int? tabIndex;
  bool isSelectAllProducts;
  bool isCardFuctionlitySectionLoading;
  String? statusMessage;
  TransactionResponse? transactionResponse;
  bool isError;
  bool isSuccess;
  List<CardsDataModel>? listOfAppliedCards;
  List<CardSerialNumberData>? listOfSerialNumberData;
  bool isSelectedAllSerialNos;
  List<String> listOfSelectedSerialNos;
  int? appliedCardCount;
  List<AccountDetailsResponse>? accountDetailsResponses;
  Set<String> productNamesByType ;
  String? selectedProductGroup;


  CardFunctionalityState copyWith(
      {int? tabIndex,
      bool? isSelectAllProducts,
      bool? isCardFuctionlitySectionLoading,
      String? statusMessage,
      TransactionResponse? transactionResponse,
      bool? isError,
      bool? isSuccess,
      List<CardsDataModel>? listOfAppliedCards,
      List<CardSerialNumberData>? listOfSerialNumberData,
      bool? isSelectedAllSerialNos,
      List<String>? listOfSelectedSerialNos,
      int?appliedCardCount,
        List<AccountDetailsResponse>? accountDetailsResponses,
        Set<String>? productNamesByType,
        String? selectedProductGroup
      }) {
    return CardFunctionalityState(
        tabIndex: tabIndex ?? this.tabIndex,
        isSelectAllProducts: isSelectAllProducts ?? this.isSelectAllProducts,
        isCardFuctionlitySectionLoading: isCardFuctionlitySectionLoading ??
            this.isCardFuctionlitySectionLoading,
        statusMessage: statusMessage ?? this.statusMessage,
        transactionResponse: transactionResponse ?? this.transactionResponse,
        isError: isError ?? this.isError,
        isSuccess: isSuccess ?? this.isSuccess,
        listOfAppliedCards: listOfAppliedCards ?? this.listOfAppliedCards,
        listOfSerialNumberData:
            listOfSerialNumberData ?? this.listOfSerialNumberData,
        isSelectedAllSerialNos:isSelectedAllSerialNos?? this.isSelectedAllSerialNos,
        listOfSelectedSerialNos: listOfSelectedSerialNos ?? this.listOfSelectedSerialNos,
        appliedCardCount:appliedCardCount ?? this.appliedCardCount,
        accountDetailsResponses: accountDetailsResponses ?? this.accountDetailsResponses,
        productNamesByType: productNamesByType ?? this.productNamesByType,
        selectedProductGroup: selectedProductGroup?? this.selectedProductGroup);
  }
}
