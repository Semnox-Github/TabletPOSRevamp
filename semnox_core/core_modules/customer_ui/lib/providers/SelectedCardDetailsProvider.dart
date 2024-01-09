import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:flutter/cupertino.dart';

class SelectedCardDetails with ChangeNotifier{

  int? cardLength;
  int? get selectedLength => cardLength;
  AccountDetailsData? data;
  AccountDetailsData? get selectedData => data;

  void updateData(AccountDetailsData? accountDetailsData){
    data = accountDetailsData;
    notifyListeners();
  }

  void updateCardLength(int? length){
    cardLength = length;
    notifyListeners();
  }
}
