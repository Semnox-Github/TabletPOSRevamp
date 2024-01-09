import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class DrawerDropDownView extends StatefulWidget {
  const DrawerDropDownView({super.key, required this.title, required this.dropdownValues, required this.selectedValueCallback, this.isUserManager});

  final String title;
  final List<String> dropdownValues;
  final Function(String value) selectedValueCallback;
  final bool? isUserManager;

  @override
  State<StatefulWidget> createState() => _DrawerDropDownViewState();
}

class _DrawerDropDownViewState extends State<DrawerDropDownView> {
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
          Container(
            padding: EdgeInsets.only(
              top: SizeConfig.getHeight(0),
              bottom: SizeConfig.getHeight(0),
            ),
            height: SizeConfig.getHeight(42),
            margin: EdgeInsets.only(top: SizeConfig.getHeight(3)),
            child: InputDecorator(
              decoration: InputDecoration(
                  focusColor: theme.cartItemCardBG,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                    borderSide: BorderSide(color: theme.secondaryColor!, width: SizeConfig.getWidth(1)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                    borderSide: BorderSide(color: theme.secondaryColor!, width: SizeConfig.getWidth(1)),
                  ),
                  filled: true,
                  fillColor: theme.cartItemCardBG,
                  contentPadding: EdgeInsets.all(SizeConfig.getSize(10))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  iconSize: SizeConfig.getSize(20),
                  isDense: true,
                  value: selectedDropDownValue,
                  items: widget.dropdownValues.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: widget.isUserManager == true ?
                        TextStyle(color: Colors.grey,fontSize: SizeConfig.getFontSize(16),fontWeight: FontWeight.w400) :
                        theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    );
                  }).toList(),
                  onChanged: widget.isUserManager == true ? null : (String? newValue) {
                    setState(() {
                      selectedDropDownValue = newValue!;
                      widget.selectedValueCallback(selectedDropDownValue);
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
