import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_data/models/login_response.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/cubits/balance_transfer/balance_transfer_cubit.dart';
import 'package:other_function_ui/model/multi_cards_model.dart';
import 'package:other_function_ui/screens/widgets/card_details_widget.dart';
import 'package:other_function_ui/screens/widgets/traiangle_clip_path.dart';
import 'package:other_function_ui/utils/constants.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../bloc/cubits/balance_transfer/balance_transfer_state.dart';
import '../widgets/action_btns.dart';
import '../widgets/card_number_entry_dialog/card_number_entry_dialog.dart';
import '../widgets/ofContent/link_cards_dialog.dart';

class BalanceTransferDialog extends StatelessWidget {
  const BalanceTransferDialog(
      {super.key,
      this.loginResponse,
      this.onSuccessShowNotification,
      this.onFailureShowNotification});
  final LoginResponse? loginResponse;
  final Function? onSuccessShowNotification;
  final Function? onFailureShowNotification;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BalanceTransferCubit>(
            create: (BuildContext context) => BalanceTransferCubit()),
      ],
      child: BalanceTransferDialogScreen(
          loginResponse: loginResponse,
          onSuccessShowNotification: onSuccessShowNotification,
          onFailureShowNotification: onFailureShowNotification),
    );
  }
}

class BalanceTransferDialogScreen extends StatefulWidget {
  const BalanceTransferDialogScreen(
      {super.key,
        this.loginResponse,
        this.onSuccessShowNotification,
        this.onFailureShowNotification});

  final LoginResponse? loginResponse;
  final Function? onSuccessShowNotification;
  final Function? onFailureShowNotification;


  @override
  State<BalanceTransferDialogScreen> createState() =>
      _BalanceTransferDialogScreenState();
}

