import 'package:customer_data/models/account_details/account_details_response.dart';

import '../../../model/multi_cards_model.dart';

class BalanceTransferState{
  BalanceTransferState({ this.multiCardsData = const[], this.isLoading  = false, this.isSuccess = false, this.isPrimaryCardApplied = false,
  this.isError =false, this.loaderMessage = '', this.primaryCardData, this.statusMessage =''});

  List<MultiCardsModel> multiCardsData ;
  bool isLoading ;
  bool isSuccess ;
  bool isError ;
  String loaderMessage;
  bool isPrimaryCardApplied;
  AccountDetailsResponse? primaryCardData;
  String statusMessage;


  BalanceTransferState copyWith(
      {List<MultiCardsModel>? multiCardsData ,
        bool? isLoading ,
        bool? isSuccess ,
        bool? isError ,
        String? loaderMessage,
        bool? isPrimaryCardApplied,
        AccountDetailsResponse? primaryCardData,
        String? statusMessage,
      }) {
    return BalanceTransferState(
      multiCardsData:
      multiCardsData ?? this.multiCardsData,
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
       isError : isError ?? this.isError,
      loaderMessage: loaderMessage?? this.loaderMessage,
        isPrimaryCardApplied : isPrimaryCardApplied ?? this.isPrimaryCardApplied,
        primaryCardData: primaryCardData?? this.primaryCardData,
        statusMessage: statusMessage ?? this.statusMessage
    );
  }
}