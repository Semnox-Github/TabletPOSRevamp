import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_ui/CustomerDetailsPage.dart';
import 'package:customer_ui/CustomersPage.dart';
import 'package:customer_ui/NewCustomerPage.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/widgets/ChangeAlertButtonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/cubit/transaction_cubit_state.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'AccountsDetailsPage.dart';
import 'customer_lookup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_ui/loader_dialog.dart' as loader;

class CustomerChangeAlert extends StatelessWidget{

  bool _cardDisabled = false;
  bool _customerDisabled = false;
  bool _accountDisabled = false;
  bool _selectAnotherCardDisabled = false;
  String? title;
  CustomerData? data;
  final Function()? onCancelTapped;
  final Function(CustomerData?)? onCustomerSet;
  final Function(String?)? onValidationError;

  CustomerChangeAlert({super.key, this.data, this.title, this.onCancelTapped, this.onCustomerSet, this.onValidationError});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    title ??= MessagesProvider.get("Change").toUpperCase();
    AccountDetailsData? cardData =  context.watch<SelectedCardDetails>().selectedData;
    int? cardLength =  context.watch<SelectedCardDetails>().selectedLength;

    if(data == null){
      _customerDisabled = true;
    }
    if(cardData == null){
      _cardDisabled = true;
    }

    if(cardLength == null || cardLength <= 0){
      _accountDisabled = true;
      _selectAnotherCardDisabled = true;
    }else if(cardLength == 1 && cardData != null){
      _selectAnotherCardDisabled = true;
    }



    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Material(
          type: MaterialType.transparency,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                margin: const EdgeInsets.all(25),
                width:  MediaQuery.of(context).size.width *0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.backGroundColor,
                  // gradient: boxGradient,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
                            child: Text(title!, textAlign: TextAlign.center,style :theme.heading2?.copyWith(fontSize: SizeConfig.getFontSize(24))),
                          ),
                        ],
                      ),
                      Container(
                        color: theme.dividerColor, height: 1,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(MessagesProvider.get("Customer"), style:  theme.title3?.copyWith(fontWeight: FontWeight.w700, fontSize: SizeConfig.getFontSize(18)),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                ChangeButtonWidget(onPress: (){
                                  if(_customerDisabled && _cardDisabled) {
                                    Navigator.pop(context);
                                    Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CustomersPage(
                                                isShowHeader:true,
                                                onNewCustomerCreated: (customer) {
                                                  onCustomerSet!(customer);
                                                }, onCancelTapped: () {
                                                onCancelTapped!();
                                              },)),);
                                     /* MaterialPageRoute(
                                          builder: (context) =>
                                              NewCustomerPage(
                                                isShowHeader:true,
                                                onNewCustomerCreated: (customer) {
                                                onCustomerSet!(customer);
                                              }, onCancelTapped: () {
                                                onCancelTapped!();
                                              },)),);*/
                                  }
                                },
                                  buttonText: MessagesProvider.get("New\nCustomer").toUpperCase(),
                                  buttonBackground:  (!_customerDisabled || !_cardDisabled) ? theme.button1BG1 : theme.button2BG1,
                                  buttonTextStyle:  (!_customerDisabled || !_cardDisabled ) ? theme.headingLight6?.copyWith(color: theme.dividerColor, fontSize: SizeConfig.getFontSize(16)) : theme.headingLight6?.copyWith(color:Colors.white,fontSize: SizeConfig.getFontSize(16)),),
                                const SizedBox(width: 10,),
                                ChangeButtonWidget(onPress: (){
                                    if(_customerDisabled && _cardDisabled ) {
                                      Navigator.pop(context);
                                      showDialog(context: context, builder: (_) {
                                        return Padding(
                                            padding: const EdgeInsets.only(left: 16,right:16, top: 12,bottom:60 ),
                                            child:  CustomerLookUpScreen(
                                              isShowHeader: true,
                                              isNameSelect: false,
                                              onCustomerSelected: (customer) {
                                                onCustomerSet!(customer);
                                              },
                                              onCancelTapped: () {
                                                onCancelTapped!();
                                              },
                                            ));
                                      }, barrierDismissible: false);
                                    }
                                },
                                  buttonText: MessagesProvider.get("Customer\nLookup").toUpperCase(),
                                  buttonBackground:  (!_customerDisabled || !_cardDisabled) ?  theme.button1BG1  :theme.button2BG1,
                                  buttonTextStyle:  (!_customerDisabled || !_cardDisabled ) ? theme.headingLight6?.copyWith(color: theme.dividerColor,fontSize: SizeConfig.getFontSize(16)) : theme.headingLight6?.copyWith(color:Colors.white,fontSize: SizeConfig.getFontSize(16))),
                                const SizedBox(width: 10,),
                                ChangeButtonWidget(onPress: (){
                                  if(data != null) {
                                    Navigator.pop(context);
                                    Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CustomerDetailsPage(source: 0,)),);
                                  }
                                },
                                  buttonText: MessagesProvider.get("Customer\nDetails").toUpperCase(),
                                  buttonBackground: (_customerDisabled)?  theme.button1BG1  :theme.button2BG1,
                                  buttonTextStyle:  (_customerDisabled) ? theme.headingLight6?.copyWith(color: theme.dividerColor,fontSize: SizeConfig.getFontSize(16)) : theme.headingLight6?.copyWith(color:Colors.white,fontSize: SizeConfig.getFontSize(16)),),
                                const SizedBox(width: 10,),
                                BlocBuilder<TransactionCubit, TransactionCubitState>(
                                    builder: (context, transactionState) {
                                      return ChangeButtonWidget(onPress: (){
                                        ///
                                        /// Note : If the "Only for VIP" or "Registered Customer Only" products are present in the transaction-line.
                                        /// Cannot remove the customer.
                                        ///
                                        final status = context.read<TransactionCubit>().state.transactionData?.transactionStatus;
                                        if(status == 'CLOSED' || status == 'PENDING_CLOSE' || status == 'CANCELLED' || status == 'REOPENED'
                                            || status == 'ABANDONED' || status == 'REVERSED' || status == 'REVERSE_INITIATED') {
                                          if(onValidationError != null) {
                                            onValidationError!(MessagesProvider.get("Transaction Current status is &1. &2 operation not permitted.", [status, "DISASSOCIATE CUSTOMER"]));
                                          }
                                          return;
                                        }
                                        if(data != null) {
                                          if(transactionState.transactionData != null){
                                            context.read<TransactionCubit>().deLinkCustomerFromTransaction();
                                            Navigator.pop(context);
                                            Future.microtask(() => loader.showLoaderDialog(context, MessagesProvider.get("Removing Customer")));
                                          } else {
                                            context.read<SelectedCustomer>().updateData(null);
                                            context.read<SelectedCardDetails>().updateCardLength(null);
                                            context.read<SelectedCardDetails>().updateData(null);
                                            Navigator.pop(context);
                                          }
                                        }
                                      },
                                        buttonText: MessagesProvider.get("Remove\nCustomer").toUpperCase(),
                                        buttonBackground:  (_customerDisabled) ?  theme.button1BG1  : theme.button2BG1,
                                        buttonTextStyle:  (_customerDisabled) ? theme.headingLight6?.copyWith(color: theme.dividerColor,fontSize: SizeConfig.getFontSize(16)) : theme.headingLight6?.copyWith(color:Colors.white,fontSize: SizeConfig.getFontSize(16)),);
                                    }
                                ),
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Text(MessagesProvider.get("Card"), style:  theme.title3?.copyWith(fontWeight: FontWeight.w700,fontSize: SizeConfig.getFontSize(18)),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                ChangeButtonWidget(onPress: (){
                                  // if(!_customerDisabled && !_cardDisabled){
                                  if(!_cardDisabled){
                                    Navigator.pop(context);
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountsDetailsPage(source: 0,)));
                                  }
                                },
                                  buttonText: MessagesProvider.get("Account\nDetails").toUpperCase(),
                                  buttonBackground:  ( _cardDisabled) ?  theme.button1BG1   : theme.button2BG1,
                                  buttonTextStyle:  (_cardDisabled) ? theme.headingLight6?.copyWith(color: theme.dividerColor,fontSize: SizeConfig.getFontSize(16)) : theme.headingLight6?.copyWith(color:Colors.white,fontSize: SizeConfig.getFontSize(16)),),
                                const SizedBox(width: 10,),
                                ChangeButtonWidget(onPress: (){
                                  if(!_customerDisabled && !_selectAnotherCardDisabled){
                                    //click event
                                    Navigator.pop(context);
                                    Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CustomerDetailsPage(source: 4,fromPage: "change",)),);
                                  }
                                },
                                    buttonText: MessagesProvider.get("Select\nAnother Card").toUpperCase(),
                                    buttonBackground:  (_customerDisabled || _selectAnotherCardDisabled) ? theme.button1BG1  : theme.button2BG1,
                                    buttonTextStyle:  (_customerDisabled || _selectAnotherCardDisabled) ? theme.headingLight6?.copyWith(color: theme.dividerColor,fontSize: SizeConfig.getFontSize(16)) : theme.headingLight6?.copyWith(color:Colors.white,fontSize: SizeConfig.getFontSize(16))),
                                const SizedBox(width: 10,),
                                ChangeButtonWidget(onPress: (){
                                  // if(!_customerDisabled && !_cardDisabled){
                                  if(!_cardDisabled){
                                    //click event
                                    ///
                                    /// Note : If the "Only for VIP" product is present in the transaction-line. Cannot remove the card.
                                    ///
                                    context.read<SelectedCardDetails>().updateData(null);
                                    Navigator.pop(context);
                                  }
                                },
                                  buttonText: MessagesProvider.get("Remove\nCard").toUpperCase(),
                                  buttonBackground:  (_cardDisabled) ?  theme.button1BG1 : theme.button2BG1,
                                  buttonTextStyle:  (_cardDisabled) ? theme.headingLight6?.copyWith(color: theme.dividerColor,fontSize: SizeConfig.getFontSize(16)) : theme.headingLight6?.copyWith(color:Colors.white,fontSize: SizeConfig.getFontSize(16)),),

                                const Spacer()
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 30,
                backgroundColor: theme.secondaryColor,
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                  onCancelTapped!();
                }, icon: Icon(Icons.close, color: theme.primaryColor,)),
              )
            ],
          ),
        ),
      ),
    );
  }

}

//diabled color Color(0xFFE7E9F1)