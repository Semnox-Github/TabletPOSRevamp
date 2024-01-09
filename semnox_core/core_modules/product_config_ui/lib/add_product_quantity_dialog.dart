import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';

class ProductQuantityDialog extends StatefulWidget {
  final String title;
  final int? quantity;
  final Function onConfirm;

  const ProductQuantityDialog(this.title, this.onConfirm, {this.quantity, super.key});

  @override
  State<ProductQuantityDialog> createState() => _ProductQuantityDialogState();
}

class _ProductQuantityDialogState extends State<ProductQuantityDialog> {
  int _quantity = 1;
  final _quantityTextController = TextEditingController();
  final _scrollController = ScrollController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SemnoxTheme _theme;

  @override
  void initState() {
    // TODO: implement initState
    _quantity = widget.quantity ?? 1;
    _quantityTextController.text = '$_quantity';
    _quantityTextController.selection =
        TextSelection.collapsed(offset: _quantityTextController.text.length);
    _quantityTextController.selection = TextSelection.fromPosition(
        TextPosition(offset: _quantityTextController.text.length));
    super.initState();
  }

  void _incrementQuantity() {
    _quantity =_quantityTextController.text.isEmpty || _quantityTextController.text == '0'?0: int.parse(_quantityTextController.text);
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
    _quantity =_quantityTextController.text.isEmpty || _quantityTextController.text == '0'?1:  int.parse(_quantityTextController.text);
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
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
        ),
        child: SizedBox(
          height: SizeConfig.getSize(270),
          width: SizeConfig.getSize(350),
          child: Padding(
            padding:  EdgeInsets.only(right:SizeConfig.getSize(8)),
            child: Scrollbar(
              radius:  Radius.circular(SizeConfig.getSize(10)),
              thumbVisibility: true,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Center(
                  child: Padding(
                    padding:  EdgeInsets.only(top: SizeConfig.getSize(15),left:SizeConfig.getSize(8)),
                    child: Column(
                      children: [
                        Text(
                          maxLines: 2,
                          "${widget.title} \n ${MessagesProvider.get("Enter Quantity")}",
                          style: _theme.heading3!.copyWith(fontSize:SizeConfig.getFontSize(22)),
                          textAlign: TextAlign.center,
                        ),
                         SizedBox(height: SizeConfig.getSize(15)),
                        Container(
                          height: 1,
                          color: _theme.dialogFooterInnerShadow,
                        ),
                        const SizedBox(height: 1),
                        Padding(
                          padding:  EdgeInsets.all(SizeConfig.getSize(15)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Form(
                                  key: _formKey,
                                  child: SizedBox(
                                    height: SizeConfig.getSize(62),
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
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
                                        }
                                        _quantityTextController.selection =
                                            TextSelection.collapsed(
                                                offset:
                                                    _quantityTextController.text.length);
                                      },
                                      cursorWidth: 2,
                                      // cursorHeight: 0,
                                      controller: _quantityTextController,
                                      maxLength: 5,
                                      style: _theme.heading1!.copyWith(fontSize:SizeConfig.getFontSize(32)),
                                      textAlign: TextAlign.center,
                                      onTap: (){
                                        showDialog(
                                            barrierDismissible: true,
                                            context: context,
                                            barrierColor: _theme.transparentColor,
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
                                      decoration: InputDecoration(
                                        counterText: '',
                                        hintStyle:_theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                        contentPadding:  EdgeInsets.only(
                                            top: SizeConfig.getSize(5), bottom: SizeConfig.getSize(5), right: SizeConfig.getSize(5), left: SizeConfig.getSize(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                            borderSide:  BorderSide(
                                              width: SizeConfig.getSize(1),
                                              color: _theme.secondaryColor!,
                                            )),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                            borderSide:  BorderSide(
                                              width: SizeConfig.getSize(1),
                                              color: _theme.secondaryColor!,
                                            )),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                          borderSide:  BorderSide(
                                            width: SizeConfig.getSize(1),
                                            color: _theme.secondaryColor!,
                                          ),
                                        ),
                                        prefixIcon: Padding(
                                          padding:  EdgeInsets.all(SizeConfig.getSize(6)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                            ),
                                            width: SizeConfig.getSize(50),
                                            height: SizeConfig.getSize(50),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  padding:  EdgeInsets.symmetric(
                                                      horizontal: SizeConfig.getSize(4), vertical: SizeConfig.getSize(4),),
                                                  backgroundColor: _theme.button1BG1),
                                              onPressed: () {
                                                _decrementQuantity();
                                              },
                                              child:  Icon(
                                                Icons.remove,
                                                size:SizeConfig.getSize(30),
                                                color: _theme.secondaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        suffixIcon: Padding(
                                          padding:  EdgeInsets.all(SizeConfig.getSize(6)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                            ),
                                            width: SizeConfig.getSize(50),
                                            height: SizeConfig.getSize(50),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  padding:  EdgeInsets.symmetric(
                                                      horizontal: SizeConfig.getSize(4), vertical: SizeConfig.getSize(4)),
                                                  backgroundColor: _theme.button1BG1),
                                              onPressed: () {
                                                _incrementQuantity();
                                              },
                                              child:  Icon(
                                                Icons.add,
                                                size:SizeConfig.getSize(30),
                                                color: _theme.secondaryColor,
                                              ),
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
                          color:  _theme.dialogFooterInnerShadow!,
                        ),
                         SizedBox(height: SizeConfig.getSize(10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SecondaryLargeButton(onPressed: (){
                              Navigator.pop(context);
                            }, text: MessagesProvider.get("Cancel").toUpperCase()),
                             SizedBox(width: SizeConfig.getSize(10)),
                            PrimaryLargeButton(onPressed: (){
                              if(_formKey.currentState!.validate()) {
                                Navigator.of(context).pop();
                                widget.onConfirm(_quantityTextController.text);
                              }
                            }, text: MessagesProvider.get("ok").toUpperCase())
                          ],
                        ),
                         SizedBox(height: SizeConfig.getSize(10)),
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
