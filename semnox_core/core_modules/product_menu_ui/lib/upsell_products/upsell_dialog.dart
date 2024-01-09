import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'upsell_list_item.dart';
import 'upsell_product_model.dart';

class UpsellDialog extends StatefulWidget {
  final Function _onConfirm;
  final Function _onCancel;

  final String _productName;
  final List<UpsellProductModel> _upsellProducts;

  const UpsellDialog(this._productName, this._upsellProducts, this._onConfirm, this._onCancel, {super.key});

  @override
  State<StatefulWidget> createState() {
    return UpsellDialogState();
  }
}

class UpsellDialogState extends State<UpsellDialog> {
  final ScrollController _scrollController = ScrollController();
  late NotificationBar _notificationBar;
  List<UpsellProductModel> selectedItems = [];

  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(showHideSideBar: false);
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin:  EdgeInsets.all(SizeConfig.getSize(24)),
                  padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                  decoration: BoxDecoration(
                    color: theme.backGroundColor,
                    borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: SizeConfig.getSize(8), horizontal:SizeConfig.getSize(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Upsell offers - ${widget._productName}".toUpperCase(),
                                style: GoogleFonts.robotoCondensed(
                                    color: theme.secondaryColor, fontSize: SizeConfig.getSize(20), fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                       Divider(
                        thickness: 1,
                        color: theme.dividerColor,
                        indent: SizeConfig.getSize(8),
                        endIndent: SizeConfig.getSize(8),
                      ),
                      Expanded(
                          child: Scrollbar(
                        controller: _scrollController,
                        thumbVisibility: true,
                        child: GridView.builder(
                          controller: _scrollController,
                          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.getSize(8)),
                          itemCount: widget._upsellProducts.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 2,
                          ),
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return getItem(index);
                          },
                        ),
                      )),
                       Divider(
                        thickness: 1,
                        color: theme.dividerColor,
                        indent: SizeConfig.getSize(8),
                        endIndent: SizeConfig.getSize(8),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: SizeConfig.getSize(58),
                            width: SizeConfig.getSize(160),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                ),
                                backgroundColor: theme.button1BG1,
                              ),
                              onPressed: () {
                                widget._onCancel();
                                //Navigator.pop(context);
                              },
                              child: Text(
                                "No, Thanks".toUpperCase(),
                                style: GoogleFonts.robotoCondensed(
                                    color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16), fontWeight: FontWeight.w700),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                           SizedBox(width: SizeConfig.getSize(10)),
                          SizedBox(
                            height: SizeConfig.getSize(58),
                            width: SizeConfig.getSize(160),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                ),
                                backgroundColor: selectedItems.isNotEmpty ? theme.button2BG1 : const Color(0xFFECEFF6),
                              ),
                              onPressed: () {
                                // ok pressed
                                if (selectedItems.isNotEmpty) {
                                  UpsellProductModel selectedProduct =
                                      widget._upsellProducts.firstWhere((element) => element.isSelected);
                                  widget._onConfirm(selectedProduct);
                                  //Navigator.pop(context);
                                }
                              },
                              child: Text(
                                "Yes, Please".toUpperCase(),
                                style: GoogleFonts.robotoCondensed(
                                    color: selectedItems.isNotEmpty ? Colors.white : const Color(0xFFD3D3DB),
                                    fontSize: SizeConfig.getFontSize(16),
                                    fontWeight: FontWeight.w700),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:SizeConfig.getSize(8))
                    ],
                  ),
                ),
              ),
              Container(
                child: _notificationBar,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getItem(int index) {
    return GestureDetector(
      onTap: () {
        // single tap to select/de-select the item
        if(selectedItems.isEmpty) {
          widget._upsellProducts[index].isSelected = !widget._upsellProducts[index].isSelected;
          for (int i = 0; i < widget._upsellProducts.length; i++) {
            if (i != index) {
              widget._upsellProducts[i].isDisabled = true;
            }
          }
        } else if(widget._upsellProducts[index].isSelected){
          widget._upsellProducts[index].isSelected = !widget._upsellProducts[index].isSelected;
          for (int i = 0; i < widget._upsellProducts.length; i++) {
            widget._upsellProducts[i].isDisabled = false;
          }
        }

        selectedItems = widget._upsellProducts.where((element) => element.isSelected).toList();
        setState(() {});
      },
      child: UpsellListItem(widget._upsellProducts[index]),
    );
  }
}
