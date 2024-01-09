import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/cubits/exchange_entitlements/exchange_entitlement_cubit.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';
import '../../bloc/cubits/exchange_entitlements/exchange_entitlement_state.dart';
import '../../widgets/action_btns.dart';
import '../../widgets/card_number_entry_dialog/card_number_entry_dialog.dart';
import '../widgets/card_details_widget.dart';
import 'package:widgets_library/utils/size_config.dart';

class ExchangeEntitlementScreen extends StatelessWidget {
  const ExchangeEntitlementScreen(
      {Key? key,
      required this.exchangeType,
        this.approverId,
      this.onSuccessShowNotification,
      this.onFailureShowNotification})
      : super(key: key);
  final String exchangeType;
  final Function? onSuccessShowNotification;
  final Function? onFailureShowNotification;
  final int? approverId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ExchangeEntitlementCubit>(
              create: (BuildContext context) => ExchangeEntitlementCubit()),
        ],
        child: ExchangeEntitlementSection(
          exchangeType: exchangeType,
          onSuccessShowNotification: onSuccessShowNotification,
          onFailureShowNotification: onFailureShowNotification,
            approverId:approverId
        ));
  }
}

class ExchangeEntitlementSection extends StatefulWidget {
  const ExchangeEntitlementSection(
      {Key? key,
        required this.exchangeType,
        this.approverId,
        this.onSuccessShowNotification,
        this.onFailureShowNotification})
      : super(key: key);
  final String exchangeType;
  final Function? onSuccessShowNotification;
  final Function? onFailureShowNotification;
  final int? approverId;

  @override
  State<ExchangeEntitlementSection> createState() =>
      _ExchangeEntitlementSectionState();
}

