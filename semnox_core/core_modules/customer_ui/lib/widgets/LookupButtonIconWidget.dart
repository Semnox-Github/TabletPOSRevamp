import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';


class LookupButtonIconWidget extends StatefulWidget{

  VoidCallback? onPress;
  String buttonText;
  Color? buttonBackground;
  Widget prefixIcon;

  LookupButtonIconWidget({this.onPress,
    required this.buttonText,
    required this.buttonBackground,
    required this.prefixIcon});

  @override
  State<LookupButtonIconWidget> createState() => _LookupButtonIconWidgetState();
}

class _LookupButtonIconWidgetState extends State<LookupButtonIconWidget> {
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return ElevatedButton.icon(onPressed: widget.onPress,
      icon: widget.prefixIcon,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(8.0),
        primary: widget.buttonBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),

      ),
      label:  Text(widget.buttonText, style: theme.description1?.copyWith(fontSize: SizeConfig.getFontSize(14))),);
  }
}