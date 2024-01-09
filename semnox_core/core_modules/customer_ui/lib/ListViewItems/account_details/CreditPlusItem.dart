import 'package:customer_data/models/account_details/account_credit_plus_dto.dart';
import 'package:customer_data/models/loyalty_attribute_container/loyalty_attribute_container_dto.dart';
import 'package:customer_ui/ListViewItems/account_details/CreditPlusChildItem.dart';
import 'package:customer_ui/widgets/CustomerButtonWidget.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/category_container/category_container_dto.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:master_data/models/game_container/game_container_dto.dart';
import 'package:master_data/models/game_profile_container/game_profile_container_dto.dart';
import 'package:master_data/models/order_type_container/order_type_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:intl/intl.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'CreditPlusChildItemHeader.dart';

class CreditPlusItem extends StatefulWidget{

  int selectedIndex = 0;
  int index = 0;
  final Function(int value) onChange;
  AccountCreditPlusDTO? data;
  List<LoyaltyAttributeContainerDTO>? loyaltyAttribute;
  List<GameProfileContainerDTO>? gameProfileContainer;
  List<GameContainerDTO>? gameContainer;
  List<ProductContainerDTO>? productContainer;
  List<CategoryContainerDTO>? categoryContainer;
  List<OrderTypeContainerDTO>? orderTypeContainer;
  String? dateFormat;


  CreditPlusItem({
      super.key,
      required this.selectedIndex,
      required this.index,
      required this.onChange,
      this.data,
      this.loyaltyAttribute,
      this.gameProfileContainer,
      this.gameContainer,
      this.productContainer,
      this.categoryContainer,
      this.orderTypeContainer,
      this.dateFormat
  });

  @override
  State<CreditPlusItem> createState() => _CreditPlusItemState();
}

class _CreditPlusItemState extends State<CreditPlusItem> {
  bool _rules = false;
  bool _criteria = false;
  final ScrollController _gameScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    var periodFrom = "-";
    var periodTo = "-";
    var createdOn = "";
    if(widget.data?.periodFrom != null && widget.data?.periodFrom != "") {
      var parsedDate = DateTime.parse(widget.data?.periodFrom.toString() ??
              "1974-03-20 00:00:00.000");
      periodFrom = DateFormat(widget.dateFormat).format(parsedDate);
    }
    if(widget.data?.periodTo != null && widget.data?.periodTo != "") {
      var parsedDate = DateTime.parse(widget.data?.periodTo.toString() ??
          "1974-03-20 00:00:00.000");
      periodTo = DateFormat(widget.dateFormat).format(parsedDate);
    }
    if(widget.data?.creationDate != null && widget.data?.creationDate != "") {
      var parsedDate = DateTime.parse(widget.data?.creationDate.toString() ??
          "1974-03-20 00:00:00.000");
      createdOn = DateFormat(widget.dateFormat).format(parsedDate);
    }
    var type = "";
    widget.loyaltyAttribute?.forEach((element) {
      if(widget.data?.creditPlusType.toString() == element.creditPlusType){
        type = element.attribute ?? "";
      }
    });
    String validityStatus = "";
    if(widget.data?.validityStatus == 0){
      validityStatus = "Valid";
    }else if(widget.data?.validityStatus == 1){
      validityStatus = "Hold";
    }

