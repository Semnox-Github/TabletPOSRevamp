
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_ui/utils/AppColors.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/widgets/primaryMediumButton.dart';
import 'package:shift_tracking/cubit/lines_view2.dart';
import 'package:shift_tracking/cubit/remot_cashdrawer_cubit.dart';
import 'package:shift_tracking/cubit/remote_cashdrawer_cubit_state.dart';
import 'package:shift_tracking/primary_button2.dart';
import 'package:shift_tracking_data/models/shift_dto/shift_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'drawer_dropdown_view.dart';
import 'drawer_search_dropdown.dart';
import 'header_view.dart';
import 'lines_view.dart';

class RemoteCashDrawerAssignment extends StatefulWidget {
  const RemoteCashDrawerAssignment({Key? key}) : super(key: key);

  @override
  State<RemoteCashDrawerAssignment> createState() => _RemoteCashDrawerAssignmentState();
}

class _RemoteCashDrawerAssignmentState extends State<RemoteCashDrawerAssignment> {
  late SemnoxTheme theme;
  late RemoteCashDrawerCubit remoteCashDrawerCubit ;
  NotificationBar? _notificationBar;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _remarksEditingController = TextEditingController();
  late InputDecoration _textInputDecoration;

  bool isChecked = false;
  var execContextBL; var execContext; var masterDataBL;
  ShiftDTO? selectedShift = null;
  String currentPOSCounter = 'All';
  String currentPOS = 'All';
  String currentUser = 'All';
  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(showHideSideBar: false);
    remoteCashDrawerCubit = context.read<RemoteCashDrawerCubit>();
    Future.microtask(()async{
      await remoteCashDrawerCubit.getPosDropDownValues();
      await remoteCashDrawerCubit.getUserDropDownValues();
    });
    Future.microtask(() async {
     await remoteCashDrawerCubit.getOpenShiftDetails();
    });

  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);


    _textInputDecoration = InputDecoration(
      fillColor: theme.primaryColor,
      filled: true,
      hintText: MessagesProvider.get("Enter"),
      hintStyle: theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(19)),
      contentPadding: EdgeInsets.only(
          top: SizeConfig.getSize(5),
          bottom: SizeConfig.getSize(5),
          right: SizeConfig.getSize(5),
          left: SizeConfig.getSize(10)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          borderSide: BorderSide(
            width: SizeConfig.getSize(0.8),
            color: theme.dividerColor!,
          )),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          borderSide: BorderSide(
            width: SizeConfig.getSize(0.8),
            color: theme.dividerColor!,
          )),
    );


    return BlocBuilder<RemoteCashDrawerCubit, RemoteCashDrawerCubitState>(
  builder: (context, state) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: theme.transparentColor,
        child: Stack(
          children: [
            Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: theme.transparentColor,
                bottomNavigationBar: Container(
                  child: _notificationBar,
                ),
                body: Padding(
                  padding: EdgeInsets.all(SizeConfig.getSize(8.0)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(SizeConfig.getWidth(0), SizeConfig.getHeight(0), SizeConfig.getWidth(0),
                            SizeConfig.getHeight(0)),
                        child: Container(
                          height: SizeConfig.getHeight(64),
                          decoration: BoxDecoration(
                              color: theme.cartItemCardBG,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(SizeConfig.getSize(8)),
                                  topLeft: Radius.circular(SizeConfig.getSize(8)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: theme.button2BG1,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(SizeConfig.getSize(8)),
                                          topLeft: Radius.circular(SizeConfig.getSize(8)))),
                                  constraints: const BoxConstraints(
                                    minHeight: double.infinity,
                                    maxHeight: double.infinity,
                                  ),
                                  child: Padding(
                                    padding:
                                    EdgeInsets.only(left: SizeConfig.getWidth(21.0), right: SizeConfig.getWidth(20)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.white,
                                          size: SizeConfig.getSize(30),
                                        ),
                                        SizedBox(
                                          width: SizeConfig.getWidth(10),
                                        ),
                                        Text(
                                          MessagesProvider.get("CASHDRAWER \nASSIGNMENT"),
                                          style: theme.headingLight4
                                              ?.copyWith(color: Colors.white, fontSize: SizeConfig.getFontSize(24)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConfig.getWidth(8),
                              ),
                              Expanded(
                                child: Container(
                                  constraints: const BoxConstraints(
                                    minHeight: double.infinity,
                                    maxHeight: double.infinity,
                                  ),
                                  decoration: BoxDecoration(
                                      color: theme.tableRow1,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(SizeConfig.getSize(8)),
                                          bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
                                  height: SizeConfig.getHeight(64),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(SizeConfig.getSize(7)),
                                        // padding: EdgeInsets.all(SizeConfig.getSize(3)),
                                        decoration: BoxDecoration(
                                            color: theme.cartItemCardBG,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(SizeConfig.getSize(4.0)),
                                            )),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              MessagesProvider.get('Mode') ,
                                              style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16)),
                                              textAlign: TextAlign.center,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: SizeConfig.getSize(7), right: SizeConfig.getSize(7)),
                                              child: Text(
                                                MessagesProvider.get('REMOTE') ,
                                                style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      if (state.isLoading) Expanded(
                        child: Container(
                         color: Colors.white,
                         width: double.infinity,
                         child: const Center(child: CircularProgressIndicator()),
                  ),
                      ) else Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            top: SizeConfig.getHeight(10),
                            right: SizeConfig.getWidth(5),
                          ),
                          color: theme.cartItemCardBG,
                          child: Row(
                            children: [
                              _showLeftView(state),
                              _showRightView(state),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme.dividerColor,
                        height: SizeConfig.getHeight(1),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(SizeConfig.getWidth(0), SizeConfig.getHeight(0), SizeConfig.getWidth(0),
                            SizeConfig.getHeight(0)),
                        child: Container(
                          height: SizeConfig.getHeight(55),
                          decoration: BoxDecoration(
                              color: theme.cartItemCardBG,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(SizeConfig.getSize(8)),
                                  bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              state.tabValue == 'OPEN' ? Container(
                                margin: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(10)),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(SizeConfig.getWidth(10)),
                                    tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    maximumSize: Size(SizeConfig.getSize(300),SizeConfig.getSize(42)),
                                    minimumSize:  Size(SizeConfig.getSize(100),SizeConfig.getSize(42)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.getSize(8)), // <-- Radius
                                    ),
                                    backgroundColor:  theme.button2InnerShadow1,
                                  ),
                                  onPressed: () {
                                    if(state.cash == '' || state.cardCount == ''){
                                      _notificationBar!.showMessage(
                                          "Please enter closing balance",
                                          AppColors.notificationBGLightYellowColor);
                                    } else if( selectedShift == null){
                                      _notificationBar!.showMessage(
                                          "Please select a shift",
                                          AppColors.notificationBGLightYellowColor);
                                    }
                                    else{
                                      _notificationBar!.showMessage(
                                          "",
                                          Colors.white);
                                      remoteCashDrawerCubit.provisionalCloseShift(shiftDto: selectedShift!);
                                    }
                                  },
                                  child: Text(
                                    'PROVISIONAL CLOSE',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style:  theme.headingLight5!.copyWith(fontSize:SizeConfig.getFontSize(18),color: Colors.white),
                                  ),
                                ),
                              ) : SizedBox(),
                              state.tabValue == 'PROVISIONAL CLOSE' || state.tabValue == 'OPEN' ?  Container(
                                margin: EdgeInsets.symmetric(horizontal: SizeConfig.getWidth(10)),
                                child: PrimaryMediumButton(
                                  onPressed: () {
                                    if(state.cash == '' || state.cardCount == ''){
                                      _notificationBar!.showMessage(
                                          "Please enter closing balance",
                                          AppColors.notificationBGLightYellowColor);
                                    } else if( selectedShift == null){
                                      _notificationBar!.showMessage(
                                          "Please select a shift",
                                          AppColors.notificationBGLightYellowColor);
                                    }
                                    else{
                                      _notificationBar!.showMessage(
                                          "",
                                          Colors.white);
                                     remoteCashDrawerCubit.unAssignOpenCashDrawer(shiftDto: selectedShift!);
                                    }
                                  },
                                  text: 'UNASSIGN',
                                ),
                              ) : SizedBox(),
                          //    rcashDrawerAssignedLoginId != 'null' ? const SizedBox(width: 20,) : Container(),
                              state.tabValue == 'NOT OPEN'? PrimaryMediumButton(
                                onPressed: () {
                                  // print("cardCount.value : "+cardCount.value);
                                  if(state.cash == ''){
                                    _notificationBar!.showMessage(
                                        "Please enter opening balance",
                                        AppColors.notificationBGLightYellowColor);
                                  }else{
                                    _notificationBar!.showMessage(
                                        "",
                                        Colors.white);
                                    //createNewShift();
                                  }
                                },
                                text: MessagesProvider.get('ASSIGN'),
                              ) : const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  },
);
  }

  _showLeftView(RemoteCashDrawerCubitState state) {
    List<String> posDropDown = state.posMachineContainer!.map((item) => item.posName.toString()).toList();
    posDropDown = ["All",...posDropDown];
    List<String> userDropDown = state.userContainer!.map((item) => item.userName.toString()).toList();
    userDropDown = ["All",...userDropDown];
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                     // flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(left: SizeConfig.getHeight(7.5)),
                        child: PrimaryButton2(
                          onPressed: () {
                            remoteCashDrawerCubit.changeTabValue('OPEN');
                            remoteCashDrawerCubit.getOpenShiftDetails();
                          },
                          text: MessagesProvider.get('OPEN'),
                          isEnabled: state.tabValue == 'OPEN' ? true : false,
                        ),
                      ),
                    ),
                    Expanded(
                     // flex:3,
                      child: Padding(
                        padding: EdgeInsets.only(left: SizeConfig.getHeight(7.5)),
                        child: PrimaryButton2(
                          onPressed: () {
                            remoteCashDrawerCubit.changeTabValue('NOT OPEN');
                          },
                          text: MessagesProvider.get('NOT OPEN'),
                          isEnabled: state.tabValue == 'NOT OPEN' ? true : false,
                        ),
                      ),
                    ),
                    Expanded(
                   // flex:3,
                      child: Padding(
                        padding: EdgeInsets.only(left: SizeConfig.getHeight(7.5), right: SizeConfig.getHeight(7.5)),
                        child: PrimaryButton2(
                          onPressed: () {
                            remoteCashDrawerCubit.changeTabValue('PROVISIONAL CLOSE');
                            remoteCashDrawerCubit.getProvisionalCloseShiftDetails();
                          },
                          text: MessagesProvider.get('PROVISIONAL CLOSE'),
                          isEnabled: state.tabValue == 'PROVISIONAL CLOSE' ? true : false,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(73) : SizeConfig.getHeight(82),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: SizeConfig.getHeight(7.5), top: SizeConfig.getHeight(7.5)),
                          child: DrawerSearchDropDown(
                            isUserManager: false,
                            title: MessagesProvider.get("POS Counter"),
                            dropdownValues: const [
                             "All", "Default","Kiosk"
                            ],
                            selectedValueCallback: (String value) {
                              currentPOSCounter = value;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: SizeConfig.getHeight(7.5), top: SizeConfig.getHeight(7.5)),
                          child: DrawerSearchDropDown(
                            isUserManager: false,
                            title: MessagesProvider.get("POS"),
                            dropdownValues:  posDropDown, //TODO Change the values here. Values used for UI testing purpose
                            selectedValueCallback: (String value) {
                              currentPOS = value;
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      print("User-$currentUser");
                      print('posCounter- $currentPOSCounter');
                      print('Pos-$currentPOS');
                      remoteCashDrawerCubit.search(currentPOSCounter, currentPOS, currentUser);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getSize(7.5), bottom: SizeConfig.getHeight(10), right: SizeConfig.getSize(7.5)),
                      child: Container(
                        height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(42) : SizeConfig.getHeight(55),
                        width: SizeConfig.isBigDevice() ? SizeConfig.getHeight(42) : SizeConfig.getHeight(55),
                        decoration:
                        BoxDecoration(color: theme.button1BG1!, borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        child: Icon(Icons.search, size: SizeConfig.getWidth(33), color: theme.secondaryColor!),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: SizeConfig.getHeight(7.5), top: SizeConfig.getHeight(7.5)),
                        child: DrawerSearchDropDown(
                          isUserManager: false,
                          title: MessagesProvider.get("User"),
                          dropdownValues:
                            userDropDown,
                          selectedValueCallback: (String value) {
                            currentUser = value;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(left: SizeConfig.getHeight(7.5), top: SizeConfig.getHeight(7.5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              state.tabValue == 'NOT OPEN' ? Padding(
                                padding: EdgeInsets.only(bottom: SizeConfig.getSize(3)),
                                child: Text(
                                  MessagesProvider.get("Shareable"),
                                  style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16)),
                                ),
                              ) :SizedBox(),
                              state.tabValue == 'NOT OPEN' ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      isChecked = !isChecked;
                                    });
                                  },
                                  child: Container(
                                    height: SizeConfig.getSize(40),
                                    width: SizeConfig.getSize(40),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(6))),
                                      border: Border.all(width: SizeConfig.getWidth(1), color: theme.secondaryColor!),
                                      color: theme.transparentColor,
                                    ),
                                    child: isChecked == true
                                        ? Image.asset(
                                      "assets/check.png",
                                      color: theme.secondaryColor,
                                      width: SizeConfig.getSize(40),
                                      height: SizeConfig.getSize(40),
                                    )
                                        : const SizedBox(),
                                  )) : SizedBox(),
                            ],
                          )
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(SizeConfig.getSize(7.5)),
                child: SizedBox(
                  height: SizeConfig.getSize(58),
                  width: SizeConfig.getSize(58),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              margin:  EdgeInsets.all( SizeConfig.getSize(7.5)),
              decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(SizeConfig.getSize(5)),
                   border: Border.all(
                   width: SizeConfig.getSize(1),
                   color: theme.dividerColor!,
                   )
              ),
              child: Column(
                children: [
                 SizedBox(height:SizeConfig.getSize(5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("POS",style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                      Text("CashDrawer",style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                      Text("Shareable",style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                      Text("User",style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                      Text("Shift Time",style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                    ],
                  ),
                  SizedBox(height:SizeConfig.getSize(5)),

                  Expanded(
                    child: ListView.builder(
                      itemCount: state.openShiftList.length,
                      itemBuilder:(ctx,intex) {
                        final shiftItem = state.openShiftList[intex];
                        return GestureDetector(
                          onTap: (){
                            remoteCashDrawerCubit.getSystemValues(shiftItem);
                            selectedShift = shiftItem;
                            remoteCashDrawerCubit.resetFormValues();
                          },
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                                margin: EdgeInsets.all(SizeConfig.getSize(5)),
                                height: SizeConfig.getSize(50),
                                decoration: BoxDecoration(
                                color: theme.tableRow1,
                                borderRadius: BorderRadius.circular(SizeConfig.getSize(5)),
                            border: Border.all(
                            width: SizeConfig.getSize(2),
                            color: theme.dividerColor!,
                            )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: SizeConfig.getSize(5)),
                                  Text(shiftItem.posMachine ?? '',style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                                  SizedBox(width: SizeConfig.getSize(10)),
                                  Text("SYSTEM-CDR",style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                                  SizedBox(width: SizeConfig.getSize(10)),
                                  Container(
                                    height: SizeConfig.getSize(35),
                                    width: SizeConfig.getSize(35),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(6))),
                                      border: Border.all(width: SizeConfig.getWidth(1), color: theme.secondaryColor!),
                                      color: Colors.white,
                                    ),
                                    child: shiftItem.isShareable == true
                                        ? Image.asset(
                                      "assets/check.png",
                                      color: theme.secondaryColor,
                                      width: SizeConfig.getSize(40),
                                      height: SizeConfig.getSize(40),
                                    )
                                        : const SizedBox(),
                                  ),
                                  SizedBox(width: SizeConfig.getSize(10)),
                                  Text(shiftItem.shiftLoginId ?? '',style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                                  SizedBox(width: SizeConfig.getSize(10)),
                                  Text(shiftItem.shiftTime ?? '',style: theme.heading6?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16),)),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _showRightView(RemoteCashDrawerCubitState state) {
    return Expanded(
      flex: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const HeaderView(),
          Expanded(
            child: Scroller(
                controller: _scrollController,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Container(
                    padding: EdgeInsets.only(
                        right: SizeConfig.isBigDevice() ? SizeConfig.getWidth(33.0) : SizeConfig.getWidth(55.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LinesView2(
                          isSystemCDREnabled:  true,
                          type: '* Cash',
                          cashier: null,
                          system: state.systemCash,
                          netShift: null,
                          buttonText: null,
                        ),
                        LinesView2(
                          isSystemCDREnabled:  true,
                          type: '* Card Count',
                          cashier: null,
                          system: state.systemCardCount,
                          netShift: null,
                          buttonText: null,
                        ),
                        LinesView2(
                          isSystemCDREnabled: false,
                          type: 'Game Card',
                          cashier: null,
                          system: state.systemGameCard,
                          netShift: null,
                          buttonText: null,
                        ),
                        LinesView2(
                          isSystemCDREnabled:  true,
                          type: 'Credit Card',
                          cashier: null,
                          system: state.systemCreditCard,
                          netShift: null,
                          buttonText: null,
                        ),
                        LinesView2(
                          isSystemCDREnabled:  true,
                          type: 'Others',
                          cashier: null,
                          system: state.systemOthers,
                          netShift: null,
                          buttonText: null,
                        ),
                        LinesView2(
                          isSystemCDREnabled:  true,
                          type: 'Coupons',
                          cashier: null,
                          system: state.systemCoupons,
                          netShift: null,
                          buttonText: null,
                        ),
                        LinesView2(
                          isSystemCDREnabled:  true,
                          type: 'Tickets',
                          cashier: null,
                          system: state.systemTicket,
                          netShift: null,
                          buttonText: null,
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: SizeConfig.getWidth(7), left: SizeConfig.getWidth(5), bottom: SizeConfig.getWidth(7)),
                child: Text(
                  MessagesProvider.get("Remarks"),
                  style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(21)),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                height: SizeConfig.getSize(48),
                margin: EdgeInsets.only(bottom: SizeConfig.getSize(8)),
                child: TextFormField(
                    inputFormatters: [LengthLimitingTextInputFormatter(30)],
                    keyboardType: TextInputType.text,
                    controller: _remarksEditingController,
                    style: theme.subtitle2!.copyWith(fontSize: SizeConfig.getFontSize(19)),
                    decoration: _textInputDecoration),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
