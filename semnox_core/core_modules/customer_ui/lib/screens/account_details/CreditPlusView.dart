import 'dart:convert';
import 'package:customer_data/models/account_details/account_credit_plus_dto.dart';
import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_data/models/loyalty_attribute_container/loyalty_attribute_container_dto.dart';
import 'package:customer_data/models/loyalty_attribute_container/loyalty_attribute_container_response.dart';
import 'package:customer_ui/ListViewItems/account_details/CreditPlusItem.dart';
import 'package:customer_ui/ListViewItems/account_details/CreditPlusItemHeader.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/widgets/account_details/AccountSearchFilter.dart';
import 'package:customer_ui/widgets/account_details/AccountsTopBar.dart';
import 'package:customer_ui/widgets/account_details_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:customer_data/builder.dart';
import 'package:execution_context/builder.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/category_container/category_container_dto.dart';
import 'package:master_data/models/game_container/game_container_dto.dart';
import 'package:master_data/models/game_profile_container/game_profile_container_dto.dart';
import 'package:master_data/models/order_type_container/order_type_container_dto.dart';
import 'package:product_menu_data/builder.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:logs_data/logger.dart';

import 'package:provider/provider.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';


class CreditPlusView extends StatefulWidget {
  const CreditPlusView({
    Key? key,
    required this.cId,
  }) : super(key: key);
  final int cId;

  @override
  State<CreditPlusView> createState() => _CreditPlusViewState();
}

class _CreditPlusViewState extends State<CreditPlusView> {

  AccountDetailsResponse? accounts;
  AccountDetailsData? accountsData;
  CustomerData? data;
  bool showData = false;
  final ScrollController _creditHorizontalScrollController = ScrollController();
  final ScrollController _creditScrollController = ScrollController();
  LoyaltyAttributeContainerDTO? type;

  bool _nonZeroBalance = true;
  bool _currentEffective = true;
  bool _memberShipReward = false;
  String? _dateFormat;

  List<AccountCreditPlusDTO>? _data;
  List<LoyaltyAttributeContainerDTO>? _loyaltyAttribute;

  List<GameProfileContainerDTO>? _gameProfileContainer;
  List<GameContainerDTO>? _gameContainer;
  List<ProductContainerDTO>? _productContainer;
  List<CategoryContainerDTO>? _categoryContainer;
  List<OrderTypeContainerDTO>? _orderTypeContainer;

