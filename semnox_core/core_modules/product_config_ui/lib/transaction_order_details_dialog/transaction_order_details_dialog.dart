import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/transaction_order_details_dialog/cubit/transaction_order_details_state.dart';
import 'package:product_config_ui/utils/constants.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:widgets_library/error_alert_dialog.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../widgets/primaryMediumButton.dart';
import '../widgets/secondaryMediumButton.dart';
import 'cubit/transaction_order_details_cubit.dart';
import 'package:login_ui/loader_dialog.dart' as loader;

class TransactionOrderDetailsDialog extends StatelessWidget {
  const TransactionOrderDetailsDialog(
      {Key? key,
        this.approverID,
      required this.isUpdate,
      required this.showNotification,
      required this.onComplete,
        this.tableId,
      this.transactionCubit})
      : super(key: key);
  final bool isUpdate;
  final Function(String value, Color color) showNotification;
  final Function() onComplete;
  final TransactionCubit? transactionCubit;
  final int? tableId;
  final int?approverID;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TransactionOrderDetailsCubit>(
              create: (BuildContext context) => TransactionOrderDetailsCubit()),
        ],
        child: TransactionDetailsDialog(
            approverID:approverID,
            showNotification: showNotification,
            transactionCubit: transactionCubit,
            onComplete: onComplete,
            isUpdate: isUpdate,
            tableId:tableId));
  }
}

class TransactionDetailsDialog extends StatefulWidget {
  const TransactionDetailsDialog(
      {Key? key,
        this.approverID,
        required this.isUpdate,
        required this.showNotification,
        required this.onComplete,
        this.tableId,
        this.transactionCubit})
      : super(key: key);
  final bool isUpdate;
  final Function(String value, Color color) showNotification;
  final Function() onComplete;
  final TransactionCubit? transactionCubit;
  final int? tableId;
  final int?approverID;

  @override
  State<TransactionDetailsDialog> createState() =>
      _TransactionDetailsDialogState();
}

class _TransactionDetailsDialogState extends State<TransactionDetailsDialog> {
  final TextEditingController _guestNameTextController = TextEditingController();
  final TextEditingController _guestContactTextController = TextEditingController();
  final TextEditingController _orderIdentifierTextController = TextEditingController();
  final TextEditingController _guestCountTextController = TextEditingController();
  final _scrollController = ScrollController();
  Size? _screenSize;
  double _screenHeight = 0.0;
  double _screenWidth = 0.0;
  NotificationBar? _notificationBar;
  late SemnoxTheme _theme;
  late InputDecoration _textInputDecoration ;


  @override
  void initState() {
    _guestCountTextController.text = "1";
    _notificationBar = NotificationBar(showHideSideBar: false);
    initTextFields();
    super.initState();
  }

