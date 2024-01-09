import 'package:customer_data/models/account_details/account_credit_plus_consumption_dto.dart';
import 'package:customer_data/models/account_details/account_credit_plus_purchase_criteria_dto.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:master_data/models/category_container/category_container_dto.dart';
import 'package:master_data/models/game_container/game_container_dto.dart';
import 'package:master_data/models/game_profile_container/game_profile_container_dto.dart';
import 'package:master_data/models/order_type_container/order_type_container_dto.dart';
import 'package:product_menu_data/builder.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:intl/intl.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';


class CreditPlusChildItem extends StatefulWidget{

  bool rules = false;
  int index = 0;
  AccountCreditPlusConsumptionDTO? data;
  AccountCreditPlusPurchaseCriteriaDTO? purchaseCriteriaDTO;
  List<GameProfileContainerDTO>? gameProfileContainer;
  List<GameContainerDTO>? gameContainer;
  List<ProductContainerDTO>? productContainer;
  List<CategoryContainerDTO>? categoryContainer;
  List<OrderTypeContainerDTO>? orderTypeContainer;
  String? dateFormat;


  CreditPlusChildItem({super.key,
      required this.rules,
      required this.index,
      this.data,
      this.gameProfileContainer,
      this.gameContainer,
      this.productContainer,
      this.categoryContainer,
      this.orderTypeContainer,
      this.purchaseCriteriaDTO,
      this.dateFormat});

  @override
  State<CreditPlusChildItem> createState() => _CreditPlusChildItemState();
}

class _CreditPlusChildItemState extends State<CreditPlusChildItem> {
  String productName = "";

  @override
  void initState() {
    super.initState();
    _initDropDown();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    String gameProfileName = "";
    String gameName = "";

    String categoryName = "";
    String orderTypeName = "";
    String expiryDate = "";

    widget.gameProfileContainer?.forEach((element) {
      if(element.gameProfileId == widget.data?.gameProfileId){
        gameProfileName = element.profileName;
      }
    });
    widget.gameContainer?.forEach((element) {
      if(element.gameId == widget.data?.gameId){
        gameName = element.gameName ?? "";
      }
    });
    /*productContainer?.forEach((element) {
      if(element.productId == data?.productId){
        productName = element.productName;
      }
    });*/
    widget.categoryContainer?.forEach((element) {
      if(element.categoryId == widget.data?.categoryId){
        categoryName = element.name ?? "";
      }
    });
    widget.orderTypeContainer?.forEach((element) {
      if(element.orderTypeId == widget.data?.orderTypeId){
        orderTypeName = element.description ?? "";
      }
    });

    if(widget.data?.expiryDate != null && widget.data?.expiryDate != "") {
      var parsedDate = DateTime.parse(widget.data?.expiryDate.toString() ??
          "1974-03-20 00:00:00.000");
      expiryDate = DateFormat(widget.dateFormat).format(parsedDate);
    }

    return  Row(
      children: [
        Visibility(
          visible : widget.rules == true ? true:false,
          child: Container(
              width: 100,
              alignment: Alignment.center,
              child: Text(categoryName, style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        ),
        Container(
            width: 100,
            margin: const EdgeInsets.only(left: 8.0,),
            alignment: Alignment.center,
            child: Text(productName, style:theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        Visibility(
          visible : widget.rules == true ? true:false,
          child: Container(
              width: 100,
              margin: const EdgeInsets.only(left: 12.0,),
              alignment: Alignment.center,
              child: Text(orderTypeName, style:theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        ),
        Visibility(
          visible : widget.rules == true ? true:false,
          child: Container(
              width: 100,
              margin: const EdgeInsets.only(left: 12.0,),
              alignment: Alignment.center,
              child: Text(gameProfileName, style:theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        ),
        Visibility(
          visible : widget.rules == true ? true:false,
          child: Container(
              width: 100,
              margin: const EdgeInsets.only(left: 12.0,),
              alignment: Alignment.center,
              child: Text(gameName, style:theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        ),
        Visibility(
          visible : widget.rules == true ? true:false,
          child: Container(
              width: 120,
              margin: const EdgeInsets.only(left: 12.0,),
              alignment: Alignment.center,
              child: Text(widget.data?.discountPercentage == null ? "": (widget.data?.discountPercentage.toString() ?? ""), style:theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        ),
        Visibility(
          visible : widget.rules == true ? true:false,
          child: Container(
              width: 100,
              margin: const EdgeInsets.only(left: 12.0,),
              alignment: Alignment.center,
              child: Text(widget.data?.discountAmount ?? "", style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        ),
        Visibility(
          visible : widget.rules == true ? true:false,
          child: Container(
              width: 100,
              margin: const EdgeInsets.only(left: 12.0,),
              alignment: Alignment.center,
              child: Text(widget.data?.discountedPrice == null ? "":( widget.data?.discountedPrice.toString() ?? ""), style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        ),
        Visibility(
          visible : widget.rules == true ? true:false,
          child: Container(
              width: 100,
              margin: const EdgeInsets.only(left: 12.0,),
              alignment: Alignment.center,
              child: Text(widget.data?.consumptionQty == null ? "": (widget.data?.consumptionQty.toString() ?? ""), style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        ),
        Visibility(
          visible : widget.rules == true ? true:false,
          child: Container(
              width: 100,
              margin: const EdgeInsets.only(left: 12.0,),
              alignment: Alignment.center,
              child: Text(widget.data?.consumptionBalance == null ? "": (widget.data?.consumptionBalance.toString() ?? ""), style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        ),
        Visibility(
          visible : widget.rules == true ? true:false,
          child: Container(
              width: 100,
              margin: const EdgeInsets.only(left: 12.0,),
              alignment: Alignment.center,
              child: Text(expiryDate, style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        ),
        Visibility(
          visible : widget.rules == true ? true:false,
          child: Container(
              width: 100,
              margin: const EdgeInsets.only(left: 12.0,),
              alignment: Alignment.center,
              child: Text(widget.data?.quantityLimit == null ? "": (widget.data?.quantityLimit.toString() ?? ""), style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(16)),overflow: TextOverflow.ellipsis,)),
        ),
      ],
    );
  }

  _initDropDown() async{
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    //var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var productMenuDataBl = await ProductMenuDataBuilder.build(execContextDTO!);
    var productProfileContainerResponse = await productMenuDataBl.getProductContainerDetails(widget.rules? (widget.data?.productId ?? -1) : (widget.purchaseCriteriaDTO?.productId ?? -1));
    productName = productProfileContainerResponse?.productName ?? "";
    setState(() {

    });
  }
}