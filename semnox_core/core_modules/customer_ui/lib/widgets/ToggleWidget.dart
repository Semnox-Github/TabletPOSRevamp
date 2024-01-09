import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';


typedef IsExactItemClicked = Function(bool isExact);

class ToggleWidget extends StatefulWidget {
  final IsExactItemClicked onClick;

  const ToggleWidget({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  State<ToggleWidget> createState() => ToggleWidgetState();
}

class ToggleWidgetState extends State<ToggleWidget> {
  final List<bool> _isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return ToggleButtons(
        isSelected: _isSelected,
        selectedColor: theme.light1,
        color: theme.primaryOpposite,
        fillColor: theme.button2BG1,
        textStyle: theme.heading6?.copyWith(color: Colors.white , fontSize: SizeConfig.getFontSize(18)),
        constraints: const BoxConstraints(),
        borderRadius: BorderRadius.circular(8.0),
        onPressed: (int newIndex) {
          setState(() {
            // looping through the list of booleans values
            for (int index = 0; index < _isSelected.length; index++) {
              // checking for the index value
              if (index == newIndex) {
                // one button is always set to true
                _isSelected[index] = true;
              } else {
                // other two will be set to false and not selected
                _isSelected[index] = false;
              }
            }
            widget.onClick(_isSelected[0]);
          });
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MessagesProvider.get("Exact").toUpperCase()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MessagesProvider.get("Like").toUpperCase()),
          )
        ]);
  }

  void setSelectedList(bool isExactItemEnabled) {
    _isSelected[0] = isExactItemEnabled;
    _isSelected[1] = !isExactItemEnabled;
    setState(() {});
  }
}
