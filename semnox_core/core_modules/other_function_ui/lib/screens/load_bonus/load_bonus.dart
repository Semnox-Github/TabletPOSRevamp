import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/cubits/load_bonus/load_bonus_cubit.dart';
import 'package:other_function_ui/bloc/cubits/load_bonus/load_bonus_state.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';
import '../../widgets/action_btns.dart';
import '../../widgets/card_number_entry_dialog/card_number_entry_dialog.dart';
import '../widgets/card_details_widget.dart';
import 'package:widgets_library/utils/size_config.dart';


class LoadBonusScreen extends StatelessWidget {
  const LoadBonusScreen(
      {Key? key,
        this.approverId,
        this.onSuccessShowNotification,
        this.onFailureShowNotification})
      : super(key: key);
  final Function? onSuccessShowNotification;
  final Function? onFailureShowNotification;
  final int? approverId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoadBonusCubit>(
              create: (BuildContext context) => LoadBonusCubit()),
        ],
        child: LoadBonusSection(
          approverId:approverId,
          onSuccessShowNotification: onSuccessShowNotification,
          onFailureShowNotification: onFailureShowNotification,
        ));
  }
}

class LoadBonusSection extends StatefulWidget {
  const LoadBonusSection(
      {Key? key,
        this.approverId,
        this.onSuccessShowNotification,
        this.onFailureShowNotification})
      : super(key: key);
  final Function? onSuccessShowNotification;
  final Function? onFailureShowNotification;
  final int? approverId;

  @override
  State<LoadBonusSection> createState() =>
      _LoadBonusSectionState();
}

