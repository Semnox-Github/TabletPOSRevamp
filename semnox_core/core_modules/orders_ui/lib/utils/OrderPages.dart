import 'package:orders_ui/Screens/AllTransactionScreen.dart';
import 'package:orders_ui/Screens/ClosedOrdersScreen.dart';
import 'package:orders_ui/Screens/ClosedTransactionScreen.dart';
import 'package:orders_ui/Screens/OnHoldTransactionsScreen.dart';
import 'package:orders_ui/Screens/OpenOrdersScreen.dart';
import 'package:orders_ui/Screens/OpenTransactionScreen.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreen.dart';
import 'package:messages_data/builder.dart';

import '../Screens/FreeTableScreen.dart';
import '../Screens/NewTableSeatLayoutScreen.dart';
import '../Screens/UnavailableTableScreen.dart';
import '../Screens/OccupiedTableScreen.dart';
import '../Screens/AllOrdersScreen.dart';

List<Map<String,dynamic>> pageList = [
  {
    "key": MessagesProvider.get("Table"),
    "visible": true,
    "value":MessagesProvider.get("All"),
    "page" : TableSeatLayoutWrapper()
  },
  {
    "key":MessagesProvider.get("Table"),
    "visible": false,
    "value":MessagesProvider.get("Free"),
    "page" : FreeTableScreen()
  },
  {
    "key":MessagesProvider.get("Table"),
    "value":MessagesProvider.get("Occupied"),
    "visible": false,
    "page" : OccupiedTableScreen()
  },
  {
    "key":MessagesProvider.get("Table"),
    "value":MessagesProvider.get("Unavailable"),
    "visible": false,
    "page" : UnavailableTableScreen()
  },
  {
    "key":MessagesProvider.get("Orders"),
    "value":MessagesProvider.get("All"),
    "visible": true,
    "page" : AllOrdersScreen()
  },
  {
    "key":MessagesProvider.get("Orders"),
    "value":MessagesProvider.get("Open"),
    "visible": false,
    "page" : OpenOrdersScreen()
  },
  {
    "key":MessagesProvider.get("Orders"),
    "value":MessagesProvider.get("Closed"),
    "visible": false,
    "page" : ClosedOrdersScreen()
  },
  {
    "key": MessagesProvider.get("Transactions"),
    "value":MessagesProvider.get("All"),
    "visible": true,
    "page" : AllTransactionScreen()
  },
  {
    "key": MessagesProvider.get("Transactions"),
    "value":MessagesProvider.get("Open"),
    "visible": false,
    "page" : OpenTransactionScreen()
  },
  {
    "key": MessagesProvider.get("Transactions"),
    "value":MessagesProvider.get("Closed"),
    "visible": false,
    "page" : ClosedTransactionScreen()
  },
  {
    "key": MessagesProvider.get("Transactions"),
    "value":MessagesProvider.get("Onhold"),
    "visible": false,
    "page" : OnHoldTransactions()
  },
];
List<Map<String,dynamic>> transactionLookupPageList = [
  {
  "key": MessagesProvider.get("Transactions"),
  "value":MessagesProvider.get("All"),
  "visible": true,
  "page" : AllTransactionScreen()
  },
  {
  "key": MessagesProvider.get("Transactions"),
  "value":MessagesProvider.get("Open"),
  "visible": false,
  "page" : OpenTransactionScreen()
  },
  {
  "key": MessagesProvider.get("Transactions"),
  "value":MessagesProvider.get("Closed"),
  "visible": false,
  "page" : ClosedTransactionScreen()
  },
  {
  "key": MessagesProvider.get("Transactions"),
  "value":MessagesProvider.get("Onhold"),
  "visible": false,
  "page" : OnHoldTransactions()
  },
];