import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';

class ProductDetailsDialog extends StatefulWidget {
  int initialQuantity = 0;
  final Function onConfirm;
  ProductContainerDTO _productContainer;

  ProductDetailsDialog(this._productContainer, this.onConfirm,
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return ProductDetailsDialogState();
  }
}

class ProductDetailsDialogState extends State<ProductDetailsDialog> {
  int _quantity = 0;
  final _quantityTextController = TextEditingController();
  NotificationBar? _notificationBar;

  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
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
      _quantityTextController.text = (_quantity >= 1 ? _quantity :0 ).toString();
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
      child: SafeArea(
        child: Container(
          decoration:  BoxDecoration(
              color: theme.transparentColor,
              borderRadius:const BorderRadius.all(Radius.circular(8))),
          child: Scaffold(
            backgroundColor: theme.transparentColor,
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: Container(
              child: _notificationBar,
            ),
            body: Padding(
              padding:  EdgeInsets.all(SizeConfig.getSize(8)),
              child: Container(
                decoration:  BoxDecoration(
                    color: theme.backGroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(8)))),
                child: Padding(
                  padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                  child: CustomScrollView(
                    scrollDirection: Axis.vertical,
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: SizeConfig.getSize(16)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Product Details",
                                        style: GoogleFonts.robotoCondensed(
                                            color:theme.secondaryColor,
                                            fontSize: SizeConfig.getSize(26),
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                               Divider(
                                thickness: 1,
                                color:theme.dividerColor,
                                indent: SizeConfig.getSize(8),
                                endIndent: SizeConfig.getSize(8),
                              ),
                              Padding(
                                padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: theme.tableRow1,
                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                      boxShadow:  [
                                        BoxShadow(
                                            color: theme.dividerColor!, spreadRadius: 1),
                                      ]),
                                  child: Padding(
                                    padding:  EdgeInsets.all(SizeConfig.getSize(16)),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Name: ",
                                              style: GoogleFonts.robotoCondensed(
                                                  color:theme.secondaryColor,
                                                  fontSize: SizeConfig.getSize(16),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                             SizedBox(height: SizeConfig.getSize(8)),
                                            Text(
                                              "Type: ",
                                              style: GoogleFonts.robotoCondensed(
                                                  color:theme.secondaryColor,
                                                  fontSize:SizeConfig.getSize(16),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                             SizedBox(height: SizeConfig.getSize(8)),
                                            Text(
                                              "Base Price: ",
                                              style: GoogleFonts.robotoCondensed(
                                                  color:theme.secondaryColor,
                                                  fontSize: SizeConfig.getSize(16),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                         SizedBox(width: SizeConfig.getSize(16)),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget
                                                  ._productContainer.productName,
                                              style: GoogleFonts.robotoCondensed(
                                                color:theme.secondaryColor,
                                                fontSize: SizeConfig.getSize(16),
                                              ),
                                            ),
                                             SizedBox(height: SizeConfig.getSize(8)),
                                            Text(
                                              widget
                                                  ._productContainer.productType,
                                              style: GoogleFonts.robotoCondensed(
                                                color:theme.secondaryColor,
                                                fontSize: SizeConfig.getSize(16),
                                              ),
                                            ),
                                             SizedBox(height: SizeConfig.getSize(8)),
                                            Text( //todo - check base price from price container is same to product container price
                                              widget._productContainer.price
                                                  .toString(),
                                              style: GoogleFonts.robotoCondensed(
                                                color:theme.secondaryColor,
                                                fontSize: SizeConfig.getSize(16),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: SizeConfig.getSize(32)),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Code: ",
                                              style: GoogleFonts.robotoCondensed(
                                                  color:theme.secondaryColor,
                                                  fontSize: SizeConfig.getSize(16),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(height: SizeConfig.getSize(8)),
                                            Text(
                                              "Barcode: ",
                                              style: GoogleFonts.robotoCondensed(
                                                  color:theme.secondaryColor,
                                                  fontSize: SizeConfig.getSize(16),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                             SizedBox(height: SizeConfig.getSize(8)),
                                            Text(
                                              "HSN Code: ",
                                              style: GoogleFonts.robotoCondensed(
                                                  color:theme.secondaryColor,
                                                  fontSize: SizeConfig.getSize(16),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                         SizedBox(width: SizeConfig.getSize(16)),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              widget._productContainer
                                                  .inventoryProductCode,
                                              style: GoogleFonts.robotoCondensed(
                                                color:theme.secondaryColor,
                                                fontSize: SizeConfig.getSize(16),
                                              ),
                                            ),
                                             SizedBox(height: SizeConfig.getSize(8)),
                                            Text(
                                              widget
                                                      ._productContainer
                                                      .inventoryItemContainerDTO
                                                      ?.productBarcodeContainerDtoList?[
                                                          0]
                                                      .barCode ??
                                                  "",
                                              style: GoogleFonts.robotoCondensed(
                                                color:theme.secondaryColor,
                                                fontSize: SizeConfig.getSize(16),
                                              ),
                                            ),
                                             SizedBox(height: SizeConfig.getSize(8)),
                                            Text(
                                              widget
                                                  ._productContainer.hsnSacCode,
                                              style: GoogleFonts.robotoCondensed(
                                                color:theme.secondaryColor,
                                                fontSize: SizeConfig.getSize(16),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Tax Name: ",
                                              style: GoogleFonts.robotoCondensed(
                                                  color:theme.secondaryColor,
                                                  fontSize: SizeConfig.getSize(16),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                             SizedBox(height: SizeConfig.getSize(8)),
                                            Text(
                                              "Tax Inclusive: ",
                                              style: GoogleFonts.robotoCondensed(
                                                  color:theme.secondaryColor,
                                                  fontSize: SizeConfig.getSize(16),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(height: SizeConfig.getSize(8)),
                                            Text(
                                              "",
                                              style: GoogleFonts.robotoCondensed(
                                                  color:theme.secondaryColor,
                                                  fontSize: SizeConfig.getSize(16),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                         SizedBox(width: SizeConfig.getSize(16)),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              widget._productContainer.taxName,
                                              style: GoogleFonts.robotoCondensed(
                                                color:theme.secondaryColor,
                                                fontSize: SizeConfig.getSize(16),
                                              ),
                                            ),
                                             SizedBox(height: SizeConfig.getSize(8)),
                                            Text(
                                              widget._productContainer
                                                  .taxInclusivePrice,
                                              style: GoogleFonts.robotoCondensed(
                                                color:theme.secondaryColor,
                                                fontSize: SizeConfig.getSize(16),
                                              ),
                                            ),
                                             SizedBox(height: SizeConfig.getSize(8)),
                                            Text(
                                              "",
                                              style: GoogleFonts.robotoCondensed(
                                                color:theme.secondaryColor,
                                                fontSize: SizeConfig.getSize(16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Description",
                                        style: GoogleFonts.robotoCondensed(
                                            color:theme.secondaryColor,
                                            fontSize: SizeConfig.getSize(16),
                                            fontWeight: FontWeight.w700),
                                      ),
                                       SizedBox(height: SizeConfig.getSize(8)),
                                      Text(
                                        widget._productContainer.description,
                                        style: GoogleFonts.robotoCondensed(
                                          color:theme.secondaryColor,
                                          fontSize: SizeConfig.getSize(16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                               Divider(
                                thickness: 1,
                                color:theme.dividerColor,
                                indent: SizeConfig.getSize(8),
                                endIndent: SizeConfig.getSize(8),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: SizeConfig.getSize(68),
                                    width: SizeConfig.getSize(120),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all( SizeConfig.getSize(4)),
                                        tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(SizeConfig.getSize(8)), // <-- Radius
                                        ),
                                        backgroundColor: theme.button1BG1,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
//loader.hideLoaderDialog(context);
                                      },
                                      child: Text(
                                        "CLOSE",
                                        style: GoogleFonts.robotoCondensed(
                                            color:theme.secondaryColor,
                                            fontSize: SizeConfig.getSize(20),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                   SizedBox(width: SizeConfig.getSize(10)),
                                  SizedBox(
                                    width: SizeConfig.getSize(400),
                                    height:SizeConfig.getSize(68),
                                    child: TextField(
                                      showCursor: true,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                      ],
                                      onTap: () {
                                        showDialog(
                                            barrierDismissible: true,
                                            context: context,
                                            barrierColor: const Color(0x01000000),
                                            builder: (BuildContext context) {
                                              return NumberPad(
                                                initialOffset: Offset(MediaQuery.of(context).size.height/15, MediaQuery.of(context).size.width/15),
                                                title: "Quantity",
                                                onOkPressed: (value) {
                                                 setState(() {
                                                   _quantityTextController.text = value.toString();
                                                 });
                                                },
                                              );
                                            });
                                      },
                                      readOnly: true,
                                      onChanged: (text) {
                                        if (_quantityTextController.text == '0' ||
                                            _quantityTextController.text.isEmpty) {
                                        }
                                        _quantityTextController.selection =
                                            TextSelection.collapsed(
                                                offset: _quantityTextController
                                                    .text.length);
                                      },
                                      controller: _quantityTextController,
                                      autofocus: false,
                                      maxLength: 5,
                                      style: GoogleFonts.robotoCondensed(
                                          color:theme.secondaryColor,
                                          fontSize: SizeConfig.getSize(30),
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        counterText: '',
                                        contentPadding:  EdgeInsets.only(
                                            top: SizeConfig.getSize(10), bottom: SizeConfig.getSize(10), right: SizeConfig.getSize(10), left: SizeConfig.getSize(10)),
                                        focusedBorder:  OutlineInputBorder(
                                            borderSide: BorderSide(
                                          color:theme.dividerColor!,
                                        )),
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xffE4E6EF),
                                          ),
                                        ),
                                        prefix: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(SizeConfig.getSize(25)),
                                          ),
                                          width: SizeConfig.getSize(50),
                                          height: SizeConfig.getSize(50),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                padding:  EdgeInsets.symmetric(
                                                    horizontal: SizeConfig.getSize(4), vertical: SizeConfig.getSize(4)),
                                                backgroundColor:
                                                    theme.button1BG1),
                                            onPressed: () {
                                              _decrementQuantity();
                                            },
                                            child:  Icon(
                                              Icons.remove,
                                              size:SizeConfig.getSize(25),
                                              color:theme.secondaryColor,
                                            ),
                                          ),
                                        ),
                                        suffix: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                          ),
                                          width: SizeConfig.getSize(50),
                                          height: SizeConfig.getSize(50),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                padding:  EdgeInsets.symmetric(
                                                    horizontal: SizeConfig.getSize(4), vertical: SizeConfig.getSize(4)),
                                                backgroundColor:
                                                    theme.button1BG1),
                                            onPressed: () {
                                              _incrementQuantity();
                                            },
                                            child:  Icon(
                                              Icons.add,
                                              size:SizeConfig.getSize(25),
                                              color:theme.secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                   SizedBox(width: SizeConfig.getSize(8)),
                                  SizedBox(
                                    height: SizeConfig.getSize(68),
                                    width: SizeConfig.getSize(120),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all( SizeConfig.getSize(4)),
                                        tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                        ),
                                        backgroundColor:theme.button2BG1,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        if (int.parse(_quantityTextController.text) >
                                            0) {
                                          widget.onConfirm(int.parse(
                                              _quantityTextController.text));
                                        }
                                      },
                                      child: Text(
                                        "ADD",
                                        style: GoogleFonts.robotoCondensed(
                                            color: Colors.white,
                                            fontSize: SizeConfig.getSize(20),
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(height: SizeConfig.getSize(10)),
                            ]),
                      ),
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
