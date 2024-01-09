import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messages_data/builder.dart';
import 'AppColors.dart';
import 'AppStyle.dart';

class RepeatTransactionLineDialog extends StatefulWidget {
  final Function onConfirm;

  const RepeatTransactionLineDialog(this.onConfirm, {super.key});

  @override
  State<RepeatTransactionLineDialog> createState() => _RepeatTransactionLineDialogState();
}

class _RepeatTransactionLineDialogState extends State<RepeatTransactionLineDialog> {
  int _quantity = 1;
  final _quantityTextController = TextEditingController();
  final _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _quantityTextController.text = '$_quantity';
    _quantityTextController.selection = TextSelection.collapsed(offset: _quantityTextController.text.length);
    _quantityTextController.selection = TextSelection.fromPosition(TextPosition(offset: _quantityTextController.text.length));
    super.initState();
  }

  void _incrementQuantity() {
    _quantity =_quantityTextController.text.isEmpty || _quantityTextController.text == '0'?0: int.parse(_quantityTextController.text);
    setState(() {
      _quantity++;
      _quantityTextController.text = (_quantity < 100000 ? _quantity : 99999).toString();
      _quantityTextController.selection = TextSelection.collapsed(offset: _quantityTextController.text.length);
      _quantityTextController.selection = TextSelection.fromPosition(TextPosition(offset: _quantityTextController.text.length));
    });
  }

  void _decrementQuantity() {
    _quantity =_quantityTextController.text.isEmpty || _quantityTextController.text == '0'?1:  int.parse(_quantityTextController.text);
    setState(() {
      _quantity--;
      _quantityTextController.text = (_quantity > 1 ? _quantity : 1).toString();
      _quantityTextController.selection = TextSelection.collapsed(offset: _quantityTextController.text.length);
      _quantityTextController.selection = TextSelection.fromPosition(TextPosition(offset: _quantityTextController.text.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    AppStyle.init(context);
    AppColors.init(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        height: 300,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Scrollbar(
            radius: const Radius.circular(10),
            thumbVisibility: true,
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      Text(
                        maxLines: 2,
                        "${MessagesProvider.get("Repeat Product")} \n ${MessagesProvider.get("Enter Quantity")}",
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 1,
                        color: const Color(0xffE4E6EF),
                      ),
                      const SizedBox(height: 1),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(RegExp(r'\d')),
                                  ],
                                  validator: (value){
                                    if(value == null || value.isEmpty ){
                                      return MessagesProvider.get("Quantity cannot be empty.");
                                    }if(value == "0"  ){
                                      return MessagesProvider.get("Minimum quantity should be &1", [1]);
                                    }
                                    return null;
                                  },
                                  onChanged: (text) {
                                    if (_quantityTextController.text == '0' ||
                                        _quantityTextController.text.isEmpty) {
                                      // setState(() {
                                      //   _quantityTextController.text = '1';
                                      // });
                                    }
                                    _quantityTextController.selection = TextSelection.collapsed(offset: _quantityTextController.text.length);
                                  },
                                  cursorWidth: 2,
                                  // cursorHeight: 0,
                                  controller: _quantityTextController,
                                  autofocus: true,
                                  maxLength: 5,
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.black,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    contentPadding: const EdgeInsets.only(top: 5, bottom: 25, right: 10, left: 10),
                                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xffE4E6EF),)),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 3,
                                        color: Color(0xffE4E6EF),
                                      ),
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0),),
                                        width: 50,
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                              backgroundColor: const Color(0xffE9EBF6)),
                                          onPressed: () {
                                            _decrementQuantity();
                                          },
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0),),
                                        width: 50,
                                        height: 50,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                              backgroundColor: const Color(0xffE9EBF6)),
                                          onPressed: () {
                                            _incrementQuantity();
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.black,
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
                      ),
                      Container(
                        height: 1,
                        color: const Color(0xffE4E6EF),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 68,
                            width: 120,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [
                                  Color(0xffEBEDF6),
                                  Color(0xffF3F4F9),
                                ]),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const <BoxShadow>[
                                  BoxShadow(offset: Offset(1.0, 2.0,),
                                      color: Color.fromRGBO(0, 0, 0, 0.47), //shadow for button
                                      blurRadius: 1) //blur radius of shadow
                                ],
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8), // <-- Radius
                                  ),
                                  backgroundColor:
                                  AppColors.backGroundGreyLightColor1,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  MessagesProvider.get("CANCEL"),
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            height: 68,
                            width: 120,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
                                backgroundColor: Colors.black,
                              ),
                              onPressed: () {
                                if(FocusScope.of(context).hasFocus) {
                                  FocusScope.of(context).unfocus();
                                }
                                if(_formKey.currentState!.validate()) {
                                  Navigator.of(context).pop();
                                  widget.onConfirm(_quantityTextController.text);
                                }
                              },
                              child: Text(
                                MessagesProvider.get("OK"),
                                style: GoogleFonts.robotoCondensed(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
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
