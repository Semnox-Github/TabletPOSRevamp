import 'package:customer_ui/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';
class Product9999Details extends StatefulWidget {
  final int productId;
  final int quantity;
  final Future<void> Function(int, String, double, int, String, int, int, String) add9999ToTransaction;

  const Product9999Details({Key? key,required
   this.productId,required this.quantity,required this.add9999ToTransaction}) : super(key: key);

  @override
  State<Product9999Details> createState() => _Product9999DetailsState();
}

class _Product9999DetailsState extends State<Product9999Details> {
  TextEditingController nineItemDescription = TextEditingController();
  TextEditingController nineItemPrice = TextEditingController();
  TextEditingController nineItemRemarks = TextEditingController();
  String selectedPrinter = 'Bullzip PDF Printer-KOTPrinter';
  ScrollController popUpScroll = ScrollController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    final TransactionCubit transactionCubit = context.read<TransactionCubit>();
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 50,
        right: MediaQuery.of(context).size.width/3.5,
        left: MediaQuery.of(context).size.width/3.5,
      ),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              // width: 350,
              // height: 450,
              color: theme.backGroundColor,
              child: Scroller(
                controller: popUpScroll,
                child: SingleChildScrollView(
                  controller: popUpScroll,
                  scrollDirection: Axis.vertical,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10,),
                        Text("9999 DETAILS",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.robotoCondensed(
                              color: theme.secondaryColor,
                              fontSize: SizeConfig.getFontSize(22),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const Divider(thickness: 0.5,),
                        const SizedBox(height: 10,),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width/3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("* Description",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'RobotoCondensed',
                                    color: theme.secondaryColor,
                                    fontSize: SizeConfig.getFontSize(20),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  //height: MediaQuery.of(context).size.height/15,
                                  child: TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    controller: nineItemDescription,
                                    style: theme.subtitle2,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Description is mandatory';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: theme.primaryColor,
                                        isDense: true,
                                        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        hintText: 'Enter',
                                        hintStyle: TextStyle(
                                          fontFamily: 'RobotoCondensed',
                                          color: theme.secondaryColor,
                                          fontSize: SizeConfig.getFontSize(20),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        suffixIconConstraints: const BoxConstraints()
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width/3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("* Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'RobotoCondensed',
                                    color: theme.secondaryColor,
                                    fontSize: SizeConfig.getFontSize(20),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  //height: MediaQuery.of(context).size.height/15,
                                  child: TextFormField(
                                    onTap: (){
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          barrierColor: const Color(0x01000000),
                                          builder: (BuildContext context) {
                                            return NumberPad(
                                              initialOffset: const Offset(50,50),
                                              title:'',
                                              onOkPressed: (value) {
                                                setState(() {
                                                  nineItemPrice.text = value.toString();
                                                });
                                              },
                                            );
                                          });
                                    },
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    readOnly: true,
                                    showCursor: false,
                                    //enabled: false,
                                    controller: nineItemPrice,
                                    style: theme.subtitle2,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Price is mandatory';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      isDense: true,
                                      filled: true,
                                      fillColor: theme.primaryColor,
                                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      hintText: 'Enter',
                                      hintStyle: TextStyle(
                                        fontFamily: 'RobotoCondensed',
                                        color: theme.secondaryColor,
                                        fontSize: SizeConfig.getFontSize(20),
                                        fontWeight: FontWeight.w400,
                                      ),
                                      errorStyle: const TextStyle(
                                        color: Colors.red, // or any other color
                                      ),
                                      suffixIconConstraints: const BoxConstraints(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width/3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("* Remarks",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'RobotoCondensed',
                                    color: theme.secondaryColor,
                                    fontSize: SizeConfig.getFontSize(20),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  //height: MediaQuery.of(context).size.height/15,
                                  child: TextFormField(
                                    controller: nineItemRemarks,
                                    style: theme.subtitle2,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Remarks is mandatory';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: theme.primaryColor,
                                        isDense: true,
                                        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        hintText: 'Enter',
                                        hintStyle: TextStyle(
                                          fontFamily: 'RobotoCondensed',
                                          color: theme.secondaryColor,
                                          fontSize: SizeConfig.getFontSize(20),
                                          fontWeight: FontWeight.w400,
                                        ),
                                        suffixIconConstraints: const BoxConstraints()
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "* KOT Printer?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'RobotoCondensed',
                                    color: theme.secondaryColor,
                                    fontSize: SizeConfig.getFontSize(20),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                  height: MediaQuery.of(context).size.height / 12,
                                  width: MediaQuery.of(context).size.width / 3,
                                  decoration: BoxDecoration(
                                    color: theme.primaryColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.black, width: 0.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5, top: 2, bottom: 0, right: 10),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        canvasColor: theme.primaryColor,
                                      ),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        hint: const Text('Select'), // Not necessary for Option 1
                                        value: selectedPrinter,
                                        underline: Container(),
                                        icon: Icon(Icons.arrow_drop_down, color: theme.secondaryColor,),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedPrinter = newValue!;
                                          });
                                        },
                                        items: [
                                          'Bullzip PDF Printer-KOTPrinter',
                                          'Bullzip PDF Printer-KOTPrinter2'
                                        ].map((location) {
                                          return DropdownMenuItem<String>(
                                            value: location,
                                            child: Text(
                                              location,
                                              style: TextStyle(
                                                fontFamily: 'RobotoCondensed',
                                                color: theme.secondaryColor,
                                                fontSize: SizeConfig.getFontSize(20),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width/10,
                                height: MediaQuery.of(context).size.height/10,
                                decoration: BoxDecoration(
                                    color: theme.button1BG1,
                                    borderRadius: const BorderRadius.all(Radius.circular(5))
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("CANCEL",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: SizeConfig.getFontSize(20),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'RobotoCondensed',
                                          color: theme.secondaryColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            InkWell(
                              onTap: (){
                                if (_formKey.currentState!.validate()) {
                                  widget.add9999ToTransaction(widget.productId, nineItemDescription.text.toString(),
                                    double.parse(nineItemPrice.text.toString()),
                                    1,
                                    nineItemRemarks.text.toString(),
                                    widget.quantity,
                                    transactionCubit.state.selectedSeat,
                                    transactionCubit.state.selectedSeatName,).whenComplete(() => print("Done adding 9999"));
                                }
                                /*if(nineItemDescription.text.isEmpty || nineItemPrice.text.isEmpty
                                        || nineItemRemarks.text.isEmpty){
                                          setNotification.value = NotificationMessage(message:  MessagesProvider.get(" All fields are mandatory "),
                                              color: AppColors.notificationBGRedColor);
                                          Future.delayed(Duration(seconds: 3),(){
                                            setNotification.value = NotificationMessage(message: '',color: theme.footerBG4);
                                          });
                                        }else{
                                          _add9999ToTransaction(
                                            productId,
                                            nineItemDescription.text.toString(),
                                            double.parse(nineItemPrice.text.toString()),
                                            1,
                                            nineItemRemarks.text.toString(),
                                            quantity,
                                            transactionCubit!.state.selectedSeat,
                                            transactionCubit!.state.selectedSeatName,
                                          ).whenComplete(() => print("Done adding 9999"));
                                        }*/
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width/10,
                                height: MediaQuery.of(context).size.height/10,
                                decoration: BoxDecoration(
                                    color: theme.button2InnerShadow1,
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("OK",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w700,
                                        fontFamily: 'RobotoCondensed',
                                        color: theme.secondaryColor,
                                      ).copyWith(color: theme.light1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

