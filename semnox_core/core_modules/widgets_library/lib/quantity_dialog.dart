import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logs_data/logger.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'number_pad/number_pad.dart';
// import 'package:login_ui/loader_dialog.dart' as loader;

class QuantityDialog extends StatefulWidget {
  final String title;
  int initialQuantity;
  final Function onConfirm;

  QuantityDialog(this.title, this.onConfirm,
      {this.initialQuantity = 1, super.key});

  @override
  State<QuantityDialog> createState() => _QuantityDialogState();
}

class _QuantityDialogState extends State<QuantityDialog> {
  int _quantity = 1;
  final _quantityTextController = TextEditingController();

  @override
  void initState() {
    _quantity = widget.initialQuantity;
    _quantityTextController.text = '$_quantity';
    _quantityTextController.selection =
        TextSelection.collapsed(offset: _quantityTextController.text.length);
    _quantityTextController.selection = TextSelection.fromPosition(
        TextPosition(offset: _quantityTextController.text.length));
    super.initState();
  }

  void _incrementQuantity() {
    _quantity = int.parse(_quantityTextController.text);
    setState(() {
      _quantity++;
      _quantityTextController.text =
          (_quantity < 100000 ? _quantity : 99999).toString();
      // _quantityTextController.text = (_counter).toString();
      _quantityTextController.selection =
          TextSelection.collapsed(offset: _quantityTextController.text.length);
      _quantityTextController.selection = TextSelection.fromPosition(
          TextPosition(offset: _quantityTextController.text.length));
    });
  }

  void _decrementQuantity() {
    _quantity = int.parse(_quantityTextController.text);
    setState(() {
      _quantity--;
      _quantityTextController.text = (_quantity > 1 ? _quantity : 1).toString();
      _quantityTextController.selection =
          TextSelection.collapsed(offset: _quantityTextController.text.length);
      _quantityTextController.selection = TextSelection.fromPosition(
          TextPosition(offset: _quantityTextController.text.length));
    });
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(15)),
        ),
        child: SizedBox(
          height: SizeConfig.getSize(250),
          width: SizeConfig.getSize(420),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding:  EdgeInsets.only(top: SizeConfig.getSize(15)),
                child: Column(
                  children: [
                    Text(
                      maxLines: 2,
                      widget.title,
                      style: GoogleFonts.robotoCondensed(
                          color: theme.secondaryColor,
                          fontSize: SizeConfig.getFontSize(24),
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                     SizedBox(height: SizeConfig.getSize(15)),
                    Container(
                      height: 1,
                      color: theme.dividerColor,
                    ),
                     SizedBox(height: SizeConfig.getSize(1)),
                    Padding(
                      padding:  EdgeInsets.all(SizeConfig.getSize(15)),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: SizeConfig.getSize(62),
                              child: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                ],
                                onChanged: (text) {
                                  if (_quantityTextController.text == '0' ||
                                      _quantityTextController.text.isEmpty) {
                                    setState(() {
                                      _quantityTextController.text = '1';
                                    });
                                  }
                                  _quantityTextController.selection =
                                      TextSelection.collapsed(
                                          offset:
                                              _quantityTextController.text.length);
                                },
                                onTap: (){
                                  showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      barrierColor: const Color(0x01000000),
                                      builder: (BuildContext context) {
                                        return NumberPad(
                                          title: '',
                                          initialOffset: const Offset(0, 50),
                                          onOkPressed: (int? value) async {
                                            setState(() {
                                              _quantityTextController.text = value.toString();
                                            });
                                          },
                                        );
                                      });
                                },
                                readOnly: true,
                                cursorWidth: 0,
                                cursorHeight: 0,
                                controller: _quantityTextController,
                                maxLength: 5,
                                style: GoogleFonts.robotoCondensed(
                                    color: theme.secondaryColor,
                                    fontSize: SizeConfig.getFontSize(32),
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  counterText: '',
                                  contentPadding:  EdgeInsets.only(
                                      top: SizeConfig.getSize(10), bottom:  SizeConfig.getSize(10), right:  SizeConfig.getSize(10), left:  SizeConfig.getSize(10)),
                                  focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: theme.dividerColor!,
                                      )),
                                  border:  OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: theme.dividerColor!,
                                    ),
                                  ),
                                  prefix: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(15)),
                                    ),
                                    width: SizeConfig.getSize(50),
                                    height: SizeConfig.getSize(50),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                          padding:  EdgeInsets.symmetric(
                                              horizontal: SizeConfig.getSize(4), vertical: SizeConfig.getSize(4)),
                                          backgroundColor: theme.button1BG1),
                                      onPressed: () {
                                        _decrementQuantity();
                                      },
                                      child:  Icon(
                                        Icons.remove,
                                        size: SizeConfig.getSize(30),
                                        color: theme.secondaryColor,
                                      ),
                                    ),
                                  ),
                                  suffix: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(15)),
                                    ),
                                    width: SizeConfig.getSize(50),
                                    height: SizeConfig.getSize(50),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                          padding:  EdgeInsets.symmetric(
                                              horizontal: SizeConfig.getSize(4), vertical: SizeConfig.getSize(4)),
                                          backgroundColor: theme.button1BG1),
                                      onPressed: () {
                                        _incrementQuantity();
                                      },
                                      child:  Icon(
                                        Icons.add,
                                        size: SizeConfig.getSize(30),
                                        color: theme.secondaryColor,
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
                      color: theme.dividerColor,
                    ),
                     SizedBox(height: SizeConfig.getSize(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: SizeConfig.getSize(68),
                          width: SizeConfig.getSize(138),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color:theme.button1BG1!,
                              borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),

                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom( tapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: SizeConfig.getSize(4), vertical: SizeConfig.getSize(4)),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(SizeConfig.getSize(8)),
                                ),
                              backgroundColor: theme.button1BG1
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                //loader.hideLoaderDialog(context);
                              },
                              child: Text(
                                "Cancel".toUpperCase(),
                                style: GoogleFonts.robotoCondensed(
                                    color: theme.secondaryColor ,
                                    fontSize: SizeConfig.getFontSize(20),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(width: SizeConfig.getSize(10)),
                        SizedBox(
                          height: SizeConfig.getSize(68),
                          width: SizeConfig.getSize(138),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(SizeConfig.getSize(8)),
                              ),
                              backgroundColor:theme.button2BG1,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Log.v("-- onConfirm ${_quantityTextController.text}");
                              widget.onConfirm(int.parse(_quantityTextController.text));
                            },
                            child: Text(
                              "OK",
                              style: GoogleFonts.robotoCondensed(
                                  color: Colors.white,
                                  fontSize: SizeConfig.getFontSize(20),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