  Future getAccountDetails(BuildContext context) async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();

    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    accounts = await customerDataBl.getCustomerAccounts(customerId: widget.cId);
    /*setState(() {
      showData = true;
    });*/
    Log.v("Selected Customer ID : ${widget.cId}");
    Log.v("tagNumber : ${accounts?.data?.first.tagNumber}");
    Log.v("showData : $showData");

  }

  @override
  void initState() {
    super.initState();
    _getConfigurations(context);
    showData = false;
    _initDropDown();
    //data = context.watch<SelectedCustomer>().selectedData;
    //getAccountDetails(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //data = context.watch<SelectedCustomer>().selectedData;
    accountsData = context.watch<SelectedCardDetails>().selectedData;
    _addSearchFilter();
    showData = true;
  }

  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;
  bool checkedValue = true;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      //height: MediaQuery.of(context).size.height*0.90,
      //constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AccountsTopBar(accountsData : accountsData),
          AccountsSearchFilter(
            nonZeroBalance: _nonZeroBalance,
            currentEffective: _currentEffective,
            membershipReward: _memberShipReward,
            onChangeNonZeroBalance: (value){
              setState(() {
                _nonZeroBalance = value;
                _addSearchFilter();
              });
            },
            onChangeCurrentEffective: (value){
              setState(() {
                _currentEffective = value;
                _addSearchFilter();
              });
            },
            onChangeMembershipReward: (value){
              setState(() {
                _memberShipReward = value;
                _addSearchFilter();
              });
            },
            onChange: (value){
              type = value;
              _addSearchFilter();
            },),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Divider(color: theme.dividerColor,),
          ),
          Expanded(
            child: Scroller(
              controller:_creditHorizontalScrollController,
              child: Padding(
                padding: const EdgeInsets.only(bottom : 24.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller:_creditHorizontalScrollController,
                  child: Scroller(
                    controller:_creditScrollController,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: SingleChildScrollView(
                        child: Container(
                          width: 3130,
                          //height: 200,
                          child: Column(
                            children: [
                              CreditPlusItemHeader(),
                              ListView.builder(
                                  shrinkWrap: true,
                                  controller:_creditScrollController,
                                  physics: const ScrollPhysics(),
                                  itemCount: _data?.length ?? 0,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: CreditPlusItem(
                                        dateFormat: _dateFormat,
                                        selectedIndex: _selectedIndex, index: index,
                                        data :_data?[index],
                                        loyaltyAttribute: _loyaltyAttribute,
                                        gameProfileContainer: _gameProfileContainer,
                                        gameContainer: _gameContainer,
                                        productContainer: _productContainer,
                                        categoryContainer: _categoryContainer,
                                        orderTypeContainer: _orderTypeContainer,
                                        onChange: (value){
                                          setState((){
                                            _selectedIndex = value;
                                            //_selectedData = _data?[_selectedIndex];
                                          });
                                        },),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addSearchFilter() {
    Log.printMethodStart('_addSearchFilter()', 'Credit Plus View Screen','confirm');
    setState(() {
      List<AccountCreditPlusDTO>? data = List.from(accountsData?.accountCreditPlusDTOList ?? []);
      data.sort((a,b) => DateTime.parse(b.creationDate).compareTo(DateTime.parse(a.creationDate)));

      print("credit type ${type?.creditPlusType}");
      if(type != null && type?.loyaltyAttributeId != -1){
        data.removeWhere((element) =>  type?.creditPlusType != _getCreditPlusType(element.creditPlusType));
      }

      if(_memberShipReward){
        data.removeWhere((element) =>
        element.membershipRewardsId == -1);
      }
      if(_nonZeroBalance){
        data.removeWhere((element) =>
        element.creditPlusBalance <= 0);
      }

      if(_currentEffective){
        data.removeWhere((element) => checkCurrentEffective(element.periodTo,element.periodFrom,element.obligationStatus));
      }
      _data = data;
    });
    Log.printMethodEnd('_addSearchFilter()', 'Credit Plus View Screen','confirm');
  }

  String _getCreditPlusType(int value){
    switch(value){
    //case 0: return  getElement("");
      case 0: return "A";
      case 1: return "L";
      case 2: return "T";
      case 3: return "G";
      case 4: return "P";
      case 5: return "B";
      case 6: return "M";
      case 7: return "V";
      case 8: return "A";
      case 9: return "D";
      case 10: return "E";
      case 11: return "F";
      case 12: return "A";
      case 13: return "H";
      case 14: return "I";
      case 15: return "J";
      case 16: return "K";
      case 17: return "N";
      case 18: return "O";
      case 19: return "Q";
      case 20: return "R";
      case 21: return "S";
      case 22: return "U";
      case 23: return "W";
      case 24: return "X";
      case 25: return "Y";
      case 26: return "Z";
      default : return "";
    }
  }

  checkCurrentEffective(String? periodTo, String? periodFrom, String? obligationStatus) {
    if((periodTo != null ? _isDateGreater(periodTo): false) && obligationStatus == 'ACTIVATED' && (periodFrom != null ? _isDateSmaller(periodFrom) : true)){
      return true;
    }else{
      return false;
    }
  }


  bool _isDateGreater(String date){
    DateTime dt1 = DateTime.parse(date); //from
    DateTime dt2 = DateTime.now();
    return dt1.compareTo(dt2) > 0 ? true: false;
  }

  bool _isDateSmaller(String date){
    DateTime dt1 = DateTime.parse(date); //from
    DateTime dt2 = DateTime.now();
    return dt1.compareTo(dt2) < 0 ? true: false;
  }

  _initDropDown() async{
    Log.printMethodStart('_addSearchFilter()', 'Credit Plus View Screen','init');
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var productMenuDataBl = await ProductMenuDataBuilder.build(execContextDTO);
    final customerSearchBL = await CustomerDataBuilder.build(execContextDTO);
    LoyaltyAttributeContainerResponse? response = await customerSearchBL.getLoyaltyAttribute();
    _loyaltyAttribute = response?.data?.loyaltyAttributeContainerDTO;
  /*  if((widget.loyaltyAttribute?.length ?? 0) > 0){
      var item1 = LoyaltyAttributeContainerDTO(loyaltyAttributeId: -1, attribute: "All", purchaseApplicable: '',
          consumptionApplicable: '', dBColumnName: 'all', creditPlusType: '');
      value = item1;
      item.add(DropdownMenuItem(
          value: item1,
          child: AutoSizeText(item1.attribute.toString() ?? "",
              style: AppStyle.dropDownTextStyle)));
    }
    widget.loyaltyAttribute?.forEach((element) {
      print("itemsss ${element.attribute}");
      item.add(DropdownMenuItem(
          value: element,
          child: AutoSizeText(element.attribute.toString() ?? "",
              style: AppStyle.dropDownTextStyle)));
    });*/

    var gameProfileContainerResponse = await masterDataBL.getGameProfileContainer();
    _gameProfileContainer = gameProfileContainerResponse?.data?.gameProfileContainerDTOList;
    var gameContainerResponse = await masterDataBL.getGameContainer();
    _gameContainer = gameContainerResponse?.data?.gameContainerDTOList;
   /* var productProfileContainerResponse = await productMenuDataBl.getProductContainerDetails(productId);
    _productContainer = gameProfileContainerResponse?.data?.gameProfileContainerDTOList;*/
    var categoryContainerResponse = await masterDataBL.getCategoryContainer();
    _categoryContainer = categoryContainerResponse?.data?.categoryContainerDTOList;
    var orderTypeProfileContainerResponse = await masterDataBL.getOrderTypeContainer();
    _orderTypeContainer = orderTypeProfileContainerResponse?.data?.orderTypeContainerDTOList;
    Log.v("game profile count ${_gameProfileContainer?.length}");
    Log.v("game count ${_gameContainer?.length}");
    setState(() {

    });
    Log.printMethodEnd('_addSearchFilter()', 'Credit Plus View Screen','init');
  }

  Future _getConfigurations(BuildContext context) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _dateFormat = await masterDataBl.getDefaultValuesByName(defaultValueName: "DATETIME_FORMAT");
    _dateFormat = _dateFormat?.replaceAll('tt', 'a');
  }
}
