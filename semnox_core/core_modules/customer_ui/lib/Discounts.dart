import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/account_details/account_discount_dto.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:customer_ui/widgets/DiscountsSearchItem.dart';
import 'package:customer_ui/widgets/account_details/AccountsTopBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logs_data/logger.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';

class Discounts extends StatefulWidget {
   Discounts({
    Key? key,
    required this.cId,
  }) : super(key: key);
  final int cId;

  @override
  State<Discounts> createState() => _DiscountsState();
}

class _DiscountsState extends State<Discounts> {
  bool showData = false;
  bool _isCurrentEffectiveChecked = true;
  bool _isMembershipRewardChecked = false;
  AccountDetailsData? cardData;
  final ScrollController _vertical = ScrollController();
  List<AccountDiscountData>? _discountsData;
  List<AccountDiscountData?>? _discountsDataMain;
  NotificationBar? _notificationBar;
  bool _isLoading = false;
  int _selectedIndex = 0;




  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(showHideSideBar: false);
    showData = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cardData =  context.watch<SelectedCardDetails>().selectedData;
    _discountsData = cardData?.accountDiscountDTOList ?? [];
    _discountsDataMain = cardData?.accountDiscountDTOList ?? [];
    showData = true;
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.backGroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountsTopBar(accountsData : cardData),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width:5),
                    Transform.scale(
                      scale: SizeConfig.getSize(2.9),
                      child: Checkbox(
                        checkColor:theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) =>  BorderSide(
                              width: 1.0, color: theme.secondaryColor!),
                        ),
                        //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                        value: _isCurrentEffectiveChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isCurrentEffectiveChecked = value!;
                          });
                        },
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(-10, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          MessagesProvider.get('Current Effective'),
                          style:theme.heading5?.copyWith(
                            fontSize: SizeConfig.getFontSize(18),
                              fontWeight: FontWeight.w700
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: SizeConfig.getSize(2.9),
                      child: Checkbox(
                        checkColor:theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) =>  BorderSide(
                              width: 1.0, color: theme.secondaryColor!),
                        ),
                        //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                        value: _isMembershipRewardChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isMembershipRewardChecked = value!;
                            _addSearchFilter();
                          });
                        },
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(-10, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          MessagesProvider.get('Membership Rewards'),
                          style: theme.heading5?.copyWith(
                              fontSize: SizeConfig.getFontSize(18),
                              fontWeight: FontWeight.w700
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Divider(height: SizeConfig.getSize(5),),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(left: SizeConfig.getSize(30)),
                                child: Text(
                                  MessagesProvider.get('Name'),
                                  style: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(18),
                                      fontWeight: FontWeight.w700
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: SizeConfig.getSize(80 )),
                                child: Text(
                                  MessagesProvider.get('Expiry'),
                                  style: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(18),
                                      fontWeight: FontWeight.w700
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: SizeConfig.getSize(40)),
                                child: Text(
                                  MessagesProvider.get('Percentage'),
                                  style: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(18),
                                      fontWeight: FontWeight.w700
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: SizeConfig.getSize(40)),
                                child: Text(
                                  MessagesProvider.get('Amount'),
                                  style: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(18),
                                      fontWeight: FontWeight.w700
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: SizeConfig.getSize(40)),
                                child: Text(
                                  MessagesProvider.get('Type'),
                                  style: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(18),
                                      fontWeight: FontWeight.w700
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: SizeConfig.getSize(40)),
                                child: Text(
                                  MessagesProvider.get('Min Sale Amount'),
                                  style: theme.heading5?.copyWith(
                                      fontSize: SizeConfig.getFontSize(18),
                                      fontWeight: FontWeight.w700
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Scroller(
                                  controller: _vertical,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: SizedBox(
                                      height: SizeConfig.getSize(SizeConfig.screenHeight*0.73),
                                      width: MediaQuery.of(context).size.width * 0.77,
                                      child:  ListView.builder(
                                          shrinkWrap: true,
                                          controller:_vertical,
                                          physics: const ScrollPhysics(),
                                          itemCount: _discountsData?.length ?? 0,
                                          padding: const EdgeInsets.only(left:0,right: 0.0),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(1.0),
                                              child: DiscountsSearchItem(
                                                selectedIndex: _selectedIndex, index: index,
                                                data :_discountsData,
                                                notificationBar: _notificationBar!,
                                                onChange: (value){
                                                  setState((){
                                                    _selectedIndex = value;
                                                    //  _selectedData = _accountDetailsData?[_selectedIndex];
                                                  });
                                                },),
                                            );
                                          }),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ).withLoader(isLoading: _isLoading,theme: theme);
  }

  void setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  void _addSearchFilter() {
    setState(() {
      List<AccountDiscountData> data = List.from(_discountsDataMain!);
      if(_isMembershipRewardChecked){
        data.removeWhere((element) =>
        element.membershipRewardsId == -1);
      }
      if(_isCurrentEffectiveChecked){
        data.removeWhere((element) => checkCurrentEffective(element.expiryDate,element.creationDate,element.obligationStatus)
        );
      }
      _discountsData = data;
      if(data.isEmpty){
        showData = false;
      }else{
        showData = true;
      }
    });
  }

  checkCurrentEffective(String? expiryDate, String? creationDate, String? obligationStatus) {
    if((expiryDate != null ? _isDateGreater(expiryDate): false) && obligationStatus == 'ACTIVATED' && (creationDate != null ? _isDateSmaller(creationDate) : true)){
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
}
