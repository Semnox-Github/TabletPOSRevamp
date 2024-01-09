import 'package:customer_data/models/customer_data.dart';
import 'package:flutter/cupertino.dart';

class SelectedCustomer with ChangeNotifier {
  CustomerData? data;
  CustomerData? get selectedData => data;
  CustomerData? searchData;
  CustomerData? get selectedSearchData => searchData;

  void updateData(CustomerData? customerData) {
    data = customerData;
    notifyListeners();
  }

  void selectSearchData(CustomerData? customerData) {
    searchData = customerData;
    notifyListeners();
  }
}