class _LoadBonusSectionState
    extends State<LoadBonusSection> {
  AccountDetailsResponse? accounts;
  final _scrollController = ScrollController();
  late NotificationBar _notificationBar;
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  final TextEditingController _remarkTextController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  bool _isNFCAvailable = false;
  late SemnoxTheme _theme;

  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false,);
    _setInitialValues();
    WidgetsBinding.instance
        .addPostFrameCallback((_) =>     _notificationBar.showMessage(MessagesProvider.get("Enter only decimal value for '&1'.", ["Bonus to Load"]), _theme.footerBG5!));
    super.initState();
  }

  _resetLoaderStatus() {
    context.read<LoadBonusCubit>().resetValues();
  }

  _setInitialValues() async {
    _isNFCAvailable = await NFCManager().isNfcAvailable();
      context.read<LoadBonusCubit>().setInitialValues("CB");
  }

  @override
  void didUpdateWidget(covariant LoadBonusSection oldWidget) {
    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Material(
      color: _theme.transparentColor,
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: _theme.transparentColor,
            bottomNavigationBar: SizedBox(
              width: _screenWidth,
              child: Container(
                child: _notificationBar,
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(10), SizeConfig.getSize(10), SizeConfig.getSize(10), 0),
                  child: Container(
                    decoration:  BoxDecoration(
                        color: _theme.backGroundColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(SizeConfig.getSize(8)),
                            topLeft: Radius.circular(SizeConfig.getSize(8)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding:  EdgeInsets.symmetric(
                              horizontal: SizeConfig.getSize(8),
                            ),
                            height: SizeConfig.getSize(96),
                            decoration:  BoxDecoration(
                              color: _theme.button2InnerShadow1!,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(SizeConfig.getSize(8)),
                                bottomRight: Radius.circular(SizeConfig.getSize(8)),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                 Icon(
                                  Icons.arrow_back_ios,
                                  color: _theme.light1!,
                                   size:SizeConfig.getSize(30)
                                ),
                                Center(
                                  child: Text(
                                  MessagesProvider.get('Load bonus')
                                        .toUpperCase(),
                                    style: _theme.headingLight4!.copyWith(color: _theme.light1, fontSize:SizeConfig.getFontSize(22)),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                         SizedBox(width: SizeConfig.getSize(10)),
                        Expanded(
                          child: BlocBuilder<LoadBonusCubit,
                              LoadBonusState>(
                              builder: (context, state) {
                                if (state.isPrimaryCardApplied) {
                                  return _cardDetails(
                                    state.primaryCardData,
                                  );
                                }
                                return Container(
                                  height: SizeConfig.getSize(96),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: _theme.button1BG1!!,
                                  ),
                                  child: Center(
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:[
                                          Text(
                                            _isNFCAvailable
                                                ? MessagesProvider.get('Tap Card OR')
                                                : MessagesProvider.get(''),
                                            style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(25)),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(width: 5,),
                                          SizedBox(
                                            height:SizeConfig.isBigDevice()? SizeConfig.getSize(72):null,
                                            child: ElevatedButton(onPressed: (){
                                              // context.read<BalanceTransferCubit>().addMultiCard(tagNumber: "VINAY123");
                                              showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (newContext) {
                                                  return BlocProvider<
                                                      LoadBonusCubit>.value(
                                                      value: context
                                                          .read<LoadBonusCubit>(),
                                                      child:CardNumberEntryDialog(
                                                        isNFCAvailable:
                                                        state.allowManualEntryCard == "Y"?  _isNFCAvailable: false,
                                                        notificationBar: _notificationBar,
                                                        onSuccess: (AccountDetailsResponse accountsData){
                                                          context.read<LoadBonusCubit>().addPrimaryCard(accountsData:accountsData, );
                                                        }, onLoginViaCardSuccess: () {  },));
                                                },
                                              );
                                            },
                                                style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.all(SizeConfig.getWidth(4)),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(
                                                        SizeConfig.getSize(8)), // <-- Radius
                                                  ),
                                                  backgroundColor: _theme.button2InnerShadow1!,),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(MessagesProvider.get('ENTER CARD NO'),
                                                      overflow: TextOverflow.ellipsis,
                                                      style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18),color: _theme.light1!)),
                                                )),
                                          )
                                        ]),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin:  EdgeInsets.symmetric(horizontal: SizeConfig.getSize(10)),
                    color: _theme.backGroundColor,
                    child: CustomScrollView(
                      shrinkWrap: true,
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: true,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // const Spacer(),
                              // const SizedBox(height: 4,),
                              Expanded(
                                // flex: 8,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                    color: _theme.backGroundColor,
                                  ),
                                  child: Scroller(
                                    controller: _scrollController,
                                    child: ListView(
                                        controller: _scrollController,
                                        children:[ _body()]),
                                  ),
                                ),
                              ),
                              // const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: SizeConfig.getSize(10)),
                  child: Container(
                    color: _theme.backGroundColor,
                    child: Column(
                      children: [
                        Container(
                          height: 1,
                          width: _screenWidth,
                          color: _theme.dialogHeaderInnerShadow,
                        ),
                         SizedBox(
                          height: SizeConfig.getSize(4),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: SizeConfig.getSize(8)),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      BlocConsumer<LoadBonusCubit, LoadBonusState>(
                                          listener: (context, state){},
                                          builder: (context, loadBonusState) {
                                          return Text("${MessagesProvider.get('Remarks')}${loadBonusState.isRemarksMandatory == "Y"?'*':''}",
                                              style:_theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(20)));
                                        }
                                      ),
                                       SizedBox(height: SizeConfig.getSize(8)),
                                      SizedBox(
                                        height:SizeConfig.getSize(42),
                                        child: TextFormField(
                                          controller: _remarkTextController,
                                          style:_theme.title1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                          decoration:
                                          InputDecoration(
                                              fillColor: _theme.primaryColor,
                                              filled: true,
                                              contentPadding: EdgeInsets.only(
                                                top:  SizeConfig.getSize(5),
                                                bottom:  SizeConfig.getSize(5),
                                                right: SizeConfig.getSize(10),
                                                left: SizeConfig.getSize(10),
                                              ),
                                              errorStyle:
                                              TextStyle(color: _theme.textField1Error),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(SizeConfig.getSize(8))),
                                                  borderSide: BorderSide(
                                                      color: _theme.secondaryColor!)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(SizeConfig.getSize(8))),
                                                  borderSide: BorderSide(
                                                      color: _theme.secondaryColor!)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(SizeConfig.getSize(8))),
                                                  borderSide: BorderSide(
                                                      color: _theme.secondaryColor!)),
                                              hintText: MessagesProvider.get(
                                                  'Enter Remarks'),
                                              suffixStyle: _theme.textFieldHintStyle!.copyWith(
                                                  fontSize: SizeConfig.getFontSize(16))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                         SizedBox(
                          height:  SizeConfig.getSize(10),
                        ),
                        Container(
                          height: 1,
                          width: _screenWidth,
                          color: _theme.dialogHeaderInnerShadow,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding:  EdgeInsets.fromLTRB( SizeConfig.getSize(10), 0,  SizeConfig.getSize(10),  SizeConfig.getSize(10),),
                    child: Container(
                      decoration:  BoxDecoration(
                          color: _theme.backGroundColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(SizeConfig.getSize(10)),
                              bottomLeft: Radius.circular(SizeConfig.getSize(10)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OfActionBtns(
                            onClick: () {
                              _remarkTextController.clear();
                              _valueController.text = "0";
                              context
                                  .read<LoadBonusCubit>()
                                  .clearAllState();
                            },
                            text: MessagesProvider.get('Clear').toUpperCase(),
                            btnColor: _theme.button1BG1!,
                            textColor: _theme.primaryOpposite!,
                          ),
                          BlocConsumer<LoadBonusCubit, LoadBonusState>(
                              listener: (context, state){},
                              builder: (context, loadBonusState) {
                              return OfActionBtns(
                                onClick: () {
                                  if(!context.read<LoadBonusCubit>().state.isPrimaryCardApplied ){
                                   _notificationBar.showMessage(MessagesProvider.get('Please Tap Card'), _theme.footerBG5!);
                                  }else if( _valueController.text.isEmpty  || loadBonusState.bonusValue <= 0.00 ){
                                    _notificationBar.showMessage(MessagesProvider.get("Enter only decimal value for '&1'.", ["Bonus to Load"]), _theme.footerBG5!);
                                  }else if( _remarkTextController.text.isEmpty  && loadBonusState.isRemarksMandatory == "Y"){
                                    _notificationBar.showMessage(MessagesProvider.get("Enter Remarks"), _theme.footerBG5!);
                                  }else{
                                    if(FocusScope.of(context).hasFocus){
                                      FocusScope.of(context).unfocus();
                                    }
                                    context.read<LoadBonusCubit>().addLoadBonus(remarks: _remarkTextController.text, approverId:widget.approverId).then((value) {
                                      if(value){
                                        Navigator.pop(context);
                                      }
                                    });
                                  }

                                },
                                text: MessagesProvider.get('Confirm').toUpperCase(),
                                btnColor: _theme.button2InnerShadow1!,
                                textColor: _theme.light1!,
                              );
                            }
                          )
                        ],
                      ),
                    )),

              ],
            ),
          ),

          BlocBuilder<LoadBonusCubit, LoadBonusState>(
              builder: (context, state) {
                if (state.isError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _notificationBar.showMessage(state.statusMessage.toString(),
                        _theme.footerBG3!);
                    _resetLoaderStatus();
                  });
                } else if (state.isSuccess) {

                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    widget.onSuccessShowNotification!(
                        "${state.statusMessage.toString()}");
                    _notificationBar.showMessage(state.statusMessage.toString(),
                        state.notificationBarColor);
                    _resetLoaderStatus();
                  });
                } else if (state.isLoading) {
                  return Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: _screenWidth,
                        height: _screenHeight,
                        decoration: BoxDecoration(
                          color: _theme.secondaryColor!.withOpacity(.4),
                        ),
                        child: Center(
                          child: Container(
                            decoration:  BoxDecoration(
                                color: _theme.backGroundColor,
                                borderRadius:const BorderRadius.all(Radius.circular(6))),
                            width: _screenWidth * .30,
                            child: Padding(
                              padding:  EdgeInsets.all(SizeConfig.getSize(25)),
                              child: Row(children: [
                                 SizedBox(width: SizeConfig.getSize(10)),
                                SizedBox(
                                height: SizeConfig.getSize(40),
                                width: SizeConfig.getSize(40),
                                child: const CircularProgressIndicator()),
                                 SizedBox(width: SizeConfig.getSize(25)),
                                Expanded(
                                  child: Text(
                                    state.loaderMessage ?? '',
                                    maxLines: 2,
                                    style:_theme.title1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ));
                }
                return const SizedBox();
              }),

        ],
      ),
    );
  }

  Widget _body() {
    return BlocConsumer<LoadBonusCubit, LoadBonusState>(
      listener: (context, state){},
      builder: (context, loadBonusState) {
        return Column(
          children: [
            SizedBox(
              width: SizeConfig.getSize(428),
              child: Column(
                children: [
                   SizedBox(
                    height: SizeConfig.getSize(24),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(MessagesProvider.get('Choose Bonus Type (Non-Refundable)'), style:_theme.heading3!.copyWith(fontSize: SizeConfig.getFontSize(22)))),
                   SizedBox(
                    height: SizeConfig.getSize(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _largeButtons(onPressed: (){
                        context.read<LoadBonusCubit>().onSelectBonusType("CB");
                      },title: MessagesProvider.get('Card Balance'), isSelected:loadBonusState.loadBonusType == "CB"? true:false),
                       SizedBox(width: SizeConfig.getSize(12),),
                      _largeButtons(onPressed: (){
                        context.read<LoadBonusCubit>().onSelectBonusType("LP");
                      },title: MessagesProvider.get('Loyalty Points'),  isSelected:loadBonusState.loadBonusType == "LP"? true:false),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _largeButtons(onPressed: (){
                        context.read<LoadBonusCubit>().onSelectBonusType("GC");
                      },title: MessagesProvider.get('Game Play Credits'),  isSelected:loadBonusState.loadBonusType == "GC"? true:false),
                       SizedBox(width: SizeConfig.getSize(12),),
                      _largeButtons(onPressed: (){
                        context.read<LoadBonusCubit>().onSelectBonusType("GB");
                      },title: MessagesProvider.get('Game Play Bonus'),  isSelected:loadBonusState.loadBonusType == "GB"? true:false),
                    ],
                  ),
                   SizedBox(
                    height: SizeConfig.getSize(24),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(MessagesProvider.get('Bonus to Load'), style:_theme.heading3!.copyWith(fontSize: SizeConfig.getFontSize(22)))),
                   SizedBox(
                    height: SizeConfig.getSize(16),
                  ),
                  Container(
                    width: SizeConfig.getSize(428),
                    height: SizeConfig.getSize(48),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                       ),
                    child:TextFormField(
                      textAlign: TextAlign.center,
                      controller: _valueController,
                      readOnly: true,
                      onTap: (){
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          barrierColor: const Color(0x01000000),
                          builder: (newContext) {
                            return BlocProvider<
                                LoadBonusCubit>.value(
                                value: context
                                    .read<LoadBonusCubit>(),
                                child: NumberPad(
                                  isZeroRequired: false,
                                  isDecimalRequired: true,
                                  title: '',
                                  onOkPressed: (doubleValue) {
                                    if( doubleValue <= loadBonusState.loadBonusLimit ){
                                      _valueController.text = doubleValue.toStringAsFixed(2);
                                      context.read<LoadBonusCubit>().onUpdateValue(doubleValue);
                                    }else{
                                      _notificationBar.showMessage(MessagesProvider.get("Please enter a value less than or equal to ${loadBonusState.loadBonusLimit} for bonus"), _theme.footerBG5!);
                                    }
                                  },
                                ));
                          },
                        );
                      },
                      style: _theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(26),color: _theme.primaryOpposite, fontWeight: FontWeight.w600),
                      // context.read<OtherFunctionBloc>().remarkController,
                      decoration: InputDecoration(
                        fillColor: _theme.primaryColor,
                        filled: true,
                        contentPadding:

                         EdgeInsets.symmetric(
                            horizontal: SizeConfig.getSize(10)),
                        focusedBorder:  OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: _theme.secondaryColor!,
                          ),
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: _theme.secondaryColor!,
                          ),
                        ),
                        border:  OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: _theme.secondaryColor!,
                          ),
                        ),
                        hintStyle: _theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(28), fontWeight: FontWeight.w600),
                        hintText: MessagesProvider.get(
                            'Enter Bonus'),
                      ),
                    ),
                  ),
                   SizedBox(
                    height: SizeConfig.getSize(16),
                  ),

                ],
              ),
            ),

          ],
        );
      }
    );
  }

  Widget _largeButtons({required VoidCallback onPressed,required String title,required bool isSelected }){
    return ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(SizeConfig.getWidth(4)),
            tapTargetSize:
            MaterialTapTargetSize.shrinkWrap,
            maximumSize: Size(SizeConfig.getSize(208),SizeConfig.getSize(68)),
            minimumSize:  Size(SizeConfig.getSize(208),SizeConfig.getSize(68)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  SizeConfig.getSize(8)), // <-- Radius
            ),
          backgroundColor:isSelected? _theme.button2InnerShadow1!:_theme.button1BG1!
    ),
        child: Text(title,style:isSelected? _theme.subtitleLight3!.copyWith(color: _theme.light1!, fontSize: SizeConfig.getFontSize(18)):_theme.subtitle3!.copyWith(fontSize: SizeConfig.getFontSize(18)) ,));
  }


  Widget _cardDetails(accountResponse) {
    return Container(
      height: SizeConfig.getSize(96),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
        color: _theme.button1BG1!,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.getSize(4)),
        child: CardDetailsWidget(accounts: accountResponse),
      ),
    );
  }
}