class _BalanceTransferDialogScreenState
    extends State<BalanceTransferDialogScreen> {
  AccountDetailsResponse? accounts;
  final _scrollController = ScrollController();
  final _multiCardsScrollController = ScrollController();
  late NotificationBar _notificationBar;
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  final TextEditingController _remarkTextController = TextEditingController();
  bool _isNFCAvailable = false;
  List<MultiCardsModel> _multicardsData = [];
  AccountDetailsResponse? _primaryCardData;
  final List<double> _creditsArray = [0.0, 0.0];
  final List<double> _playCreditsArray = [0.0, 0.0];
  final List<double> _bonusArray = [0.0, 0.0];
  final List<double> _ticketsArray = [0.0, 0.0];
  final List<double> _courtesyArray = [0.0, 0.0];
  final List<double> _timeArray = [0.0, 0.0];
  final List<double> _counterArray = [0.0, 0.0];
  late SemnoxTheme _theme;

  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    _setInitialValues();
    super.initState();
  }

  _resetLoaderStatus() {
    context.read<BalanceTransferCubit>().resetValues();
  }

  _setInitialValues() async {
    _isNFCAvailable = await NFCManager().isNfcAvailable();
    context.read<BalanceTransferCubit>().setInitialValues();
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
                  padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(8), SizeConfig.getSize(8), SizeConfig.getSize(8), 0),
                  child: Container(
                    decoration:  BoxDecoration(
                        color: _theme.backGroundColor!,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular( SizeConfig.getSize(8)),
                            topLeft: Radius.circular( SizeConfig.getSize(8)))),
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
                                topLeft: Radius.circular( SizeConfig.getSize(8)),
                                bottomRight: Radius.circular( SizeConfig.getSize(8)),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                 Icon(
                                  Icons.arrow_back_ios,
                                  color: _theme.light1,
                                   size: SizeConfig.getSize(30)
                                ),
                                Center(
                                  child: Text(
                                    MessagesProvider.get('Transfer\nBalance')
                                        .toUpperCase(),
                                    style: _theme.headingLight4!.copyWith(color: Colors.white, fontSize: SizeConfig.getFontSize(22)),
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
                          child: BlocBuilder<BalanceTransferCubit,
                              BalanceTransferState>(builder: (context, state) {
                            if (state.isPrimaryCardApplied) {
                              return _cardDetails(
                                state.primaryCardData,
                              );
                            }
                            return Container(
                              height: SizeConfig.getSize(96),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: _theme.button1BG1!,
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
                                        height:SizeConfig.isBigDevice() ? SizeConfig.getSize(72) : null,
                                        child: ElevatedButton(onPressed: (){
                                          showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (newContext) {
                                              return CardNumberEntryDialog(
                                                isNFCAvailable: _isNFCAvailable,
                                                notificationBar: _notificationBar,
                                                onSuccess: (AccountDetailsResponse
                                                accountsData) {
                                                  context
                                                      .read<BalanceTransferCubit>()
                                                      .addPrimaryCard(
                                                      accountData: accountsData);
                                                },
                                                onLoginViaCardSuccess: () {},
                                              );
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
                Expanded(child: _body()),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: SizeConfig.getSize(8)),
                  child: Container(
                    color: _theme.backGroundColor,
                    child: Column(
                      children: [
                         SizedBox(
                          height: SizeConfig.getSize(4),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: SizeConfig.getSize(8)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Remarks',
                                          style:
                                          _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18))),
                                      SizedBox(height: SizeConfig.getSize(10)),
                                      SizedBox(
                                        height:SizeConfig.getSize(42),
                                        child: TextFormField(
                                          controller: _remarkTextController,
                                          style: _theme.title1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                          decoration:
                                          InputDecoration(
                                              fillColor: _theme.primaryColor,
                                              filled: true,
                                              contentPadding: EdgeInsets.only(
                                                top: 0,
                                                bottom: 0,
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
                                                  'Enter Remarks (Optional)'),
                                              suffixStyle: _theme.textFieldHintStyle!.copyWith(
                                                  fontSize: SizeConfig.getFontSize(16))),
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.getSize(10)),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding:  EdgeInsets.symmetric(
                                    vertical: SizeConfig.getSize(10), horizontal: SizeConfig.getSize(5)),

                                child: BlocSelector<BalanceTransferCubit,
                                        BalanceTransferState, bool>(
                                    selector: (state) =>
                                        state.isPrimaryCardApplied,
                                    builder: (context, state) {
                                      return Row(
                                            children: [
                                              Text('Tap multiple cards  OR',style: _theme.heading5?.copyWith( fontSize: SizeConfig
                                                  .getFontSize(
                                                  26)),),
                                              const SizedBox(width: 5,),
                                        Opacity(
                                          opacity: state ? 1 : 0.2,
                                          child: LinkedCardActionBtns(
                                                  cardColor: state?  _theme.button2InnerShadow1!:_theme.button1BG1!,
                                                  fontColor: state?  _theme.button1BG1!:
                                                  _theme.button2BG1!,
                                                  onPressed: () {
                                                  !state
                                                  ? () {}
                                                        :  // context.read<BalanceTransferCubit>().addMultiCard(tagNumber: "VINAY123");
                                                    showDialog(
                                                      barrierDismissible: false,
                                                      context: context,
                                                      builder: (newContext) {
                                                        return CardNumberEntryDialog(
                                                          isNFCAvailable:
                                                          _isNFCAvailable,
                                                          notificationBar:
                                                          _notificationBar,
                                                          onSuccess:
                                                              (AccountDetailsResponse
                                                          accountsData) {
                                                            context
                                                                .read<
                                                                BalanceTransferCubit>()
                                                                .addMultiCard(
                                                                tagNumber: accountsData
                                                                    .data
                                                                    ?.first
                                                                    .tagNumber ??
                                                                    '',
                                                                accountData:
                                                                accountsData);
                                                          },
                                                          onLoginViaCardSuccess:
                                                              () {},
                                                        );
                                                      },
                                                    );
                                                  },
                                                  text:
                                                  'ENTER CARD NO'),
                                        ),
                                            ],
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                         SizedBox(
                          height: SizeConfig.getSize(4),
                        ),
                        Container(
                          height: 1,
                          width: _screenWidth,
                          color: _theme.dialogFooterInnerShadow,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(8), 0, SizeConfig.getSize(8), SizeConfig.getSize(8)),
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
                              context
                                  .read<BalanceTransferCubit>()
                                  .clearAllState();
                              _notificationBar.showMessage("",_theme.footerBG2!);
                            },
                            text: MessagesProvider.get("clear").toUpperCase(),
                            btnColor: _theme.button1BG1!,
                            textColor: _theme.primaryOpposite!,
                          ),
                          OfActionBtns(
                            onClick: () {
                              if(context
                                  .read<BalanceTransferCubit>().state.isPrimaryCardApplied && context
                                  .read<BalanceTransferCubit>().state.multiCardsData.isNotEmpty){
                                context
                                    .read<BalanceTransferCubit>()
                                    .applyBalanceTransfer(
                                    multiCardsData: _multicardsData,
                                    loginResponse:widget.loginResponse,
                                    remarks: _remarkTextController.text)
                                    .then((value) {
                                  if (value) {
                                    Navigator.pop(context);
                                  }
                                });
                              }else{
                                _notificationBar.showMessage(MessagesProvider.get('Please Tap Card'), _theme.footerBG5!);
                              }

                            },
                            text: MessagesProvider.get('confirm').toUpperCase(),
                            btnColor: _theme.button2InnerShadow1!,
                            textColor: _theme.light1!,
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          BlocBuilder<BalanceTransferCubit, BalanceTransferState>(
              builder: (context, state) {
            if (state.isError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _notificationBar.showMessage(state.statusMessage.toString(),
                    _theme.footerBG3!);
                _resetLoaderStatus();
              });
            } else if (state.isSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                widget
                    .onSuccessShowNotification!(state.statusMessage.toString());
                _notificationBar.showMessage(state.statusMessage.toString(),
                    _theme.footerBG4!);
                _resetLoaderStatus();
              });
            } else if (state.isLoading) {
              return  Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: _screenWidth,
                    height: _screenHeight,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.4),
                    ),
                    child: Center(
                      child: Container(
                        decoration:  BoxDecoration(
                            color: _theme.backGroundColor,
                            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(6)))),
                        width: _screenWidth * .40,
                        child: Padding(
                          padding:  EdgeInsets.all(SizeConfig.getSize(25)),
                          child: Row(children: [
                            SizedBox(width: SizeConfig.getSize(10)),
                            const CircularProgressIndicator(),
                            SizedBox(width: SizeConfig.getSize(36)),
                            Expanded(
                              child: Text(
                                state.loaderMessage ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: _theme.title1!.copyWith(fontSize: SizeConfig.getFontSize(26)),
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
    return Container(
        margin:  EdgeInsets.only(left: SizeConfig.getSize(8), right: SizeConfig.getSize(8),),
        color: _theme.backGroundColor,
        child: Scroller(
          controller: _scrollController,
          child:  SingleChildScrollView(
            child: Column(

              children: [
                SizedBox(height: SizeConfig.getSize(5),),
                Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                      flex: 30,
                      child: BlocBuilder<BalanceTransferCubit,
                          BalanceTransferState>(builder: (context, state) {
                        return state.isPrimaryCardApplied
                            ? Padding(
                          padding:  EdgeInsets.only(right: SizeConfig.getSize(5),),
                          child: Row(
                            children: [
                              _titleAndTextField(
                                  MessagesProvider.get('Credits'),
                                  (state
                                      .primaryCardData
                                      ?.data?[0]
                                      .accountSummaryDTO
                                      ?.creditPlusCardBalance ??
                                      0.00)),
                              _titleAndTextField(
                                  MessagesProvider.get('Play Credits'),
                                  state
                                      .primaryCardData
                                      ?.data?[0]
                                      .accountSummaryDTO
                                      ?.creditPlusGamePlayCredits ??
                                      0.00),
                              _titleAndTextField(
                                  MessagesProvider.get('Bonus'),
                                  state
                                      .primaryCardData
                                      ?.data?[0]
                                      .accountSummaryDTO
                                      ?.totalBonusBalance ??
                                      0.00),
                              _titleAndTextField(
                                  MessagesProvider.get('Tickets'),
                                  state
                                      .primaryCardData
                                      ?.data?[0]
                                      .accountSummaryDTO
                                      ?.totalTicketsBalance ??
                                      0.00),
                              _titleAndTextField(
                                  MessagesProvider.get('Courtesy'),
                                  state
                                      .primaryCardData
                                      ?.data?[0]
                                      .accountSummaryDTO
                                      ?.totalCourtesyBalance ??
                                      0.00),
                              _titleAndTextField(
                                  MessagesProvider.get('Time'),
                                  state
                                      .primaryCardData
                                      ?.data?[0]
                                      .accountSummaryDTO
                                      ?.totalTimeBalance ??
                                      0.00),
                              _titleAndTextField(
                                  MessagesProvider.get('Counter Items'),
                                  state
                                      .primaryCardData
                                      ?.data?[0]
                                      .accountSummaryDTO
                                      ?.creditPlusItemPurchase ??
                                      0.00),
                            ],
                          ),
                        )
                            : Padding(
                          padding:  EdgeInsets.only(right: SizeConfig.getSize(5),),
                          child: Row(
                            children: [
                              _titleAndTextField(
                                  MessagesProvider.get('Credits'),
                                  0.00),
                              _titleAndTextField(
                                  MessagesProvider.get('Play Credits'),
                                  0.00),
                              _titleAndTextField(
                                  MessagesProvider.get('Bonus'), 0.00),
                              _titleAndTextField(
                                  MessagesProvider.get('Tickets'),
                                  0.00),
                              _titleAndTextField(
                                  MessagesProvider.get('Courtesy'),
                                  0.00),
                              _titleAndTextField(
                                  MessagesProvider.get('Time'), 0.00),
                              _titleAndTextField(
                                  MessagesProvider.get('Counter Items'),
                                  0.00),
                            ],
                          ),
                        );
                      }),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
                BlocBuilder<BalanceTransferCubit,
                    BalanceTransferState>(builder: (context, state) {
                  return Padding(
                    padding:  EdgeInsets.only(right: SizeConfig.getSize(5)),
                    child: Scrollbar(
                      // interactive: true,
                      radius:  Radius.circular(SizeConfig.getSize(8),),
                      thumbVisibility: true,
                      controller: _multiCardsScrollController,
                      child: ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),
                          controller: _multiCardsScrollController,
                          itemCount: state.multiCardsData.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return IntrinsicHeight(
                              child: Column(
                                children: [
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                              EdgeInsets
                                                  .only(
                                                left: SizeConfig.getSize(8),
                                              ),
                                              child: SizedBox(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Container(
                                                                height:SizeConfig.getSize(3),
                                                                width:
                                                                1,
                                                                color:
                                                                _theme.transparentColor),
                                                            Container(
                                                              height:
                                                              SizeConfig.getSize(3),
                                                              width:
                                                              1,
                                                              color: _theme.secondaryColor,
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 1,
                                                          width: SizeConfig.getSize(10),
                                                          color:  _theme.secondaryColor,
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color:  _theme.secondaryColor,
                                                              borderRadius:
                                                              const BorderRadius.all(Radius.circular(5))),
                                                          height: SizeConfig.getSize(6),
                                                          width: SizeConfig.getSize(6),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      height: SizeConfig.getSize(92),
                                                      width: 1,
                                                      color:  _theme.secondaryColor,
                                                    ),
                                                    Row(

                                                      children: [
                                                        Column(
                                                          children: [
                                                            Container(
                                                              height:
                                                              SizeConfig.getSize(3),
                                                              width:
                                                              1,
                                                              color:  _theme.secondaryColor,
                                                            ),
                                                            Container(
                                                                height:
                                                                SizeConfig.getSize(3),
                                                                width:
                                                                1,
                                                                color:
                                                                _theme.transparentColor),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 1,
                                                          width: SizeConfig.getSize(10),
                                                          color:  _theme.secondaryColor,
                                                        ),
                                                        ClipPath(
                                                          clipper:
                                                          CustomTriangleClipper(),
                                                          child:
                                                          Container(
                                                            width: SizeConfig.getSize(5),
                                                            height: SizeConfig.getSize(5),
                                                            decoration:
                                                            BoxDecoration(
                                                              gradient:
                                                              LinearGradient(
                                                                begin:
                                                                Alignment.bottomLeft,
                                                                end: Alignment
                                                                    .topRight,
                                                                colors: [
                                                                  _theme.secondaryColor!,
                                                                  _theme.secondaryColor!
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )),
                                        Expanded(
                                          flex: 30,
                                          child: IntrinsicHeight(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Align(
                                                    alignment: Alignment
                                                        .centerLeft,
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(
                                                          8.0),
                                                      child: Text(
                                                        MessagesProvider
                                                            .get(
                                                            'Transfer'),
                                                        style:_theme.heading4!.copyWith(fontSize: SizeConfig.getFontSize(20)),
                                                      ),
                                                    )),
                                                Row(
                                                  children: [
                                                    _textField(
                                                        MessagesProvider
                                                            .get(
                                                            'Credits'),
                                                        state
                                                            .multiCardsData[
                                                        index]
                                                            .creditsController!,
                                                        index,
                                                        "CREDITS"),
                                                    _textField(
                                                        MessagesProvider
                                                            .get(
                                                            'Play Credits'),
                                                        state
                                                            .multiCardsData[
                                                        index]
                                                            .playCreditsController!,
                                                        index,
                                                        "PLAYERCREDITS"),
                                                    _textField(
                                                        MessagesProvider
                                                            .get(
                                                            'Bonus'),
                                                        state
                                                            .multiCardsData[
                                                        index]
                                                            .bonusController!,
                                                        index,
                                                        "BONUS"),
                                                    _textField(
                                                        MessagesProvider
                                                            .get(
                                                            'Tickets'),
                                                        state
                                                            .multiCardsData[
                                                        index]
                                                            .ticketsController!,
                                                        index,
                                                        "TICKETS"),
                                                    _textField(
                                                        MessagesProvider
                                                            .get(
                                                            'Courtesy'),
                                                        state
                                                            .multiCardsData[
                                                        index]
                                                            .courtesyController!,
                                                        index,
                                                        "COURTESY"),
                                                    _textField(
                                                        MessagesProvider
                                                            .get(
                                                            'Time'),
                                                        state
                                                            .multiCardsData[
                                                        index]
                                                            .timeController!,
                                                        index,
                                                        "TIME"),
                                                    _textField(
                                                        MessagesProvider
                                                            .get(
                                                            'Counter Items'),
                                                        state
                                                            .multiCardsData[
                                                        index]
                                                            .counterItemsController!,
                                                        index,
                                                        "COUNTERITEM"),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: SizeConfig.getFontSize(10),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:  EdgeInsets
                                                        .symmetric(
                                                        horizontal:
                                                        SizeConfig.getFontSize(8)),
                                                    child: _cardDetails(state
                                                        .multiCardsData[
                                                    index]
                                                        .accountDetailsResponse),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: SizeConfig.getFontSize(10),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Align(
                                            alignment:
                                            Alignment.centerLeft,
                                            child: InkWell(
                                              onTap: () {
                                                context
                                                    .read<
                                                    BalanceTransferCubit>()
                                                    .removeCardsFromMultiCards(state
                                                    .multiCardsData[
                                                index]
                                                    .tagNumber);
                                              },
                                              child: Icon(
                                                Icons.cancel,
                                                color:  _theme.secondaryColor,
                                                size: SizeConfig.getFontSize(30),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  );
                }),
              ],
            ),
          )
        ));
  }

  Widget _titleAndTextField(String text, double value) {
    return Expanded(
      child: Padding(
        padding:  EdgeInsets.only(left: SizeConfig.getSize(6), right: SizeConfig.getSize(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: _theme.heading3!.copyWith(fontSize:SizeConfig.getFontSize(20)),
            ),
             SizedBox(
              height: SizeConfig.getSize(8),
            ),
            Container(
              width: SizeConfig.getSize(148),
              height: SizeConfig.getSize(42),
              decoration: AppDecorations.containerBoxDecoration
                  .copyWith(color: _theme.button1BG1 ,
                  borderRadius:  BorderRadius.all(Radius.circular(SizeConfig.getSize(8)))),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: SizeConfig.getSize(8)),
                  child: Text(
                    value.toStringAsFixed(2),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: _theme.heading4!.copyWith(fontSize:SizeConfig.getFontSize(20)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textField(
      String text, TextEditingController controller, index, matchValue) {
    return Expanded(
      child: Padding(
        padding:  EdgeInsets.only(left: SizeConfig.getSize(8), right: SizeConfig.getSize(8)),
        child: SizedBox(
          height:SizeConfig.getSize(42),
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(50)
            ],
            onTap: () {
              var offset = const Offset(100, 50);
              if (matchValue == "CREDITS") {
                offset = Offset(_screenWidth * 0.15, 50);
              }
              if (matchValue == "PLAYERCREDITS") {
                offset = Offset(_screenWidth * 0.28, 50);
              }
              if (matchValue == "BONUS") {
                offset = Offset(_screenWidth * 0.41, 50);
              }
              if (matchValue == "TICKETS") {
                offset = Offset(_screenWidth * 0.54, 50);
              }
              if (matchValue == "COURTESY") {
                offset = Offset(_screenWidth * 0.28, 50);
              }
              if (matchValue == "TIME") {
                offset = Offset(_screenWidth * 0.41, 50);
              }
              if (matchValue == "COUNTERITEM") {
                offset = Offset(_screenWidth * 0.54, 50);
              }
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  barrierColor:  _theme.transparentColor!,
                  builder: (BuildContext newContext) {
                    return NumberPad(
                      initialOffset: offset,
                      isInitialRequired: true,
                      initialDecimalValue:
                          double.tryParse(controller.text.toString()) ?? 0.0,
                      isDecimalRequired: true,
                      title: '',
                      onOkPressed: (doubleValue) {
                        setState(() {
                          String value = double.parse(doubleValue.toString())
                              .toStringAsFixed(2);
                          controller.text = value.toString();
                          _primaryCardData = context
                              .read<BalanceTransferCubit>()
                              .state
                              .primaryCardData;
                          _multicardsData = context
                              .read<BalanceTransferCubit>()
                              .state
                              .multiCardsData;
                          for (var i = 0; i < _multicardsData.length; i++) {
                            if (index == i) {
                              if (matchValue == "CREDITS") {
                                if (_creditsArray.length > i) {
                                  _creditsArray[i] = doubleValue;
                                } else {
                                  _creditsArray.add(doubleValue);
                                }
                                _multicardsData[i].creditsController?.text =
                                    value.toString();
                              }
                              if (matchValue == "PLAYERCREDITS") {
                                if (_playCreditsArray.length > i) {
                                  _playCreditsArray[i] = doubleValue;
                                } else {
                                  _playCreditsArray.add(doubleValue);
                                }
                                _multicardsData[i].playCreditsController?.text =
                                    value.toString();
                              }
                              if (matchValue == "BONUS") {
                                if (_bonusArray.length > i) {
                                  _bonusArray[i] = doubleValue;
                                } else {
                                  _bonusArray.add(doubleValue);
                                }
                                _multicardsData[i].bonusController?.text =
                                    value.toString();
                              }
                              if (matchValue == "TICKETS") {
                                if (_ticketsArray.length > i) {
                                  _ticketsArray[i] = doubleValue;
                                } else {
                                  _ticketsArray.add(doubleValue);
                                }
                                _multicardsData[i].ticketsController?.text =
                                    value.toString();
                              }
                              if (matchValue == "COURTESY") {
                                if (_courtesyArray.length > i) {
                                  _courtesyArray[i] = doubleValue;
                                } else {
                                  _courtesyArray.add(doubleValue);
                                }
                                _multicardsData[i].courtesyController?.text =
                                    value.toString();
                              }
                              if (matchValue == "TIME") {
                                if (_timeArray.length > i) {
                                  _timeArray[i] = doubleValue;
                                } else {
                                  _timeArray.add(doubleValue);
                                }
                                _multicardsData[i].timeController?.text =
                                    value.toString();
                              }
                              if (matchValue == "COUNTERITEM") {
                                if (_counterArray.length > i) {
                                  _counterArray[i] = doubleValue;
                                } else {
                                  _counterArray.add(doubleValue);
                                }
                                _multicardsData[i].counterItemsController?.text =
                                    value.toString();
                              }
                            }
                          }
                          if (_creditsArray.reduce((a, b) => a + b) >
                              (_primaryCardData?.data?[0].accountSummaryDTO
                                      ?.creditPlusCardBalance ??
                                  0.00)) {
                            _notificationBar.showMessage(
                                MessagesProvider.get(
                                    "Cannot transfer more than available"),
                                _theme.footerBG3!);
                          }
                          if (_playCreditsArray.reduce((a, b) => a + b) >
                              (_primaryCardData?.data?[0].accountSummaryDTO
                                      ?.creditPlusGamePlayCredits ??
                                  0.00)) {
                            _notificationBar.showMessage(
                                MessagesProvider.get(
                                    "Cannot transfer more than available"),
                                _theme.footerBG3!);
                          }
                          if (_bonusArray.reduce((a, b) => a + b) >
                              (_primaryCardData?.data?[0].accountSummaryDTO
                                      ?.totalBonusBalance ??
                                  0.00)) {
                            _notificationBar.showMessage(
                                MessagesProvider.get(
                                    "Cannot transfer more than available"),
                                _theme.footerBG3!);
                          }
                          if (_ticketsArray.reduce((a, b) => a + b) >
                              (_primaryCardData?.data?[0].accountSummaryDTO
                                      ?.totalTicketsBalance ??
                                  0.00)) {
                            _notificationBar.showMessage(
                                MessagesProvider.get(
                                    "Cannot transfer more than available"),
                                _theme.footerBG3!);
                          }
                          if (_courtesyArray.reduce((a, b) => a + b) >
                              (_primaryCardData?.data?[0].accountSummaryDTO
                                      ?.totalCourtesyBalance ??
                                  0.00)) {
                            _notificationBar.showMessage(
                                MessagesProvider.get(
                                    "Cannot transfer more than available"),
                                _theme.footerBG3!);
                          }
                          if (_timeArray.reduce((a, b) => a + b) >
                              (_primaryCardData?.data?[0].accountSummaryDTO
                                      ?.totalTimeBalance ??
                                  0.00)) {
                            _notificationBar.showMessage(
                                MessagesProvider.get(
                                    "Cannot transfer more than available"),
                                _theme.footerBG3!);
                          }
                          if (_counterArray.reduce((a, b) => a + b) >
                              (_primaryCardData?.data?[0].accountSummaryDTO
                                      ?.creditPlusItemPurchase ??
                                  0.00)) {
                            _notificationBar.showMessage(
                                MessagesProvider.get(
                                    "Cannot transfer more than available"),
                                _theme.footerBG3!);
                          }
                        });
                      },
                    );
                  });
            },
            onChanged: (String? value) {
              setState(() {
                if (value != null) {
                  _multicardsData =
                      context.read<BalanceTransferCubit>().state.multiCardsData;
                  for (var i = 0; i < _multicardsData.length; i++) {
                    if (index == i) {
                      if (matchValue == "CREDITS") {
                        _multicardsData[i].creditsController?.text =
                            value.toString();
                      }
                      if (matchValue == "PLAYERCREDITS") {
                        _multicardsData[i].playCreditsController?.text =
                            value.toString();
                      }
                      if (matchValue == "BONUS") {
                        _multicardsData[i].bonusController?.text =
                            value.toString();
                      }
                      if (matchValue == "TICKETS") {
                        _multicardsData[i].ticketsController?.text =
                            value.toString();
                      }
                      if (matchValue == "COURTESY") {
                        _multicardsData[i].courtesyController?.text =
                            value.toString();
                      }
                      if (matchValue == "TIME") {
                        _multicardsData[i].timeController?.text =
                            value.toString();
                      }
                      if (matchValue == "COUNTERITEM") {
                        _multicardsData[i].counterItemsController?.text =
                            value.toString();
                      }
                    }
                  }
                }
              });
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            controller: controller,
            style: _theme.heading3!.copyWith(fontSize: SizeConfig.getFontSize(20)),
            readOnly: true,
            decoration: AppDecorations.textFieldInputDecoration.copyWith(
              hintText: text,
              filled: true,
                contentPadding: EdgeInsets.only(
                  top: 0,
                  bottom: 0,
                  right: SizeConfig.getSize(10),
                  left: SizeConfig.getSize(10),
                ),
                fillColor: _theme.primaryColor,
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
                hintStyle: _theme.textFieldHintStyle!.copyWith(
                    fontSize: SizeConfig.getFontSize(16))

            ),
          ),
        ),
      ),
    );
  }

  Widget _cardDetails(accountResponse) {
    return Container(
      height:  SizeConfig.getSize(96),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
        color: _theme.button1BG1!,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:SizeConfig.getSize(4)),
        child: CardDetailsWidget(accounts: accountResponse),
      ),
    );
  }
}
