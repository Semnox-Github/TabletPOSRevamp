import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messages_data/builder.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_container_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'models/modifier_customization_model.dart';
import 'models/modifier_dto.dart';

class SelectedCustomizations extends StatefulWidget {
  final List<ModifierCustomizationModel> _customizationItems;
  final List<ModifierSetContainerDTO> _requiredModifiers;
  final Function _setNotification;
  final VoidCallback refreshCallBack;

  const SelectedCustomizations(this._customizationItems, this._requiredModifiers, this._setNotification, this.refreshCallBack,
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return SelectedCustomizationsState();
  }
}

class SelectedCustomizationsState extends State<SelectedCustomizations> {
  late List<ModifierCustomizationModel> customizationItems;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    customizationItems = widget._customizationItems;
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          color: theme.tableRow1,
          borderRadius: BorderRadius.circular(SizeConfig.getSize(4)),
        ),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: SizeConfig.getSize(8), top:SizeConfig.getSize(8)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Customization",
                        style: GoogleFonts.robotoCondensed(
                          color: theme.secondaryColor,
                          fontSize: SizeConfig.getFontSize(16),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top:SizeConfig.getSize(8)),
                        child: Text(
                          "${_getCompletedConditions()}/${widget._customizationItems.length} Done",
                          style: GoogleFonts.robotoCondensed(
                            color: theme.secondaryColor,
                            fontSize: SizeConfig.getFontSize(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  GestureDetector(
                    child: SizedBox(
                        height: SizeConfig.getSize(40),
                        width: SizeConfig.getSize(40),
                        child: Image.asset("assets/ic_trash.png",color: theme.secondaryColor,)),
                    onTap: () {
                      print("delete clicked");
                      var count = customizationItems
                          .where((element) => element.isSelected)
                          .toList()
                          .length;
                      if (count == 0) {
                        widget._setNotification(
                            MessagesProvider.get(
                                'Please select item on right side.'),
                            Colors.yellow);
                      } else {
                        customizationItems.forEach((element) {
                          if (element.isSelected) {
                            element.selectedItems.clear();
                            element.qtyItemsList.clear();
                            element.isSelected = false;
                          }
                        });
                        setState(() {});
                        widget.refreshCallBack();
                        widget._setNotification(
                            MessagesProvider.get(
                                'Cleared the selected item successfully.'),
                            Colors.lightBlueAccent);
                      }
                    },
                  ),
                   SizedBox(
                    width: SizeConfig.getSize(16),
                  ),
                  GestureDetector(
                    child: SizedBox(
                        height: SizeConfig.getSize(40),
                        width: SizeConfig.getSize(40),
                        child: Image.asset("assets/ic_reset.png",color: theme.secondaryColor,)),
                    onTap: () {
                      print("reset clicked");
                      customizationItems.forEach((element) {
                        // if (element.isSelected) {
                        element.selectedItems.clear();
                        element.qtyItemsList.clear();
                        element.isSelected = false;
                        // }
                      });
                      setState(() {});
                      widget.refreshCallBack();
                      widget._setNotification(
                          MessagesProvider.get('Cleared successfully.'),
                          Colors.lightBlueAccent);
                    },
                  ),
                   SizedBox(
                    width: SizeConfig.getSize(16),
                  ),
                ],
              ),
            ),
             Divider(
              thickness: 1,
              color: theme.dividerColor,
              indent: SizeConfig.getSize(8),
              endIndent: SizeConfig.getSize(8),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(SizeConfig.getSize(4)),
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: scrollController,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: customizationItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return getICustomizationItemWidget(index);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getICustomizationItemWidget(int index) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    ModifierCustomizationModel customizationItem = customizationItems[index];
    return GestureDetector(
      onTap: () {
        customizationItem.isSelected = !customizationItem.isSelected;
        setState(() {});
      },
      child: Padding(
        padding:  EdgeInsets.only(right: SizeConfig.getSize(4)),
        child: Container(
          margin:  EdgeInsets.all(SizeConfig.getSize(4)),
          padding:  EdgeInsets.all(SizeConfig.getSize(8)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.getSize(6)),
            color: (customizationItem.isSelected) ? theme.dividerColor : theme.primaryColor,
          ),
          child: Column(
            children: [
              SizedBox(
                  height: (customizationItem.selectedItems.isEmpty) ? SizeConfig.getSize(8) : 0),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Item ${index + 1} - ${customizationItem.productName}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:  TextStyle(
                            color: theme.secondaryColor,
                            fontSize: SizeConfig.getFontSize(16),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "x${customizationItem.quantity.toInt()}",
                      maxLines: 1,
                      style:  TextStyle(
                        color: theme.secondaryColor,
                        fontSize: SizeConfig.getFontSize(16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: (customizationItem.selectedItems.isEmpty) ? SizeConfig.getSize(8) : 0),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding:  EdgeInsets.only(left: SizeConfig.getSize(8)),
                shrinkWrap: true,
                itemCount: customizationItem.selectedItems.length,
                itemBuilder: (BuildContext context, int position) {
                  return getModifierItemWidget(
                      customizationItem.selectedItems[position]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getModifierItemWidget(ModifierDTO selectedItem) {
    return Padding(
      padding:  EdgeInsets.only(top: SizeConfig.getSize(8)),
      child: getNestedModifier([selectedItem]),
    );
  }

  Widget getNestedModifier(List<ModifierDTO> list) {

    return Padding(
      padding: EdgeInsets.only(left: SizeConfig.getSize(8)),
      child: Column(
        children: list.map<Widget>((e) => nestedItem(e)).toList(),
      ),
    );
  }

  Widget nestedItem(ModifierDTO item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: SizeConfig.getSize(8)),
        ModifierRowItem(selectedItem: item),
        Visibility(
            visible: item.childModifiers.isNotEmpty,
            child: SizedBox(height: SizeConfig.getSize(8))),
        Visibility(
          visible: item.childModifiers.isNotEmpty,
          child: Padding(
            padding: EdgeInsets.only(left: SizeConfig.getSize(8)),
            child: getNestedModifier(item.childModifiers),
          ),
        ),
      ],
    );
  }

  int _getCompletedConditions() {
    if(widget._requiredModifiers.isEmpty) {
      return widget._customizationItems.length;
    } else {
      int completed = 0;
      final customizationLength = widget._customizationItems.length;
      for (var element in widget._requiredModifiers) {
        for(int i = 0; i < customizationLength; i++) {
          widget._customizationItems[i].selectedItems.firstWhere((e) {
            if(e.modifierSetId == element.modifierSetId) {
              completed++;
              return true;
            } else {
              return false;
            }
          }, orElse: () => ModifierDTO(-1,-1,-1,"", 0, false, false, false, 0, false, 0));
        }
      }
      return completed == (widget._requiredModifiers.length * widget._customizationItems.length) ? widget._customizationItems.length : completed ~/ widget._requiredModifiers.length;
    }
  }
}


class ModifierRowItem extends StatelessWidget {
  final ModifierDTO selectedItem;
  const ModifierRowItem({Key? key, required this.selectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Row(children: [
      Text(
        selectedItem.productName,
        style:  TextStyle(
          color: theme.secondaryColor,
          fontSize: SizeConfig.getFontSize(16),
          fontWeight: FontWeight.w700,
        ),
      ),
      const Spacer(),
      Text(
        "x${selectedItem.quantity.toInt()}",
        style:  TextStyle(
          color: theme.secondaryColor,
          fontSize: SizeConfig.getFontSize(16),
        ),
      ),
    ]);
  }
}