  _initInputDecoration(){
    _textInputDecoration = InputDecoration(
      fillColor: _theme.primaryColor,
      filled: true,
      // constraints:const BoxConstraints(maxHeight:34, ),
      hintText: MessagesProvider.get("Enter"),
      hintStyle: _theme.textFieldHintStyle!.copyWith(fontSize:SizeConfig.getFontSize(16)),
      contentPadding:  EdgeInsets.only(top: SizeConfig.getSize(5), bottom: SizeConfig.getSize(5), right: SizeConfig.getSize(5), left: SizeConfig.getSize(10)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          borderSide:  BorderSide(
            width: SizeConfig.getSize(1),
            color: _theme.secondaryColor!,
          )),
      border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          borderSide:  BorderSide(
            width: SizeConfig.getSize(1),
            color: _theme.secondaryColor!,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    _screenSize = MediaQuery.of(context).size;
    _screenHeight = _screenSize!.height;
    _screenWidth = _screenSize!.width;
    SizeConfig.init(context);
    _initInputDecoration();
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color:_theme.transparentColor,
        child: Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor:_theme.transparentColor,
              bottomNavigationBar: Container(
                child: _notificationBar,
              ),
              body: Padding(
                padding:  EdgeInsets.all(SizeConfig.getSize(10)),
                child: Column(
                  children: [
                  Container(
                     decoration: BoxDecoration(
                     color: _theme.backGroundColor, borderRadius:  BorderRadius.only(
                     topLeft:Radius.circular( SizeConfig.getSize(8)),
                     topRight: Radius.circular( SizeConfig.getSize(8)),
                   )
                 ),
                  padding: EdgeInsets.only(top:SizeConfig.getSize(10)),
                  child: Column(
                  children: [
                       Text(
                        MessagesProvider.get('Order Details').toUpperCase(),
                        style:_theme.headingLight4!.copyWith(color:_theme.secondaryColor,fontSize: SizeConfig.getFontSize(22)),
                          ),
                       Divider(
                        color: _theme.dividerColor,
                         ),
                      ],
                     ),
                    ),
                   Expanded(
                      child: Scroller(
                        controller: _scrollController,
                        child: CustomScrollView(
                          controller: _scrollController,
                          //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
                          slivers: [
                            SliverFillRemaining(
                              hasScrollBody: false,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      color: _theme.backGroundColor,
                                      child: Padding(
                                        padding:  EdgeInsets.only( right: SizeConfig.getSize(12)),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:  EdgeInsets.all(SizeConfig.getSize(16)),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: _screenWidth,
                                                    child: IntrinsicHeight(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          Expanded(
                                                            child: SizedBox(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    MessagesProvider.get('Guest Name'),
                                                                    style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                                  ),
                                                                   SizedBox(height: SizeConfig.getSize(10),),
                                                                  SizedBox(
                                                                    height:SizeConfig.getSize(42),
                                                                    child: TextFormField(
                                                                      inputFormatters: [
                                                                        LengthLimitingTextInputFormatter(51)
                                                                      ],
                                                                      controller: _guestNameTextController,
                                                                      style: _theme.subtitle2!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                                      decoration: _textInputDecoration
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                           SizedBox(width: SizeConfig.getSize(10),),
                                                          Expanded(
                                                            child: SizedBox(
                                                              // width: _screenWidth * .43,
                                                              child: Column(
                                                                crossAxisAlignment:CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    MessagesProvider.get('Guest Contact'),
                                                                    style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                                  ),
                                                                   SizedBox(height: SizeConfig.getSize(10),),
                                                                  SizedBox(
                                                                    height:SizeConfig.getSize(42),
                                                                    child: TextFormField(
                                                                      inputFormatters: [
                                                                        LengthLimitingTextInputFormatter( 14)
                                                                      ],
                                                                      keyboardType: TextInputType.phone,
                                                                      controller: _guestContactTextController,
                                                                      style: _theme.subtitle2!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                                      decoration: _textInputDecoration
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                   SizedBox(height:  SizeConfig.getSize(12),),
                                                  SizedBox(
                                                    width: _screenWidth,
                                                    child: IntrinsicHeight(
                                                      child:Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          Expanded(
                                                            child: SizedBox(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(MessagesProvider.get('Order Identifier'),
                                                                    style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                                  ),
                                                                   SizedBox(height:  SizeConfig.getSize(10),),
                                                                  SizedBox(
                                                                    height:SizeConfig.getSize(42),
                                                                    child: TextFormField(
                                                                      inputFormatters: [
                                                                        LengthLimitingTextInputFormatter(11)
                                                                      ],
                                                                      controller: _orderIdentifierTextController,
                                                                      style: _theme.subtitle2!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                                      decoration:_textInputDecoration
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                           SizedBox(width:  SizeConfig.getSize(10),),
                                                          Expanded(
                                                            child: SizedBox(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(MessagesProvider.get('* Guest Count'),
                                                                    style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                                  ),
                                                                   SizedBox(height:  SizeConfig.getSize(10),),
                                                                  SizedBox(
                                                                    child: SizedBox(
                                                                      height:SizeConfig.getSize(42),
                                                                      child: TextFormField(
                                                                        inputFormatters: [
                                                                          FilteringTextInputFormatter.digitsOnly,
                                                                          LengthLimitingTextInputFormatter(7)
                                                                        ],
                                                                        readOnly:true,
                                                                        onTap:(){
                                                                          showDialog(
                                                                              barrierDismissible: true,
                                                                              context: context,
                                                                              barrierColor: _theme.transparentColor,
                                                                              builder: (BuildContext context) {
                                                                                return NumberPad(
                                                                                  initialOffset: Offset(_screenWidth/1.6,_screenHeight/5),
                                                                                  title: '',
                                                                                  onOkPressed: (intValue) {
                                                                                    setState(() {
                                                                                      _guestCountTextController.text = intValue.toString();
                                                                                    });
                                                                                  },
                                                                                );
                                                                              });
                                                                        },
                                                                        controller: _guestCountTextController,
                                                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                                                        style: _theme.subtitle2!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                                        decoration: _textInputDecoration
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                             SizedBox(height:  SizeConfig.getSize(20),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: _theme.dialogFooterInnerShadow,
                                  ),
                                  Container(
                                    decoration:  BoxDecoration(
                                      color:_theme.backGroundColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular( SizeConfig.getSize(8)),
                                          bottomRight: Radius.circular( SizeConfig.getSize(8))),
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.all( SizeConfig.getSize(8)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SecondaryMediumButton(onPressed: () {
                                            if(widget.isUpdate == false) {
                                              widget.showNotification(
                                                  MessagesProvider.get("Order details requires to create transaction."),
                                                  _theme.footerBG5!);
                                            }
                                            Navigator.pop(context);
                                          },text:MessagesProvider.get('Cancel').toUpperCase(),),
                                          const SizedBox(width: 8,),
                                          PrimaryMediumButton(onPressed: () async {
                                            if(FocusScope.of(context).hasFocus) {
                                              FocusScope.of(context).unfocus();
                                            }
                                            if (_checkValidation()) {
                                              loader.showLoaderDialog(context, MessagesProvider.get(widget.isUpdate
                                                  ? "Updating transaction order details..."
                                                  : "Initiating Transaction..."));
                                              final transactionOrderState = context.read<TransactionOrderDetailsCubit>();
                                              if(widget.isUpdate) {
                                                await transactionOrderState.updateTransactionOrderDetails(
                                                    approverID:widget.approverID,
                                                    guestCount: int.parse(_guestCountTextController.text) ?? 1,
                                                    guestContact: _guestContactTextController.text ?? '',
                                                    guestName: _guestNameTextController.text ?? '',
                                                    transactionIdentifier: _orderIdentifierTextController.text ?? '');
                                              } else {
                                                final TransactionCubit transactionCubit = context.read<TransactionCubit>();
                                                if(transactionCubit.state.transactionData != null) {
                                                  await transactionCubit.unlockTransaction();
                                                }
                                                await transactionOrderState.initiateTransaction(
                                                    approverID:widget.approverID,
                                                    guestCount: int.parse(_guestCountTextController.text) ?? 1,
                                                    guestContact: _guestContactTextController.text ?? '',
                                                    guestName: _guestNameTextController.text ?? '',
                                                    transactionIdentifier: _orderIdentifierTextController.text ?? '',
                                                    tableId: widget.tableId ??-1
                                                );
                                              }
                                              if (transactionOrderState.state.isSuccess) {
                                                loader.hideLoaderDialog(context);
                                                Future.microtask(() => Navigator.pop(context));
                                                widget.showNotification(MessagesProvider.get(widget.isUpdate
                                                    ? "Updated the transaction details successfully."
                                                    : "Created transaction successfully."),
                                                    _theme.footerBG4!);
                                                widget.onComplete();
                                                if(widget.isUpdate) {
                                                  context.read<TransactionCubit>().onTransactionDetailsUpdated(transactionOrderState.state.transactionResponse!.data);
                                                } else {
                                                  context.read<TransactionCubit>().onNewTransactionInitiated(transactionOrderState.state.transactionResponse!.data);
                                                }
                                              }
                                              if (transactionOrderState.state.isError) {
                                                loader.hideLoaderDialog(context);
                                              }
                                            }
                                          }, text: MessagesProvider.get('OK').toUpperCase(),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<TransactionOrderDetailsCubit, TransactionOrderDetailsState>(
              builder: (context,state){
                return const SizedBox();
              },
                listener: (context, transactionOrderDetailsState) {
              if (transactionOrderDetailsState.isError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _notificationBar?.showMessage(
                      transactionOrderDetailsState.statusMessage.toString(),
                      _theme.footerBG3!);
                  _resetLoaderAndMessage();
                });
              } else if (transactionOrderDetailsState.isSuccess) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _notificationBar?.showMessage(
                      transactionOrderDetailsState.statusMessage.toString(),
                      _theme.footerBG4!);
                  _resetLoaderAndMessage();
                });
              }

            }),
          ],
        ),
      ),
    );
  }

  bool _checkValidation(){
    String phoneNumberPatter = r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
    RegExp regExpPhone = RegExp(phoneNumberPatter);
    if (_guestNameTextController.text.length > 50) {
      _showErrorDialog(MessagesProvider.get("Guest name must be 50 characters"));
      return false;
    } else if ((_guestNameTextController.text.trim() != '') && !AppConstants.alphanumericRegExpWithSpecialChar.hasMatch(_guestNameTextController.text ?? '')) {
      _showErrorDialog(MessagesProvider.get("Guest name should not contain any special characters"));
      return false;
    } else if ((_guestContactTextController.text.trim() != '')  && !regExpPhone.hasMatch(_guestContactTextController.text)) {
      _showErrorDialog(MessagesProvider.get("Please Enter The valid Phone Number"));
      return false;
    } else if (_orderIdentifierTextController.text.length > 10) {
      _showErrorDialog(MessagesProvider.get("Order identifier must be 10 characters"));
      return false;
    } else if ( (_orderIdentifierTextController.text.trim() != '') &&!AppConstants.alphanumericRegExpWithSpecialChar.hasMatch(_orderIdentifierTextController.text ?? '')) {
      _showErrorDialog(MessagesProvider.get("Order identifier should not contain any special characters"));
      return false;
    }else if (_guestCountTextController.text.isEmpty) {
      _showErrorDialog(MessagesProvider.get("Guest count is required"));
      return false;
    } else if (int.parse(_guestCountTextController.text) <= 0) {
      _showErrorDialog(MessagesProvider.get('Guest count should be greater than zero'));
      return false;
    } else if (!AppConstants.onlyNumbersRegExp.hasMatch(_guestCountTextController.text)) {
      _showErrorDialog(MessagesProvider.get('Invalid Guest count'));
      return false;
    } else if (int.parse(_guestCountTextController.text) > 30) {
      _showErrorDialog(MessagesProvider.get('Guest count cannot exceed more than 30'));
      return false;
    }else{
      return true;
    }
  }

  _showErrorDialog(String message){
    // ErrorDialog
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext newContext) {
          return ErrorAlertDialog(title: 'Error',message:message ,

          );
        });
  }

  initTextFields() {
    if(widget.isUpdate){
      _guestNameTextController.text = widget.transactionCubit?.state.transactionData?.guestName ?? '';
      _guestCountTextController.text = widget.transactionCubit?.state.transactionData?.guestCount.toString() ?? "1";
      _orderIdentifierTextController.text = widget.transactionCubit?.state.transactionData?.transactionIdentifier ?? '';
      _guestContactTextController.text = widget.transactionCubit?.state.transactionData?.guestContactNumber ?? '';
    }
  }

  _resetLoaderAndMessage() {
    final transactionOrderDetailsState = context.read<TransactionOrderDetailsCubit>();
    transactionOrderDetailsState.resetLoaderAndMessage();
  }

  @override
  void dispose() {
    _guestNameTextController.clear();
    _guestContactTextController.clear();
    _guestCountTextController.clear();
    _orderIdentifierTextController.clear(); //closing cubit
    _notificationBar = null;
    super.dispose();
  }
}
