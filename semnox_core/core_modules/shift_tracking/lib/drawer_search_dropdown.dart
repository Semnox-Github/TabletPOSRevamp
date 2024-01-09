import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class DrawerSearchDropDown extends StatefulWidget {
  const DrawerSearchDropDown({super.key, required this.title, required this.dropdownValues, required this.selectedValueCallback, this.isUserManager});

  final String title;
  final List<String> dropdownValues;
  final Function(String value) selectedValueCallback;
  final bool? isUserManager;

  @override
  State<StatefulWidget> createState() => _DrawerSearchDropDownState();
}

class _DrawerSearchDropDownState extends State<DrawerSearchDropDown> {
  String selectedDropDownValue = '';

  @override
  void initState() {
    selectedDropDownValue = widget.dropdownValues.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.getHeight(0), left: SizeConfig.getWidth(0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(SizeConfig.getSize(0)),
            child: Text(
              widget.title,
              style: widget.isUserManager == true ?
              TextStyle(color: Colors.grey,fontSize: SizeConfig.getFontSize(16),fontWeight: FontWeight.w400) :theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(16)),
            ),
          ),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
              fit: FlexFit.loose,
            ),
            items: widget.dropdownValues,
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: theme.heading5?.copyWith(
                  fontSize: SizeConfig.getFontSize(14), fontWeight: FontWeight.w400),
              dropdownSearchDecoration: InputDecoration(
                hintText: "All",
                hintStyle: theme.heading5?.copyWith(
                    fontSize: SizeConfig.getFontSize(14), fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                ),
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              ),
            ),
            onChanged: (valuei){
             widget.selectedValueCallback(valuei ?? 'All');
            },
          ),
        ],
      ),
    );
  }
}
