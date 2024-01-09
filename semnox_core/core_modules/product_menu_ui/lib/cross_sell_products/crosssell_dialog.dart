import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_menu_ui/cross_sell_products/crosssell_list_item.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'crosssell_product_model.dart';

class CrossSellDialog extends StatefulWidget {
  final Function _onConfirm;
  final Function _onCancel;

  final String _productName;
  final List<CrossSellProductModel> _crossSellProducts;

  const CrossSellDialog(this._productName, this._crossSellProducts, this._onConfirm, this._onCancel, {super.key});

  @override
  State<StatefulWidget> createState() {
    return CrossSellDialogState();
  }
}

class CrossSellDialogState extends State<CrossSellDialog> {
  final ScrollController _scrollController = ScrollController();
  late NotificationBar _notificationBar;
  List<CrossSellProductModel> selectedItems = [];

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
                          padding:  EdgeInsets.symmetric(vertical: SizeConfig.getSize(8), horizontal: SizeConfig.getSize(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Suggestive sell offers - ${widget._productName}".toUpperCase(),
                                style: GoogleFonts.robotoCondensed(
                                    color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w600),
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
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:  EdgeInsets.only(top: SizeConfig.getSize(8), left: SizeConfig.getSize(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget._crossSellProducts[0].crossSellProductsContainerDTO.offerMessage,
                                style: GoogleFonts.robotoCondensed(
                                    color:theme.secondaryColor, fontSize:SizeConfig.getFontSize(16), fontWeight: FontWeight.w700),
                              ),
                               SizedBox(height: SizeConfig.getSize(8)),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: Scrollbar(
                        controller: _scrollController,
                        thumbVisibility: true,
                        child: GridView.builder(
                          controller: _scrollController,
                          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.getSize(8)),
                          itemCount: widget._crossSellProducts.length,
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
                        color: theme.secondaryColor,
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
                                print("------- _onCancel cross dialog");
                                widget._onCancel();
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel".toUpperCase(),
                                style: GoogleFonts.robotoCondensed(
                                    color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w700),
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
                                print("------- _onConfirm cross dialog");
                                if (selectedItems.isNotEmpty) {
                                  CrossSellProductModel selectedProduct =
                                      widget._crossSellProducts.firstWhere((element) => element.isSelected);
                                  widget._onConfirm(selectedProduct);
                                  Navigator.pop(context);
                                }
                              },
                              child: Text(
                                "Confirm".toUpperCase(),
                                style: GoogleFonts.robotoCondensed(
                                    color: selectedItems.isNotEmpty ? Colors.white : const Color(0xFFD3D3DB),
                                    fontSize:SizeConfig.getFontSize(16),
                                    fontWeight: FontWeight.w700),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.getSize(8),)
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
    CrossSellProductModel model = widget._crossSellProducts[index];
    return GestureDetector(
      onTap: () {
        // single tap to select/de-select the item
        widget._crossSellProducts[index].isSelected = !widget._crossSellProducts[index].isSelected;
        selectedItems = widget._crossSellProducts.where((element) => element.isSelected).toList();
        setState(() {});
      },
      child: CrossSellListItem(widget._crossSellProducts[index]),
    );
  }
}
