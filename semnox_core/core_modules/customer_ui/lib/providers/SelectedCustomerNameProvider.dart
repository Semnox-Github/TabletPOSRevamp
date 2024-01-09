import 'package:customer_data/models/customer_data.dart';
import 'package:flutter/cupertino.dart';

class SelectedCustomerName with ChangeNotifier{

  CustomerData? data;
  CustomerData? get selectedData => data;

  void updateData(CustomerData? customerData){
    data = customerData;
    notifyListeners();
  }
}