    return Container(
      decoration: BoxDecoration(
          border:  (widget.selectedIndex == widget.index) ? Border.all(color: theme.secondaryColor!) : null,
          borderRadius: BorderRadius.circular(8),
          color: theme.tableRow1
      ),
      child: ListTile(
        dense: true,
        //visualDensity: VisualDensity(vertical: -3),
        contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
        title: Column(
          children: [
            Row(
              children: [
                Container(
                    width: 150,
                    margin: const EdgeInsets.only(left: 12.0,),
                    alignment: Alignment.center,
                    child: Text(widget.data?.remarks.toString() ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
                Container(
                    width: 120,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(_getCreditPlusType(widget.data?.creditPlusType ?? -1), style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),)),
                Container(
                    width: 60,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(widget.data?.creditPlus.toString() ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),)),
                Container(
                    width: 80,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child:  SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        checkColor: theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),
                        value: widget.data?.refundable ?? false,
                        onChanged:(bool? value) {
                        } ,
                      ),
                    ),),
                Container(
                    width: 80,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(widget.data?.creditPlusBalance.toString() ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),)),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(widget.data?.minimumSaleAmount ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),)),
                Container(
                    width: 150,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(periodFrom, style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
                Container(
                    width: 150,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(periodTo, style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),)),
                Container(
                    width: 140,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        checkColor: theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),
                        value: widget.data?.extendOnReload ?? false,
                        onChanged:(bool? value) {
                        } ,
                      ),
                    )),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(widget.data?.playStartTime ?? "-", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),)),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(widget.data?.timeFrom ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),)),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(widget.data?.timeTo ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),)),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(widget.data?.numberOfDays == null ? "" :( widget.data?.numberOfDays.toString() ?? ""), style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),)),
                Container(
                    width: 100,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 8.0,),
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        checkColor: theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),
                        value: widget.data?.monday ?? false,
                        onChanged:(bool? value) {
                         /* setState(() {
                            _isCheckedPrimary = value!;
                            _addSearchFilter();
                          });*/
                        } ,
                      ),
                    ),),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 10,
                    width: 10,
                    child: Checkbox(
                      checkColor: theme.secondaryColor,
                      activeColor: theme.backGroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                      ),
                      value: widget.data?.tuesday ?? false,
                      onChanged:(bool? value) {
                      } ,
                    ),
                  ),),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        checkColor: theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),
                        value: widget.data?.wednesday ?? false,
                        onChanged:(bool? value) {
                        } ,
                      ),
                    )),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        checkColor: theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),
                        value: widget.data?.thursday ?? false,
                        onChanged:(bool? value) {
                        } ,
                      ),
                    )),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        checkColor: theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),
                        value: widget.data?.friday ?? false,
                        onChanged:(bool? value) {
                        } ,
                      ),
                    )),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        checkColor: theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),
                        value: widget.data?.saturday ?? false,
                        onChanged:(bool? value) {
                        } ,
                      ),
                    )),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        checkColor: theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),
                        value: widget.data?.sunday ?? false,
                        onChanged:(bool? value) {
                        } ,
                      ),
                    )),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        checkColor: theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),
                        value: widget.data?.ticketAllowed ?? false,
                        onChanged:(bool? value) {
                        } ,
                      ),
                    )),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 10,
                      width: 10,
                      child: Checkbox(
                        checkColor: theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),
                        value: widget.data?.pauseAllowed ?? false,
                        onChanged:(bool? value) {
                        } ,
                      ),
                    )),
                Container(
                    width: 150,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(createdOn, style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(validityStatus, style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),)),
                Container(
                    width: 120,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: Text(widget.data?.obligationStatus ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),)),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child: CustomerButtonWidget(text: MessagesProvider.get("Rules").toUpperCase(),
                      page : "accounts",
                       onPress: (){
                        setState(() {
                          _rules = true;
                          _criteria = false;
                        });
                    },)),
                Container(
                    width: 100,
                    margin: const EdgeInsets.only(left: 8.0,),
                    alignment: Alignment.center,
                    child:  CustomerButtonWidget(text: MessagesProvider.get("Criteria").toUpperCase(), page : "accounts",onPress: (){
                        setState(() {
                          _criteria = true;
                          _rules = false;
                        });
                    },)),
              ],
            ),
            Visibility(
              visible: ((widget.selectedIndex == widget.index) && (_rules == true || _criteria == true)) ? true : false,
              child:Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: theme.secondaryColor!) ,
                    borderRadius: BorderRadius.circular(8),
                    color: theme.backGroundColor
                ),
                child: Column(
                  children: [
                    CreditPlusChildItemHeader(rules: _rules),
                    const SizedBox(height: 4.0,),
                    RawScrollbar(
                      controller:_gameScrollController,
                      thumbVisibility: true,
                      trackVisibility: true,
                      trackColor: Colors.white,
                      thickness: 10,
                      child: ListView.builder(
                          shrinkWrap: true,
                          controller:_gameScrollController,
                          physics: const ScrollPhysics(),
                          itemCount: _rules ? widget.data?.accountCreditPlusConsumptionDTOList?.length ?? 0 : widget.data?.accountCreditPlusPurchaseCriteriaDTOList?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 3.0,bottom: 3.0,right: 3.0),
                              child: CreditPlusChildItem(
                                dateFormat: widget.dateFormat,
                                rules: _rules,
                                index: index,
                                gameContainer: widget.gameContainer,
                                gameProfileContainer: widget.gameProfileContainer,
                                productContainer: widget.productContainer,
                                categoryContainer: widget.categoryContainer,
                                orderTypeContainer: widget.orderTypeContainer,
                                data: !_rules ? null : widget.data?.accountCreditPlusConsumptionDTOList?[index],
                                purchaseCriteriaDTO: _rules ? null : widget.data?.accountCreditPlusPurchaseCriteriaDTOList?[index],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        onTap: () =>{
          setState(() {
            widget.selectedIndex = widget.index;
            widget.onChange(widget.index);
            _rules = false;
            _criteria = false;
          })
        },
      ),
    );
  }

  String _getCreditPlusType(int value){
    switch(value){
      //case 0: return  getElement("");
      case 0: return  getElement("A");
      case 1: return  getElement("L");
      case 2: return  getElement("T");
      case 3: return  getElement("G");
      case 4: return  getElement("P");
      case 5: return  getElement("B");
      case 6: return  getElement("M");
      case 7: return  getElement("V");
      case 8: return  getElement("A");
      case 9: return  getElement("D");
      case 10: return  getElement("E");
      case 11: return  getElement("F");
      case 12: return  getElement("A");
      case 13: return  getElement("H");
      case 14: return  getElement("I");
      case 15: return  getElement("J");
      case 16: return  getElement("K");
      case 17: return  getElement("N");
      case 18: return  getElement("O");
      case 19: return  getElement("Q");
      case 20: return  getElement("R");
      case 21: return  getElement("S");
      case 22: return  getElement("U");
      case 23: return  getElement("W");
      case 24: return  getElement("X");
      case 25: return  getElement("Y");
      case 26: return  getElement("Z");
      default : return "";
    }
  }

  String getElement(String creditType){
    String type = "";
    widget.loyaltyAttribute?.forEach((element) {
      if(creditType == element.creditPlusType){
        type = element.attribute ?? "";
      }
    });
    return type;
  }


}