import 'package:customer_ui/widgets/CustomerDialogButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreen.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';
import 'package:widgets_library/scroller.dart';

class ReserveDialog extends StatelessWidget{

  VoidCallback? onHeaderClick;
  VoidCallback? onOk;
  VoidCallback? onCancel;
  bool detailStatus = false;
  String tableName;
  TextEditingController customerNameController;
  TextEditingController contactController;
  TextEditingController reserveFromDateController;
  TextEditingController reserveToDateController;
  TextEditingController occasionController;
  TextEditingController additionalCommentsController;


  ReserveDialog({super.key,
      this.onHeaderClick,
      this.onOk,
      this.onCancel,
      required this.detailStatus,
      required this.tableName,
      required this.customerNameController,
      required this.contactController,
      required this.reserveFromDateController,
      required this.reserveToDateController,
      required this.occasionController,
      required this.additionalCommentsController});

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return  Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: theme.backGroundColor,
                borderRadius: const BorderRadius.all(
                    Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child:
                Scroller(
                  controller: _scrollController,
                  child: CustomScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/3,
                              height: 50,
                              child: InkWell(
                                onTap:  onHeaderClick,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: theme.secondaryColor,
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(8),
                                          topLeft: Radius.circular(8))),
                                  constraints: const BoxConstraints(
                                    minHeight: double.infinity,
                                    maxHeight: double.infinity,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 21.0, right: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_back_ios,
                                          color: theme.primaryColor,
                                          size: 24,
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width/100,),
                                        Text(detailStatus ? "DETAILS  ${tableName}" : "Reserve Table ${tableName}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: theme.primaryColor)
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 0.5, width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 30,),
                                Expanded(
                                  //width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("* ${MessagesProvider.get('Customer name')}",
                                        textAlign: TextAlign.center,
                                        style: theme.subtitle2,
                                      ),
                                      const SizedBox(height: 10,),
                                      TextFormField(
                                        controller: customerNameController,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(color: Colors.black, width: 0.6),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(color: Colors.black, width: 0.6),
                                            ),
                                            focusedBorder:  OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(color: Colors.black, width: 0.6),
                                            ),
                                            hintText: MessagesProvider.get('Customer name'),
                                            hintStyle: theme.textFieldHintStyle,
                                            suffixIconConstraints: const BoxConstraints()
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  //width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("* Contact",
                                        textAlign: TextAlign.center,
                                        style: theme.subtitle2,
                                      ),
                                      const SizedBox(height: 10,),
                                      TextFormField(
                                        controller: contactController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(color: Colors.black, width: 0.6),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(color: Colors.black, width: 0.6),
                                            ),
                                            focusedBorder:  OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(color: Colors.black, width: 0.6),
                                            ),
                                            hintText: 'Contact',
                                            hintStyle: theme.textFieldHintStyle,
                                            suffixIconConstraints: const BoxConstraints()
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 30,),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 30,),
                                Expanded(
                                  //width: 200,
                                  child: Stack(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("* Reserve From Date",
                                        textAlign: TextAlign.center,
                                        style: theme.subtitle2,
                                      ),
                                      CustomerDatePickerReserve("",  "", reserveFromDateController),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  //width: 200,
                                  child: Stack(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 5,),
                                      Text("* Reserve To Date",
                                        textAlign: TextAlign.center,
                                        style: theme.subtitle2,
                                      ),
                                      CustomerDatePickerReserveTo("",  "", reserveToDateController),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 30,),
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 30,),
                                Expanded(
                                  //width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Occasion",
                                        textAlign: TextAlign.center,
                                        style: theme.subtitle2,
                                      ),
                                      const SizedBox(height: 10,),
                                      TextFormField(
                                        controller: occasionController,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(color: Colors.black, width: 0.6),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(color: Colors.black, width: 0.6),
                                            ),
                                            focusedBorder:  OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(color: Colors.black, width: 0.6),
                                            ),
                                            hintText: 'Occasion',
                                            hintStyle: theme.textFieldHintStyle,
                                            suffixIconConstraints: const BoxConstraints()
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  //width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Additional Comments",
                                        textAlign: TextAlign.center,
                                        style: theme.subtitle2,
                                      ),
                                      const SizedBox(height: 10,),
                                      TextFormField(
                                        controller: additionalCommentsController,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(color: Colors.black, width: 0.6),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(color: Colors.black, width: 0.6),
                                            ),
                                            focusedBorder:  OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(color: Colors.black, width: 0.6),
                                            ),
                                            hintText: 'Additional comments',
                                            hintStyle: theme.textFieldHintStyle,
                                            suffixIconConstraints: const BoxConstraints()
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 30,),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            const Spacer(),
                            Container(
                              height: 0.5, width: double.infinity,
                              color: Colors.grey.shade300,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height/60,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: onCancel ,
                                  child: Container(
                                    width: 80,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: theme.button1BG1,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("CANCEL",
                                          textAlign: TextAlign.center,
                                          style: theme.heading5!,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                InkWell(
                                  onTap: onOk,
                                  child: Container(
                                    width: 80,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: theme.button2InnerShadow1,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("OK",
                                          textAlign: TextAlign.center,
                                          style: theme.headingLight5!.copyWith(color: theme.light1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height/40,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



  /*@override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    _screenSize = MediaQuery.of(context).size;
    _screenHeight = _screenSize!.height;
    _screenWidth = _screenSize!.width;

    return AlertDialog(
      title:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
        child: Text(MessagesProvider.get("Allowed Override").toUpperCase(),style: theme.heading5,textAlign: TextAlign.center,),
      ),
      contentPadding: EdgeInsets.zero,
      //insetPadding: EdgeInsets.symmetric(vertical: 100),
      insetPadding: EdgeInsets.zero,
      content: _widget(context,theme),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomerDialogButton(text: MessagesProvider.get("cancel").toUpperCase(),background: false,
          onPress: (){
            Navigator.pop(context);
          },),
        CustomerDialogButton(text: MessagesProvider.get("ok").toUpperCase(),onPress: onOk,)
      ],
    );
  }

  Widget _widget(BuildContext context,SemnoxTheme theme){
    return Container(
      width: MediaQuery.of(context).size.width*0.5,
      child: CustomScrollView(
        slivers :[

        ]
      ),
    );
  }*/
}