class _ExchangeEntitlementSectionState
    extends State<ExchangeEntitlementSection> {
  AccountDetailsResponse? accounts;
  final _scrollController = ScrollController();
  late NotificationBar _notificationBar;
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  final TextEditingController _remarkTextController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  bool _isNFCAvailable = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SemnoxTheme _theme;

  @override
  void initState() {
    _notificationBar = NotificationBar(
      showHideSideBar: false,
    );
    _valueController.text = "0";
    _setInitialValues();
    super.initState();
  }

  _resetLoaderStatus() {
    context.read<ExchangeEntitlementCubit>().resetValues();
  }

  _setInitialValues() async {
    _isNFCAvailable = await NFCManager().isNfcAvailable();
    context
        .read<ExchangeEntitlementCubit>()
        .setInitialValues(widget.exchangeType);
  }

  String _getTitle(exchangeType) {
    switch (exchangeType) {
      case 'CTT':
        return MessagesProvider.get('Convert - Points > time');
      case 'TTC':
        return MessagesProvider.get('Convert - Time > Points');
      default:
        return '';
    }
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
                        borderRadius:const BorderRadius.only(
                            topRight: Radius.circular(6),
                            topLeft: Radius.circular(6))),
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
                              horizontal: SizeConfig.getSize(10),
                            ),
                            height: SizeConfig.getSize(96),
                            decoration:  BoxDecoration(
                              color:_theme.button2InnerShadow1!,
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
                                  color: _theme.light1,
                                   size: SizeConfig.getSize(30),
                                ),
                                Center(
                                  child: Text(
                                    _getTitle(widget.exchangeType)
                                        .toUpperCase(),
                                    style: _theme.headingLight3!.copyWith(color: _theme.light1, fontSize: SizeConfig.getFontSize(22)),
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
                          child: BlocBuilder<ExchangeEntitlementCubit,
                                  ExchangeEntitlementState>(
                              builder: (context, state) {
                            if (state.isPrimaryCardApplied) {
                              return _cardDetails(
                                state.primaryCardData,
                              );
                            }
                            return Container(
                              height: SizeConfig.getSize(96),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                color: _theme.button1BG1,
                              ),
                              child: Center(
                                   child: Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children:[
                                     Text(_isNFCAvailable
                                   ? MessagesProvider.get('Tap Card OR')
                                       : '',
                                       style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(22)),
                                       textAlign: TextAlign.start,
                                     ),
                                     const SizedBox(width: 8,),
                                     SizedBox(
                                       height: SizeConfig.isBigDevice()? SizeConfig.getSize(72):null,
                                       child: ElevatedButton(onPressed: (){
                                         // context.read<BalanceTransferCubit>().addMultiCard(tagNumber: "VINAY123");
                                         showDialog(
                                           barrierDismissible: false,
                                           context: context,
                                           builder: (newContext) {
                                             return BlocProvider<
                                                 ExchangeEntitlementCubit>.value(
                                                 value: context
                                                     .read<ExchangeEntitlementCubit>(),
                                                 child: CardNumberEntryDialog(
                                                   isNFCAvailable: _isNFCAvailable,
                                                   notificationBar: _notificationBar,
                                                   onSuccess: (AccountDetailsResponse
                                                   accountsData) {
                                                     context
                                                         .read<
                                                         ExchangeEntitlementCubit>()
                                                         .addPrimaryCard(
                                                       accountsData: accountsData,
                                                     );
                                                   },
                                                   onLoginViaCardSuccess: () {},
                                                 ));
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
                                                   style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(20),color: _theme.light1!)),
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
                  child: CustomScrollView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: true,
                        child: Padding(
                          padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(10), 0, SizeConfig.getSize(10), 0),
                          child: Container(
                            decoration:  BoxDecoration(
                              color: _theme.backGroundColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                      color: _theme.backGroundColor,
                                    ),
                                    child: Scroller(
                                      controller: _scrollController,
                                      child: ListView(
                                          controller: _scrollController,
                                          children: [
                                            _body(widget.exchangeType)
                                          ]),
                                    ),
                                  ),
                                ),
                                // const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
                          color: _theme.dialogFooterInnerShadow,
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
                                      horizontal:SizeConfig.getSize(8)),
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
                                                  'Enter'),
                                              hintStyle: _theme.textFieldHintStyle!.copyWith(
                                                  fontSize: SizeConfig.getFontSize(18))),
                                        ),
                                      ),
                                      SizedBox(height: SizeConfig.getSize(10)),
                                    ],
                                  ),
                                ),
                              ),
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
                    padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(10), 0, SizeConfig.getSize(10), 10),
                    child: Container(
                      decoration:  BoxDecoration(
                          color: _theme.backGroundColor,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(SizeConfig.getSize(8)),
                              bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OfActionBtns(
                            onClick: () {
                              _remarkTextController.clear();
                              context
                                  .read<ExchangeEntitlementCubit>()
                                  .clearAllState();
                            },
                            text: MessagesProvider.get('Clear').toUpperCase(),
                            btnColor: _theme.button1BG1!,
                            textColor: _theme.primaryOpposite!,
                          ),
                          OfActionBtns(
                            onClick: () {
                              if(context
                                  .read<ExchangeEntitlementCubit>()
                                  .state
                                  .isPrimaryCardApplied == false){
                                _notificationBar.showMessage(MessagesProvider.get("Please Tap Card"),_theme.footerBG5!);
                              }
                              else if(context.read<ExchangeEntitlementCubit>().state.afterConvertedValue <= 0){
                                _notificationBar.showMessage(_getWarning1Message(), _theme.footerBG3!);
                              }
                              else if (context
                                      .read<ExchangeEntitlementCubit>()
                                      .state
                                      .isPrimaryCardApplied &&
                                  (context
                                              .read<ExchangeEntitlementCubit>()
                                              .state
                                              .entitlementAvailableValue -
                                          context
                                              .read<ExchangeEntitlementCubit>()
                                              .state
                                              .entitlementConvertValue) >
                                      0) {
                                context
                                    .read<ExchangeEntitlementCubit>()
                                    .applyExchange(remarks:_remarkTextController.text, approverId:widget.approverId)
                                    .then((value) {
                                  if (value) {
                                    Navigator.pop(context);
                                  }
                                });
                              }
                            },
                            text: MessagesProvider.get('Confirm').toUpperCase(),
                            btnColor: _theme.button2InnerShadow1!,
                            textColor: _theme.light1!,
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          BlocBuilder<ExchangeEntitlementCubit, ExchangeEntitlementState>(
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
                _notificationBar.showMessage(
                    state.statusMessage.toString(), state.notificationBarColor);
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
                             SizedBox(width: SizeConfig.getSize(8)),
                             const CircularProgressIndicator(),
                             SizedBox(width: SizeConfig.getSize(24)),
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

  String _getWarning1Message(){
    switch(widget.exchangeType){
      case "TTC":
        return MessagesProvider.get('Please enter Time to be converted to Points');
      case "CTT":
        return MessagesProvider.get('Please enter the points to be converted to Time');
      default :
        return '';
    }
  }

  Widget _body(entitleType) {
    if (entitleType == 'TTC') {
      return _entitlementWidget(
          entitleAvailableHeading: MessagesProvider.get("Time Available"),
          entitleToConvertHeading: MessagesProvider.get("Time to Convert"),
          entitleType: entitleType,
          entitleValue: MessagesProvider.get("Credits"));
    }
    if (entitleType == 'CTT') {
      return _entitlementWidget(
          entitleAvailableHeading: MessagesProvider.get("Points Available"),
          entitleToConvertHeading: MessagesProvider.get("Points to Convert"),
          entitleType: entitleType,
          entitleValue: MessagesProvider.get("Minutes"));
    } else {
      return const SizedBox();
    }
  }

  Widget _entitlementWidget(
      {required String entitleAvailableHeading,
      required String entitleToConvertHeading,
      required String entitleType,
      required String entitleValue}) {
    return BlocConsumer<ExchangeEntitlementCubit, ExchangeEntitlementState>(
        listener: (context, state) {},
        builder: (context, exchangeState) {
          _valueController.text =
              exchangeState.entitlementConvertValue.toString();
          return Column(
            children: [
               SizedBox(
                height: SizeConfig.getSize(54),
              ),
              SizedBox(
                width: SizeConfig.getSize(428),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(entitleAvailableHeading,
                          style: _theme.heading4!.copyWith(fontSize: SizeConfig.getFontSize(22))),
                    ),
                     SizedBox(
                      height: SizeConfig.getSize(8),
                    ),
                    Container(
                      width: SizeConfig.isBigDevice()? SizeConfig.getSize(550): SizeConfig.getSize(428),
                      height: SizeConfig.isBigDevice()?SizeConfig.getSize(70):SizeConfig.getSize(54),
                      decoration: BoxDecoration(
                          color:_theme.button1BG1,
                          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                          border:
                              Border.all(width: 1, color: _theme.dialogFooterInnerShadow!)),
                      child: Center(
                          child: Text(
                        (exchangeState.entitlementAvailableValue -
                                    exchangeState.entitlementConvertValue) <=
                                0
                            ? '0'
                            : (exchangeState.entitlementAvailableValue -
                                    exchangeState.entitlementConvertValue)
                                .toString(),
                        style: _theme.heading2!.copyWith(fontSize: SizeConfig.getFontSize(24)),
                      )),
                    ),
                     SizedBox(
                      height: SizeConfig.getSize(24),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(entitleToConvertHeading,
                          style: _theme.heading4!.copyWith(fontSize: SizeConfig.getFontSize(22))),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: SizeConfig.isBigDevice()? SizeConfig.getSize(550):SizeConfig.getSize(428),
                      height: SizeConfig.isBigDevice()? SizeConfig.getSize(76):SizeConfig.getSize(60),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return MessagesProvider.get(
                                  "Quantity cannot be empty.");
                            }
                            if (value == "0") {
                              return MessagesProvider.get(
                                  "Minimum quantity should be &1", [1]);
                            }
                            return null;
                          },
                          onChanged: (text) {
                            if (_valueController.text == '0' ||
                                _valueController.text.isEmpty) {
                            }
                            _valueController.selection =
                                TextSelection.collapsed(
                                    offset: _valueController.text.length);
                          },
                          cursorWidth: 2,
                          controller: _valueController,
                          style: _theme.heading2!.copyWith(fontSize: SizeConfig.getFontSize(24)),
                          textAlign: TextAlign.center,
                          onTap:exchangeState.isPrimaryCardApplied? () {
                            showDialog(
                                barrierDismissible: true,
                                context: context,
                                barrierColor: _theme.transparentColor,
                                builder: (BuildContext newContext) {
                                  return BlocProvider<
                                          ExchangeEntitlementCubit>.value(
                                      value: context
                                          .read<ExchangeEntitlementCubit>(),
                                      child: NumberPad(
                                        title: '',
                                        initialOffset: Offset(_screenWidth / 5,
                                            _screenHeight / 7),
                                        onOkPressed: (int? value) async {
                                          context
                                              .read<ExchangeEntitlementCubit>()
                                              .updateConvertibleValue(
                                                  value ?? 0);
                                        },
                                      ));
                                });
                          }:null,
                          readOnly: true,
                          decoration: InputDecoration(
                            counterText: '',
                            contentPadding:  EdgeInsets.only(
                                top: SizeConfig.getSize(5), bottom: SizeConfig.getSize(5), right: SizeConfig.getSize(5), left: SizeConfig.getSize(10)),
                            focusedBorder:  OutlineInputBorder(
                                borderSide: BorderSide(
                              color: _theme.secondaryColor!,
                            )),
                            border:  OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: _theme.secondaryColor!,
                              ),
                            ),
                            prefixIconConstraints:  BoxConstraints(maxWidth: SizeConfig.isBigDevice()? 76: 30,maxHeight:SizeConfig.isBigDevice()? 76: 30),
                            prefixIcon: Padding(
                              padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(SizeConfig.getSize(25)),
                                ),
                                 width: SizeConfig.isBigDevice()?  SizeConfig.getSize(102):SizeConfig.getSize(72),
                                 height: SizeConfig.isBigDevice()? SizeConfig.getSize(102):SizeConfig.getSize(72),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding:  EdgeInsets.symmetric(
                                          horizontal: SizeConfig.getSize(3), vertical: SizeConfig.getSize(3)),
                                      backgroundColor: _theme.button1BG1!),
                                  onPressed: () {
                                    if (exchangeState.isPrimaryCardApplied && exchangeState.entitlementConvertValue >0) {
                                      context
                                          .read<ExchangeEntitlementCubit>()
                                          .decrementConvertibleValue();
                                    }
                                  },
                                  child:  Icon(
                                    Icons.remove,
                                    color: _theme.secondaryColor!,
                                    size: SizeConfig.isBigDevice()?  SizeConfig.getSize(45): SizeConfig.getSize(30),
                                  ),
                                ),
                              ),
                            ),
                            suffixIconConstraints: BoxConstraints(maxWidth: SizeConfig.isBigDevice()? 76: 30,maxHeight:SizeConfig.isBigDevice()? 76: 30),
                            suffixIcon: Padding(
                              padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(SizeConfig.getSize(25)),
                                ),
                                width: SizeConfig.isBigDevice()?  SizeConfig.getSize(102):SizeConfig.getSize(72),
                                height: SizeConfig.isBigDevice()? SizeConfig.getSize(102):SizeConfig.getSize(72),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding:  EdgeInsets.symmetric(
                                          horizontal: SizeConfig.getSize(3), vertical: SizeConfig.getSize(3)),
                                      backgroundColor: _theme.button1BG1!),
                                  onPressed: () {
                                    if (exchangeState.isPrimaryCardApplied ) {
                                      context
                                          .read<ExchangeEntitlementCubit>()
                                          .incrementConvertibleValue();
                                    }
                                  },
                                  child:  Icon(
                                    Icons.add,
                                    color: _theme.secondaryColor!,
                                    size: SizeConfig.isBigDevice()?  SizeConfig.getSize(45): SizeConfig.getSize(30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                     SizedBox(
                      height: SizeConfig.getSize(12),
                    ),
                  ],
                ),
              ),
              exchangeState.isShowConvertedValue
                  ? Text("=${exchangeState.afterConvertedValue} $entitleValue",
                      style:_theme.heading4!.copyWith(fontSize:SizeConfig.getFontSize(22)))
                  : const SizedBox(),
            ],
          );
        });
  }

  Widget _cardDetails(accountResponse) {
    return Container(
      height:SizeConfig.getSize(96),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
        color: _theme.button1BG1,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.getSize(4)),
        child: CardDetailsWidget(accounts: accountResponse),
      ),
    );
  }
}
