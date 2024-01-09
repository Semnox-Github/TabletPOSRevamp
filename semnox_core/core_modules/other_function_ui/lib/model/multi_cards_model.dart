import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:flutter/cupertino.dart';

class MultiCardsModel{
  String? tagNumber;
  int?cardId;
  TextEditingController? creditsController ;
  TextEditingController? playCreditsController ;
  TextEditingController? bonusController ;
  TextEditingController? ticketsController ;
  TextEditingController? courtesyController ;
  TextEditingController? timeController ;
  TextEditingController? counterItemsController ;
  AccountDetailsResponse? accountDetailsResponse;
  MultiCardsModel({this.tagNumber,this.cardId, this.creditsController, this.playCreditsController, this.bonusController, this.ticketsController, this.courtesyController, this.timeController, this.counterItemsController, this.accountDetailsResponse});
}