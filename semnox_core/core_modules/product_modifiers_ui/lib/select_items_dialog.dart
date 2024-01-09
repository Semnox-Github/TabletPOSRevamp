import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logs_data/logger.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_modifiers_ui/models/selected_item_model.dart';
import 'package:product_modifiers_ui/simple_list_item.dart';
import 'package:messages_data/builder.dart';
import 'package:widgets_library/utils/size_config.dart';

class SelectItemsDialog extends StatefulWidget {
  final List<SelectedItemModel> _items;
  final Function _onConfirm;
  final Function _onRangeSelected;

  const SelectItemsDialog(this._items, this._onRangeSelected, this._onConfirm, {super.key});

  @override
  State<StatefulWidget> createState() => SelectItemsDialogState();
}

class SelectItemsDialogState extends State<SelectItemsDialog> {
  final ScrollController _scrollController = ScrollController();
  late NotificationBar _notificationBar;
  final fromController = TextEditingController();
  final toController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _notificationBar = NotificationBar(showHideSideBar: false);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:  EdgeInsets.symmetric( horizontal: SizeConfig.getSize(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Items".toUpperCase(),
                              style: GoogleFonts.robotoCondensed(
                                color: Colors.black,
                                fontSize: SizeConfig.getFontSize(20),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     Divider(
                      thickness: 1,
                      color: Colors.black12,
                      indent: SizeConfig.getSize(8),
                      endIndent: SizeConfig.getSize(8),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Range From",
                                style: GoogleFonts.robotoCondensed(
                                  color: Colors.black,
                                  fontSize: SizeConfig.getFontSize(16),
                                ),
                              ),
                               SizedBox(
                                width: SizeConfig.getSize(16),
                              ),
                              TextField(
                                controller: fromController,
                                decoration: InputDecoration(
                                  hintText: "From",
                                  contentPadding:  EdgeInsets.only(top: SizeConfig.getSize(8), bottom: SizeConfig.getSize(8), right: SizeConfig.getSize(8), left: SizeConfig.getSize(8)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(10)),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                      )),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(SizeConfig.getSize(10)),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0xffE4E6EF),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                ],
                              )
                            ],
                          ),
                        ),
                         SizedBox(
                          width: SizeConfig.getSize(16),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "To",
                                style: GoogleFonts.robotoCondensed(
                                  color: Colors.black,
                                  fontSize:SizeConfig.getFontSize(16),
                                ),
                              ),
                               SizedBox(
                                width: SizeConfig.getSize(16),
                              ),
                              TextField(
                                controller: toController,
                                decoration: InputDecoration(
                                  hintText: "To",
                                  contentPadding:  EdgeInsets.only(top: SizeConfig.getSize(8), bottom: SizeConfig.getSize(8), right: SizeConfig.getSize(8), left: SizeConfig.getSize(8)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(10)),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                      )),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(SizeConfig.getSize(10)),
                                    borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0xffE4E6EF),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "OR",
                        style: GoogleFonts.robotoCondensed(
                          color: Colors.black,
                          fontSize: SizeConfig.getFontSize(20),
                          fontWeight: FontWeight.w700,
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
                        itemCount: widget._items.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          childAspectRatio: 2.5,
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
                      color: Colors.black12,
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                              ),
                              backgroundColor: const Color(0xFFF0F2F8),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel".toUpperCase(),
                              style: GoogleFonts.robotoCondensed(
                                  color: Colors.black, fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                         SizedBox(width: SizeConfig.getSize(10)),
                        SizedBox(
                          height: SizeConfig.getSize(68),
                          width: SizeConfig.getSize(120),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                              ),
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {
                              // high priority to the range entered in text field

                              List<SelectedItemModel> selectedItems =
                                  widget._items.where((model) => (model.isSelected == true)).toList();
                              if ((fromController.text.isEmpty || toController.text.isEmpty) && selectedItems.isEmpty) {
                                _notificationBar.showMessage(MessagesProvider.get('Please select any item(s) or give valid range.'), Colors.yellow);
                              } else if (fromController.text.isNotEmpty && toController.text.isNotEmpty) {
                                int fromRange = int.parse(fromController.text);
                                int toRange = int.parse(toController.text);

                                if (fromRange < 1 ||
                                    fromRange > widget._items.length + 1 ||
                                    toRange < 1 ||
                                    toRange > widget._items.length + 1) {
                                  _notificationBar.showMessage(MessagesProvider.get('Please select any item(s) or give valid range.'), Colors.yellow);
                                } else if (fromController.text.isNotEmpty &&
                                    int.parse(fromController.text) > widget._items.length + 1) {
                                  _notificationBar.showMessage(MessagesProvider.get('Range \'from\' should be less than or equal to quantity.'), Colors.yellow);
                                } else if (toController.text.isNotEmpty &&
                                    int.parse(toController.text) > widget._items.length + 1) {
                                  _notificationBar.showMessage(MessagesProvider.get('Range \'to\' should be less than or equal to quantity.'), Colors.yellow);
                                } else {
                                  widget._onRangeSelected(fromRange, toRange);
                                  Navigator.of(context).pop();
                                }
                              } else {
                                widget._onConfirm(selectedItems);
                                Navigator.of(context).pop();
                              }
                            },
                            child: Text(
                              "Confirm".toUpperCase(),
                              style: GoogleFonts.robotoCondensed(
                                  color: Colors.white, fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.green,
              child: _notificationBar,
            ),
          ],
        ),
      ),
    );
  }

  Widget getItem(int index) {
    return GestureDetector(
      onTap: () {
        Log.v("onItemClicked");
        widget._items[index].isSelected = !widget._items[index].isSelected;
        setState(() {});
      },
      child: SimpleListItem(widget._items[index]),
    );
  }
}
